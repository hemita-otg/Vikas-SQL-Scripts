SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER              Procedure CreateClientTables
	@CatCode varchar(15), 
	@Return_Val int output,
	@Debug bit = 1
as
begin
	set nocount on
	Declare @CatCWMTable varchar(255)
	Declare @CatPDTTable varchar(255)
	Declare @CatMPVTable varchar(255)
	Declare @CatMerchCatTable varchar(255)
	Declare @FullSourceCode varchar(255)
	Declare @SrcCatCode varchar(255)
	Declare @IsFull bit
	Declare @IsPDT bit	
	Declare @CBECnt int
	Declare @IsFSI bit
	Declare @IsMaster bit
	Declare @IsOD bit
	Declare @SrcPDTTable varchar(255)
	Declare @SrcMPVTable varchar(255)
	Declare @SrcPDTDeleteTable varchar(255)
	Declare @Index_Type int
	Declare @SQL varchar(8000)
	Declare @NSQL Nvarchar(1000)
	Declare @IncludePT bit
	Declare @strNewId varchar(255)
	Declare @CBETable varchar(255)	
	Declare @strMCTableName varchar(255)
	Declare @CategoryCodeTable varchar(255)
	Declare @ServerType varchar(25)
	Declare @strDate VARCHAR(100)
	Declare @Comments1NOffDesc VARCHAR(255)
	Declare @IsConCatUpdate bit
	Declare @ConcatType int 
	Declare @MasterCodeConcatType int 
	Declare @MasterCode int 
	Declare @intCategoryCodeId INT
	Declare @vchrControDbPrefix VARCHAR(100)
	Declare @vchrNorPrice VARCHAR(1000)
--	Declare @vchrRegPrice2 VARCHAR(1000)
	Declare @bitIsNORUnit BIT
	Declare @bitOffer BIT
	Declare @CRMETable varchar(255)	
	Declare @CRMECnt int
	Declare @CRMEType int
	Declare @bitBuPC BIT
	Declare @vchrBuPCSql VARCHAR(100)
	Declare @IsProductionCode BIT
	Declare @BrandField VARCHAR(100)
	SET @IsProductionCode = 0
	IF @CatCode IN('PRD1','PRD2','PRD3','prdbev','prdcan','PRDHSP','prdpr','prdProd','svlSCApl')
		SET @IsProductionCode = 1		
	SET @vchrBuPCSql = ''
	EXECUTE GetServerType @@SERVERNAME,@ServerType OUTPUT
	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	EXECUTE GetTableName @CatCode, 3, @CatCWMTable OUTPUT
	set @IncludePT = 0
	SET @NSQL = 'If exists(select Category from ' + @CategoryCodeTable + ' where category = ''' + @CatCode + ''' 
			And (BUPT = 1 or BUPTG = 1 or BUPTSG = 1) ) SET  @IncludePT = 1 '
	execute sp_executesql @NSQL, N'@IncludePT bit output', @IncludePT output
	Select @CatPDTTable = @CatCode + 'PageDetailTable'
	Select @CatMPVTable = @CatCode + 'MultiplePageValues'
	--Fetch CategoryCodeId
	SET @intCategoryCodeId = 0
	SET @NSQL = 'SELECT @intCategoryCodeId = [ID] from ' + @CategoryCodeTable + ' where category = ''' + @CatCode + ''''
	execute sp_executesql @NSQL, N'@intCategoryCodeId INT output', @intCategoryCodeId output	
	--Fetch CategoryCodeId
	--MerchandiseCategory 
	SELECT @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')
	SET @NSQL = 'SELECT @strMCTableName = TemplateName FROM ' + @vchrControDbPrefix + 'MerchandiseCategoryTemplates M JOIN 
			' + @vchrControDbPrefix + 'MerchandiseCategoryControl MC ON M.MCTemplateID = MC.MCTemplateID WHERE
			MC.CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	execute sp_executesql @NSQL, N'@strMCTableName varchar(255) output', @strMCTableName output
	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @CatMerchCatTable = 'TEMPDB..TMC' + @strNewId
	SET @SQL = 'SELECT * INTO ' + @CatMerchCatTable + ' FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory  
			Where CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	IF @Debug = 1 
		PRINT @SQL
	ELSE
		Exec(@sql)
	PRINT '--MCTemplate = ' + @strMCTableName
	PRINT '--MCTable = ' + @CatMerchCatTable
	--MerchandiseCategory 
	--ClientBrandException
	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @CBETable = ''	
	EXECUTE GetTableName 'ClientBrandException', 0, @CBETable OUTPUT  
	SET @SQL = 'SELECT * INTO TEMPDB..TCBE' + @strNewId + ' FROM ' + @CBETable + ' Where 
				CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	Exec(@sql)
	IF @Debug = 1 
		PRINT @SQL
	SET @CBETable = 'TEMPDB..TCBE' + @strNewId
	--ClientBrandException
	--ClientRetMktException
	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @SQL = 'SELECT * INTO TEMPDB..TCRME' + @strNewId + ' FROM ' + @vchrControDbPrefix + 'ClientRetMktException Where 
				CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	Exec(@sql)
	IF @Debug = 1 
		PRINT @SQL
	set @CRMETable = 'TEMPDB..TCRME' + @strNewId
	select @CRMECnt = 0
	select @NSQL = N'Select @CRMECnt = COUNT(*) FROM ' + @CRMETable 
	execute sp_executesql @NSQL, N'@CRMECnt INT OUTPUT', @CRMECnt OUTPUT
	DECLARE @vchrCrmeJoinClause VARCHAR(500)
	DECLARE @vchrCrmeWhereClause VARCHAR(500)
	/*
	SET @vchrCrmeJoinClause = ' LEFT OUTER JOIN ' + @CRMETable + ' Crme ON Pdt.Category = Crme.RealCategory 
					AND (Crme.Type = 1 OR (Crme.Type = 2 AND Cwm.RetMktId = Crme.RetMktId)) '
	SET @vchrCrmeWhereClause = ' ((Crme.RealCategory IS NULL OR Crme.RetMktId IS NULL) OR 
					(Cwm.RetMktId = Crme.RetMktId AND Crme.RealCategory = Pdt.Category AND Crme.Type = 1)) '
	*/
	select @CRMEType = 0
	select @NSQL = N'Select Top 1 @CRMEType = Type FROM ' + @CRMETable 
	execute sp_executesql @NSQL, N'@CRMEType INT OUTPUT', @CRMEType OUTPUT
	if @CRMEType = 1 --- Retailers and Market provided with set of category 
		SET @vchrCrmeJoinClause = ' LEFT OUTER JOIN ' + @CRMETable + ' Crme ON 
						(Cwm.RetMktId = Crme.RetMktId And Crme.Type = 1) '
	if @CRMEType = 2 --Category provided for subset of retailers and market		
		SET @vchrCrmeJoinClause = ' LEFT OUTER JOIN ' + @CRMETable + ' Crme ON 
						(Pdt.Category = Crme.RealCategory And Crme.Type = 2) '
	SET @vchrCrmeWhereClause = ' ((Crme.RealCategory IS NULL OR Crme.RetMktId IS NULL) OR 
					(Cwm.RetMktId = Crme.RetMktId AND Crme.RealCategory = Pdt.Category)) '
	--ClientRetMktException
	IF @ServerType = 'Master'
	BEGIN
		--Select @FullSourceCode = FullSourceCode, @Index_Type = IsNull(Index_Type, 1), @IsPDT = IsPDT, @IsMaster = IsMaster, @IsFull = IsFull , @SrcCatCode = case when IsFull = 0 then PartialSourceCode Else FullSourceCode end From CategoryCode where Category = @CatCode
		select @NSQL = N'Select @FullSourceCode = FullSourceCode, @Index_Type = Case when IsFull = 1 Then IsNull(MasterIndex, 1) Else IsNull(Index_Type, 1) End, 
				@IsPDT = isPDT, @IsMaster = IsMaster, @IsFull = IsFull , 
				@SrcCatCode = case when IsFull = 0 then PartialSourceCode Else FullSourceCode end, 
				@IsFSI = IsNull(ISFSI,0) , @IsOD = IsNull(IsOD,0), @bitIsNORUnit = ISNULL(IsNORUnit,0), @bitOffer = ISNULL(IsOffer,0), @bitBuPC = ISNULL(BuPC,0)  
				From ' + @CategoryCodeTable + ' 
				where Category = ''' + @CatCode + ''''
		execute sp_executesql @NSQL, N'@FullSourceCode varchar(255) OUTPUT,@Index_Type int OUTPUT,@IsPDT bit OUTPUT,@IsMaster bit OUTPUT,@IsFull bit OUTPUT,@SrcCatCode varchar(255) OUTPUT, @IsFSI bit OUTPUT, @IsOD bit OUTPUT, @bitIsNORUnit bit OUTPUT, @bitOffer bit OUTPUT, @bitBuPC bit OUTPUT', @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT
	END
	ELSE IF @ServerType = 'Client' and @@servername = 'MT2SQL00'
	BEGIN
		select @NSQL = N'Select @FullSourceCode = FullSourceCode, @Index_Type = Case when IsFull = 1 Then IsNull(MasterIndex, 1) Else IsNull(Index_Type, 1) End, 
				@IsPDT = ClientPDT, @IsMaster = IsMaster, @IsFull = IsFull , 
				@SrcCatCode = case when IsFull = 0 then PartialSourceCode Else FullSourceCode end, 
				@IsFSI = IsNull(ISFSI,0) , @IsOD = IsNull(IsOD,0), @bitIsNORUnit = ISNULL(IsNORUnit,0), @bitOffer = ISNULL(IsOffer,0), @bitBuPC = ISNULL(BuPC,0)   
				From ' + @CategoryCodeTable + ' 
				where Category = ''' + @CatCode + ''''
		execute sp_executesql @NSQL, N'@FullSourceCode varchar(255) OUTPUT,@Index_Type int OUTPUT,@IsPDT bit OUTPUT,@IsMaster bit OUTPUT,@IsFull bit OUTPUT,@SrcCatCode varchar(255) OUTPUT, @IsFSI bit OUTPUT, @IsOD bit OUTPUT, @bitIsNORUnit bit OUTPUT, @bitOffer bit OUTPUT, @bitBuPC bit OUTPUT', @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT
	END
	ELSE
	BEGIN
		select @NSQL = N'Select @FullSourceCode = FullSourceCode, @Index_Type = IsNull(MasterIndex, 1), @IsPDT = ClientPDT, @IsMaster = IsMaster, @IsFull = IsFull , @SrcCatCode = case when IsFull = 0 then PartialSourceCode Else FullSourceCode end, @IsFSI = IsNull(ISFSI,0), @IsOD = IsNull(IsOD,0), @bitIsNORUnit = ISNULL(IsNORUnit,0), @bitOffer = ISNULL(IsOffer,0), @bitBuPC = ISNULL(BuPC,0)  From ' + @CategoryCodeTable + ' where Category = ''' + @CatCode + ''''
		execute sp_executesql @NSQL, N'@FullSourceCode varchar(255) OUTPUT,@Index_Type int OUTPUT,@IsPDT bit OUTPUT,@IsMaster bit OUTPUT,@IsFull bit OUTPUT,@SrcCatCode varchar(255) OUTPUT, @IsFSI bit OUTPUT, @IsOD bit OUTPUT, @bitIsNORUnit bit OUTPUT, @bitOffer bit OUTPUT, @bitBuPC bit OUTPUT', @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT
	END
	--NorPrice Changes
	IF @bitIsNORUnit = 0
	BEGIN
		SET @vchrNorPrice = 'NorPrice' 	 
	END
	ELSE
	BEGIN
		SET @vchrNorPrice = 'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 
	END
	--NorPrice Changes
	--RegularPrice2
--	SET @vchrRegPrice2 = 'case when isnull(RequiredQuantity,0) > 0 then RegularPrice1/RequiredQuantity When isnull(RequiredQuantity,0) = 0 then RegularPrice1 Else NULL End AS RegularPrice2'
	--RegularPrice2
	
	IF @IsOD = 1 And @IsMaster = 1
		SET @Comments1NOffDesc = ' IsNull(EntryComments1, Comments1) as Comments1, OfferDes '
	Else
	   If @IsOD = 1 And @IsMaster = 0
		SET @Comments1NOffDesc = ' Comments1, OfferDes '
	   Else
		SET @Comments1NOffDesc = ' Comments1 '
	SET @BrandField = ' PDT.Brand '
	IF @IsProductionCode = 1
		SET @BrandField = ' PDT.EntryBrand As Brand '			
	--Adview2Control Changes.
	If @IsPDT = 1	
	begin
		--Start : Concat Updates 
		set @IsConCatUpdate = 0
		set @ConcatType = 0
		set @MasterCodeConcatType = 0
		select @NSQL = N'Select @ConcatType = ISNULL(IsConcat,0) From ' + @CategoryCodeTable + ' where Category = ''' + @CatCode + ''''
		execute sp_executesql @NSQL, N'@ConcatType int OUTPUT', @ConcatType OUTPUT
		If @IsFull = 1
		begin
			If @ConcatType in(1,3,4)
			begin
				If @IsMaster = 1 	
					set @IsConCatUpdate = 1
				else
				begin --For Child Code
					select @NSQL = N'Select @MasterCodeConcatType = ISNULL(IsConcat,0) From 
						' + @CategoryCodeTable + ' where Category = ''' + @FullSourceCode + ''''
					execute sp_executesql @NSQL, N'@MasterCodeConcatType int OUTPUT', @MasterCodeConcatType OUTPUT
					If @ConcatType <> @MasterCodeConcatType
						set @IsConCatUpdate = 1
				end
			end
		end
		else
		begin -- Peform Concat Update for Partial/Incremental Load
			If @ConcatType in(1,3,4)	
				set @IsConCatUpdate = 1
		end
		--End : Concat Updates 
					
		Select @SrcPDTTable = @SrcCatCode + 'PageDetailTable'
		Select @SrcPDTDeleteTable = @SrcCatCode + 'PDTDelete'
		Select @SrcMPVTable = @SrcCatCode + 'MultiplePageValues'	
		
		select @CBECnt = 0
		--select @NSQL = N'Select @CBECnt = COUNT(*) FROM ' + @CBETable + ' Where CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
		select @NSQL = N'Select @CBECnt = COUNT(*) FROM ' + @CBETable 
		execute sp_executesql @NSQL, N'@CBECnt INT OUTPUT', @CBECnt OUTPUT
		if @Debug = 1
		begin
			If @IsMaster = 1
				Print '--Master'
			Else
				Print '--Child'
			If @IsFull = 1
				Print '--Full'
			Else
				Print '--Partial'
			If @IsFSI = 1
				Print '--FSI'
			If @CBECnt > 0
				Print '--CBE Values Exists'
			Else
				Print '--CBE Values Not Exists'
			If @CRMECnt > 0
				Print '--ClientRetMktException Values Exists'
			Else
				Print '--ClientRetMktException Values Not Exists'
			Print '--@CatCWMTable = ' + @CatCWMTable
			Print '--@CatPDTTable = ' + @CatPDTTable
			Print '--@CatMPVTable = ' + @CatMPVTable
			Print '--@CatMerchCatTable = ' + @CatMerchCatTable
			Print '--@SrcCatCode = ' + @SrcCatCode
			Print '--@SrcPDTTable = ' + @SrcPDTTable
			Print '--@SrcPDTDeleteTable = ' + @SrcPDTDeleteTable
			Print '--@SrcMPVTable = ' + @SrcMPVTable
			Print '--@IsConCatUpdate = ' + CAST(@IsConCatUpdate AS VARCHAR(1))
			Print '--@ConcatType = ' + CAST(@ConcatType AS VARCHAR(10))
			print '-------------------------------------' 
		end		
		/*Drop Table*/	
		/*Drop Table PDT and MPV*/	
		If @IsFull = 1 or @IsFSI = 1
		begin
			if exists(Select name from sysobjects where name = @CatPDTTable)
			begin
				Select @SQL = 'Drop Table ' + @CatPDTTable 
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
			end
	
			if exists(Select name from sysobjects where name = @CatMPVTable)
			begin
				Select @SQL = 'Drop Table ' + @CatMPVTable 
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
				If @Return_Val <> 0
					Return
			end
		end	
		/*Drop Table PDT and MPV*/			
		/*Drop Table*/
	
		/*PDT AND MPV*/
		/*Deleting records from PDT and MPV*/
		if @IsFull = 0 and @IsFSI = 0
		begin
			Select @SQL = 'Alter table ' + @CatPDTTable + '  alter Column Comments1 varchar(510)'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
			
			Select @SQL = 'Delete from ' + @CatPDTTable + ' 
			where PageDetailID in (Select PageDetailid from ' + @SrcPDTTable  + ' )'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
	
		
			Select @SQL = 'Delete From ' + @CatMPVTable + '
			where PageDetailID in (Select PageDetailid from ' + @SrcPDTTable  + ')'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
	
	
			Select @SQL = 'Delete from ' + @CatPDTTable + ' 
			where PageDetailID in (Select PageDetailid from ' + @SrcPDTDeleteTable  + ')'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
	
	
			Select @SQL = 'Delete From ' + @CatMPVTable + '
			where PageDetailID in (Select PageDetailid from ' + @SrcPDTDeleteTable  + ')'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
			
			Select @SQL = 'Delete From ' + @CatMPVTable + '
			where PageDetailID in (Select PageDetailid from ' + @SrcMPVTable  + ')'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
			If @Return_Val <> 0
				Return
		end
		/*Deleting records from PDT and MPV*/	
		/* Is Full Run */
		if @IsFull = 1 or @IsFSI = 1 		
		begin
			/* Is CatCode of Master Or FSI */
			if @IsMaster = 1 or @IsFSI = 1
			begin		
				Select @SQL = ' SELECT 
				Cwm.FlyerId, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
				Retailer, TaggedCompany, Manufacturer, Mc.MerchandiseCategory, Mc.MerchandiseSubCat,
				(CASE WHEN Mc.[Set] = 1 THEN Mc.Category ELSE Mc.RealCategory END) AS Category,
				' + @BrandField + ', SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
				' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
				Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
				RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
				Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
				OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ' , comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin ,Variety ,UnitType , PkgSize
				INTO ' + @CatPDTTable + ' 
				FROM ' + @SrcPdtTable + ' Pdt INNER JOIN ' + @CatCWMTable + ' Cwm ON Cwm.FlyerId = Pdt.FlyerId 
				INNER JOIN ' + @CatMerchCatTable + ' Mc ON Mc.RealCategory = Pdt.Category '
			
				if @CBECnt = 0 -- PEP | FSL (With Exception)
				begin
					IF @CRMECnt > 0 
					BEGIN
						Select @SQL = @SQL + @vchrCrmeJoinClause
						Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					END
					Select @SQL = @SQL + ' OPTION (MAXDOP 1) '
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
					If @Return_Val <> 0
						Return
				end
				else
				begin --GAL
					--Select @SQL = @SQL + ' WHERE Mc.Exclude = 0  OPTION (MAXDOP 1) '
					Select @SQL = @SQL + ' AND Mc.Exclude = 0 '
					IF @CRMECnt > 0 
					BEGIN
						Select @SQL = @SQL + @vchrCrmeJoinClause
						Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					END
					Select @SQL = @SQL + ' OPTION (MAXDOP 1)'
					
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
					If @Return_Val <> 0
						Return					
					--CBE based load
					Select @SQL = 'INSERT INTO ' + @CatPDTTable + '
					SELECT Cwm.FlyerId, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, 
					MultipleValues, DTAdded, Retailer, TaggedCompany, Manufacturer, cbe.MerchandiseCategory, cbe.MerchandiseSubCat,
					CASE WHEN Cbe.CategorySet = 1 THEN Cbe.Category ELSE Cbe.RealCategory END AS Category,
					CASE WHEN Cbe.BrandSet = 1 THEN Cbe.Brand ELSE Cbe.RealBrand END AS Brand, 
					SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
					' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
					Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
					RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
					Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
					OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin ,Variety ,UnitType , PkgSize
					FROM ' + @SrcPDTTable + ' Pdt JOIN ' + @CatCWMTable + ' Cwm ON Cwm.FlyerId = Pdt.FlyerId 
					JOIN ' + @CBETable + ' Cbe ON Pdt.Brand = Cbe.RealBrand AND Pdt.Category = Cbe.RealCategory 
					AND Cbe.Exclude = 0 '
					IF @CRMECnt > 0 
					BEGIN
						Select @SQL = @SQL + @vchrCrmeJoinClause
						Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					END
	
					Select @SQL = @SQL + ' OPTION (MAXDOP 1)'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output			
					If @Return_Val <> 0
						Return
					
					--CBE based uddate
					Select @SQL = 'UPDATE ' + @CatPDTTable + '
					SET MerchandiseCategory = Cbe.MerchandiseCategory, MerchandiseSubCat = Cbe.MerchandiseSubCat,
					Category = (CASE WHEN Cbe.CategorySet = 1 THEN Cbe.Category ELSE Cbe.RealCategory END),
					Brand = (Case WHEN Cbe.BrandSet = 1 THEN Cbe.Brand ELSE Cbe.RealBrand END) 
					FROM ' + @CatPDTTable + ' Pdt JOIN ' + @CBETable + ' Cbe ON 
					Pdt.Category = Cbe.RealCategory AND Pdt.Brand = Cbe.RealBrand AND Cbe.Exclude = 1 
					OPTION (MAXDOP 1) '
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
					If @Return_Val <> 0
						Return
				end
			end	
			else
			/* Is CatCode of Child PDT Table*/
			begin
				/* If MC table is having the same cat code, build the pdt table based on MC table */
				/* Else build the child pdt table based on the child's cwm table and full master's pdt table*/
				IF PARSENAME(@strMCTableName,1) = @CatCode + 'MerchandiseCategory' --NSTPREP	
				begin
					Select @SQL = 'SELECT 
					Cwm.FlyerId, Page, IsNull(PageDetailID, '''') As PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
					Retailer, TaggedCompany, Manufacturer, Mc.MerchandiseCategory, Mc.MerchandiseSubCat,
					Pdt.Category, Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
					' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
					Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
					RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
					Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
					OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin ,Variety ,UnitType , PkgSize
					INTO ' + @CatPDTTable + ' 
					FROM ' + @SrcPdtTable + ' Pdt INNER JOIN ' + @CatCWMTable + ' Cwm ON Cwm.Flyerid = Pdt.FlyerID 
					INNER JOIN 
					(SELECT DISTINCT Category, MerchandiseCategory, MerchandiseSubCat From ' + @CatMerchCatTable + ') Mc 
					ON Mc.Category = Pdt.Category '
				end
				else
				begin   --ColKR
					Select @SQL = 'SELECT 
					Cwm.FlyerId, Page, IsNull(PageDetailID, '''') As PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
					Retailer, TaggedCompany, Manufacturer, Pdt.MerchandiseCategory, Pdt.MerchandiseSubCat, Pdt.Category, 
					Brand, SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
					' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
					Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
					RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
					Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
					OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn, Origin ,Variety ,UnitType , PkgSize
					INTO ' + @CatPDTTable + ' 
					FROM ' + @SrcPdtTable + ' Pdt INNER JOIN ' + @CatCWMTable + ' Cwm ON Cwm.Flyerid = Pdt.FlyerID '
				end
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
				If @Return_Val <> 0
					Return
			end	
			
			Select @SQL = 'SELECT IsNull(' + @CatPDTTable + '.PageDetailID, '''') AS PageDetailID,
			IsNull(FieldName, '''') AS FieldName,
			IsNull(FieldValue, '''') As FieldValue
			INTO ' + @CatMPVTable + '
			FROM ' + @SrcMPVTable + '
			Join ' + @CatPDTTable + ' on ' + @SrcMpvTable + '.PageDetailID= 
			' + @CatPDTTable + '.pagedetailid '
	
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output					
			If @Return_Val <> 0
				Return
		end 	/*if @IsFull = 1 or @IsFSI = 1 */
		else
		begin
			/*PARTIAL*/
			select @SQL = 'update ' + @CatPDTTable + ' set manufacturer = MFR.[Manufacturer] 
					From ' + @CatPDTTable + ' PDT JOIN 
					MasterClientCoverage..TempPDTMFR MFR ON PDT.PageDetailID = MFR.PageDetailID
					option (maxdop 1)'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output				
			If @Return_Val <> 0
				Return
			select @SQL = 'if exists (select * from dbo.sysobjects where id = object_id(N''[CreateClientTableTemp]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [CreateClientTableTemp]'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output				
			If @Return_Val <> 0
				Return
	
			Select @SQL = 'Select * into CreateClientTableTemp from ' + @CatPDTTable + ' Where 1=2 '
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			If @Return_Val <> 0
				Return
			If @bitOffer = 1
			BEGIN
				Select @SQL = 'if exists (select top 1 * from information_schema.columns where table_name = ''CreateClientTableTemp'' and column_name = ''Offer'')
							Alter Table CreateClientTableTemp Drop Column Offer;
						if exists (select top 1 * from information_schema.columns where table_name = ''CreateClientTableTemp'' and column_name = ''OfferType'')
							Alter Table CreateClientTableTemp Drop Column OfferType;
						if exists (select top 1 * from information_schema.columns where table_name = ''CreateClientTableTemp'' and column_name = ''MainOffer'')
							Alter Table CreateClientTableTemp Drop Column MainOffer;
						if exists (select top 1 * from information_schema.columns where table_name = ''CreateClientTableTemp'' and column_name = ''OfferId'')
							Alter Table CreateClientTableTemp Drop Column OfferId;
					'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			END
			IF @bitBuPC = 1
			BEGIN
				SET @vchrBuPCSql = ',NULL AS ParentCompany'
			END
			/*PARTIAL*/
			if @CBECnt > 0 -- CWU | GAL | 
			begin
				--MC Based Load
				Select @SQL = 'INSERT INTO CreateClientTableTemp 
				SELECT Cwm.FlyerId, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
				Retailer, TaggedCompany, Manufacturer, mc.MerchandiseCategory, mc.MerchandiseSubCat,
				Category = CASE WHEN Mc.[Set] = 1 THEN Mc.Category ELSE Mc.RealCategory END, Pdt.Brand, 
				SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
				' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
				Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
				RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
				Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
				OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn
				, Origin ,Variety ,UnitType , PkgSize ' + @vchrBuPCSql + ' 
				FROM ' + @SrcPDTTable + ' Pdt INNER JOIN ' + @CatCWMTable + ' Cwm ON Cwm.Flyerid = Pdt.FlyerId  
				INNER JOIN ' + @CatMerchCatTable + ' Mc ON Mc.RealCategory = Pdt.Category AND Mc.EXCLUDE = 0 '
				IF @CRMECnt > 0 
				BEGIN
					Select @SQL = @SQL + @vchrCrmeJoinClause
					Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
				END
				Select @SQL = @SQL + ' OPTION (MAXDOP 1)'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
				--CBE Based Load
				Select @SQL = 'INSERT INTO CreateClientTableTemp
				SELECT Cwm.FlyerId, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
				Retailer, TaggedCompany, Manufacturer, Cbe.MerchandiseCategory, Cbe.MerchandiseSubCat,
				Category = CASE WHEN Cbe.CategorySet = 1 THEN Cbe.Category ELSE Cbe.RealCategory END,
				Brand = CASE WHEN Cbe.BrandSet = 1 THEN Cbe.Brand ELSE Cbe.RealBrand END, 
				SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
				' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
				Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
				RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
				Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
				OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn
				, Origin ,Variety ,UnitType , PkgSize ' + @vchrBuPCSql + ' 
				FROM ' + @SrcPDTTable + ' Pdt JOIN ' + @CatCWMTable + ' Cwm ON Cwm.FlyerId = Pdt.FlyerId 
				JOIN ' + @CBETable + ' Cbe ON Pdt.Brand = Cbe.RealBrand AND Pdt.Category = Cbe.RealCategory AND Cbe.Exclude = 0 '
				IF @CRMECnt > 0 
				BEGIN
					Select @SQL = @SQL + @vchrCrmeJoinClause
					Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
				END
				Select @SQL = @SQL + ' OPTION (MAXDOP 1)'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
				--CBE Based Update
				Select @SQL = 'UPDATE CreateClientTableTemp 
				SET MerchandiseCategory = Cbe.MerchandiseCategory, MerchandiseSubCat = Cbe.MerchandiseSubCat,
				Category = (CASE WHEN Cbe.CategorySet = 1 THEN Cbe.Category ELSE Cbe.RealCategory END),
				Brand = (CASE WHEN Cbe.BrandSet = 1 THEN Cbe.Brand ELSE Cbe.RealBrand END) 
				FROM CreateClientTableTemp Pdt JOIN ' + @CBETable + ' Cbe 
				ON Pdt.Category = Cbe.RealCategory AND Pdt.Brand = Cbe.RealBrand AND Cbe.Exclude = 1 OPTION (MAXDOP 1) '
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			end
			else
			begin
				--Done : FSL(With Excep) | PEP 
				Select @SQL = 'INSERT INTO CreateClientTableTemp 
				SELECT Cwm.FlyerId, Page, PageDetailID, ThumbImagePath, NormalImagePath, FullImagePath, ProductImagePath, MultipleValues, DTAdded,
				Retailer, TaggedCompany, Manufacturer, mc.MerchandiseCategory, mc.MerchandiseSubCat,
				Category = CASE WHEN Mc.[Set] = 1 THEN Mc.Category ELSE Mc.RealCategory END, 
				' + @BrandField + ', SKUDescription1, SKUDescription2, SKUDescription3, SKUType, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2,
				' + @vchrNorPrice + ', RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, Promotions, PageEvent, PageTheme,
				Features, NumberPackage, Pdt.Coupon, CouponValueD1, CouponValueD2, CouponValueP1, CouponValueP2, OtherDiscountD1, OtherDiscountD2, OtherDiscountD3,
				RequiredQuantity, MaximumQuantity, AdSize, AdCost, Illustrated, Color, NoOfColors, SaleStDt, SaleEndDt, CouponExpirationDate, Optional1, Optional2, Optional3, Optional4, Optional5, Optional6, Optional7, Optional8,
				Optional9, Optional10, Optional11, Optional12, Comments, ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup, EnteredClient, CouponExpirationDate1, CouponExpirationDate2, OtherDiscountP1,
				OtherDiscountP2, OtherDiscountP3, ' + @Comments1NOffDesc + ', comments2, comments3, comments4, topleftx, toplefty, bottomrightx, bottomrighty, McUpdatedOn, MscUpdatedOn, MfrUpdatedOn, PtUpdatedOn, PtgUpdatedOn, PtsgUpdatedOn, ProdImageCreated, ProdImageCreatedOn
				, Origin ,Variety ,UnitType , PkgSize ' + @vchrBuPCSql + ' 
				FROM ' + @SrcPDTTable + ' Pdt INNER JOIN ' + @CatMerchCatTable + ' Mc ON Mc.RealCategory = Pdt.Category
				INNER JOIN ' + @CatCWMTable + ' Cwm  ON Cwm.flyerid = Pdt.FlyerID '
				IF @CRMECnt > 0 
				BEGIN
					Select @SQL = @SQL + @vchrCrmeJoinClause
					Select @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
				END
				Select @SQL = @SQL + ' OPTION (MAXDOP 1)'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			end
			
			--Call Concat Updates.
			If @IsConCatUpdate = 1
			begin
				--EXECUTE proc_ConCatUpdates @PDT,@MPV,@MC, @IsConcat
				if @Debug = 0
					EXECUTE proc_ConCatUpdates 'CreateClientTableTemp',@SrcMpvTable,@CatMerchCatTable, @ConcatType
				else
					PRINT 'EXECUTE proc_ConCatUpdates ''CreateClientTableTemp'',''' + @SrcMpvTable + ''',''' + @CatMerchCatTable + ''',' + CAST(@ConcatType AS VARCHAR(5))
			end
			If @bitOffer = 1
			BEGIN
				IF @Debug = 0
				BEGIN
					EXECUTE dbo.procPopulateOfferFields @CatCode,'CreateClientTableTemp',@CatMPVTable,@SrcMpvTable,@Debug
				END
				ELSE
					PRINT 'EXECUTE dbo.procPopulateOfferFields ''' + @CatCode + ''',''CreateClientTableTemp'',''' + @CatMPVTable + ''',''' + @SrcMpvTable + ''',' + CAST(@Debug AS VARCHAR) 
			END
			Select @SQL = 'insert into ' + @CatPDTTable + ' Select * from CreateClientTableTemp option (maxdop 1) '
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			If @Return_Val <> 0
				Return
			select @SQL = 'if exists (select * from dbo.sysobjects where id = object_id(N''[CreateClientTableTemp]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [CreateClientTableTemp]'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output				
			If @Return_Val < 0
				Return
			
			/* MPV for Partial */
			Select @SQL = 'Insert into ' + @CatMPVTable + '
			SELECT ' + @CatPDTTable + '.PageDetailID,
			FieldName,
			FieldValue
			FROM ' + @SrcMPVTable + '
			Join ' + @CatPDTTable + ' on ' + @SrcMpvTable + '.PageDetailID= 
			' + @CatPDTTable + '.pagedetailid '
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			If @Return_Val <> 0
				Return
			/*PARTIAL*/
		end
		/*PDT AND MPV*/
	
		/* Deleting pdt records based on category and brand for fsi */
		If @IsFSI = 1
		begin
		Select @SQL = 'Delete From ' + @CatPDTTable + ' Where (Category in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'')) or (Brand in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked''))'
		Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
		If @Return_Val <> 0
			Return
		end
		
		--Changes for "TAR"
		if @CatCode = 'Tar' and  @IsFull = 1
		begin
			SET @SQL = 'ALTER TABLE ' + @CatCWMTable + ' ALTER COLUMN FLYERID VARCHAR(12) NOT NULL'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			SET @SQL = 'ALTER TABLE ' + @CatPDTTable + ' ALTER COLUMN PageDetailID VARCHAR(12) NOT NULL'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			SET @SQL = 'ALTER TABLE ' + @CatMPVTable + ' ALTER COLUMN PageDetailID VARCHAR(12) NOT NULL'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
		end
		/* Deleting pdt records based on category and brand for fsi */
		--Offer Changes
		If @bitOffer = 1 AND (@IsFull = 1 OR @IsFSI = 1)
		BEGIN
			Select @SQL = 'ALTER TABLE [dbo].[' + @CatPDTTable + '] WITH NOCHECK ADD 
				CONSTRAINT [PK_' + @CatPDTTable + '] PRIMARY KEY  CLUSTERED 
				(
				[PageDetailID]
				) WITH  FILLFACTOR = 90  ON [PRIMARY] '
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			If @Return_Val <> 0
				Return
			Select @SQL = 'CREATE INDEX [idx' + @CatCode + 'PDTPageEvent] 
					ON [dbo].[' + @CatPDTTable + ']([PageEvent]) 
					WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			If @Return_Val <> 0
				Return
			IF @Index_Type = 1
			BEGIN
				--Select @SQL = 'CREATE  CLUSTERED  INDEX [IX_' + @CatCode + 'MPV1] ON [dbo].[' + @CatMPVTable + ']([PageDetailID]) ON [PRIMARY]'
				Select @SQL = 'ALTER TABLE [dbo].[' + @CatMPVTable + '] ADD CONSTRAINT PK_' + @CatMPVTable + ' 
						PRIMARY KEY CLUSTERED (PageDetailID, FieldName, FieldValue) ON [PRIMARY]'			
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
						Return
		
				Select @SQL = 'CREATE  INDEX [IX_' + @CatCode + 'MPV] ON [dbo].[' + @CatMPVTable + ']([FieldName]) ON [PRIMARY]'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			END
			IF @Index_Type = 2 OR @Index_Type = 3
			BEGIN
				Select @SQL = 'ALTER TABLE [dbo].[' + @CatMPVTable + '] WITH NOCHECK ADD 
					CONSTRAINT [PK_' + @CatCode + 'MultiplePageValues] PRIMARY KEY CLUSTERED 
					(
						[PageDetailID],
						[FieldName],
						[FieldValue]
					) WITH  FILLFACTOR = 90  ON [PRIMARY] '
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
				 Select @SQL = 'CREATE  INDEX [' + @CatCode + 'INDEXMPV2] ON [dbo].[' + @CatMPVTable + ']([FieldName]) 
						WITH  FILLFACTOR = 90 ON [PRIMARY]'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			END
			IF @Debug = 0
			BEGIN
				EXECUTE dbo.procPopulateOfferFields @CatCode,@CatPDTTable,@CatMPVTable,@CatMPVTable,@Debug
			END
			ELSE
				PRINT 'EXECUTE dbo.procPopulateOfferFields ''' + @CatCode + ''',''' + @CatPDTTable + ''',''' + @CatMPVTable + ''',''' + @CatMPVTable + ''',' + CAST(@Debug AS VARCHAR) 
		END
		--Offer Changes
		If @Index_Type = 1 or @Index_Type = 2 or @Index_Type = 3 or @Index_Type = 4
		begin
			If @IsFull = 1
			begin
				/**/
				If @Index_Type = 1
				begin
					Create Table #T1 ( PageDetailID Varchar(50))
					Select @SQL = 'Insert into #T1 select PageDetailID From ' + @CatPDTTable + ' group by PageDetailID HAVING COUNT(PageDetailID) > 1 '
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
					If @Return_Val <> 0
						Return
					If Exists(Select * from #T1)
					begin
						--update CategoryCode set Error = IsNull(Error, '') + 'Error Code: Creating PK On ' + @CatPDTTable + ' Failed Due to Duplicate Records ' where category = @CatCode
						EXECUTE('update ' + @CategoryCodeTable + ' set Error = IsNull(Error, '''') + ''Error Code: Creating PK On ' + @CatPDTTable + ' Failed Due to Duplicate Records '' where category = ''' + @CatCode + '''')
					end
					Else
					Begin
						Select @SQL = 'ALTER TABLE [dbo].[' + @CatPDTTable + '] WITH NOCHECK ADD CONSTRAINT [PK_' + @CatPDTTable + '] PRIMARY KEY CLUSTERED ([PageDetailID])  ON [PRIMARY] '
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
						If @Return_Val <> 0
							Return
					End
					Drop Table #T1
					If @IsConCatUpdate = 1
					begin
						--EXECUTE proc_ConCatUpdates @PDT,@MPV,@MC, @IsConcat
						if @Debug = 0
							EXECUTE proc_ConCatUpdates @CatPDTTable,@CatMPVTable,@CatMerchCatTable, @ConcatType
						else
							PRINT 'EXECUTE proc_ConCatUpdates ''' + @CatPDTTable + ''',''' + @CatMPVTable + ''',''' + @CatMerchCatTable + ''',' + CAST(@ConcatType AS VARCHAR(5))
					end
			
			
					Select @SQL = 'CREATE  INDEX [' + @CatCode + 'PDTConsolidated] ON [dbo].[' + @CatPDTTable + ']([TaggedCompany] , [Manufacturer] , [MerchandiseCategory] , [MerchandiseSubCat] , [Category] , [Brand] , [PageEvent] , [ProductTerritory] , [ProductTerritorySubGroup] , [ProductTerritoryGroup] ) ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
					If @Return_Val <> 0
						Return
			
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTPageEvent] 
							ON [dbo].[' + @CatPDTTable + ']([PageEvent],[PageDetailID]) 
							WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					--For @bitOffer = 1 index is already getting created on above.
					If @bitOffer = 0
					BEGIN
						Select @SQL = 'ALTER TABLE [dbo].[' + @CatMPVTable + '] ADD CONSTRAINT PK_' + @CatMPVTable + ' PRIMARY KEY CLUSTERED (PageDetailID, FieldName, FieldValue) ON [PRIMARY]'			
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
								Return
				
						Select @SQL = 'CREATE  INDEX [IX_' + @CatCode + 'MPV] ON [dbo].[' + @CatMPVTable + ']([FieldName]) ON [PRIMARY]'
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
							Return
					END
				end
				Else if @Index_Type = 4
				begin
					Select @SQL = 'ALTER TABLE [dbo].[' + @CatPDTTable + '] WITH NOCHECK ADD 
						CONSTRAINT [PK_' + @CatPDTTable + '] PRIMARY KEY  CLUSTERED 
						(
						[PageDetailID]
						) WITH  FILLFACTOR = 90  ON [PRIMARY] '
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					If @IsConCatUpdate = 1
					begin
						--EXECUTE proc_ConCatUpdates @PDT,@MPV,@MC, @IsConcat
						if @Debug = 0
							EXECUTE proc_ConCatUpdates @CatPDTTable,@CatMPVTable,@CatMerchCatTable, @ConcatType
						else
							PRINT 'EXECUTE proc_ConCatUpdates ''' + @CatPDTTable + ''',''' + @CatMPVTable + ''',''' + @CatMerchCatTable + ''',' + CAST(@ConcatType AS VARCHAR(5))
					end
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdCategoryEtc] 
						ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Category], [Manufacturer], 
						[PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdMerchandiseSubCatEtc] 
						ON [dbo].[' + @CatPDTTable + ']([FlyerId], [MerchandiseSubCat], [Manufacturer], 
						[PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdMerchandiseCategoryEtc] 
						ON [dbo].[' + @CatPDTTable + ']([FlyerId], [MerchandiseCategory],[Manufacturer], 
						[PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdManufactureEtc] 
						ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Manufacturer], [Category], 
						[MerchandiseSubCat], [MerchandiseCategory],
						[PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
				end
				Else If @Index_Type = 3 or @Index_Type = 2
				begin
					Select @SQL = 'ALTER TABLE [dbo].[' + @CatPDTTable + '] WITH NOCHECK ADD 
						CONSTRAINT [PK_' + @CatCode + 'PageDetailTable] PRIMARY KEY  CLUSTERED 
						(
							[PageDetailID]
						) WITH  FILLFACTOR = 90  ON [PRIMARY] '
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					If @IsConCatUpdate = 1
					begin
						--EXECUTE proc_ConCatUpdates @PDT,@MPV,@MC, @IsConcat
						if @Debug = 0
							EXECUTE proc_ConCatUpdates @CatPDTTable,@CatMPVTable,@CatMerchCatTable, @ConcatType
						else
							PRINT 'EXECUTE proc_ConCatUpdates ''' + @CatPDTTable + ''',''' + @CatMPVTable + ''',''' + @CatMerchCatTable + ''',' + CAST(@ConcatType AS VARCHAR(5))
					end					
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Brand], [Category], 
							[MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], 
							[RequiredQuantity], [SalePrice1], [Features], [comments1], [RegularPrice1], 
							[PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], 
							[MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], 
							[comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], 
							[MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], 
							[comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], 
							[MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], 
							[comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], 
							[Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [comments1], 
							[RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON
							[dbo].[' + @CatPDTTable + ']([PageEvent], [RequiredQuantity], [SalePrice1], [Features], 
							[comments1], [RegularPrice1], [NORPrice], [FlyerId], [PageDetailID], [Page]) 
							WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] 
							ON [dbo].[' + @CatPDTTable + ']([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], 
							[Category], [MerchandiseCategory], [MerchandiseSubCat], [NORPrice]) 
							WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] 
							ON [dbo].[' + @CatPDTTable + ']([Manufacturer], [MerchandiseCategory], [Category], [Brand], 
							[MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [comments1], 
							[RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] 
							ON [dbo].[' + @CatPDTTable + ']([MerchandiseSubCat], [Manufacturer], [Category], [Brand], 
							[MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [comments1], 
							[RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTMerchandiseCategoryFlyerIDPageDetailIDPage] 
							ON [dbo].[' + @CatPDTTable + ']([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) 
							WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
					
					Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTPageEvent] 
							ON [dbo].[' + @CatPDTTable + ']([PageEvent],[PageDetailID]) 
							WITH  FILLFACTOR = 90 ON [PRIMARY]'
					Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
					If @Return_Val <> 0
						Return
				
					if @Index_Type = 2
					Begin
						Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTOrigin] 
								ON [dbo].[' + @CatPDTTable + ']([Origin],[PageDetailID]) 
								WITH  FILLFACTOR = 90 ON [PRIMARY]'
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
							Return
	
						Select @SQL = ' CREATE  INDEX [idx' + @CatCode + 'PDTVariety] 
								ON [dbo].[' + @CatPDTTable + ']([Variety],[PageDetailID]) 
								WITH  FILLFACTOR = 90 ON [PRIMARY]'
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
							Return
					End	
					
					--MPV
					--For @bitOffer = 1 index is already getting created on above.
					If @bitOffer = 0
					BEGIN
						Select @SQL = 'ALTER TABLE [dbo].[' + @CatMPVTable + '] WITH NOCHECK ADD 
							CONSTRAINT [PK_' + @CatCode + 'MultiplePageValues] PRIMARY KEY  CLUSTERED 
							(
								[PageDetailID],
								[FieldName],
								[FieldValue]
							) WITH  FILLFACTOR = 90  ON [PRIMARY] '
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
							Return
						 Select @SQL = 'CREATE  INDEX [' + @CatCode + 'INDEXMPV2] ON [dbo].[' + @CatMPVTable + ']([FieldName]) 
								WITH  FILLFACTOR = 90 ON [PRIMARY]'
						Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
						If @Return_Val <> 0
							Return
					END
				end
				/**/
			end
			else  -- partial
			begin
				/* REINDEXING TABLES */
				Select @SQL = 'dbcc dbreindex ('+ @CatPDTTable +','''',90 )'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			
			
				Select @SQL = 'dbcc dbreindex ('+ @CatMPVTable +','''',90 )'			
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				If @Return_Val <> 0
					Return
			
				/* REINDEXING TABLES */
			end
		end -- If @Index_Type = 1 or @Index_Type = 2 or @Index_Type = 3
		/*PDT Batch Update*/
		EXECUTE BATCHUPDATE @CatCode, @Debug, 1
		/*PDT Batch Update*/
		EXECUTE dbo.procGenerateDisQueryPage @CatCode, @Debug
		
		/*
		--Drop Table DISBrand and DisManufacturer	
		if exists(Select name from sysobjects where name = @CatCode + 'DisQueryPage')
		begin
			Select @SQL = 'Drop Table ' + @CatCode + 'DisQueryPage' 
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
			If @Return_Val <> 0
				Return
		end
		--Drop DisQueryPage
		--Create DisQueryPage
		Select @SQL = 'Select Distinct Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat,  Category '
		If @IncludePT = 1
			Select @SQL = @SQL + ', ProductTerritory, ProductTerritorySubGroup, ProductTerritoryGroup '  
		Select @SQL = @SQL + ' Into ' + @CatCode + 'DisQueryPage From ' + @CatPDTTable
		Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		If @Return_Val <> 0
			Return
		Select @SQL = 'CREATE  CLUSTERED INDEX [idx_' + @CatCode + 'DisQPBrand] ON [dbo].[' + @CatCode + 'DisQueryPage]([Brand]) ON [PRIMARY]'
		Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		If @Return_Val <> 0
			Return
		
		Select @SQL = 'CREATE  INDEX [idx_' + @CatCode + 'DisQPCategory] ON [dbo].[' + @CatCode + 'DisQueryPage]([Category]) ON [PRIMARY]'
		Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		If @Return_Val <> 0
			Return
		
		Select @SQL = 'CREATE  INDEX [idx_' + @CatCode + 'DisQPCatBraMfrMSC] ON [dbo].[' + @CatCode + 'DisQueryPage](Category, Manufacturer, Brand, MerchandiseSubCat) ON [PRIMARY]'
		Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		If @Return_Val <> 0
			Return
		--Create DisQueryPage
		--Create DisOrigin And DisVariety Tables		
		Declare @FromClause varchar(255)
		Declare @MPV varchar(50)
		If @ConcatType = 2 or @ConcatType = 4 
		begin
			If @IsPDT = 1
			Begin
				SET @FromClause = @CatPDTTable
				Set @MPV = @CatMPVTable
			End
			Else
			Begin
				SET @FromClause = @FullSourceCode + 'PageDetailTable PDT, ' + @CatCWMTable + ' CWM Where PDT.FlyerID = CWM.FlyerID '
				execute GetTableName @catcode,22,@MPV OUTPUT
			End
			If @ConcatType = 2
			begin
				set @SQL = 'if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @CatCode + 'DisOrigin]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				DROP TABLE ' + @CatCode+'DisOrigin'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
	
				set @SQL = 'SELECT DISTINCT Origin Into ' + @CatCode + 'DisOrigin FROM ' + @FromClause
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
				
				set @SQL = 'if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @CatCode + 'DisVariety]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				DROP TABLE ' + @CatCode+'DisVariety'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
	
				set @SQL = 'SELECT DISTINCT Variety Into ' + @CatCode + 'DisVariety FROM ' + @FromClause
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
	
				If @ISPdt = 1	
				begin
					set @SQL = 'INSERT INTO ' + @CatCode + 'DisVariety SELECT DISTINCT FieldValue 
					FROM ' + @MPV + ' WHERE FieldName = ''Variety'' AND ISNULL(FieldValue,'''') <> '''' 
					AND FieldValue NOT IN(SELECT Variety From ' + @CatCode + 'DisVariety where ISNULL(Variety,'''') <> '''')'
				end
				Else
				begin
					set @SQL = 'INSERT INTO ' + @CatCode + 'DisVariety SELECT DISTINCT Variety 
					FROM ' + @MPV + ' WHERE ISNULL(Variety,'''') <> '''' 
					AND Variety NOT IN(SELECT Variety From ' + @CatCode + 'DisVariety where ISNULL(Variety,'''') <> '''')'
				end
	
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
	
				set @SQL = 'Delete from ' + @CatCode + 'DisVariety  where variety=''-----None Selected-----'''
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
			end
			
			if @ConcatType = 4 OR @ConcatType = 2 
			begin
				set @SQL = 'if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[' + @CatCode + 'DisUnitType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				DROP TABLE ' + @CatCode+'DisUnitType'
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
	
				set @SQL = 'SELECT DISTINCT UnitType Into ' + @CatCode + 'DisUnitType FROM ' + @FromClause 
	
				Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
				If @Return_Val <> 0
					Return
			end
		end
		--Create DisOrigin And DisVariety Tables
		*/
		--Adview2Control Changes.	
		SELECT @strDate = CAST(getdate() AS VARCHAR(100))
		IF @ServerType = 'Master' OR (@ServerType = 'Client' and @@servername = 'MT2SQL00')
		BEGIN
			If @IsFull = 1
			begin
				Select @SQL = 'Update ' + @CategoryCodeTable + ' set FullRunDate = ''' + @strDate + ''''
			end
			else
			begin
				Select @SQL = 'Update ' + @CategoryCodeTable + ' set PartialRunDate = ''' + @strDate + ''''	
			end
			Select @SQL = @SQL + ' Where Category = ''' + @CatCode + '''' 
			IF @Debug = 0
				EXEC(@SQL)	
			ELSE
				PRINT @SQL
		END
		ELSE
		BEGIN
			--CLIENT CHANGES
			If @IsFull = 1
			begin
				Select @SQL = 'Update ' + @CategoryCodeTable + ' set ClientFullRundate = ''' + @strDate + ''''
			end
			else
			begin
				Select @SQL = 'Update ' + @CategoryCodeTable + ' set ClientPartialRundate = ''' + @strDate + ''''	
			end
			Select @SQL = @SQL + ' Where Category = ''' + @CatCode + '''' 
			IF @Debug = 0
				EXEC(@SQL)	
			ELSE
				PRINT @SQL
		END
		--Adview2Control Changes.
		--ADIVEW2CONTROL CHANGES
		IF EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@CBETable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CBETable
			EXEC(@SQL)
			--Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		END
	
		IF EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@CatMerchCatTable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CatMerchCatTable			
			Exec DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		END
		IF EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@CRMETable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CRMETable
			EXEC(@SQL)
		END
		if @Debug = 1 
		BEGIN
			PRINT  'DROP TABLE ' + @CBETable
			PRINT  'DROP TABLE ' + @CatMerchCatTable
			PRINT  'DROP TABLE ' + @CRMETable
		END
		--ADIVEW2CONTROL CHANGES
	
	end /*IF @IsPDT = 1*/
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

