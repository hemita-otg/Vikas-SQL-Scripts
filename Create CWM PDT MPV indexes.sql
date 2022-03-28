
if exists (select * from dbo.sysindexes where name = N'BDCCWMRetMkt' and id = object_id(N'[dbo].[BDCChildWebMain]'))
drop index [dbo].[BDCChildWebMain].[BDCCWMRetMkt]
GO

 CREATE  INDEX [BDCCWMRetMkt] ON [dbo].[BDCChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'BDCCWMConsolidated' and id = object_id(N'[dbo].[BDCChildWebMain]'))
drop index [dbo].[BDCChildWebMain].[BDCCWMConsolidated]
GO

 CREATE  INDEX [BDCCWMConsolidated] ON [dbo].[BDCChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'BDCCWMLarge' and id = object_id(N'[dbo].[BDCChildWebMain]'))
drop index [dbo].[BDCChildWebMain].[BDCCWMLarge]
GO

 CREATE  INDEX [BDCCWMLarge] ON [dbo].[BDCChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'BDCCWMINDEX1' and id = object_id(N'[dbo].[BDCChildWebMain]'))
drop index [dbo].[BDCChildWebMain].[BDCCWMINDEX1]
GO

 CREATE  INDEX [BDCCWMINDEX1] ON [dbo].[BDCChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO

 CREATE  INDEX [idxBDCPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[BDCPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO

 CREATE  INDEX [idxBDCPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[BDCPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO

 CREATE  INDEX [idxBDCPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[BDCPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO

 CREATE  INDEX [idxBDCPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[BDCPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO

 CREATE  INDEX [idxBDCPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[BDCPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxBDCPDTPageEvent' and id = object_id(N'[dbo].[BDCPageDetailTable]'))
drop index [dbo].[BDCPageDetailTable].[idxBDCPDTPageEvent]
GO

 CREATE  INDEX [idxBDCPDTPageEvent] ON [dbo].[BDCPageDetailTable]([PageEvent], [PageDetailID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


if exists (select * from dbo.sysindexes where name = N'BDCINDEXMPV2' and id = object_id(N'[dbo].[BDCMultiplePageValues]'))
drop index [dbo].[BDCMultiplePageValues].[BDCINDEXMPV2]
GO

 CREATE  INDEX [BDCINDEXMPV2] ON [dbo].[BDCMultiplePageValues]([FieldName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

