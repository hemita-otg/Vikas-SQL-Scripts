-------------Diageo---------

Drop table ffDiaChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffDiaChildWebMain
 from FTFVchildwebmain cwm join Diageo_market RM
on cwm.market=rm.market

Drop Table ffDiaPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffDiaPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join Diageo_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffDiaChildWebMain)

drop index [dbo].[ffdiaChildWebMain].[ffdiaCWMRetMkt]
GO
 CREATE  INDEX [ffdiaCWMRetMkt] ON [dbo].[ffdiaChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdiaCWMConsolidated' and id = object_id(N'[dbo].[ffdiaChildWebMain]'))
drop index [dbo].[ffdiaChildWebMain].[ffdiaCWMConsolidated]
GO
 CREATE  INDEX [ffdiaCWMConsolidated] ON [dbo].[ffdiaChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdiaCWMLarge' and id = object_id(N'[dbo].[ffdiaChildWebMain]'))
drop index [dbo].[ffdiaChildWebMain].[ffdiaCWMLarge]
GO
 CREATE  INDEX [ffdiaCWMLarge] ON [dbo].[ffdiaChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdiaCWMINDEX1' and id = object_id(N'[dbo].[ffdiaChildWebMain]'))
drop index [dbo].[ffdiaChildWebMain].[ffdiaCWMINDEX1]
GO
 CREATE  INDEX [ffdiaCWMINDEX1] ON [dbo].[ffdiaChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffdiaDisDateRanges
From ffdiaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffdiaDisAdvertiserMarket
From ffdiaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaPublication]
GO

SELECT DISTINCT Publication
Into ffdiaPublication
From ffdiaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaMedia]
GO

SELECT DISTINCT Media
Into ffdiaMedia
From ffdiaChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffdiaDisQueryPage
From ffdiaPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdiaDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffdiaDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffdiaDisUnitType
From ffdiaPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffdiaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffdiaPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffdiaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffdiaPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffdiaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffdiaPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffdiaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffdiaPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdiaPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffdiaPageDetailTable]'))
drop index [dbo].[ffdiaPageDetailTable].[idxffdiaPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffdiaPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffdiaPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


--=====Bacardi====----
Drop table ffbacChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffbacChildWebMain
 from FTFVchildwebmain cwm join Bacardi_market RM
on cwm.market=rm.market

Drop Table ffbacPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffbacPageDetailTable
 from FTFVPageDetailTable pdt with (nolock)  join Bacardi_Category mc
on pdt.MerchandiseSubCat=mc.Category And Flyerid in (Select FlyerID From ffbacChildWebMain)


if exists (select * from dbo.sysindexes where name = N'ffbacCWMRetMkt' and id = object_id(N'[dbo].[ffbacChildWebMain]'))
drop index [dbo].[ffbacChildWebMain].[ffbacCWMRetMkt]
GO
 CREATE  INDEX [ffbacCWMRetMkt] ON [dbo].[ffbacChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbacCWMConsolidated' and id = object_id(N'[dbo].[ffbacChildWebMain]'))
drop index [dbo].[ffbacChildWebMain].[ffbacCWMConsolidated]
GO
 CREATE  INDEX [ffbacCWMConsolidated] ON [dbo].[ffbacChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbacCWMLarge' and id = object_id(N'[dbo].[ffbacChildWebMain]'))
drop index [dbo].[ffbacChildWebMain].[ffbacCWMLarge]
GO
 CREATE  INDEX [ffbacCWMLarge] ON [dbo].[ffbacChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbacCWMINDEX1' and id = object_id(N'[dbo].[ffbacChildWebMain]'))
drop index [dbo].[ffbacChildWebMain].[ffbacCWMINDEX1]
GO
 CREATE  INDEX [ffbacCWMINDEX1] ON [dbo].[ffbacChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffbacDisDateRanges
From ffbacChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffbacDisAdvertiserMarket
From ffbacChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacPublication]
GO

SELECT DISTINCT Publication
Into ffbacPublication
From ffbacChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacMedia]
GO

SELECT DISTINCT Media
Into ffbacMedia
From ffbacChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffbacDisQueryPage
From ffbacPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbacDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbacDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffbacDisUnitType
From ffbacPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffbacPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffbacPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffbacPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffbacPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffbacPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffbacPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffbacPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffbacPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbacPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffbacPageDetailTable]'))
drop index [dbo].[ffbacPageDetailTable].[idxffbacPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffbacPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffbacPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

--select Top 100 from FTFVPageDetailTable pdt with (nolock)  where pdt.unittype is not null
--select top 50 unittype, comments1, *  from FTFVPageDetailTable pdt with (nolock)  join Diageo_Category mc
-- on pdt.category=mc.Category
-- Where Flyerid in (Select FlyerID From ffDiaChildWebMain) 


----Pernoid---------
Drop table ffprChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffprChildWebMain
 from FTFVchildwebmain cwm join Pernod_market RM
on cwm.market=rm.market

Drop Table ffprPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffprPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join Pernod_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffprChildWebMain)

drop index [dbo].[ffprChildWebMain].[ffprCWMRetMkt]
GO
 CREATE  INDEX [ffprCWMRetMkt] ON [dbo].[ffprChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffprCWMConsolidated' and id = object_id(N'[dbo].[ffprChildWebMain]'))
drop index [dbo].[ffprChildWebMain].[ffprCWMConsolidated]
GO
 CREATE  INDEX [ffprCWMConsolidated] ON [dbo].[ffprChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffprCWMLarge' and id = object_id(N'[dbo].[ffprChildWebMain]'))
drop index [dbo].[ffprChildWebMain].[ffprCWMLarge]
GO
 CREATE  INDEX [ffprCWMLarge] ON [dbo].[ffprChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffprCWMINDEX1' and id = object_id(N'[dbo].[ffprChildWebMain]'))
drop index [dbo].[ffprChildWebMain].[ffprCWMINDEX1]
GO
 CREATE  INDEX [ffprCWMINDEX1] ON [dbo].[ffprChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffprDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffprDisDateRanges
From ffprChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffprDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffprDisAdvertiserMarket
From ffprChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffprPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprPublication]
GO

SELECT DISTINCT Publication
Into ffprPublication
From ffprChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffprMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprMedia]
GO

SELECT DISTINCT Media
Into ffprMedia
From ffprChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffprDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffprDisQueryPage
From ffprPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffprDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffprDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffprDisUnitType
From ffprPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffprPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffprPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffprPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffprPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffprPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffprPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffprPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffprPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffprPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffprPageDetailTable]'))
drop index [dbo].[ffprPageDetailTable].[idxffprPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffprPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffprPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



----Glazers-----
Drop table ffglaChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffglaChildWebMain
 from FTFVchildwebmain cwm join Glazer_market RM
on cwm.market=rm.market

Drop Table ffglaPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffglaPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join Glazer_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffglaChildWebMain)


drop index [dbo].[ffglaChildWebMain].[ffglaCWMRetMkt]
GO
 CREATE  INDEX [ffglaCWMRetMkt] ON [dbo].[ffglaChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffglaCWMConsolidated' and id = object_id(N'[dbo].[ffglaChildWebMain]'))
drop index [dbo].[ffglaChildWebMain].[ffglaCWMConsolidated]
GO
 CREATE  INDEX [ffglaCWMConsolidated] ON [dbo].[ffglaChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffglaCWMLarge' and id = object_id(N'[dbo].[ffglaChildWebMain]'))
drop index [dbo].[ffglaChildWebMain].[ffglaCWMLarge]
GO
 CREATE  INDEX [ffglaCWMLarge] ON [dbo].[ffglaChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffglaCWMINDEX1' and id = object_id(N'[dbo].[ffglaChildWebMain]'))
drop index [dbo].[ffglaChildWebMain].[ffglaCWMINDEX1]
GO
 CREATE  INDEX [ffglaCWMINDEX1] ON [dbo].[ffglaChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffglaDisDateRanges
From ffglaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffglaDisAdvertiserMarket
From ffglaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaPublication]
GO

SELECT DISTINCT Publication
Into ffglaPublication
From ffglaChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaMedia]
GO

SELECT DISTINCT Media
Into ffglaMedia
From ffglaChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffglaDisQueryPage
From ffglaPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffglaDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffglaDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffglaDisUnitType
From ffglaPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffglaPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffglaPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffglaPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffglaPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffglaPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffglaPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffglaPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffglaPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffglaPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffglaPageDetailTable]'))
drop index [dbo].[ffglaPageDetailTable].[idxffglaPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffglaPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffglaPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



---RNDC---------------
Drop table ffrndcChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffrndcChildWebMain
 from FTFVchildwebmain cwm join RNDC_market RM
on cwm.market=rm.market

Drop Table ffrndcPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffrndcPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join RNDC_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffrndcChildWebMain)

drop index [dbo].[ffrndcChildWebMain].[ffrndcCWMRetMkt]
GO
 CREATE  INDEX [ffrndcCWMRetMkt] ON [dbo].[ffrndcChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffrndcCWMConsolidated' and id = object_id(N'[dbo].[ffrndcChildWebMain]'))
drop index [dbo].[ffrndcChildWebMain].[ffrndcCWMConsolidated]
GO
 CREATE  INDEX [ffrndcCWMConsolidated] ON [dbo].[ffrndcChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffrndcCWMLarge' and id = object_id(N'[dbo].[ffrndcChildWebMain]'))
drop index [dbo].[ffrndcChildWebMain].[ffrndcCWMLarge]
GO
 CREATE  INDEX [ffrndcCWMLarge] ON [dbo].[ffrndcChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffrndcCWMINDEX1' and id = object_id(N'[dbo].[ffrndcChildWebMain]'))
drop index [dbo].[ffrndcChildWebMain].[ffrndcCWMINDEX1]
GO
 CREATE  INDEX [ffrndcCWMINDEX1] ON [dbo].[ffrndcChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffrndcDisDateRanges
From ffrndcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffrndcDisAdvertiserMarket
From ffrndcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcPublication]
GO

SELECT DISTINCT Publication
Into ffrndcPublication
From ffrndcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcMedia]
GO

SELECT DISTINCT Media
Into ffrndcMedia
From ffrndcChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffrndcDisQueryPage
From ffrndcPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffrndcDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffrndcDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffrndcDisUnitType
From ffrndcPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffrndcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffrndcPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffrndcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffrndcPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffrndcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffrndcPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffrndcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffrndcPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffrndcPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffrndcPageDetailTable]'))
drop index [dbo].[ffrndcPageDetailTable].[idxffrndcPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffrndcPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffrndcPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



----SWS -------
--Create SWS_Market and SWS_Category tables as blank
--Drop table sws_market
--Drop table sws_category
--Create table SWS_Market (Market varchar(100))
--Create table SWS_Category (Category varchar(100))


Drop table ffswsChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffswsChildWebMain
 from FTFVchildwebmain cwm join SWS_market RM
on cwm.market=rm.market

Drop Table ffswsPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffswsPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join SWS_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffswsChildWebMain)

drop index [dbo].[ffswsChildWebMain].[ffswsCWMRetMkt]
GO
 CREATE  INDEX [ffswsCWMRetMkt] ON [dbo].[ffswsChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffswsCWMConsolidated' and id = object_id(N'[dbo].[ffswsChildWebMain]'))
drop index [dbo].[ffswsChildWebMain].[ffswsCWMConsolidated]
GO
 CREATE  INDEX [ffswsCWMConsolidated] ON [dbo].[ffswsChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffswsCWMLarge' and id = object_id(N'[dbo].[ffswsChildWebMain]'))
drop index [dbo].[ffswsChildWebMain].[ffswsCWMLarge]
GO
 CREATE  INDEX [ffswsCWMLarge] ON [dbo].[ffswsChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffswsCWMINDEX1' and id = object_id(N'[dbo].[ffswsChildWebMain]'))
drop index [dbo].[ffswsChildWebMain].[ffswsCWMINDEX1]
GO
 CREATE  INDEX [ffswsCWMINDEX1] ON [dbo].[ffswsChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffswsDisDateRanges
From ffswsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffswsDisAdvertiserMarket
From ffswsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsPublication]
GO

SELECT DISTINCT Publication
Into ffswsPublication
From ffswsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsMedia]
GO

SELECT DISTINCT Media
Into ffswsMedia
From ffswsChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffswsDisQueryPage
From ffswsPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffswsDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffswsDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffswsDisUnitType
From ffswsPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffswsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffswsPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffswsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffswsPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffswsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffswsPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffswsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffswsPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffswsPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffswsPageDetailTable]'))
drop index [dbo].[ffswsPageDetailTable].[idxffswsPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffswsPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffswsPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

----ABC -------

Drop table ffabcChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffabcChildWebMain
 from FTFVchildwebmain cwm join abc_market RM
on cwm.market=rm.market

Drop Table ffabcPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffabcPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join abc_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffabcChildWebMain)

drop index [dbo].[ffabcChildWebMain].[ffabcCWMRetMkt]
GO
 CREATE  INDEX [ffabcCWMRetMkt] ON [dbo].[ffabcChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffabcCWMConsolidated' and id = object_id(N'[dbo].[ffabcChildWebMain]'))
drop index [dbo].[ffabcChildWebMain].[ffabcCWMConsolidated]
GO
 CREATE  INDEX [ffabcCWMConsolidated] ON [dbo].[ffabcChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffabcCWMLarge' and id = object_id(N'[dbo].[ffabcChildWebMain]'))
drop index [dbo].[ffabcChildWebMain].[ffabcCWMLarge]
GO
 CREATE  INDEX [ffabcCWMLarge] ON [dbo].[ffabcChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffabcCWMINDEX1' and id = object_id(N'[dbo].[ffabcChildWebMain]'))
drop index [dbo].[ffabcChildWebMain].[ffabcCWMINDEX1]
GO
 CREATE  INDEX [ffabcCWMINDEX1] ON [dbo].[ffabcChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffabcDisDateRanges
From ffabcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffabcDisAdvertiserMarket
From ffabcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcPublication]
GO

SELECT DISTINCT Publication
Into ffabcPublication
From ffabcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcMedia]
GO

SELECT DISTINCT Media
Into ffabcMedia
From ffabcChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffabcDisQueryPage
From ffabcPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffabcDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffabcDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffabcDisUnitType
From ffabcPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffabcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffabcPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffabcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffabcPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffabcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffabcPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffabcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffabcPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffabcPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffabcPageDetailTable]'))
drop index [dbo].[ffabcPageDetailTable].[idxffabcPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffabcPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffabcPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO






----CPH -------1339	364	ffcph

Drop table ffcphChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffcphChildWebMain
 from FTFVchildwebmain cwm join cph_market RM
on cwm.market=rm.market

Drop Table ffcphPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffcphPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join cph_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffcphChildWebMain)

drop index [dbo].[ffcphChildWebMain].[ffcphCWMRetMkt]
GO
 CREATE  INDEX [ffcphCWMRetMkt] ON [dbo].[ffcphChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffcphCWMConsolidated' and id = object_id(N'[dbo].[ffcphChildWebMain]'))
drop index [dbo].[ffcphChildWebMain].[ffcphCWMConsolidated]
GO
 CREATE  INDEX [ffcphCWMConsolidated] ON [dbo].[ffcphChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffcphCWMLarge' and id = object_id(N'[dbo].[ffcphChildWebMain]'))
drop index [dbo].[ffcphChildWebMain].[ffcphCWMLarge]
GO
 CREATE  INDEX [ffcphCWMLarge] ON [dbo].[ffcphChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffcphCWMINDEX1' and id = object_id(N'[dbo].[ffcphChildWebMain]'))
drop index [dbo].[ffcphChildWebMain].[ffcphCWMINDEX1]
GO
 CREATE  INDEX [ffcphCWMINDEX1] ON [dbo].[ffcphChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffcphDisDateRanges
From ffcphChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffcphDisAdvertiserMarket
From ffcphChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphPublication]
GO

SELECT DISTINCT Publication
Into ffcphPublication
From ffcphChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphMedia]
GO

SELECT DISTINCT Media
Into ffcphMedia
From ffcphChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffcphDisQueryPage
From ffcphPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffcphDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffcphDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffcphDisUnitType
From ffcphPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffcphPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffcphPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffcphPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffcphPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffcphPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffcphPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffcphPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffcphPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffcphPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffcphPageDetailTable]'))
drop index [dbo].[ffcphPageDetailTable].[idxffcphPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffcphPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffcphPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



----pab -------1340	365	ffpab

Drop table ffpabChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffpabChildWebMain
 from FTFVchildwebmain cwm join pab_market RM
on cwm.market=rm.market

Drop Table ffpabPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffpabPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join pab_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffpabChildWebMain)

drop index [dbo].[ffpabChildWebMain].[ffpabCWMRetMkt]
GO
 CREATE  INDEX [ffpabCWMRetMkt] ON [dbo].[ffpabChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpabCWMConsolidated' and id = object_id(N'[dbo].[ffpabChildWebMain]'))
drop index [dbo].[ffpabChildWebMain].[ffpabCWMConsolidated]
GO
 CREATE  INDEX [ffpabCWMConsolidated] ON [dbo].[ffpabChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpabCWMLarge' and id = object_id(N'[dbo].[ffpabChildWebMain]'))
drop index [dbo].[ffpabChildWebMain].[ffpabCWMLarge]
GO
 CREATE  INDEX [ffpabCWMLarge] ON [dbo].[ffpabChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpabCWMINDEX1' and id = object_id(N'[dbo].[ffpabChildWebMain]'))
drop index [dbo].[ffpabChildWebMain].[ffpabCWMINDEX1]
GO
 CREATE  INDEX [ffpabCWMINDEX1] ON [dbo].[ffpabChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffpabDisDateRanges
From ffpabChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffpabDisAdvertiserMarket
From ffpabChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabPublication]
GO

SELECT DISTINCT Publication
Into ffpabPublication
From ffpabChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabMedia]
GO

SELECT DISTINCT Media
Into ffpabMedia
From ffpabChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffpabDisQueryPage
From ffpabPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpabDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpabDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffpabDisUnitType
From ffpabPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffpabPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffpabPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffpabPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffpabPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffpabPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffpabPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffpabPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffpabPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpabPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffpabPageDetailTable]'))
drop index [dbo].[ffpabPageDetailTable].[idxffpabPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffpabPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffpabPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO




----pbi -------1341	366	ffpbi

Drop table ffpbiChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffpbiChildWebMain
 from FTFVchildwebmain cwm join pbi_market RM
on cwm.market=rm.market

Drop Table ffpbiPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffpbiPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join pbi_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffpbiChildWebMain)

drop index [dbo].[ffpbiChildWebMain].[ffpbiCWMRetMkt]
GO
 CREATE  INDEX [ffpbiCWMRetMkt] ON [dbo].[ffpbiChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpbiCWMConsolidated' and id = object_id(N'[dbo].[ffpbiChildWebMain]'))
drop index [dbo].[ffpbiChildWebMain].[ffpbiCWMConsolidated]
GO
 CREATE  INDEX [ffpbiCWMConsolidated] ON [dbo].[ffpbiChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpbiCWMLarge' and id = object_id(N'[dbo].[ffpbiChildWebMain]'))
drop index [dbo].[ffpbiChildWebMain].[ffpbiCWMLarge]
GO
 CREATE  INDEX [ffpbiCWMLarge] ON [dbo].[ffpbiChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffpbiCWMINDEX1' and id = object_id(N'[dbo].[ffpbiChildWebMain]'))
drop index [dbo].[ffpbiChildWebMain].[ffpbiCWMINDEX1]
GO
 CREATE  INDEX [ffpbiCWMINDEX1] ON [dbo].[ffpbiChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffpbiDisDateRanges
From ffpbiChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffpbiDisAdvertiserMarket
From ffpbiChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiPublication]
GO

SELECT DISTINCT Publication
Into ffpbiPublication
From ffpbiChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiMedia]
GO

SELECT DISTINCT Media
Into ffpbiMedia
From ffpbiChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffpbiDisQueryPage
From ffpbiPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffpbiDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffpbiDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffpbiDisUnitType
From ffpbiPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffpbiPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffpbiPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffpbiPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffpbiPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffpbiPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffpbiPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffpbiPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffpbiPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffpbiPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffpbiPageDetailTable]'))
drop index [dbo].[ffpbiPageDetailTable].[idxffpbiPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffpbiPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffpbiPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO







----emn -------1342	356	ffemn

Drop table ffemnChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffemnChildWebMain
 from FTFVchildwebmain cwm join emn_market RM
on cwm.market=rm.market

Drop Table ffemnPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffemnPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join emn_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffemnChildWebMain)

drop index [dbo].[ffemnChildWebMain].[ffemnCWMRetMkt]
GO
 CREATE  INDEX [ffemnCWMRetMkt] ON [dbo].[ffemnChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffemnCWMConsolidated' and id = object_id(N'[dbo].[ffemnChildWebMain]'))
drop index [dbo].[ffemnChildWebMain].[ffemnCWMConsolidated]
GO
 CREATE  INDEX [ffemnCWMConsolidated] ON [dbo].[ffemnChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffemnCWMLarge' and id = object_id(N'[dbo].[ffemnChildWebMain]'))
drop index [dbo].[ffemnChildWebMain].[ffemnCWMLarge]
GO
 CREATE  INDEX [ffemnCWMLarge] ON [dbo].[ffemnChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffemnCWMINDEX1' and id = object_id(N'[dbo].[ffemnChildWebMain]'))
drop index [dbo].[ffemnChildWebMain].[ffemnCWMINDEX1]
GO
 CREATE  INDEX [ffemnCWMINDEX1] ON [dbo].[ffemnChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffemnDisDateRanges
From ffemnChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffemnDisAdvertiserMarket
From ffemnChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnPublication]
GO

SELECT DISTINCT Publication
Into ffemnPublication
From ffemnChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnMedia]
GO

SELECT DISTINCT Media
Into ffemnMedia
From ffemnChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffemnDisQueryPage
From ffemnPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffemnDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffemnDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffemnDisUnitType
From ffemnPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffemnPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffemnPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffemnPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffemnPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffemnPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffemnPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffemnPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffemnPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffemnPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffemnPageDetailTable]'))
drop index [dbo].[ffemnPageDetailTable].[idxffemnPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffemnPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffemnPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO





----bdc -------1343	356	ffbdc

Drop table ffbdcChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffbdcChildWebMain
 from FTFVchildwebmain cwm join bdc_market RM
on cwm.market=rm.market

Drop Table ffbdcPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffbdcPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join bdc_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffbdcChildWebMain)

drop index [dbo].[ffbdcChildWebMain].[ffbdcCWMRetMkt]
GO
 CREATE  INDEX [ffbdcCWMRetMkt] ON [dbo].[ffbdcChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbdcCWMConsolidated' and id = object_id(N'[dbo].[ffbdcChildWebMain]'))
drop index [dbo].[ffbdcChildWebMain].[ffbdcCWMConsolidated]
GO
 CREATE  INDEX [ffbdcCWMConsolidated] ON [dbo].[ffbdcChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbdcCWMLarge' and id = object_id(N'[dbo].[ffbdcChildWebMain]'))
drop index [dbo].[ffbdcChildWebMain].[ffbdcCWMLarge]
GO
 CREATE  INDEX [ffbdcCWMLarge] ON [dbo].[ffbdcChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbdcCWMINDEX1' and id = object_id(N'[dbo].[ffbdcChildWebMain]'))
drop index [dbo].[ffbdcChildWebMain].[ffbdcCWMINDEX1]
GO
 CREATE  INDEX [ffbdcCWMINDEX1] ON [dbo].[ffbdcChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffbdcDisDateRanges
From ffbdcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffbdcDisAdvertiserMarket
From ffbdcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcPublication]
GO

SELECT DISTINCT Publication
Into ffbdcPublication
From ffbdcChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcMedia]
GO

SELECT DISTINCT Media
Into ffbdcMedia
From ffbdcChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffbdcDisQueryPage
From ffbdcPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbdcDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbdcDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffbdcDisUnitType
From ffbdcPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffbdcPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffbdcPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffbdcPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffbdcPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffbdcPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffbdcPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffbdcPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffbdcPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbdcPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffbdcPageDetailTable]'))
drop index [dbo].[ffbdcPageDetailTable].[idxffbdcPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffbdcPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffbdcPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO





----chd -------1344	356	ffchd

Drop table ffchdChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffchdChildWebMain
 from FTFVchildwebmain cwm join chd_market RM
on cwm.market=rm.market

Drop Table ffchdPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffchdPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join chd_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffchdChildWebMain)

drop index [dbo].[ffchdChildWebMain].[ffchdCWMRetMkt]
GO
 CREATE  INDEX [ffchdCWMRetMkt] ON [dbo].[ffchdChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffchdCWMConsolidated' and id = object_id(N'[dbo].[ffchdChildWebMain]'))
drop index [dbo].[ffchdChildWebMain].[ffchdCWMConsolidated]
GO
 CREATE  INDEX [ffchdCWMConsolidated] ON [dbo].[ffchdChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffchdCWMLarge' and id = object_id(N'[dbo].[ffchdChildWebMain]'))
drop index [dbo].[ffchdChildWebMain].[ffchdCWMLarge]
GO
 CREATE  INDEX [ffchdCWMLarge] ON [dbo].[ffchdChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffchdCWMINDEX1' and id = object_id(N'[dbo].[ffchdChildWebMain]'))
drop index [dbo].[ffchdChildWebMain].[ffchdCWMINDEX1]
GO
 CREATE  INDEX [ffchdCWMINDEX1] ON [dbo].[ffchdChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffchdDisDateRanges
From ffchdChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffchdDisAdvertiserMarket
From ffchdChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdPublication]
GO

SELECT DISTINCT Publication
Into ffchdPublication
From ffchdChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdMedia]
GO

SELECT DISTINCT Media
Into ffchdMedia
From ffchdChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffchdDisQueryPage
From ffchdPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffchdDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffchdDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffchdDisUnitType
From ffchdPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffchdPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffchdPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffchdPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffchdPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffchdPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffchdPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffchdPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffchdPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffchdPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffchdPageDetailTable]'))
drop index [dbo].[ffchdPageDetailTable].[idxffchdPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffchdPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffchdPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO





----mbb -------1346	369	ffmbb


Drop table ffmbbChildWebMain
Go

select 
cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,
cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.Published
On,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.
SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdat
edOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffmbbChildWebMain
 from FTFVchildwebmain cwm join mbb_market RM
on cwm.market=rm.market

Drop Table ffmbbPageDetailTable
GO

select  
pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePa
th,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.Sal
ePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscou
ntD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffmbbPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join mbb_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffmbbChildWebMain)

drop index [dbo].[ffmbbChildWebMain].[ffmbbCWMRetMkt]
GO
 CREATE  INDEX [ffmbbCWMRetMkt] ON [dbo].[ffmbbChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffmbbCWMConsolidated' and id = object_id(N'[dbo].
[ffmbbChildWebMain]'))
drop index [dbo].[ffmbbChildWebMain].[ffmbbCWMConsolidated]
GO
 CREATE  INDEX [ffmbbCWMConsolidated] ON [dbo].[ffmbbChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], 
[event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffmbbCWMLarge' and id = object_id(N'[dbo].
[ffmbbChildWebMain]'))
drop index [dbo].[ffmbbChildWebMain].[ffmbbCWMLarge]
GO
 CREATE  INDEX [ffmbbCWMLarge] ON [dbo].[ffmbbChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], 
[theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffmbbCWMINDEX1' and id = object_id(N'[dbo].
[ffmbbChildWebMain]'))
drop index [dbo].[ffmbbChildWebMain].[ffmbbCWMINDEX1]
GO
 CREATE  INDEX [ffmbbCWMINDEX1] ON [dbo].[ffmbbChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbDisDateRanges]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffmbbDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-
1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffmbbDisDateRanges
From ffmbbChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbDisAdvertiserMarket]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffmbbDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffmbbDisAdvertiserMarket
From ffmbbChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbPublication]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffmbbPublication]
GO

SELECT DISTINCT Publication
Into ffmbbPublication
From ffmbbChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 
1)
drop table [ffmbbMedia]
GO

SELECT DISTINCT Media
Into ffmbbMedia
From ffmbbChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbDisQueryPage]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffmbbDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffmbbDisQueryPage
From ffmbbPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffmbbDisUnitType]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffmbbDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffmbbDisUnitType
From ffmbbPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].
[ffmbbPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  
FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffmbbPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffmbbPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON 
[dbo].[ffmbbPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON 
[dbo].[ffmbbPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffmbbPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].
[ffmbbPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], 
[NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffmbbPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON 
[dbo].[ffmbbPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], 
[MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffmbbPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON 
[dbo].[ffmbbPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffmbbPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id
(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].
[idxffmbbPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffmbbPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON 
[dbo].[ffmbbPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffmbbPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and 
id = object_id(N'[dbo].[ffmbbPageDetailTable]'))
drop index [dbo].[ffmbbPageDetailTable].[idxffmbbPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffmbbPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffmbbPageDetailTable]
([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO







----unl -------1347	370	ffunl


Drop table ffunlChildWebMain
Go

select 
cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,
cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.Published
On,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.
SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdat
edOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffunlChildWebMain
 from FTFVchildwebmain cwm join unl_market RM
on cwm.market=rm.market

Drop Table ffunlPageDetailTable
GO

select  
pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePa
th,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.Sal
ePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscou
ntD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffunlPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join unl_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffunlChildWebMain)

drop index [dbo].[ffunlChildWebMain].[ffunlCWMRetMkt]
GO
 CREATE  INDEX [ffunlCWMRetMkt] ON [dbo].[ffunlChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffunlCWMConsolidated' and id = object_id(N'[dbo].
[ffunlChildWebMain]'))
drop index [dbo].[ffunlChildWebMain].[ffunlCWMConsolidated]
GO
 CREATE  INDEX [ffunlCWMConsolidated] ON [dbo].[ffunlChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], 
[event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffunlCWMLarge' and id = object_id(N'[dbo].
[ffunlChildWebMain]'))
drop index [dbo].[ffunlChildWebMain].[ffunlCWMLarge]
GO
 CREATE  INDEX [ffunlCWMLarge] ON [dbo].[ffunlChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], 
[theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffunlCWMINDEX1' and id = object_id(N'[dbo].
[ffunlChildWebMain]'))
drop index [dbo].[ffunlChildWebMain].[ffunlCWMINDEX1]
GO
 CREATE  INDEX [ffunlCWMINDEX1] ON [dbo].[ffunlChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlDisDateRanges]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffunlDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-
1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffunlDisDateRanges
From ffunlChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlDisAdvertiserMarket]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffunlDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffunlDisAdvertiserMarket
From ffunlChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlPublication]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffunlPublication]
GO

SELECT DISTINCT Publication
Into ffunlPublication
From ffunlChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 
1)
drop table [ffunlMedia]
GO

SELECT DISTINCT Media
Into ffunlMedia
From ffunlChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlDisQueryPage]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffunlDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffunlDisQueryPage
From ffunlPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffunlDisUnitType]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffunlDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffunlDisUnitType
From ffunlPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].
[ffunlPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  
FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffunlPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffunlPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON 
[dbo].[ffunlPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON 
[dbo].[ffunlPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffunlPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].
[ffunlPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], 
[NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffunlPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON 
[dbo].[ffunlPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], 
[MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffunlPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON 
[dbo].[ffunlPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffunlPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id
(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].
[idxffunlPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffunlPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON 
[dbo].[ffunlPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffunlPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and 
id = object_id(N'[dbo].[ffunlPageDetailTable]'))
drop index [dbo].[ffunlPageDetailTable].[idxffunlPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffunlPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffunlPageDetailTable]
([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO






----nws -------1348	371	ffnws


Drop table ffnwsChildWebMain
Go

select 
cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,
cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.Published
On,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.
SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdat
edOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffnwsChildWebMain
 from FTFVchildwebmain cwm join nws_market RM
on cwm.market=rm.market

Drop Table ffnwsPageDetailTable
GO

select  
pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePa
th,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.Sal
ePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscou
ntD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffnwsPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join nws_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffnwsChildWebMain)

drop index [dbo].[ffnwsChildWebMain].[ffnwsCWMRetMkt]
GO
 CREATE  INDEX [ffnwsCWMRetMkt] ON [dbo].[ffnwsChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffnwsCWMConsolidated' and id = object_id(N'[dbo].
[ffnwsChildWebMain]'))
drop index [dbo].[ffnwsChildWebMain].[ffnwsCWMConsolidated]
GO
 CREATE  INDEX [ffnwsCWMConsolidated] ON [dbo].[ffnwsChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], 
[event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffnwsCWMLarge' and id = object_id(N'[dbo].
[ffnwsChildWebMain]'))
drop index [dbo].[ffnwsChildWebMain].[ffnwsCWMLarge]
GO
 CREATE  INDEX [ffnwsCWMLarge] ON [dbo].[ffnwsChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], 
[theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffnwsCWMINDEX1' and id = object_id(N'[dbo].
[ffnwsChildWebMain]'))
drop index [dbo].[ffnwsChildWebMain].[ffnwsCWMINDEX1]
GO
 CREATE  INDEX [ffnwsCWMINDEX1] ON [dbo].[ffnwsChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsDisDateRanges]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffnwsDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-
1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffnwsDisDateRanges
From ffnwsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsDisAdvertiserMarket]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffnwsDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffnwsDisAdvertiserMarket
From ffnwsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsPublication]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffnwsPublication]
GO

SELECT DISTINCT Publication
Into ffnwsPublication
From ffnwsChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 
1)
drop table [ffnwsMedia]
GO

SELECT DISTINCT Media
Into ffnwsMedia
From ffnwsChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsDisQueryPage]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffnwsDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffnwsDisQueryPage
From ffnwsPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffnwsDisUnitType]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffnwsDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffnwsDisUnitType
From ffnwsPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].
[ffnwsPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  
FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffnwsPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffnwsPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON 
[dbo].[ffnwsPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON 
[dbo].[ffnwsPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffnwsPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].
[ffnwsPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], 
[NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffnwsPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON 
[dbo].[ffnwsPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], 
[MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffnwsPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON 
[dbo].[ffnwsPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffnwsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id
(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].
[idxffnwsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffnwsPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON 
[dbo].[ffnwsPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffnwsPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and 
id = object_id(N'[dbo].[ffnwsPageDetailTable]'))
drop index [dbo].[ffnwsPageDetailTable].[idxffnwsPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffnwsPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffnwsPageDetailTable]
([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



----dlw -------1349	372	ffdlw


Drop table ffdlwChildWebMain
Go

select 
cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,
cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.Published
On,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.
SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdat
edOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffdlwChildWebMain
 from FTFVchildwebmain cwm join dlw_market RM
on cwm.market=rm.market

Drop Table ffdlwPageDetailTable
GO

select  
pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePa
th,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.Sal
ePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscou
ntD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffdlwPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join dlw_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffdlwChildWebMain)

drop index [dbo].[ffdlwChildWebMain].[ffdlwCWMRetMkt]
GO
 CREATE  INDEX [ffdlwCWMRetMkt] ON [dbo].[ffdlwChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdlwCWMConsolidated' and id = object_id(N'[dbo].
[ffdlwChildWebMain]'))
drop index [dbo].[ffdlwChildWebMain].[ffdlwCWMConsolidated]
GO
 CREATE  INDEX [ffdlwCWMConsolidated] ON [dbo].[ffdlwChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], 
[event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdlwCWMLarge' and id = object_id(N'[dbo].
[ffdlwChildWebMain]'))
drop index [dbo].[ffdlwChildWebMain].[ffdlwCWMLarge]
GO
 CREATE  INDEX [ffdlwCWMLarge] ON [dbo].[ffdlwChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], 
[theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffdlwCWMINDEX1' and id = object_id(N'[dbo].
[ffdlwChildWebMain]'))
drop index [dbo].[ffdlwChildWebMain].[ffdlwCWMINDEX1]
GO
 CREATE  INDEX [ffdlwCWMINDEX1] ON [dbo].[ffdlwChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwDisDateRanges]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffdlwDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-
1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffdlwDisDateRanges
From ffdlwChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwDisAdvertiserMarket]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffdlwDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffdlwDisAdvertiserMarket
From ffdlwChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwPublication]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffdlwPublication]
GO

SELECT DISTINCT Publication
Into ffdlwPublication
From ffdlwChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 
1)
drop table [ffdlwMedia]
GO

SELECT DISTINCT Media
Into ffdlwMedia
From ffdlwChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwDisQueryPage]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffdlwDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffdlwDisQueryPage
From ffdlwPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffdlwDisUnitType]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffdlwDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffdlwDisUnitType
From ffdlwPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].
[ffdlwPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  
FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffdlwPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffdlwPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON 
[dbo].[ffdlwPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON 
[dbo].[ffdlwPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffdlwPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].
[ffdlwPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], 
[NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffdlwPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON 
[dbo].[ffdlwPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], 
[MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffdlwPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON 
[dbo].[ffdlwPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffdlwPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id
(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].
[idxffdlwPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffdlwPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON 
[dbo].[ffdlwPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffdlwPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and 
id = object_id(N'[dbo].[ffdlwPageDetailTable]'))
drop index [dbo].[ffdlwPageDetailTable].[idxffdlwPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffdlwPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffdlwPageDetailTable]
([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO




----jdo -------1350	372	ffjdo


Drop table ffjdoChildWebMain
Go

select 
cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,
cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.Published
On,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.
SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdat
edOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffjdoChildWebMain
 from FTFVchildwebmain cwm join jdo_market RM
on cwm.market=rm.market

Drop Table ffjdoPageDetailTable
GO

select  
pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePa
th,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.Sal
ePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscou
ntD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffjdoPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join jdo_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffjdoChildWebMain)

drop index [dbo].[ffjdoChildWebMain].[ffjdoCWMRetMkt]
GO
 CREATE  INDEX [ffjdoCWMRetMkt] ON [dbo].[ffjdoChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffjdoCWMConsolidated' and id = object_id(N'[dbo].
[ffjdoChildWebMain]'))
drop index [dbo].[ffjdoChildWebMain].[ffjdoCWMConsolidated]
GO
 CREATE  INDEX [ffjdoCWMConsolidated] ON [dbo].[ffjdoChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], 
[event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffjdoCWMLarge' and id = object_id(N'[dbo].
[ffjdoChildWebMain]'))
drop index [dbo].[ffjdoChildWebMain].[ffjdoCWMLarge]
GO
 CREATE  INDEX [ffjdoCWMLarge] ON [dbo].[ffjdoChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], 
[theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], 
[SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffjdoCWMINDEX1' and id = object_id(N'[dbo].
[ffjdoChildWebMain]'))
drop index [dbo].[ffjdoChildWebMain].[ffjdoCWMINDEX1]
GO
 CREATE  INDEX [ffjdoCWMINDEX1] ON [dbo].[ffjdoChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoDisDateRanges]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffjdoDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-
1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffjdoDisDateRanges
From ffjdoChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoDisAdvertiserMarket]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffjdoDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffjdoDisAdvertiserMarket
From ffjdoChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoPublication]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffjdoPublication]
GO

SELECT DISTINCT Publication
Into ffjdoPublication
From ffjdoChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 
1)
drop table [ffjdoMedia]
GO

SELECT DISTINCT Media
Into ffjdoMedia
From ffjdoChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoDisQueryPage]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffjdoDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffjdoDisQueryPage
From ffjdoPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffjdoDisUnitType]') and OBJECTPROPERTY(id, 
N'IsUserTable') = 1)
drop table [ffjdoDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffjdoDisUnitType
From ffjdoPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].
[ffjdoPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  
FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffjdoPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON 
[dbo].[ffjdoPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON 
[dbo].[ffjdoPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON 
[dbo].[ffjdoPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], 
[Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffjdoPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].
[ffjdoPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], 
[NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffjdoPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON 
[dbo].[ffjdoPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], 
[MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffjdoPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON 
[dbo].[ffjdoPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = 
N'idxffjdoPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id
(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].
[idxffjdoPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffjdoPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON 
[dbo].[ffjdoPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], 
[PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], 
[Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffjdoPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and 
id = object_id(N'[dbo].[ffjdoPageDetailTable]'))
drop index [dbo].[ffjdoPageDetailTable].[idxffjdoPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffjdoPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffjdoPageDetailTable]
([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



-------------ffben

Drop table ffbenChildWebMain
Go

select cwm.FlyerID,cwm.Advertiser,cwm.AdDate,cwm.WeekOf,cwm.media,cwm.event,cwm.theme,cwm.market,cwm.Publication,cwm.salestartdate,
cwm.saleenddate,cwm.pages,cwm.size,cwm.tradeclass,cwm.coupon,cwm.img,cwm.url,cwm.webcreated,cwm.PublishedOn,cwm.recordenteredby,
cwm.datetimerecordentered,cwm.AdviewStatusID,cwm.AdlertStatusID,cwm.Region,cwm.District,cwm.SalesTerritory,cwm.SalesTerritoryGroup,cwm.SalesTerritorySubGroup,
cwm.DateTimeAdded,cwm.TcUpdatedOn,cwm.DistUpdatedOn,cwm.RegionUpdatedOn,cwm.StUpdatedOn,cwm.StgUpdatedOn,cwm.StsgUpdatedOn,
cwm.RetID,cwm.MktID,cwm.RetMktID,cwm.AdMonth,cwm.AdDay,cwm.CountryID,cwm.LanguageID,cwm.TCID,
cwm.AVTCID,cwm.PubID,cwm.NewsID,cwm.MediaID,cwm.ThemeID,cwm.EventID,
cwm.Priority,cwm.EntryProjectID,cwm.WeekOfn,cwm.WeekOfi
Into ffbenChildWebMain
 from FTFVchildwebmain cwm join ben_market RM
on cwm.market=rm.market

Drop Table ffbenPageDetailTable
GO

select  pdt.FlyerId,pdt.Page,pdt.PageDetailID,pdt.ThumbImagePath,pdt.NormalImagePath,pdt.FullImagePath,pdt.ProductImagePath,pdt.MultipleValues,
pdt.DTAdded,pdt.Retailer,pdt.TaggedCompany,pdt.Manufacturer,pdt.MerchandiseCategory,
pdt.MerchandiseSubCat,
pdt.Category,pdt.Brand,pdt.SKUDescription1,pdt.SKUDescription2,pdt.SKUDescription3,pdt.SKUType,pdt.SalePrice1,pdt.SalePrice2,pdt.RegularPrice1,
pdt.RegularPrice2,pdt.NorPrice,pdt.RebateAmount,pdt.LowestRebatePrice,pdt.LowestDiscountPrice,pdt.UnitPrice,
pdt.Promotions,pdt.PageEvent,pdt.PageTheme,pdt.Features,pdt.NumberPackage,pdt.Coupon,pdt.CouponValueD1,
pdt.CouponValueD2,pdt.CouponValueP1,pdt.CouponValueP2,pdt.OtherDiscountD1,pdt.OtherDiscountD2,pdt.OtherDiscountD3,
pdt.RequiredQuantity,pdt.MaximumQuantity,pdt.AdSize,pdt.AdCost,pdt.Illustrated,pdt.Color,pdt.NoOfColors,pdt.SaleStDt,
pdt.SaleEndDt,pdt.CouponExpirationDate,pdt.Optional1,pdt.Optional2,pdt.Optional3,pdt.Optional4,pdt.Optional5,
pdt.Optional6,pdt.Optional7,pdt.Optional8,pdt.Optional9,pdt.Optional10,pdt.Optional11,pdt.Optional12,pdt.Comments,
pdt.ProductTerritory,pdt.ProductTerritorySubGroup,pdt.ProductTerritoryGroup,
pdt.EnteredClient,pdt.CouponExpirationDate1,pdt.CouponExpirationDate2,pdt.OtherDiscountP1,
pdt.OtherDiscountP2,pdt.OtherDiscountP3,pdt.Comments1,pdt.OfferDes,pdt.comments2,
pdt.comments3,pdt.comments4,pdt.topleftx,pdt.toplefty,pdt.bottomrightx,pdt.bottomrighty,pdt.McUpdatedOn,
pdt.MscUpdatedOn,pdt.MfrUpdatedOn,pdt.PtUpdatedOn,pdt.PtgUpdatedOn,pdt.PtsgUpdatedOn,pdt.ProdImageCreated,
pdt.ProdImageCreatedOn,pdt.Origin,pdt.Variety,pdt.UnitType,pdt.PkgSize
Into ffbenPageDetailTable
 from FTFVPageDetailTable pdt with (nolock) join ben_Category mc on pdt.MerchandiseSubCat=mc.Category
Where Flyerid in (Select FlyerID From ffbenChildWebMain)

drop index [dbo].[ffbenChildWebMain].[ffbenCWMRetMkt]
GO
 CREATE  INDEX [ffbenCWMRetMkt] ON [dbo].[ffbenChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbenCWMConsolidated' and id = object_id(N'[dbo].[ffbenChildWebMain]'))
drop index [dbo].[ffbenChildWebMain].[ffbenCWMConsolidated]
GO
 CREATE  INDEX [ffbenCWMConsolidated] ON [dbo].[ffbenChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbenCWMLarge' and id = object_id(N'[dbo].[ffbenChildWebMain]'))
drop index [dbo].[ffbenChildWebMain].[ffbenCWMLarge]
GO
 CREATE  INDEX [ffbenCWMLarge] ON [dbo].[ffbenChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'ffbenCWMINDEX1' and id = object_id(N'[dbo].[ffbenChildWebMain]'))
drop index [dbo].[ffbenChildWebMain].[ffbenCWMINDEX1]
GO
 CREATE  INDEX [ffbenCWMINDEX1] ON [dbo].[ffbenChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into ffbenDisDateRanges
From ffbenChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into ffbenDisAdvertiserMarket
From ffbenChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenPublication]
GO

SELECT DISTINCT Publication
Into ffbenPublication
From ffbenChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenMedia]
GO

SELECT DISTINCT Media
Into ffbenMedia
From ffbenChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenDisQueryPage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenDisQueryPage]
GO

SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category
Into ffbenDisQueryPage
From ffbenPageDetailTable
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[ffbenDisUnitType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [ffbenDisUnitType]
GO

SELECT DISTINCT UnitType
Into ffbenDisUnitType
From ffbenPageDetailTable
GO


if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO
 CREATE  INDEX [idxffbenPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[ffbenPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO
 CREATE  INDEX [idxffbenPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[ffbenPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO
 CREATE  INDEX [idxffbenPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[ffbenPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO
 CREATE  INDEX [idxffbenPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[ffbenPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxffbenPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[ffbenPageDetailTable]'))
drop index [dbo].[ffbenPageDetailTable].[idxffbenPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO
 CREATE  INDEX [idxffbenPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[ffbenPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Clustered Index creation script for all clients
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffprChildWebMain Add CONSTRAINT [pk_ffprChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffprPageDetailTable Add CONSTRAINT [PK_ffprPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffmoeChildWebMain Add CONSTRAINT [pk_ffmoeChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffmoePageDetailTable Add CONSTRAINT [PK_ffmoePageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffswsChildWebMain Add CONSTRAINT [pk_ffswsChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffswsPageDetailTable Add CONSTRAINT [PK_ffswsPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffglaChildWebMain Add CONSTRAINT [pk_ffglaChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffglaPageDetailTable Add CONSTRAINT [PK_ffglaPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffrndcChildWebMain Add CONSTRAINT [pk_ffrndcChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffrndcPageDetailTable Add CONSTRAINT [PK_ffrndcPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffbenChildWebMain Add CONSTRAINT [pk_ffbenChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffbenPageDetailTable Add CONSTRAINT [PK_ffbenPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffabcChildWebMain Add CONSTRAINT [pk_ffabcChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffabcPageDetailTable Add CONSTRAINT [PK_ffabcPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffcphChildWebMain Add CONSTRAINT [pk_ffcphChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffcphPageDetailTable Add CONSTRAINT [PK_ffcphPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffpabChildWebMain Add CONSTRAINT [pk_ffpabChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffpabPageDetailTable Add CONSTRAINT [PK_ffpabPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffpbiChildWebMain Add CONSTRAINT [pk_ffpbiChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffpbiPageDetailTable Add CONSTRAINT [PK_ffpbiPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffemnChildWebMain Add CONSTRAINT [pk_ffemnChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffemnPageDetailTable Add CONSTRAINT [PK_ffemnPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffbdcChildWebMain Add CONSTRAINT [pk_ffbdcChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffbdcPageDetailTable Add CONSTRAINT [PK_ffbdcPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffchdChildWebMain Add CONSTRAINT [pk_ffchdChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffchdPageDetailTable Add CONSTRAINT [PK_ffchdPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffmbbChildWebMain Add CONSTRAINT [pk_ffmbbChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffmbbPageDetailTable Add CONSTRAINT [PK_ffmbbPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffunlChildWebMain Add CONSTRAINT [pk_ffunlChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffunlPageDetailTable Add CONSTRAINT [PK_ffunlPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffnwsChildWebMain Add CONSTRAINT [pk_ffnwsChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffnwsPageDetailTable Add CONSTRAINT [PK_ffnwsPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffdlwChildWebMain Add CONSTRAINT [pk_ffdlwChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffdlwPageDetailTable Add CONSTRAINT [PK_ffdlwPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Alter Table ffjdoChildWebMain Add CONSTRAINT [pk_ffjdoChildWebMain] PRIMARY KEY  CLUSTERED ([FlyerID])  ON [PRIMARY] 
GO

Alter Table ffjdoPageDetailTable Add CONSTRAINT [PK_ffjdoPageDetailTable] PRIMARY KEY CLUSTERED ([PageDetailID]) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



