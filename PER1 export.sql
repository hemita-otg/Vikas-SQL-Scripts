/*
truncate table Per1MasterAdvertiserIDTable
truncate table Per1MasterBrandIDTable
truncate table Per1MasterCategoryIDTable
truncate table Per1MasterDistrictIDTable
truncate table Per1MasterEventIDTable
truncate table Per1MasterFeaturesIDTable
truncate table Per1MasterMainOfferIDTable
truncate table Per1MasterManufacturerIDTable
truncate table Per1MasterMarketIDTable
truncate table Per1MasterMediaIDTable
truncate table Per1MasterMerchandiseCategoryIDTable
truncate table Per1MasterMerchandiseSubCatIDTable
truncate table Per1MasterOfferDesIDTable
truncate table Per1MasterOfferIDTable
truncate table Per1MasterOfferTypeIDTable
truncate table Per1MasterOriginIDTable
truncate table Per1MasterPageEventIDTable
truncate table Per1MasterproductterritorygroupIDTable
truncate table Per1MasterproductterritoryIDTable
truncate table Per1MasterproductterritorysubgroupIDTable
truncate table Per1MasterPublicationIDTable
truncate table Per1MasterRegionIDTable
truncate table Per1MasterSalesTerritoryGroupIDTable
truncate table Per1MasterSalesTerritoryIDTable
truncate table Per1MasterSalesTerritorySubGroupIDTable
truncate table Per1MasterSizeIDTable
truncate table Per1MasterSKUDescription1IDTable
truncate table Per1MasterSKUDescription2IDTable
truncate table Per1MasterSKUDescription3IDTable
truncate table Per1MasterSKUTypeIDTable
truncate table Per1MasterThemeIDTable
truncate table Per1MasterTradeClassIDTable
truncate table Per1MasterunittypeIDTable
truncate table Per1MasterVarietyIDTable


*/


DELETE From [PER1MasterDelete_Data]

Truncate Table Per1MasterExportTable 

Insert Into [Per1MasterExportTable]
Select CWM.Flyerid, PDT.PageDetailId, CWM.TradeClass, Cast(0 As Int) As TradeClassID, CWM.Advertiser, Cast(0 As Int) As AdvertiserID, 
CWM.AdDate, CWM.WeekOf, CWM.Market, Cast(0 As Int) As MarketID, CWM.Media, Cast(0 As Int) As MediaID, CWM.Publication, 
Cast(0 As Int) As PublicationID, CWM.pages, CWM.Event, Cast(0 As Int) As EventID, CWM.Theme, Cast(0 As Int) As ThemeID, CWM.SaleStartDate, 
CWM.SaleEndDate, CWM.WeekOfn, CWM.WeekOfi, CWM.District, Cast(0 As Int) As DistrictID, 
CWM.Region, Cast(0 As Int) As RegionID, CWM.Size, Cast(0 As Int) As SizeID, CWM.SalesTerritory, Cast(0 As Int) As SalesTerritoryID, 
CWM.SalesTerritoryGroup, Cast(0 As Int) As SalesTerritoryGroupID, CWM.SalesTerritorySubGroup, Cast(0 As Int) As SalesTerritorySubGroupID, 
Case When CWM.Coupon = 'Yes' Then Cast(1 as bit) Else Cast(0 as Bit) End Coupon, CWM.Priority, PDT.MerchandiseCategory, Cast(0 As Int) As MerchandiseCategoryID, 
PDT.MerchandiseSubCat, Cast(0 As Int) As MerchandiseSubCatID, PDT.Category, Cast(0 As Int) As CategoryID, PDT.Manufacturer, 
Cast(0 As Int) As ManufacturerID, PDT.Brand, Cast(0 As Int) As BrandID, PDT.Features, Cast(0 As Int) As FeaturesID, Replace(PDT.Comments1, '"', '''') Comments1, 
PDT.TaggedCompany, 
Cast(Replace(PDT.PageEvent, '"', '''') as varchar(255)) PageEvent, Cast(0 As Int) As PageEventID, 
Cast(Replace(PDT.Origin, '"', '''') as varchar(255)) Origin, Cast(0 As Int) As OriginID, 
Cast(Replace(PDT.Variety, '"', '''') as varchar(100)) Variety, Cast(0 As Int) As VarietyID, PDT.MainOffer, Cast(0 As Int) As MainOfferID, 
Cast(Replace(PDT.Offer, '"', '''') as varchar(255)) Offer, Cast(0 As Int) As OfferID, 
Cast(PDT.OfferType as varchar(255)) OfferType, Cast(0 As Int) As OfferTypeID, 
Cast(Replace(PDT.OfferDes, '"', '''') as varchar(255)) as OfferDes, Cast(0 As Int) As OfferDesID, 
PDT.page, PDT.SalePrice1, PDT.SalePrice2, PDT.RegularPrice1, PDT.RegularPrice2, PDT.NORPrice, PDT.RebateAmount, PDT.LowestRebatePrice, PDT.LowestDiscountPrice, 
PDT.UnitPrice, PDT.CouponValueD2, PDT.CouponValueP1, PDT.OtherDiscountD1, PDT.OtherDiscountD2, PDT.RequiredQuantity, PDT.MaximumQuantity, 
PDT.NumberPackage, PDT.pkgsize, PDT.unittype, Cast(0 As Int) As unittypeID, PDT.productterritory, Cast(0 As Int) As productterritoryID, 
PDT.productterritorysubgroup, Cast(0 As Int) As productterritorysubgroupID, PDT.productterritorygroup, 
Cast(0 As Int) As productterritorygroupID, PDT.SKUType, Cast(0 As Int) As SKUTypeID, PDT.SKUDescription1, 
Cast(0 As Int) As SKUDescription1ID, PDT.SKUDescription2, Cast(0 As Int) As SKUDescription2ID, PDT.SKUDescription3, 
Cast(0 As Int) As SKUDescription3ID, Cast(0 as SmallInt) Exported, DTAdded
From PER1ChildWebMain CWM
JOIN PER1PageDetailTable PDT ON CWM.FlyerID = PDT.FlyerID
WHERE PDT.Category in ('Fully Cooked Beef','Fully Cooked Chicken','Fully Cooked Lamb','Fully Cooked Other Meat','Fully Cooked Pork','Fully Cooked Stir Fry/Fajita Strips','Fully Cooked Turkey')
 AND
PAGEDETAILID NOT IN (Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0)
-- (PDT.DTADDED = (Select Max(Convert(varchar(12), X.DTADDED, 101)) From Per1MasterExportTable X Where Exported > 0) AND 
-- 	PAGEDETAILID  NOT IN (Select Distinct PageDetailID From Per1MasterExportTable 
-- 		Where Exported > 0 AND PDT.DTADDED = (Select Max(Convert(varchar(12), Y.DTADDED, 101)) From Per1MasterExportTable Y Where Exported > 0)))
-- OR
-- (PDT.DTADDED > (Select Max(Convert(varchar(12), Z.DTADDED, 101)) From Per1MasterExportTable Z Where Exported > 0) AND 
-- PAGEDETAILID NOT IN (Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0))
ORDER BY CWM.AdDate, CWM.FlyerID, PDT.PageDetailID

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_PageEvent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_PageEvent]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.PageEvent 
Into Per1MasterExportTable_PageEvent 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'PageEvent'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'PageEvent', 'SQL09..Per1MasterExportTable_PageEvent', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set PageEvent = Temp.PageEvent
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_PageEvent Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set PageEvent = Replace(PageEvent, '"', '''') Where PageEvent Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_PageEvent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_PageEvent]


if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Origin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Origin]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.Origin 
Into Per1MasterExportTable_Origin 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'Origin'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'Origin', 'SQL09..Per1MasterExportTable_Origin', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set Origin = Temp.Origin
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_Origin Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set Origin = Replace(Origin, '"', '''') Where Origin Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Origin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Origin]

---New Fields added

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription1]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription1 
Into Per1MasterExportTable_skuDescription1 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription1'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription1', 'SQL09..Per1MasterExportTable_skuDescription1', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription1 = Temp.skuDescription1
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription1 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription1 = Replace(skuDescription1, '"', '''') Where skuDescription1 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription1]


--
if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription2]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription2 
Into Per1MasterExportTable_skuDescription2 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription2'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription2', 'SQL09..Per1MasterExportTable_skuDescription2', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription2 = Temp.skuDescription2
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription2 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription2 = Replace(skuDescription2, '"', '''') Where skuDescription2 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription2]


--
if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription3]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription3 
Into Per1MasterExportTable_skuDescription3 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription3'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription3', 'SQL09..Per1MasterExportTable_skuDescription3', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription3 = Temp.skuDescription3
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription3 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription3 = Replace(skuDescription3, '"', '''') Where skuDescription3 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription3]


---New Fields added


if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Offer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Offer]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.Offer
Into Per1MasterExportTable_Offer 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'Offer'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'Offer', 'SQL09..Per1MasterExportTable_Offer', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set Offer = Temp.Offer
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_Offer Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set Offer = Replace(Offer, '"', '''') Where Offer Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Offer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Offer]

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_OfferType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_OfferType]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.OfferType 
Into Per1MasterExportTable_OfferType 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'OfferType'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'OfferType', 'SQL09..Per1MasterExportTable_OfferType', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set OfferType = Temp.OfferType
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_OfferType Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set OfferType = Replace(OfferType, '"', '''') Where OfferType Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_OfferType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_OfferType]

-- INSERT INTO Per1MasterExportTable
-- Select Distinct Flyerid, A.PageDetailId, TradeClass, TradeClassID, Advertiser, AdvertiserID, AdDate, WeekOf, Market, MarketID, Media, MediaID, Publication, PublicationID, pages, Event, EventID, Theme, ThemeID, SaleStartDate, SaleEndDate, WeekOfn, WeekOfi, District, DistrictID, Region, RegionID, Size, SizeID, SalesTerritory, SalesTerritoryID, SalesTerritoryGroup, SalesTerritoryGroupID, SalesTerritorySubGroup, SalesTerritorySubGroupID, Coupon, Priority, MerchandiseCategory, MerchandiseCategoryID, MerchandiseSubCat, MerchandiseSubCatID, Category, CategoryID, Manufacturer, ManufacturerID, Brand, BrandID, Features, FeaturesID, Comments1, TaggedCompany, 
-- PageEvent, PageEventID, Origin, OriginID, 
-- Replace(B.FieldValue, '"', '''') As Variety, 
-- VarietyID, MainOffer, MainOfferID, Offer, OfferID, OfferType, OfferTypeID, 
-- OfferDes, OfferDesID, page, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2, NORPrice, RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, CouponValueD2, CouponValueP1, OtherDiscountD1, OtherDiscountD2, RequiredQuantity, MaximumQuantity, NumberPackage, pkgsize, unittype, unittypeID, productterritory, productterritoryID, productterritorysubgroup, productterritorysubgroupID, productterritorygroup, productterritorygroupID, SKUType, SKUTypeID, SKUDescription1, SKUDescription1ID, SKUDescription2, SKUDescription2ID, SKUDescription3, SKUDescription3ID, Exported, DTAdded
-- FROM Per1MasterExportTable A
-- JOIN PER1MultiplePageValues B ON A.PageDetailID = B.PageDetailID And B.FieldName = 'Variety'
-- Where A.Exported = 0

Insert Into Per1MasterTradeClassIDTable (TradeClass) Select Distinct IsNull(TradeClass, '') TradeClass From Per1MasterExportTable Where IsNull(TradeClass, '') Not In (Select IsNull(TradeClass, '') TradeClass From Per1MasterTradeClassIDTable) Order By TradeClass
Insert Into Per1MasterAdvertiserIDTable (Advertiser) Select Distinct IsNull(Advertiser, '') Advertiser From Per1MasterExportTable Where IsNull(Advertiser, '') Not In (Select IsNull(Advertiser, '') Advertiser From Per1MasterAdvertiserIDTable) Order By Advertiser
Insert Into Per1MasterMarketIDTable (Market) Select Distinct IsNull(Market, '') Market From Per1MasterExportTable Where IsNull(Market, '') Not In (Select IsNull(Market, '') Market From Per1MasterMarketIDTable) Order By Market

Insert Into Per1MasterMediaIDTable (Media) Select Distinct IsNull(Media, '') Media From Per1MasterExportTable Where IsNull(Media, '') Not In (Select IsNull(Media, '') Media From Per1MasterMediaIDTable) Order By Media
Insert Into Per1MasterPublicationIDTable (Publication) Select Distinct IsNull(Publication, '') Publication From Per1MasterExportTable Where IsNull(Publication, '') Not In (Select IsNull(Publication, '') Publication From Per1MasterPublicationIDTable) Order By Publication
Insert Into Per1MasterEventIDTable (Event) Select Distinct IsNull(Event, '') Event From Per1MasterExportTable Where IsNull(Event, '') Not In (Select IsNull(Event, '') Event From Per1MasterEventIDTable) Order By Event
Insert Into Per1MasterThemeIDTable (Theme) Select Distinct IsNull(Theme, '') Theme From Per1MasterExportTable Where IsNull(Theme, '') Not In (Select IsNull(Theme, '') Theme From Per1MasterThemeIDTable) Order By Theme
Insert Into Per1MasterDistrictIDTable (District) Select Distinct IsNull(District, '') District From Per1MasterExportTable Where IsNull(District, '') Not In (Select IsNull(District, '') District From Per1MasterDistrictIDTable) Order By District
Insert Into Per1MasterRegionIDTable (Region) Select Distinct IsNull(Region, '') Region From Per1MasterExportTable Where IsNull(Region, '') Not In (Select IsNull(Region, '') Region From Per1MasterRegionIDTable) Order By Region
Insert Into Per1MasterSizeIDTable (Size) Select Distinct IsNull(Size, '') Size From Per1MasterExportTable Where IsNull(Size, '') Not In (Select IsNull(Size, '') Size From Per1MasterSizeIDTable) Order By Size
Insert Into Per1MasterSalesTerritoryIDTable (SalesTerritory) Select Distinct IsNull(SalesTerritory, '') SalesTerritory From Per1MasterExportTable Where IsNull(SalesTerritory, '') Not In (Select IsNull(SalesTerritory, '') SalesTerritory From Per1MasterSalesTerritoryIDTable) Order By SalesTerritory
Insert Into Per1MasterSalesTerritoryGroupIDTable (SalesTerritoryGroup) Select Distinct IsNull(SalesTerritoryGroup, '') SalesTerritoryGroup From Per1MasterExportTable Where IsNull(SalesTerritoryGroup, '') Not In (Select IsNull(SalesTerritoryGroup, '') SalesTerritoryGroup From Per1MasterSalesTerritoryGroupIDTable) Order By SalesTerritoryGroup
Insert Into Per1MasterSalesTerritorySubGroupIDTable (SalesTerritorySubGroup) Select Distinct IsNull(SalesTerritorySubGroup, '') SalesTerritorySubGroup From Per1MasterExportTable Where IsNull(SalesTerritorySubGroup, '') Not In (Select IsNull(SalesTerritorySubGroup, '') SalesTerritorySubGroup From Per1MasterSalesTerritorySubGroupIDTable) Order By SalesTerritorySubGroup
Insert Into Per1MasterMerchandiseCategoryIDTable (MerchandiseCategory) Select Distinct IsNull(MerchandiseCategory, '') MerchandiseCategory From Per1MasterExportTable Where IsNull(MerchandiseCategory, '') Not In (Select IsNull(MerchandiseCategory, '') MerchandiseCategory From Per1MasterMerchandiseCategoryIDTable) Order By MerchandiseCategory
Insert Into Per1MasterMerchandiseSubCatIDTable (MerchandiseSubCat) Select Distinct IsNull(MerchandiseSubCat, '') MerchandiseSubCat From Per1MasterExportTable Where IsNull(MerchandiseSubCat, '') Not In (Select IsNull(MerchandiseSubCat, '') MerchandiseSubCat From Per1MasterMerchandiseSubCatIDTable) Order By MerchandiseSubCat
Insert Into Per1MasterCategoryIDTable (Category) Select Distinct IsNull(Category, '') Category From Per1MasterExportTable Where IsNull(Category, '') Not In (Select IsNull(Category, '') Category From Per1MasterCategoryIDTable) Order By Category
Insert Into Per1MasterManufacturerIDTable (Manufacturer) Select Distinct IsNull(Manufacturer, '') Manufacturer From Per1MasterExportTable Where IsNull(Manufacturer, '') Not In (Select IsNull(Manufacturer, '') Manufacturer From Per1MasterManufacturerIDTable) Order By Manufacturer
Insert Into Per1MasterBrandIDTable (Brand) Select Distinct IsNull(Brand, '') Brand From Per1MasterExportTable Where IsNull(Brand, '') Not In (Select IsNull(Brand, '') Brand From Per1MasterBrandIDTable) Order By Brand
Insert Into Per1MasterFeaturesIDTable (Features) Select Distinct IsNull(Features, '') Features From Per1MasterExportTable Where IsNull(Features, '') Not In (Select IsNull(Features, '') Features From Per1MasterFeaturesIDTable) Order By Features
Insert Into Per1MasterPageEventIDTable (PageEvent) Select Distinct IsNull(PageEvent, '') PageEvent From Per1MasterExportTable Where IsNull(PageEvent, '') Not In (Select IsNull(PageEvent, '') PageEvent From Per1MasterPageEventIDTable) Order By PageEvent
Insert Into Per1MasterOriginIDTable (Origin) Select Distinct IsNull(Origin, '') Origin From Per1MasterExportTable Where IsNull(Origin, '') Not In (Select IsNull(Origin, '') Origin From Per1MasterOriginIDTable) Order By Origin
Insert Into Per1MasterVarietyIDTable (Variety) Select Distinct IsNull(Variety, '') Variety From Per1MasterExportTable Where IsNull(Variety, '') Not In (Select IsNull(Variety, '') Variety From Per1MasterVarietyIDTable) Order By Variety
Insert Into Per1MasterMainOfferIDTable (MainOffer) Select Distinct IsNull(MainOffer, '') MainOffer From Per1MasterExportTable Where IsNull(MainOffer, '') Not In (Select IsNull(MainOffer, '') MainOffer From Per1MasterMainOfferIDTable) Order By MainOffer
Insert Into Per1MasterOfferIDTable (Offer) Select Distinct IsNull(Offer, '') Offer From Per1MasterExportTable Where IsNull(Offer, '') Not In (Select IsNull(Offer, '') Offer From Per1MasterOfferIDTable) Order By Offer
Insert Into Per1MasterOfferTypeIDTable (OfferType) Select Distinct IsNull(OfferType, '') OfferType From Per1MasterExportTable Where IsNull(OfferType, '') Not In (Select IsNull(OfferType, '') OfferType From Per1MasterOfferTypeIDTable) Order By OfferType
Insert Into Per1MasterOfferDesIDTable (OfferDes) Select Distinct IsNull(OfferDes, '') OfferDes From Per1MasterExportTable Where IsNull(OfferDes, '') Not In (Select IsNull(OfferDes, '') OfferDes From Per1MasterOfferDesIDTable) Order By OfferDes
Insert Into Per1MasterunittypeIDTable (unittype) Select Distinct IsNull(unittype, '') unittype From Per1MasterExportTable Where IsNull(unittype, '') Not In (Select IsNull(unittype, '') unittype From Per1MasterunittypeIDTable) Order By unittype
Insert Into Per1MasterproductterritoryIDTable (productterritory) Select Distinct IsNull(productterritory, '') productterritory From Per1MasterExportTable Where IsNull(productterritory, '') Not In (Select IsNull(productterritory, '') productterritory From Per1MasterproductterritoryIDTable) Order By productterritory
Insert Into Per1MasterproductterritorysubgroupIDTable (productterritorysubgroup) Select Distinct IsNull(productterritorysubgroup, '') productterritorysubgroup From Per1MasterExportTable Where IsNull(productterritorysubgroup, '') Not In (Select IsNull(productterritorysubgroup, '') productterritorysubgroup From Per1MasterproductterritorysubgroupIDTable) Order By productterritorysubgroup
Insert Into Per1MasterproductterritorygroupIDTable (productterritorygroup) Select Distinct IsNull(productterritorygroup, '') productterritorygroup From Per1MasterExportTable Where IsNull(productterritorygroup, '') Not In (Select IsNull(productterritorygroup, '') productterritorygroup From Per1MasterproductterritorygroupIDTable) Order By productterritorygroup
Insert Into Per1MasterSKUTypeIDTable (SKUType) Select Distinct IsNull(SKUType, '') SKUType From Per1MasterExportTable Where IsNull(SKUType, '') Not In (Select IsNull(SKUType, '') SKUType From Per1MasterSKUTypeIDTable) Order By SKUType
Insert Into Per1MasterSKUDescription1IDTable (SKUDescription1) Select Distinct IsNull(SKUDescription1, '') SKUDescription1 From Per1MasterExportTable Where IsNull(SKUDescription1, '') Not In (Select IsNull(SKUDescription1, '') SKUDescription1 From Per1MasterSKUDescription1IDTable) Order By SKUDescription1
Insert Into Per1MasterSKUDescription2IDTable (SKUDescription2) Select Distinct IsNull(SKUDescription2, '') SKUDescription2 From Per1MasterExportTable Where IsNull(SKUDescription2, '') Not In (Select IsNull(SKUDescription2, '') SKUDescription2 From Per1MasterSKUDescription2IDTable) Order By SKUDescription2
Insert Into Per1MasterSKUDescription3IDTable (SKUDescription3) Select Distinct IsNull(SKUDescription3, '') SKUDescription3 From Per1MasterExportTable Where IsNull(SKUDescription3, '') Not In (Select IsNull(SKUDescription3, '') SKUDescription3 From Per1MasterSKUDescription3IDTable) Order By SKUDescription3

Update A Set TradeClassID = B.AVTCID From Per1MasterTradeClassIDTable A Join masterclientcoverage..tblAvTradeClass B On A.TradeCLass = B.AVTradeClass WHere A.TradeClassID Is Null
Update A Set AdvertiserID = B.RetID From Per1MasterAdvertiserIDTable A Join masterclientcoverage..retmkt B On A.Advertiser = B.Advertiser Where A.AdvertiserID Is Null
Update A Set MarketID = B.MktID From Per1MasterMarketIDTable A Join masterclientcoverage..retmkt B On A.Market = B.Market Where A.MarketID Is Null

Update A Set TradeClassID = B.TradeClassID From Per1MasterExportTable A Join [Per1MasterTradeClassIDTable] B  On IsNull(A.TradeClass, '') = IsNull(B.TradeClass, '')  Where A.TradeClassID = 0
Update A Set AdvertiserID = B.AdvertiserID From Per1MasterExportTable A Join [Per1MasterAdvertiserIDTable] B  On IsNull(A.Advertiser, '') = IsNull(B.Advertiser, '')  Where A.AdvertiserID = 0
Update A Set MarketID = B.MarketID From Per1MasterExportTable A Join [Per1MasterMarketIDTable] B  On IsNull(A.Market, '') = IsNull(B.Market, '')  Where A.MarketID = 0
Update A Set MediaID = B.MediaID From Per1MasterExportTable A Join [Per1MasterMediaIDTable] B  On IsNull(A.Media, '') = IsNull(B.Media, '')  Where A.MediaID = 0
Update A Set PublicationID = B.PublicationID From Per1MasterExportTable A Join [Per1MasterPublicationIDTable] B  On IsNull(A.Publication, '') = IsNull(B.Publication, '')  Where A.PublicationID = 0
Update A Set EventID = B.EventID From Per1MasterExportTable A Join [Per1MasterEventIDTable] B  On IsNull(A.Event, '') = IsNull(B.Event, '')  Where A.EventID = 0
Update A Set ThemeID = B.ThemeID From Per1MasterExportTable A Join [Per1MasterThemeIDTable] B  On IsNull(A.Theme, '') = IsNull(B.Theme, '')  Where A.ThemeID = 0
Update A Set DistrictID = B.DistrictID From Per1MasterExportTable A Join [Per1MasterDistrictIDTable] B  On IsNull(A.District, '') = IsNull(B.District, '')  Where A.DistrictID = 0
Update A Set RegionID = B.RegionID From Per1MasterExportTable A Join [Per1MasterRegionIDTable] B  On IsNull(A.Region, '') = IsNull(B.Region, '')  Where A.RegionID = 0
Update A Set SizeID = B.SizeID From Per1MasterExportTable A Join [Per1MasterSizeIDTable] B  On IsNull(A.Size, '') = IsNull(B.Size, '')  Where A.SizeID = 0
Update A Set SalesTerritoryID = B.SalesTerritoryID From Per1MasterExportTable A Join [Per1MasterSalesTerritoryIDTable] B  On IsNull(A.SalesTerritory, '') = IsNull(B.SalesTerritory, '')  Where A.SalesTerritoryID = 0
Update A Set SalesTerritoryGroupID = B.SalesTerritoryGroupID From Per1MasterExportTable A Join [Per1MasterSalesTerritoryGroupIDTable] B  On IsNull(A.SalesTerritoryGroup, '') = IsNull(B.SalesTerritoryGroup, '')  Where A.SalesTerritoryGroupID = 0
Update A Set SalesTerritorySubGroupID = B.SalesTerritorySubGroupID From Per1MasterExportTable A Join [Per1MasterSalesTerritorySubGroupIDTable] B  On IsNull(A.SalesTerritorySubGroup, '') = IsNull(B.SalesTerritorySubGroup, '')  Where A.SalesTerritorySubGroupID = 0
Update A Set MerchandiseCategoryID = B.MerchandiseCategoryID From Per1MasterExportTable A Join [Per1MasterMerchandiseCategoryIDTable] B  On IsNull(A.MerchandiseCategory, '') = IsNull(B.MerchandiseCategory, '')  Where A.MerchandiseCategoryID = 0
Update A Set MerchandiseSubCatID = B.MerchandiseSubCatID From Per1MasterExportTable A Join [Per1MasterMerchandiseSubCatIDTable] B  On IsNull(A.MerchandiseSubCat, '') = IsNull(B.MerchandiseSubCat, '')  Where A.MerchandiseSubCatID = 0
Update A Set CategoryID = B.CategoryID From Per1MasterExportTable A Join [Per1MasterCategoryIDTable] B  On IsNull(A.Category, '') = IsNull(B.Category, '')  Where A.CategoryID = 0
Update A Set ManufacturerID = B.ManufacturerID From Per1MasterExportTable A Join [Per1MasterManufacturerIDTable] B  On IsNull(A.Manufacturer, '') = IsNull(B.Manufacturer, '')  Where A.ManufacturerID = 0
Update A Set BrandID = B.BrandID From Per1MasterExportTable A Join [Per1MasterBrandIDTable] B  On IsNull(A.Brand, '') = IsNull(B.Brand, '')  Where A.BrandID = 0
Update A Set FeaturesID = B.FeaturesID From Per1MasterExportTable A Join [Per1MasterFeaturesIDTable] B  On IsNull(A.Features, '') = IsNull(B.Features, '')  Where A.FeaturesID = 0
Update A Set PageEventID = B.PageEventID From Per1MasterExportTable A Join [Per1MasterPageEventIDTable] B  On IsNull(A.PageEvent, '') = IsNull(B.PageEvent, '')  Where A.PageEventID = 0
Update A Set OriginID = B.OriginID From Per1MasterExportTable A Join [Per1MasterOriginIDTable] B  On IsNull(A.Origin, '') = IsNull(B.Origin, '')  Where A.OriginID = 0
Update A Set VarietyID = B.VarietyID From Per1MasterExportTable A Join [Per1MasterVarietyIDTable] B  On IsNull(A.Variety, '') = IsNull(B.Variety, '')  Where A.VarietyID = 0
Update A Set MainOfferID = B.MainOfferID From Per1MasterExportTable A Join [Per1MasterMainOfferIDTable] B  On IsNull(A.MainOffer, '') = IsNull(B.MainOffer, '')  Where A.MainOfferID = 0
Update A Set OfferID = B.OfferID From Per1MasterExportTable A Join [Per1MasterOfferIDTable] B  On IsNull(A.Offer, '') = IsNull(B.Offer, '')  Where A.OfferID = 0
Update A Set OfferTypeID = B.OfferTypeID From Per1MasterExportTable A Join [Per1MasterOfferTypeIDTable] B  On IsNull(A.OfferType, '') = IsNull(B.OfferType, '')  Where A.OfferTypeID = 0
Update A Set OfferDesID = B.OfferDesID From Per1MasterExportTable A Join [Per1MasterOfferDesIDTable] B  On IsNull(A.OfferDes, '') = IsNull(B.OfferDes, '')  Where A.OfferDesID = 0
Update A Set unittypeID = B.unittypeID From Per1MasterExportTable A Join [Per1MasterunittypeIDTable] B  On IsNull(A.unittype, '') = IsNull(B.unittype, '')  Where A.unittypeID = 0
Update A Set productterritoryID = B.productterritoryID From Per1MasterExportTable A Join [Per1MasterproductterritoryIDTable] B  On IsNull(A.productterritory, '') = IsNull(B.productterritory, '')  Where A.productterritoryID = 0
Update A Set productterritorysubgroupID = B.productterritorysubgroupID From Per1MasterExportTable A Join [Per1MasterproductterritorysubgroupIDTable] B  On IsNull(A.productterritorysubgroup, '') = IsNull(B.productterritorysubgroup, '')  Where A.productterritorysubgroupID = 0
Update A Set productterritorygroupID = B.productterritorygroupID From Per1MasterExportTable A Join [Per1MasterproductterritorygroupIDTable] B  On IsNull(A.productterritorygroup, '') = IsNull(B.productterritorygroup, '')  Where A.productterritorygroupID = 0
Update A Set SKUTypeID = B.SKUTypeID From Per1MasterExportTable A Join [Per1MasterSKUTypeIDTable] B  On IsNull(A.SKUType, '') = IsNull(B.SKUType, '')  Where A.SKUTypeID = 0
Update A Set SKUDescription1ID = B.SKUDescription1ID From Per1MasterExportTable A Join [Per1MasterSKUDescription1IDTable] B  On IsNull(A.SKUDescription1, '') = IsNull(B.SKUDescription1, '')  Where A.SKUDescription1ID = 0
Update A Set SKUDescription2ID = B.SKUDescription2ID From Per1MasterExportTable A Join [Per1MasterSKUDescription2IDTable] B  On IsNull(A.SKUDescription2, '') = IsNull(B.SKUDescription2, '')  Where A.SKUDescription2ID = 0
Update A Set SKUDescription3ID = B.SKUDescription3ID From Per1MasterExportTable A Join [Per1MasterSKUDescription3IDTable] B  On IsNull(A.SKUDescription3, '') = IsNull(B.SKUDescription3, '')  Where A.SKUDescription3ID = 0

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Final]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Final]

Select Flyerid As [Unique Ad], Left(PageDetailId, 11) As [Product Detail ID], TradeClassID As [Account Group ID], AdvertiserID As [Account ID], 
AdDate As [Ad Date], WeekOf As [Week Starting], MarketID As [Market ID], MediaID As [Media Type ID], PublicationID As [Specific Media ID], 
pages As [# of Pgs], EventID As [Event ID], ThemeID As [Theme ID], SaleStartDate As [Sale Start Date], SaleEndDate As [Sale End Date], 
WeekOfn As [ACN Week Ending], WeekOfi As [IRI Week Ending], DistrictID As [District ID], 
RegionID As [Region ID], SizeID As [Ad Size ID], SalesTerritoryID As [Sales Territory ID], 
SalesTerritoryGroupID As [Sales Territory Group ID], SalesTerritorySubGroupID As [Sales Territory Subgroup ID], Coupon As [Coupon], 
Priority As [Priority], MerchandiseCategoryID As [Department ID], MerchandiseSubCatID As [Category Group ID], CategoryID As [Category ID], 
ManufacturerID As [Manufacturer ID], BrandID As [Brand ID], FeaturesID As [Page Position ID], Comments1 As [Product Description], 
TaggedCompany As [Ad Type], PageEventID As [Promotions ID], OriginID As [Origin ID], VarietyID As [Variety ID], 
MainOfferID As [Main Offer ID], OfferID As [Offer ID], OfferTypeID As [Offer Type ID], OfferDesID As [Offer Description ID], 
page As [Page # In Ad], SalePrice1 As [Sale Price], SalePrice2 As [High Sale Price], RegularPrice1 As [Reg. Price], 
RegularPrice2 As [Unit Price - Reg.], NORPrice As [NOR Price], RebateAmount As [Low Rebate Amount], 
LowestRebatePrice As [Lowest Rebate Price], LowestDiscountPrice As [Save Up To], UnitPrice As [Unit Price - Sale], 
CouponValueD2 As [$ Off], CouponValueP1 As [% Off], OtherDiscountD1 As [Mfr Cpn $], OtherDiscountD2 As [Rtl Cpn $], 
RequiredQuantity As [Pur Qty], MaximumQuantity As [Maximum Quantity], NumberPackage As [Limit], pkgsize As [Pkg Size], 
unittypeID As [Unit Type ID], productterritoryID As [Product Territory ID], 
productterritorysubgroupID As [Product Territory Subgroup ID], productterritorygroupID As [Product Territory Group ID], 
SKUTypeID As [SKU Type (product type) ID], SKUDescription1ID As [SKU Description 1 (product attribute 1) ID], 
SKUDescription2ID As [SKU Description 1 (product attribute 2) ID], SKUDescription3ID As [SKU Description 1 (product attribute 3) ID]
Into Per1MasterExportTable_Final
From Per1MasterExportTable
Where Exported = 0




