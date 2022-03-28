

Use SQL13
Go
Declare @CatCode varchar(15) 

				 
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
						WaitFor Delay '00:00:56'
						SET @CatCode = (Select Top 1 Category From MasterACFV.dbo.CategoryCodeRunFlag Where ClientRun = 1 And AdBlockRun = 0 And UPCRun = 0 And HTMLRun = 0 And IsFull = 0 And CodeStatus = 1 order by DataCounts DESC)
  
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
     
				