Use SQL06
Go

--Declare @StepName varchar(500) = 'PDT INCR 3'
--Declare @StepStatus int = (Select StepStatus from MasterACFV.dbo.PackageStepDetail with(nolock) where StepName = @StepName)
Declare @CatCode varchar(15) 

--IF(@StepStatus = 0)
--Begin
	  Begin Try
					--Update MasterACFV.dbo.PackageStepDetail SET StepStatus = 2, StartTime = Getdate() Where StepName = @StepName
					
				
				 Declare @RunVal bit
				 Declare @CategoryCodeTable varchar(255)
				 Declare @NSQL Nvarchar(1000)
				 Declare @FVver tinyint
				 Declare @CustomStep Bit
				 Declare @ClientTable VARCHAR(50)
				 Declare @CatCount int = 1

				 EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT

				 While(@CatCount > 0)
				 Begin
						WaitFor Delay '00:00:20'
						SET @CatCode = (Select Top 1 Category From MasterACFV.dbo.CategoryCodeRunFlag Where ClientRun = 1 And AdBlockRun = 0 And UPCRun = 0 And HTMLRun = 0 And IsFull = 0 And CodeStatus = 1 order by DataCounts ASC)
  
						-- Update ClientRun Flag in MasterACFV.dbo.CategoryCodeRunFlag Table
						Update MasterACFV.dbo.CategoryCodeRunFlag SET ClientRun = 2 Where Category = @CatCode

						-- Log Start PDT in CategoryCodeLog Table
						EXECUTE('insert into categorycodelog values('''+ @CatCode +''',''StartPDT for ' + @CatCode +''',''StartPDT - ' + @CatCode +''',getdate())')
  
						-- Fetch @RunVal, @FVver And @CustomStep Value
						SET @NSQL = N'Select @RunVal = ClientRun, @FVver = IsNull(FVver,0), @CustomStep=IsNull(CustomStep,0) 
										FROM ' + @CategoryCodeTable + ' 
										Where Category = ''' + @CatCode + ''' And 
										Category not in (''adddh'')
									'
						Execute sp_executesql @NSQL, N'@RunVal bit OUTPUT, @FVver tinyint OUTPUT,@CustomStep bit OUTPUT', @RunVal OUTPUT, @FVver OUTPUT,@CustomStep OUTPUT  

						-- Execute CreateDetailReports SP
						IF @RunVal = 1
						Begin
								EXECUTE('update ' + @CategoryCodeTable + ' set Error = null where Category = ''' + @CatCode + '''')
								Exec CreateDetailReports_acfv @CatCode,'',0
						End

						-- Log End PDT in CategoryCodeLog Table
						EXECUTE('insert into categorycodelog values('''+ @CatCode +''',''EndPDT for ' + @CatCode +''',''EndPDT - ' + @CatCode +''',getdate())')

						-- Custom Step Call
						If @CustomStep=1
							Exec MasterCustomUpdate @CatCode,1,0
  
						-- Segmentatio Call
						IF Exists(select category from mt2sql14.sitecontrol.dbo.[vw_MasterSegmentation] where category=@CatCode)
							Exec MasterSegmentation @CatCode,0

						-- Update ClientRun, AdBlockRun, UPCRun, HTMLRun Flag in MasterACFV.dbo.CategoryCodeRunFlag Table
						IF(@CatCode IN ('Wlmpep', 'CWGPEP'))
							Update MasterACFV.dbo.CategoryCodeRunFlag set UPCRun = 1 where Category = @CatCode And ClientRun = 2
					   
						Update MasterACFV.dbo.CategoryCodeRunFlag set ClientRun = 0, AdBlockRun = 1, HTMLRun = 1 where Category = @CatCode And ClientRun = 2

						-- Update ClientRun Flag in MT2SQL14.SiteControl.dbo.CategoryCode Table
						EXECUTE('update ' + @CategoryCodeTable + ' set ClientRun = 0 where Category = ''' + @CatCode + '''')

						SET @CatCount = (Select Count(1) From MasterACFV.dbo.CategoryCodeRunFlag Where ClientRun = 1 And AdBlockRun = 0 And UPCRun = 0 And HTMLRun = 0 And IsFull = 0 And CodeStatus = 1)
				 End
     
				 --Update MasterACFV.dbo.PackageStepDetail SET StepStatus = 1, EndTime = Getdate() Where StepName = @StepName
	  End Try
	  BEGIN CATCH  
					Declare @ErrorMessage varchar(2000) = ERROR_MESSAGE()
					Declare @Message varchar(max)
					, @Subject varchar(2000)

					--Update MasterACFV.dbo.PackageStepDetail SET StepStatus = 0 Where StepName = @StepName

					Update MasterACFV.dbo.CategoryCodeRunFlag set ClientRun = 0, CodeStatus = 2 where Category = @CatCode And ClientRun = 2

					Set @Message = 'Job Failed Details, <br><br> ' +
						'<b>Please check in Nightly Load - SQL06 Package :: </b><br>' +
						'<b>Error Message :: </b>' + @ErrorMessage + 
						'<br><b>Failed Category Code is :: </b>' + ISNULL(@CatCode,'')

					SET @Subject = '[FVDataLoad] ERROR: ' + @@SERVERNAME + ': SSIS Pkg: Nightly Load - ' + RIGHT(@@SERVERNAME,5)+ ': Step: ' --+ @StepName

					exec master.dbo.mt_proc_send_cdosysmail
					@from='sql@markettrack.com', 
					@to='fvdataload@markettrack.com',
					--@to='dpatel@markettrack.com;kram@markettrack.com',
					@subject=@Subject,
					@body = @Message,
					@BodyType = 'HTML'

					RAISERROR (15600,-1,-1, 'One Code Execution Fail')
	  END CATCH

--End
