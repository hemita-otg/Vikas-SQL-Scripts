
if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxdgfvPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[dgfvPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxdgfvPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[dgfvPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxdgfvPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[dgfvPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxdgfvPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[dgfvPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxdgfvPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[dgfvPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc]
GO
 CREATE  INDEX [idxdgfvPDTPageEventOriginSalePrice1Featurescomments1VarietyFlyEtc] ON [dbo].[dgfvPageDetailTable]([SalePrice1], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxdgfvPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[dgfvPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxdgfvPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxdgfvPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxdgfvPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[dgfvPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [Origin], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup], [Features], [Comments1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxPDTFlyerIDPDTIDPageMPVColumns' and id = object_id(N'[dbo].[dgfvPageDetailTable]'))
drop index [dbo].[dgfvPageDetailTable].[idxPDTFlyerIDPDTIDPageMPVColumns]
GO
 CREATE  INDEX [idxPDTFlyerIDPDTIDPageMPVColumns] ON [dbo].[dgfvPageDetailTable]([FlyerId], [PageDetailID], [Page], [Origin], [PageEvent], [PageTheme], [Variety], [productterritory], [productterritorysubgroup], [productterritorygroup]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



	
