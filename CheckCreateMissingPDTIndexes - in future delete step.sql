--CheckCreateMissingPDTIndexes

	if exists (select * from dbo.sysobjects where id = object_id(N'[MissingPDTIndexesCodes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		drop table [MissingPDTIndexesCodes]

	--Start : Get the codes whose indexes are missing
	select replace(pdt.name,'PageDetailTable','') as categorycode into MissingPDTIndexesCodes
	from MT2aSQL05.sitecontrol.dbo.categorycode cc
	join sysobjects pdt on pdt.name = cc.category + 'pagedetailtable'
	left outer join (select pdt.name as table_name, c.name as column_name
	     from MT2aSQL05.sitecontrol.dbo.categorycode cc
	     join sysobjects pdt on pdt.name = cc.category + 'pagedetailtable'
	     join syscolumns c on pdt.id = c.id
	     left outer join sysindexkeys ik on ik.colid = c.colid and ik.id = pdt.id
	     where case when left(@@servername,4) = 'mt2a' then cc.mt2aclientserver else cc.clientserver end = case when @@servername = 'mt2sql00' then 'mt2' + db_name() else @@servername end
	     and ik.indid = 1) i on i.table_name = pdt.name
	where case when left(@@servername,4) = 'mt2a' then cc.mt2aclientserver else cc.clientserver end = case when @@servername = 'mt2sql00' then 'mt2' + db_name() else @@servername end
	and i.column_name is null
	--End : Get the codes whose indexes are missing
	
	Declare @CatCode varchar(35)
	Declare @CategoryCodeTable varchar(255)
	Declare @isPDT Bit
	Declare @ClientPDT Bit
	Declare @SQL varchar(5000)
	Declare @NSQL Nvarchar(1000)

	Set @CatCode=''
	Set @CategoryCodeTable=''
	Set @SQL=''
	Set @isPDT=0
	Set @ClientPDT=0
	
	
	Declare CURIndex cursor for
	Select CategoryCode from MissingPDTIndexesCodes
	
	Open CURIndex
	
	Fetch next from CURIndex
	into @CatCode
	
	while @@fetch_Status = 0
	begin
		EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	
		Select @NSQL = N'Select @IsPDT = isPDT, @ClientPDT = ClientPDT From ' + @CategoryCodeTable + ' 
						where Category = ''' + @CatCode + ''''
		Execute sp_executesql @NSQL, N'@IsPDT bit OUTPUT,@ClientPDT bit OUTPUT', @IsPDT OUTPUT,@ClientPDT OUTPUT
		
		
		IF @IsPDT = 1 OR @ClientPDT =1
		BEGIN	
			SET @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdBrandCateExec(@SQL)ryMerchandiseSubCatMerchandiseCateExec(@SQL)ryManufactureEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [Brand], [CateExec(@SQL)ry], [MerchandiseSubCat], [MerchandiseCateExec(@SQL)ry], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdManufacturerMerchandiseCateExec(@SQL)ryCateExec(@SQL)ryMerchandiseSubCatBrandEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCateExec(@SQL)ry], [CateExec(@SQL)ry], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdMerchandiseCateExec(@SQL)ryManufacturerCateExec(@SQL)ryMerchandiseSubCatBrandEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [MerchandiseCateExec(@SQL)ry], [Manufacturer], [CateExec(@SQL)ry], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdCateExec(@SQL)ryMerchandiseCateExec(@SQL)ryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [CateExec(@SQL)ry], [MerchandiseCateExec(@SQL)ry], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdMerchandiseSubCatCateExec(@SQL)ryMerchandiseCateExec(@SQL)ryManufacturerBrandEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [MerchandiseSubCat], [CateExec(@SQL)ry], [MerchandiseCateExec(@SQL)ry], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTFlyerIdPagePageDetailIDBrandManufacturerCateExec(@SQL)ryMerchandiseCateExec(@SQL)ryMEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [CateExec(@SQL)ry], [MerchandiseCateExec(@SQL)ry], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTManufacturerMerchandiseCateExec(@SQL)ryCateExec(@SQL)ryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([Manufacturer], [MerchandiseCateExec(@SQL)ry], [CateExec(@SQL)ry], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTMerchandiseSubCatManufacturerCateExec(@SQL)ryBrandMerchandiseCateExec(@SQL)ryPageEveEtc] ON [dbo].[' + @CatCode + 'PageDetailTable]([MerchandiseSubCat], [Manufacturer], [CateExec(@SQL)ry], [Brand], [MerchandiseCateExec(@SQL)ry], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTMerchandiseCateExec(@SQL)ryFlyerIDPageDetailIDPage] ON [dbo].[' + @CatCode + 'PageDetailTable]([MerchandiseCateExec(@SQL)ry], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
			
			Set @SQL='CREATE INDEX  [idx' + @CatCode + 'PDTPageEvent] ON [dbo].[' + @CatCode + 'PageDetailTable]([PageEvent], [PageDetailID]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
			Exec(@SQL)
		END
		
	
		
	fetch next from CURIndex
	into @CatCode
	
	END                       
	close CURIndex
	deallocate CURIndex


