SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER  PROCEDURE procPopulateOfferFields
	@pvchrCategoryCode VARCHAR(50),
	@pvchrPdtTable VARCHAR(50),
	@pvchrMpvTable VARCHAR(50),
	@pvchrSourceMpvTable VARCHAR(50),
	@pbitDebug BIT = 1
AS
BEGIN
	DECLARE @vchrStartSql VARCHAR(8000), @vchrEndSql VARCHAR(8000), @vchrSql VARCHAR(8000)
	DECLARE @vchrTempPageEventMerge VARCHAR(100), @vchrTempPdtIdPageEvent VARCHAR(100), @vchrTempPdtOfferTable VARCHAR(100)
	DECLARE @vchrPageEventList VARCHAR(8000), @vchrPageEventCase VARCHAR(8000)
	DECLARE @vchrPageEventVal VARCHAR(100)
	DECLARE @vchrAccessLevel VARCHAR(10), @nvchrSql NVARCHAR(4000)
	DECLARE @intCategoryCodeId INT
	
	SET @vchrPageEventList = ''
	SET @vchrPageEventCase = ''
	SET @vchrPageEventVal = ''
	
	--Define the AccessLevel (Master/Category) for Offer fields
	SET @nvchrSql = 'SELECT @intCategoryCodeId = [ID] FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryCode 
				WHERE Category = ''' + @pvchrCategoryCode + ''''
	EXECUTE sp_executesql @nvchrSql, N'@intCategoryCodeId INT OUTPUT', @intCategoryCodeId  OUTPUT
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''OfferControl'') 
				DROP TABLE Tempdb.dbo.OfferControl'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'IF EXISTS(SELECT * FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControl 
				WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) + ')
			 BEGIN
				SELECT * INTO Tempdb.dbo.OfferControl FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControl 
					WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) + '
			 END
			 ELSE
				SELECT * INTO Tempdb.dbo.OfferControl FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'OfferControl'  
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Define the AccessLevel (Master/Category) for Offer fields
	--Generate comma seperated pageevent list and pageevent case
	IF CURSOR_STATUS('variable', 'DisplayValue') >= 0
	BEGIN
		CLOSE DisplayValue
		DEALLOCATE DisplayValue
	END
	SET @vchrSql = 'DECLARE DisplayValue CURSOR READ_ONLY FAST_FORWARD FOR 
			SELECT DISTINCT M.PageEvent FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'MasterPromotions M 
			JOIN Tempdb.dbo.OfferControl O ON M.PageEvent = O.PageEvent 
			WHERE O.PageEvent LIKE ''%'' + M.PageEvent + ''%'' ORDER BY M.PageEvent'
	EXEC(@vchrSql)
	OPEN DisplayValue
	FETCH NEXT FROM DisplayValue INTO @vchrPageEventVal
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--print @vchrPageEventVal
		SET @vchrPageEventList = @vchrPageEventList + '''' + @vchrPageEventVal + ''','
		SET @vchrPageEventCase = @vchrPageEventCase + 'MAX(CASE WHEN PageEvent = ''' + @vchrPageEventVal + ''' THEN '', ' + @vchrPageEventVal + ''' ELSE '''' END) + '
		FETCH NEXT FROM DisplayValue INTO @vchrPageEventVal
	END
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
	SET @vchrPageEventList = LEFT(@vchrPageEventList, LEN(@vchrPageEventList) - 1)
	SET @vchrPageEventCase = LEFT(@vchrPageEventCase, LEN(@vchrPageEventCase) - 2)
	--Generate comma seperated pageevent list and pageevent case
	--PDT Process
	
	SET @vchrTempPdtIdPageEvent = @pvchrCategoryCode + 'PdtIdPageEvent'
	SET @vchrTempPageEventMerge = @pvchrCategoryCode + 'PageEventMerge'
	SET @vchrTempPdtOfferTable = @pvchrPdtTable + '_Offer'
	--Step1 : Get distinct PageDetailID, PageEvent from PDT table.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''' + @vchrTempPdtIdPageEvent + ''') 
				DROP TABLE Tempdb.dbo.' + @vchrTempPdtIdPageEvent 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'SELECT PageDetailID, PageEvent INTO Tempdb.dbo.' + @vchrTempPdtIdPageEvent + ' FROM ' + 
			@pvchrPdtTable + ' WHERE PageEvent IN(' + @vchrPageEventList + ') '
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step2 : Get distinct PageDetailID, PageEvent from MPV table.
	SET @vchrSql = 'INSERT INTO Tempdb.dbo.' + @vchrTempPdtIdPageEvent + '
			SELECT PageDetailID, FieldValue AS PageEvent FROM ' + @pvchrSourceMpvTable + ' WHERE FieldName = ''PageEvent'' AND 
			FieldValue IN(' + @vchrPageEventList + ') '
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	
	--Step3 : Perform PageEvent Merge On Temp Table.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''' + @vchrTempPageEventMerge + ''') 
				DROP TABLE Tempdb.dbo.' + @vchrTempPageEventMerge 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	
	SET @vchrSql = 'SELECT PageDetailID, ' + @vchrPageEventCase  + ' AS PageEvent 
				INTO Tempdb.dbo.' + @vchrTempPageEventMerge + ' FROM Tempdb.dbo.' + @vchrTempPdtIdPageEvent + '
				GROUP BY PageDetailId '
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step4 : Create Clustered Index on PageEventMerge table.
	SET @vchrSql = 'CREATE CLUSTERED INDEX IDX_' + @vchrTempPageEventMerge + ' ON 
				Tempdb.dbo.' + @vchrTempPageEventMerge + '(PageDetailId)'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step5 : Perform necessary updates on PageEventMerge table.
	SET @vchrSql = 'UPDATE Tempdb.dbo.' + @vchrTempPageEventMerge + ' SET PageEvent = LTRIM(RIGHT(PageEvent,LEN(PageEvent) -1))
				WHERE PageEvent <> '''''
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step6 : Populate Temp PDT table with Offer details
	IF @intCategoryCodeId = 1220
	BEGIN
		SET @vchrStartSql = 'SELECT P.*,O.OfferId,
					ISNULL(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.Offer1, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
					''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
					''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0)),''Under Review'') As Offer, 
					ISNULL(O.OfferType1,''Under Review'') AS OfferType, ISNULL(O.MainOffer,''Under Review'') AS MainOffer '
		SET @vchrEndSql = ' INTO ' + @vchrTempPdtOfferTable + ' FROM ' + @pvchrPdtTable + ' P LEFT OUTER JOIN Tempdb.dbo.' + @vchrTempPageEventMerge + ' T 
					ON P.PageDetailId = T.PageDetailId 
					LEFT OUTER JOIN TempDb..OfferControl O ON
					CASE WHEN P.saleprice1 IS NULL THEN 0 ELSE 1 END  = O.saleprice1  And 
					CASE WHEN P.norprice IS NULL THEN 0 ELSE 1 END  = O.norprice  And 
					CASE WHEN P.requiredquantity IS NULL THEN 0 ELSE 1 END = O.requiredquantity  And 
					CASE WHEN P.couponvaluep1 IS NULL THEN 0 ELSE 1 END = O.couponvaluep1  And 
					CASE WHEN P.couponvalued2 IS NULL THEN 0 ELSE 1 END = O.couponvalued2  And 
					CASE WHEN P.otherdiscountd2 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd2 And 
					CASE WHEN P.otherdiscountd1 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd1  And 
					CASE WHEN P.numberpackage IS NULL THEN 0 ELSE 1 END = O.numberpackage  And 
					CASE WHEN P.lowestdiscountprice IS NULL THEN 0 ELSE 1 END = O.lowestdiscountprice And 
					ISNULL(T.PageEvent,'''') = O.PageEvent'
	END
	ELSE
	BEGIN
		SET @vchrStartSql = 'SELECT P.*,O.OfferId,
					ISNULL(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.Offer1, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
					''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
					''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0)),''Under Review'') As Offer, 
					ISNULL(O.OfferType1,''Under Review'') AS OfferType, ISNULL(O.MainOffer,''Under Review'') AS MainOffer '
		SET @vchrEndSql = ' INTO ' + @vchrTempPdtOfferTable + ' FROM ' + @pvchrPdtTable + ' P LEFT OUTER JOIN Tempdb.dbo.' + @vchrTempPageEventMerge + ' T 
					ON P.PageDetailId = T.PageDetailId 
					LEFT OUTER JOIN TempDb..OfferControl O ON
					CASE WHEN P.saleprice1 IS NULL THEN 0 ELSE 1 END  = O.saleprice1  And 
					CASE WHEN P.regularprice1 IS NULL THEN 0 ELSE 1 END = O.regularprice1  And 
					CASE WHEN P.norprice IS NULL THEN 0 ELSE 1 END  = O.norprice  And 
					CASE WHEN P.unitprice IS NULL THEN 0 ELSE 1 END = O.unitprice  And 
					CASE WHEN P.requiredquantity IS NULL THEN 0 ELSE 1 END = O.requiredquantity  And 
					CASE WHEN P.couponvaluep1 IS NULL THEN 0 ELSE 1 END = O.couponvaluep1  And 
					CASE WHEN P.couponvalued2 IS NULL THEN 0 ELSE 1 END = O.couponvalued2  And 
					CASE WHEN P.otherdiscountd2 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd2 And 
					CASE WHEN P.otherdiscountd1 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd1  And 
					CASE WHEN P.numberpackage IS NULL THEN 0 ELSE 1 END = O.numberpackage  And 
					CASE WHEN P.lowestdiscountprice IS NULL THEN 0 ELSE 1 END = O.lowestdiscountprice And 
					ISNULL(T.PageEvent,'''') = O.PageEvent'
	END
	IF @pbitDebug = 0 
	BEGIN
		EXECUTE(@vchrStartSql + @vchrEndSql)
	END
	ELSE
	BEGIN
		PRINT @vchrStartSql
		PRINT @vchrEndSql
	END
	--Step7 : Drop existing PDT table 
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM sysobjects WHERE XType = ''U'' AND Name = ''' + @pvchrPdtTable + ''') 
				DROP TABLE ' + @pvchrPdtTable 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	
	--Step8 : Rename Temp pdt to original
	IF @pbitDebug = 0
		EXEC sp_rename @vchrTempPdtOfferTable, @pvchrPdtTable
	ELSE
		PRINT 'sp_rename ''' + @vchrTempPdtOfferTable + ''',''' + @pvchrPdtTable + '''' + CHAR(10) + ' GO '
	--Step9 : Drop TempTables
	SET @vchrSql = 'DROP TABLE Tempdb.dbo.' + @vchrTempPdtIdPageEvent 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step10 : Drop TempTables
	SET @vchrSql = 'DROP TABLE Tempdb.dbo.' + @vchrTempPageEventMerge 
--	IF @pbitDebug = 0
--		EXECUTE(@vchrSql)
--	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '	
	--End : PDT Process.
	--Step11 : Create OfferControlDetails in tempdb.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''OfferControlDetails'') 
				DROP TABLE Tempdb.dbo.OfferControlDetails'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--SET @vchrSql = 'SELECT * INTO Tempdb.dbo.OfferControlDetails FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'OfferControlDetails' 
	--Note: "CategoryOfferControl" is used in below check as it is possible that for a categorycode configured
	-- on category may not have any entry in CategoryOfferControlDetails.
	SET @vchrSql = 'IF EXISTS(SELECT * FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControl  
				WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) + ')
			 BEGIN
				SELECT * INTO Tempdb.dbo.OfferControlDetails FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControlDetails 
					WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) + '
			 END
			 ELSE
				SELECT * INTO Tempdb.dbo.OfferControlDetails FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'OfferControlDetails'  
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'CREATE INDEX IDX_TempOfferControlDetails ON Tempdb.dbo.OfferControlDetails(OfferId)' 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step12 : Populate MPV table.
	SET @vchrSql = 'INSERT INTO ' + @pvchrMpvTable + ' 
			SELECT P.PageDetailId, O.FieldName, Case When O.FieldName = ''Offer'' Then
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.FieldValue, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
			''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
			''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0))
			Else O.FieldValue End As FieldValue 
			FROM ' + @pvchrPdtTable + ' P JOIN Tempdb.dbo.OfferControlDetails O ON P.OfferId = O.OfferId'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--END	
	--EXECUTE procPopulateOfferFields 'scj','scjPageDetailTable','scjMultiplePageValues','scjMultiplePageValues',1
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

