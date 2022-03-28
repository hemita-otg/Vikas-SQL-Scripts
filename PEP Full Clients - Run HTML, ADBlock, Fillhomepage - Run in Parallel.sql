

select * from masteracfv..CategoryCodeRunFlag where HTMLRun = 1


--Use SQL13
--Go


--		Declare @CatCode Varchar(50)
--		Declare @CatCount int = 1
--		Declare @CategoryCodeTable varchar(255)
--		declare @sql nvarchar(max), @clientid varchar(10), @id varchar(10)

--		EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT

--		While(@CatCount > 0)
--		Begin
--				WaitFor Delay '00:00:10'

--				SET @CatCode = (Select Top 1 Category From MasterACFV.dbo.CategoryCodeRunFlag Where ClientRun = 0 And AdBlockRun = 1 And HTMLRun = 1 And IsFull = 0 And CodeStatus = 1)

--				update MasterACFV.dbo.CategoryCodeRunFlag set HTMLRun = 0 where Category = @CatCode

--				-- UPC Call
--				IF (@CatCode = 'CWGPEP')
--				Begin
--						EXECUTE CustomUPC_Call_Test_Database @CatCode, 'ACFVINCR', 'CNS',0
--						Update MasterACFV.dbo.CategoryCodeRunFlag set UPCRun = 0 where Category = @CatCode
--				End

--				IF (@CatCode = 'WLMPEP')
--				Begin
--						EXECUTE CustomUPC_Call_Test_Database @CatCode, 'ACFVINCR', '',0
--						Update MasterACFV.dbo.CategoryCodeRunFlag set UPCRun = 0 where Category = @CatCode
--				End
		
--				-- HTML Call
--				EXECUTE mt_proc_Html_Call @Catcode
				
--				-- AdBlock Call
--				EXECUTE mt_proc_Create_AdBlock @CatCode, 0
--				update MasterACFV.dbo.CategoryCodeRunFlag set AdBlockRun = 0 where Category = @CatCode
				
--				-- FillHomePageInsight
--				SET @SQL = N'SELECT @lclientid = ISNULL(clientid, 0), @lid = ISNULL(id, 0) FROM mt2sql14.sitecontrol.dbo.CategoryCode WHERE category = ''' + @catcode + ''''
--				EXECUTE sp_Executesql @SQL, N'@lclientid int OUTPUT, @lid int OUTPUT', @lclientid = @clientid OUTPUT, @lid = @id OUTPUT
				
--				set @sql = 'EXEC DataSPDev50Int..[fv_FillHomePageInsightsManufacturerOfferType] '+@clientid+','+ @id+', ''MT2STG0.SiteControlMerged.dbo.'', ''MT2STG0.SubscriptionMerged.dbo.'', '''+@@SERVERNAME+'.'+right(@@servername,5)+'.dbo.'''
--				exec (@sql)
				
--				set @sql = 'EXEC DataSPDev50Int..[fv_FillHomePageInsightsRetailerSOV] '+@clientid+','+ @id+', ''MT2STG0.SiteControlMerged.dbo.'', ''MT2STG0.SubscriptionMerged.dbo.'', '''+@@SERVERNAME+'.'+right(@@servername,5)+'.dbo.'' '
--				exec (@sql)

--				-- Default Query Execution Call
--				EXECUTE DataSP50Int.dbo.fv_RefreshDefaultQueryTables @CatCode

--				-- Update ClientRun, FD Flag in CategoryCode Table
--				EXECUTE('update ' + @CategoryCodeTable + ' set FD = 1 , FDTime = getdate() where Category = ''' + @CatCode + '''')

--				Update MasterACFV.dbo.CategoryCodeRunFlag set CodeStatus = 0 where Category = @CatCode
--				--SET @CatCount = (Select Count(1) From MasterACFV.dbo.CategoryCodeRunFlag Where ClientRun = 1 And AdBlockRun = 0 And HTMLRun = 0  And IsFull = 0)
--				--SET @CatCount = (Select Count(1) From MasterACFV.dbo.CategoryCodeRunFlag Where (AdBlockRun = 1 OR HTMLRun = 1)  And IsFull = 0)
--				SET @CatCount = (Select Count(1) From MasterACFV.dbo.CategoryCodeRunFlag Where IsFull = 0 And CodeStatus = 1)
--		End

