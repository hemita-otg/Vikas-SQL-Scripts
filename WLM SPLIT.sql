USE [ConversionControl]
GO
/****** Object:  StoredProcedure [dbo].[CustomCategoryCodeConversionWLMADL_50]    Script Date: 06/11/2013 02:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[CustomCategoryCodeConversionWLMADL_50]
	@pvarCategoryCode AS VARCHAR(25),  -- AdView Master code
	@pvarChildCode AS VARCHAR(25),     -- ChildCode to be processed
	@pvarClientName AS VARCHAR(50),
	@pbitIncrementalLoad AS BIT,
	@bitDebugExecute BIT = 0,
	@pvarControlDbPrefix VARCHAR(100) = '[mt2sql14].SiteControl.dbo.',
	@ConversionDataDb VARCHAR(50) = 'SQL01'
AS 
SET NOCOUNT ON
BEGIN
/*
	EXECUTE ConversionControl..[CustomCategoryCodeConversionWLMADL_50] 'wlmadl250', 'WLMADL50', 'walmart50', 0, 1, '[mt2sql14].SiteControl.dbo.', 'SQL01'
*/
	DECLARE @varSql AS VARCHAR(8000), @varInserSql AS VARCHAR(MAX), @intIndexType AS INT
	DECLARE @varMasterPdtTable AS VARCHAR(50), @varMasterMpvTable AS VARCHAR(50), @varMasterPGCatsTable varchar(255)
	DECLARE @varChildPdtTable AS VARCHAR(50), @varChildMpvTable AS VARCHAR(50), @varChildPGCatsTable AS VARCHAR(50), @MCTableName AS VARCHAR(50)
	DECLARE @varMasterPrintPcs AS VARCHAR(100), @nvarSql AS VARCHAR(MAX), @intCategoryCodeId INT
	DECLARE @varSelectFields AS VARCHAR(MAX)
	
	DECLARE @bitDaa AS BIT
	DECLARE @bitIsMPV as BIT
	Declare @IsPgCats bit
	Declare @varCode VARCHAR(50)
	Declare @varCodeText VARCHAR(50)
	DECLARE @NSQL NVARCHAR(4000)
	Declare @isIntegerID bit

	
	SET @intCategoryCodeId = 0
	SET @MCTableName = (select MCTable from ConversionControl.dbo.ConversionCategory where DatabaseCategory= @pvarChildCode)	
	
	SET @NSQL ='SELECT @intCategoryCodeId = [Id],@isIntegerID = isnull([isIntegerID],0)
				FROM ' + @ConversionDataDb + '.dbo.CategoryCodeTable 
				WHERE Category = ''' + @pvarChildCode + ''''
	
	Execute sp_executesql @NSQL, N'@intCategoryCodeId INT output,@isIntegerID INT output', @intCategoryCodeId output,  @isIntegerID output
	
	SET @varMasterPdtTable = @pvarCategoryCode + 'DetailReports'
		
	SET @varSql = ''
	
	
	SET @varSelectFields = ' w.[PageDetailID], w.[OriginalPageDetailID], w.[FlyerId], w.[OriginalFlyerID], w.[Page], w.[PageType], w.[OrderValue], w.[Height], w.[Width], '
	SET @varSelectFields = @varSelectFields  +  'w.[PageSpace], w.[AdvertiserId], w.[Advertiser], w.[marketid], w.[market], w.[RetMktId], w.[mediaId], w.[media], w.[eventId], w.[event], '
	SET @varSelectFields = @varSelectFields  +  'w.[FirstPageHeight], w.[FirstPageWidth], w.[FlyerSpace], w.[themeid], w.[theme], w.[PublicationId], w.[Publication], w.[TradeClassId], '
	SET @varSelectFields = @varSelectFields  +  'w.[tradeclass], w.[AdDate], w.[WeekOf], w.[salestartdate], w.[saleenddate], w.[Pages], w.[CouponInd], w.[PublishedOn], w.[RegionId], '
	SET @varSelectFields = @varSelectFields  +  'w.[Region], w.[DistrictId], w.[District], w.[CountryID], w.[Country], w.[LanguageID], w.[Language], w.[WeekOfn], w.[WeekOfi], w.[AdMonth], '
	SET @varSelectFields = @varSelectFields  +  'w.[AdMonthId], w.[ManufacturerId], w.[Manufacturer], w.[MerchandiseCategoryId], w.[MerchandiseCategory], w.[MerchandiseSubCatId], w.[MerchandiseSubCat], '
	SET @varSelectFields = @varSelectFields  +  'w.[CategoryId], w.[Category], w.[BrandId], w.[Brand], w.[SKUDescription1ID], w.[SKUDescription1], w.[SKUDescription2ID], w.[SKUDescription2], '
	SET @varSelectFields = @varSelectFields  +  'w.[SKUDescription3ID], w.[SKUDescription3], w.[SKUTypeID], w.[SKUType], w.[SalePrice1], w.[SalePrice2], w.[RegularPrice1], w.[RegularPrice2], '
	SET @varSelectFields = @varSelectFields  +  'w.[NorPrice], w.[RebateAmount], w.[LowestRebatePrice], w.[LowestDiscountPrice], w.[UnitPrice], w.[Features], w.[NumberPackage], w.[Coupon], '
	SET @varSelectFields = @varSelectFields  +  'w.[CouponValueD1], w.[CouponValueD2], w.[CouponValueP1], w.[CouponValueP2], w.[OtherDiscountD1], w.[OtherDiscountD2], w.[OtherDiscountD3], '
	SET @varSelectFields = @varSelectFields  +  'w.[RequiredQuantity], w.[MaximumQuantity], w.[AdSize], w.[AdCost], w.[Illustrated], w.[SaleStDt], w.[SaleEndDt], w.[CouponExpirationDate], '
	SET @varSelectFields = @varSelectFields  +  'w.[Optional1], w.[Optional2], w.[Optional3], w.[Optional4], w.[Optional5], w.[Optional6], w.[Optional7], w.[Optional8], w.[Optional9], '
	SET @varSelectFields = @varSelectFields  +  'w.[Optional10], w.[Optional11], w.[Optional12], w.[Comments], w.[ProductTerritoryID], w.[ProductTerritory], w.[ProductTerritorySubGroupID], '
	SET @varSelectFields = @varSelectFields  +  'w.[ProductTerritorySubGroup], w.[ProductTerritoryGroupID], w.[ProductTerritoryGroup], w.[EnteredClient], w.[CouponExpirationDate1], w.[CouponExpirationDate2], '
	SET @varSelectFields = @varSelectFields  +  'w.[OtherDiscountP1], w.[OtherDiscountP2], w.[OtherDiscountP3], w.[Comments1], w.[OfferDes], w.[comments2], w.[comments3], w.[comments4], '
	SET @varSelectFields = @varSelectFields  +  'w.[topleftx], w.[toplefty], w.[bottomrightx], w.[bottomrighty], w.[UnitTypeId], w.[UnitType], w.[PkgSizeId], w.[PkgSize], w.[MPVPageEvent], '
	SET @varSelectFields = @varSelectFields  +  'w.[MPVPageEventId], w.[MPVPageTheme], w.[MPVPageThemeId], w.[MPVVariety], w.[MPVVarietyId], w.[MPVOrigin], w.[MPVOriginId], w.[McUpdatedOn], '
	SET @varSelectFields = @varSelectFields  +  'w.[MscUpdatedOn], w.[MfrUpdatedOn], w.[PtUpdatedOn], w.[PtgUpdatedOn], w.[PtsgUpdatedOn], w.[FeaturesId], w.[AdType], w.[Img], w.[PageTypeId], '
	SET @varSelectFields = @varSelectFields  +  'w.[TaggedCompany], w.[DTAdded], w.[Weight], w.[AdDay], w.[AdDayId], w.[size], w.[MPVOffer], w.[MPVOfferId], w.[MPVOfferType], w.[MPVOfferTypeId], '
	SET @varSelectFields = @varSelectFields  +  'w.[SalesTerritory], w.[SalesTerritoryGroup], w.[SalesTerritorySubGroup], w.[SalesTerritoryId], w.[SalesTerritorySubGroupId], w.[SalesTerritoryGroupId], '
	SET @varSelectFields = @varSelectFields  +  'w.[TcUpdatedOn], w.[DistUpdatedOn], w.[RegionUpdatedOn], w.[StUpdatedOn], w.[StgUpdatedOn], w.[StsgUpdatedOn], w.[MTIDERetId], w.[MTIDEMktId], '
	SET @varSelectFields = @varSelectFields  +  'w.[subject], w.[persona], w.[receivedDt], w.[AdSalePeriod], w.[AdSaleWeek], w.[AdSaleMonth], w.[AdSaleYear], w.[WeekNum], w.[ADRetId], '
	SET @varSelectFields = @varSelectFields  +  'w.[ADThemeId], w.[NewsId], w.[ADMktId], w.[RetChanId], w.[webcreated], w.[datetimerecordentered], w.[url], w.[RetID], w.[MktID], w.[ADRetMktID], '
	SET @varSelectFields = @varSelectFields  +  'w.[Image], w.[SizeId], w.[Color], w.[PageHeight], w.[PageWidth], w.[PageNo], w.[ProdImageCreated], w.[ProdImageCreatedOn], w.[FullProductImageSize], '
	SET @varSelectFields = @varSelectFields  +  'w.[ThumbnailProductImageSize], w.[HighDOff], w.[HighRebateAmount], w.[GiftCardD], w.[BuyNumber], w.[GetNumber], w.[HighPOff], w.[ExtraPOff], '
	SET @varSelectFields = @varSelectFields  +  'w.[RequiredNumberOffer], w.[FinansingInterestRate], w.[FinansingMinPurchase], w.[FinansingTermLength], w.[FinansingTermLengthType], w.[HiGiftCard], '
	SET @varSelectFields = @varSelectFields  +  'w.[WasPrice], w.[TrackNo], w.[MadCode], w.[AdlertPage], w.[CatID], w.[GrpID], w.[SubCatID], w.[ADBrandId], w.[MfrId], w.[AdNoteId], '
	SET @varSelectFields = @varSelectFields  +  'w.[BrandFamilyId], w.[BrandFamilyDescrip], w.[CropHeight], w.[CropWidth], w.[ImageProductCount], w.[Adwidth], w.[AdHeight], w.[AdSpace], '
	SET @varSelectFields = @varSelectFields  +  'w.[ReleaseStatus], w.[Channel], w.[ChannelID], w.[MediaDetail], w.[MediaDetailID]'

	SET @varChildPdtTable = @pvarChildCode + 'DetailReports'

	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Conversion Started',getdate())
		
		SET @varSql = 'IF EXISTS (SELECT * FROM Sysobjects WHERE [Name] = ''' + @MCTableName + ''' and XType = ''U'') 
			DROP TABLE ' + @MCTableName
		IF @bitDebugExecute = 1
			PRINT (@varSql)
		ELSE
			EXEC(@varSql)	

		SET @varSql = 'SELECT MC.* INTO ' + @MCTableName + ' FROM ' + @pvarControlDbPrefix + 'vw_MerchandiseCategory MC Where CategoryCodeID = ' +  Cast(@intCategoryCodeId as varchar)
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

	
	--Full Run
	IF @pbitIncrementalLoad = 0 
	BEGIN
		If @pvarChildCode IN ('WLMADL50')
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'Start : Truncate WLMADL50 Trigger', getdate())

			SET @varSql = 'TRUNCATE TABLE ' + @ConversionDataDb + '.dbo.' + @pvarChildCode + 'MasterTrigger '
			IF @bitDebugExecute = 1
				PRINT @varSql
			ELSE
				EXEC(@varSql)	

			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'End : Truncate WLMADL50 Trigger', getdate())
		END

		SET @varInserSql = @varSelectFields
		--PDT : Populate Table	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Create PDT Table',getdate())
		SET @varSql = 'IF EXISTS (SELECT * FROM ' + @ConversionDataDb + '.dbo.Sysobjects WHERE [Name] = ''' + @varChildPdtTable + ''' AND XType = ''U'') 
			DROP TABLE ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		SET @varSql = 'SELECT * INTO ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' FROM ' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' WHERE 1=2 '
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
 

		SET @varSql = 'INSERT INTO ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + '
					(' + REPLACE(@varInserSql,'w.','') + ') '
			SET @varInserSql = REPLACE(@varInserSql, 'w.[Category],', 'mc.[Category],')
			SET @varInserSql = REPLACE(@varInserSql, 'w.[MerchandiseCategory],', 'ISNULL(RTRIM(MC.[MerchandiseCategory]),''Z - ''  + RTRIM(w.[MerchandiseCategory]) + '' - OTHER''),')
			SET @varInserSql = REPLACE(@varInserSql, 'w.[MerchandiseSubCat],', 'mc.[MerchandiseSubCat],')
			SET @varSql = @varSql + 'SELECT  ' + @varInserSql + ' FROM  
					' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' AS w 
					LEFT OUTER JOIN ' + @MCTableName + ' AS mc ON w.Category = mc.RealCategory option (maxdop 1) '
		
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
			
		SELECT @varSql = 'ALTER TABLE ' + @ConversionDataDb + '.[dbo].[' + @varChildPdtTable + '] WITH NOCHECK ADD 
			CONSTRAINT [PK_' + @varChildPdtTable + '] PRIMARY KEY  CLUSTERED 
			(
				[PageDetailID]
			) WITH  FILLFACTOR = 90  ON [PRIMARY] '
		IF @bitDebugExecute = 1 
			PRINT @varSql
		ELSE
			Exec(@varSql)
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Create PDT Table',getdate())

		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @pvarChildCode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Brand Based Updates',getdate())
				
			SET @varSql  = 'UPDATE ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' SET 
						MerchandiseSubCat = T.MerchandiseSubCat 
						FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' PDT JOIN ConversionControl..MCUpdate T
						ON PDT.MerchandiseCategory = T.MerchandiseCategory and PDT.Brand = T.RealBrand
						WHERE T.DatabaseCategory IN(''' + @pvarChildCode + ''') option (maxdop 1)'
			IF @bitDebugExecute = 1 
				PRINT @varSql
			ELSE
				Exec(@varSql)
		
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,@varSql,getdate())			
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Brand Based Updates',getdate())			
		END

		--Item	::	10632
		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @pvarChildCode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : PT Based Updates',getdate())
				
			SET @varSql  = 'UPDATE ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' SET 
						ProductTerritory = T.ProductTerritory 
						FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' PDT JOIN ConversionControl..MCUpdate T
						ON PDT.Category = T.Category and PDT.Brand = T.RealBrand
						WHERE T.DatabaseCategory IN(''' + @pvarChildCode + ''') option (maxdop 1)'
			IF @bitDebugExecute = 1 
				PRINT @varSql
			ELSE
				Exec(@varSql)
		
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,@varSql,getdate())			
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : PT Based Updates',getdate())			
		END
		--Item	::	10632
		
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'Start : Inserting WLMADL50 Trigger', getdate())

		SET @varSql = 'INSERT INTO ' + @ConversionDataDb + '.dbo.' + @pvarChildCode + 'MasterTrigger SELECT PageDetailID, DTAdded, CONVERT(varchar(10), GETDATE(), 101) FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' '
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'End : Inserting WLMADL50 Trigger', getdate())

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Set IDs for Updated Fields',getdate())
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update '''+ @varChildPdtTable + ''', ''Category'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update '''+ @varChildPdtTable + ''', ''MerchandiseCategory'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update '''+ @varChildPdtTable + ''', ''MerchandiseSubCat'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Set IDs for Updated Fields',getdate())

	--Apply Indexes.
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Create Indexes',getdate())
			SET @varSql = 'CREATE  INDEX [idxWLMADL50TracknoPagePDTID] 
				ON ' + @ConversionDataDb + '.[dbo].[' + @varChildPdtTable + ' ]([Trackno], [Page], [Features], [FlyerID], [PageDetailID]) 
				WITH  FILLFACTOR = 90 ON [PRIMARY]'

			IF @bitDebugExecute = 1
				PRINT @varSql
			ELSE
				EXEC(@varSql)	

			SET @varSql = 'CREATE  INDEX [WLMADL50PDTConsolidated] ON ' + @ConversionDataDb + '.[dbo].[' + @varChildPdtTable + ' ]
				([TaggedCompany] , [Manufacturer] , [MerchandiseCategory] , [MerchandiseSubCat] , [Category] , [Brand] , [MPVPageEventId] , [ProductTerritory] , [ProductTerritorySubGroup] , [ProductTerritoryGroup] ) ON [PRIMARY]'

			IF @bitDebugExecute = 1
				PRINT @varSql
			ELSE
				EXEC(@varSql)	

			SET @varSql = 'CREATE  INDEX [idxWLMADL50PDTPageEvent] 
				ON ' + @ConversionDataDb + '.[dbo].[' + @varChildPdtTable + ' ]([MPVPageEventId],[PageDetailID]) 
				WITH  FILLFACTOR = 90 ON [PRIMARY]'

			IF @bitDebugExecute = 1
				PRINT @varSql
			ELSE
				EXEC(@varSql)	
	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Create Indexes',getdate())
		--Apply Indexes.


	END
	ELSE IF @pbitIncrementalLoad = 1 --Incremental
	BEGIN
		SET @varInserSql = @varSelectFields
		--PDT : Populate Table	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Create Incremental PDT Table',getdate())
		SET @varSql = 'IF EXISTS (SELECT * FROM Tempdb.dbo.Sysobjects WHERE [Name] = ''' + @varChildPdtTable + ''' AND XType = ''U'') 
			DROP TABLE Tempdb.dbo.' + @varChildPdtTable
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
			
		SET @varSql = 'DELETE X FROM ' + @ConversionDataDb + '.dbo.' + @pvarChildCode + 'MasterTrigger X 
		Where X.PageDetailID NOT IN (Select Y.PageDetailID FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' Y) 
		And X.PageDetailID IN (Select Z.PageDetailID FROM ' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' Z)' 
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)

		SET @varSql = 'SELECT * INTO Tempdb.dbo.' + @varChildPdtTable + ' FROM ' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' WHERE 1 = 2'
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
					
		SET @varSql = 'INSERT INTO Tempdb.dbo.' + @varChildPdtTable + '
					(' + REPLACE(@varInserSql,'w.','') + ') '
			SET @varInserSql = REPLACE(@varInserSql, 'w.[Category],', 'mc.[Category],')
			SET @varInserSql = REPLACE(@varInserSql, 'w.[MerchandiseCategory],', 'ISNULL(RTRIM(MC.[MerchandiseCategory]),''Z - ''  + RTRIM(w.[MerchandiseCategory]) + '' - OTHER''),')
			SET @varInserSql = REPLACE(@varInserSql, 'w.[MerchandiseSubCat],', 'mc.[MerchandiseSubCat],')
			SET @varSql = @varSql + 'SELECT ' + @varInserSql + ' FROM  
				' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' AS w 
				LEFT OUTER JOIN ' + @MCTableName + ' AS mc ON w.Category = mc.RealCategory 
				And w.PageDetailID NOT IN (SELECT X.PageDetailID FROM ' + @ConversionDataDb + '.dbo.' + @pvarChildCode + 'MasterTrigger X) option (maxdop 1) '
		
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Create Temp PDT Table',getdate())
	
		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @pvarChildCode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Brand Based Updates',getdate())
				
			SET @varSql  = 'UPDATE Tempdb.dbo.' + @varChildPdtTable + ' SET 
						MerchandiseSubCat = T.MerchandiseSubCat 
						FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' PDT JOIN ConversionControl..MCUpdate T
						ON PDT.MerchandiseCategory = T.MerchandiseCategory and PDT.Brand = T.RealBrand
						WHERE T.DatabaseCategory IN(''' + @pvarChildCode + ''') option (maxdop 1)'
			IF @bitDebugExecute = 1 
				PRINT @varSql
			ELSE
				Exec(@varSql)
		
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,@varSql,getdate())			
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Brand Based Updates',getdate())			
		END

		--Item	::	10632
		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @pvarChildCode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : PT Based Updates',getdate())
				
			SET @varSql  = 'UPDATE Tempdb.dbo.' + @varChildPdtTable + ' SET 
						ProductTerritory = T.ProductTerritory 
						FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' PDT JOIN ConversionControl..MCUpdate T
						ON PDT.Category = T.Category and PDT.Brand = T.RealBrand
						WHERE T.DatabaseCategory IN(''' + @pvarChildCode + ''') option (maxdop 1)'
			IF @bitDebugExecute = 1 
				PRINT @varSql
			ELSE
				Exec(@varSql)
		
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,@varSql,getdate())			
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : PT Based Updates',getdate())			
		END
		--Item	::	10632

		--ID Update Start
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Set IDs for Updated Fields',getdate())
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update_WLMADL50 ''tempdb.dbo.'+ @varChildPdtTable + ''', ''Category'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update_WLMADL50 ''tempdb.dbo.'+ @varChildPdtTable + ''', ''MerchandiseCategory'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		Set @varSql= 'exec SQL01.dbo.mt_proc_Create_ID_Update_WLMADL50 ''tempdb.dbo.'+ @varChildPdtTable + ''', ''MerchandiseSubCat'''
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Set IDs for Updated Fields',getdate())
		--ID Update End

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'Start : Inserting New Records To WLMADL50 PDT/MPV', getdate())

		SET @varSql = 'DELETE FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' WHERE PAGEDETAILID IN (SELECT w.PAGEDETAILID FROM TempDB.dbo.' + @varChildPdtTable + ' AS w) '
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

		SET @varInserSql = @varSelectFields
		SET @varSql = 'INSERT INTO ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' (' + REPLACE(@varInserSql,'w.','') + ') '
		SET @varSql = @varSql + ' SELECT ' + @varInserSql + ' FROM TempDB.dbo.' + @varChildPdtTable + ' AS w '  
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'End : Inserting New Records To WLMADL50 PDT/MPV', getdate())

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'Start : Inserting Trigger', getdate())

		SET @varSql = 'INSERT INTO ' + @ConversionDataDb + '.dbo.' +  @pvarChildCode + 'MasterTrigger SELECT Distinct PageDetailID, DTAdded, CONVERT(varchar(10), GETDATE(), 101) FROM TempDB.dbo.' + @varChildPdtTable + ' '
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'End : Inserting Trigger', getdate())

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'Start : Deleting Orphan records', getdate())

		SET @varSql = 'DELETE FROM ' + @ConversionDataDb + '.dbo.' + @varChildPdtTable + ' WHERE PageDetailID Not In (SELECT X.PageDetailID FROM ' + @ConversionDataDb + '.dbo.' + @varMasterPdtTable + ' X) '
		IF @bitDebugExecute = 1
			PRINT @varSql
		ELSE
			EXEC(@varSql)	

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode, 'End : Deleting Orphan records', getdate())
	
	END
	
	--Custom updates for WLMADL 
	
	--Create Dependent Tables.
	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Create Dependent Tables in PartialRun',getdate())
		--Execute SQL01.dbo.mt_proc_Create_DisplayTables_AD @pvarChildCode
		--TODO Create DisQuery Page for WLMADL50 - Done
			SET @varSql=''
			SET @varSql= 'if exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where NAME = ''' + @pvarChildCode + 'DisQueryPage'')
			drop table ' + @ConversionDataDb + '.dbo.[' + @pvarChildCode + 'DisQueryPage]  '
		
			IF @bitDebugExecute = 1
				PRINT (@varSql)
			ELSE
				EXEC(@varSql)
			 
			
			--DisQueryPage
			SET @varSql= 'SELECT DISTINCT [BrandId], [Brand], 
			[ManufacturerId], [Manufacturer], 
			[MerchandiseCategoryId], [MerchandiseCategory], 
			[MerchandiseSubCatId], [MerchandiseSubCat], 
			[CategoryId], [Category],
			ProductTerritoryID,
			ProductTerritory,
			ProductTerritoryGroupID,
			ProductTerritoryGroup,
			ProductTerritorySubGroupID,
			ProductTerritorySubGroup,
			LTRIM(RTRIM(SKUDescription1)) AS SKUDescription1,
			SKUDescription1ID,
			LTRIM(RTRIM(SKUDescription2)) AS SKUDescription2,
			SKUDescription2ID,
			 LTRIM(RTRIM(SKUDescription3)) AS SKUDescription3,
			 SKUDescription3ID,
			 LTRIM(RTRIM(SKUType)) AS SKUType,
			 SKUTypeID
			INTO ' + @ConversionDataDb + '.[dbo].[' + @pvarChildCode + 'DisQueryPage]
			FROM ' + @ConversionDataDb + '.[dbo].[' + @pvarChildCode + 'DetailReports]
				  '
			IF @bitDebugExecute = 1
				PRINT @varSql
			ELSE
				EXEC(@varSql)	

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Create Dependent Tables  in PartialRun',getdate())
	 
	--Create Dependent Tables.

	--TODO Done
	----Apply Indexes.
	--INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Start : Create Indexes',getdate())
	----EXECUTE conversion_AddIndexes_50 @pvarChildCode, @intIndexType, @bitDaa, @pbitIncrementalLoad, @bitDebugExecute, @ConversionDataDb,@pvarControlDbPrefix
	--INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'End : Create Indexes',getdate())
	----Apply Indexes.
	
	UPDATE ConversionCategory SET ConversionEnd = GETDATE(), FTPStatus = 0, MasterCatCode = NULL WHERE DatabaseCategory = @pvarChildCode

	IF @pbitIncrementalLoad = 1	
		UPDATE ConversionCategory SET PartialRun = GETDATE(), conversiondone = 1 WHERE DatabaseCategory = @pvarChildCode
	ELSE
		UPDATE ConversionCategory SET FullRun = GETDATE(), conversiondone = 1 WHERE DatabaseCategory = @pvarChildCode
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@pvarChildCode,'Conversion End',getdate())

	--TODO - done
	--Process WLMADL child codes as incremental
	--EXECUTE ChildCategoryCodeConversion_50 @pvarCategoryCode, @pvarClientName, @pbitIncrementalLoad, '[mt2sql14].SiteControl.dbo.', @ConversionDataDb,@isIntegerID
END




