
if exists (select * from dbo.sysindexes where name = N'idxnstPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxnstPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[nstPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxnstPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[nstPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxnstPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[nstPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxnstPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[nstPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxnstPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[nstPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc]
GO
 CREATE  INDEX [idxnstPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc] ON [dbo].[nstPageDetailTable]([SalePrice1], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxnstPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[nstPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxnstPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxnstPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxnstPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[nstPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [Origin], [Variety], [SKUType], [Features], [Comments1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxPDTFlyerIDPDTIDPageMPVColumns' and id = object_id(N'[dbo].[nstPageDetailTable]'))
drop index [dbo].[nstPageDetailTable].[idxPDTFlyerIDPDTIDPageMPVColumns]
GO
 CREATE  INDEX [idxPDTFlyerIDPDTIDPageMPVColumns] ON [dbo].[nstPageDetailTable]([FlyerId], [PageDetailID], [Page], [Origin], [PageEvent], [PageTheme], [Variety], [SKUType]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



	
