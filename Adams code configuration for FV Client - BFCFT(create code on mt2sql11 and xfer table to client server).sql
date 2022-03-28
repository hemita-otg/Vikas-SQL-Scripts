--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 1 : insert into holding table-----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * into dbo.BFCFTChildWEbMAin_holding from unlChildWEbMAin_holding where 1=2
select * into dbo.BFCFTMultiplePageValues_holding from unlMultiplePageValues_holding where 1=2
select * into dbo.BFCFTPAgeDetailTable_holding from unlPAgeDetailTable_holding where 1=2



/*
Truncate table bfcftchildwebmain_holding
Truncate table bfcftpagedetailtable_holding
Truncate table bfcftmultiplepagevalues_holding
*/

--Select * from FTCompDataPull
--Select * from FTCompDataPullCategory

--*************** FOR BACARDI(bfcft) Startdate should be 1/1/2006 - For all other codes 1/1/2008************************

--Get Beer/BA records
Insert Into bfcftpagedetailtable_holding
Select DISTINCT PDT.* from FTCompPagedetailtable PDT 
Join FTCompChildWebmain CWM on CWM.Flyerid=PDT.FlyerID and CWM.Addate between '1/1/2008' and  '2/28/2010'
Join FTCompDataPull CRM on CRM.FTAdvertiser=CWM.Advertiser and right(crm.Market, 2) + ', ' + left(crm.Market, len(crm.Market)-4)=CWM.Market and CRM.bfcft=1 and FTBeer = 'x'
Join FTCompDataPullCategory CC on CC.Category=PDT.Category and CC.bfcft=1 and CategoryGroup='Beer'
Option (maxdop 1)

--Get Wine Records
Insert Into bfcftpagedetailtable_holding
Select DISTINCT PDT.* from FTCompPagedetailtable PDT 
Join FTCompChildWebmain CWM on CWM.Flyerid=PDT.FlyerID and CWM.Addate between '1/1/2008' and  '2/28/2010'
Join FTCompDataPull CRM on CRM.FTAdvertiser=CWM.Advertiser and right(crm.Market, 2) + ', ' + left(crm.Market, len(crm.Market)-4)=CWM.Market and CRM.bfcft=1 and FTWine = 'x'
Join FTCompDataPullCategory CC on CC.Category=PDT.Category and CC.bfcft=1 and CategoryGroup='Wine'
Option (maxdop 1)

--Get Spirits Records
Insert Into bfcftpagedetailtable_holding
Select DISTINCT PDT.* from FTCompPagedetailtable PDT 
Join FTCompChildWebmain CWM on CWM.Flyerid=PDT.FlyerID and CWM.Addate between '1/1/2008' and  '2/28/2010'
Join FTCompDataPull CRM on CRM.FTAdvertiser=CWM.Advertiser and right(crm.Market, 2) + ', ' + left(crm.Market, len(crm.Market)-4)=CWM.Market and CRM.bfcft=1 and FTSpirits = 'x'
Join FTCompDataPullCategory CC on CC.Category=PDT.Category and CC.bfcft=1 and CategoryGroup='Spirits'
Option (maxdop 1)

GO

--Select pagedetailid, count(*) from bfcftpagedetailtable_holding group by pagedetailid having count(*)>1 
--select * from bfcftpagedetailtable_holding where pagedetailid = 'FTPD7203963'

--Create CWM based on PDT
Insert Into bfcftchildwebmain_holding
Select Distinct CWM.* from FTCompChildwebmain CWM
Join bfcftpagedetailtable_holding PDT on CWM.FlyeriD=PDT.Flyerid

Go

--Create MPV based on PDT
Insert Into bfcftmultiplepagevalues_holding
Select MPV.* from FTCompMultiplePageValues MPV
Join bfcftpagedetailtable_holding PDT on MPV.PagedetailID=PDT.Pagedetailid


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 1 : insert into holding table-----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 2 : insert into CWM,PDT,MPV tables from ------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select * into dbo.BFCFTChildWEbMAin from BFCFTChildWEbMAin_holding where 1=2
select * into dbo.BFCFTMultiplePageValues from BFCFTMultiplePageValues_holding where 1=2
select * into dbo.BFCFTPAgeDetailTable from BFCFTPAgeDetailTable_holding where 1=2





--Expand Image column
Alter table bfcftChildwebmain Alter Column img varchar(50)
--Alter table bfcftChildwebmain Alter Column Flyerid varchar(15)
--Alter table bfcftPageDetailTAble Alter Column Flyerid varchar(15)
--Alter table bfcftPageDetailTAble Alter Column Pagedetailid varchar(15)
--Alter table bfcftMultiplePageValues Alter Column Pagedetailid varchar(15)
GO

delete from bfcftchildwebmain where flyerid like 'FTAD%'
delete from bfcftPageDetailTAble where pagedetailid like 'FTPD%'
delete from bfcftMultiplePageValues where pagedetailid like 'FTPD%'
GO

-- Insert Holding records into Live Tables.


update HT set manufacturer =H.manufacturer 
from bfcftPageDetailTAble_holding HT join holdingMfrUpdate H on Ht.pagedetailid=h.pagedetailid
GO



insert into bfcftCHildWEbMAin
select * from bfcftCHildWEbMAin_holding where FlyerId not in (select FLyerId from bfcftCHildWEbMAin)

insert into bfcftPageDetailTAble
select * from bfcftPageDetailTAble_holding where FlyerId not in (select FLyerId from bfcftPageDetailTAble)

insert into bfcftMultiplePageValues
select * from bfcftMultiplePageValues_holding where PAgeDetailId not in (select PAgeDetailId from bfcftMultiplePageValues)

GO

-- CREATE CWM DEPENDENT TABLES 

if exists (select * from dbo.sysobjects where id = object_id(N'[bfcftDisDateRanges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bfcftDisDateRanges]
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn
Into bfcftDisDateRanges
From bfcftChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bfcftDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bfcftDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into bfcftDisAdvertiserMarket
From bfcftChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bfcftPublication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bfcftPublication]
GO

SELECT DISTINCT Publication
Into bfcftPublication
From bfcftChildWebMain
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[bfcftMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bfcftMedia]
GO

SELECT DISTINCT Media
Into bfcftMedia
From bfcftChildWebMain
GO

-- CREATE PDT DEPENDENT TABLES

EXECUTE procGenerateDisQueryPage 'bfcft', 0


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 2 : insert into CWM,PDT,MPV tables from ------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 2 : Create Indexed on CWM,PDT,MPV tables -----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------


if exists (select * from dbo.sysindexes where name = N'bfcftCWMRetMkt' and id = object_id(N'[dbo].[bfcftChildWebMain]'))
drop index [dbo].[bfcftChildWebMain].[bfcftCWMRetMkt]
GO

 CREATE  INDEX [bfcftCWMRetMkt] ON [dbo].[bfcftChildWebMain]([Advertiser], [market], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'bfcftCWMConsolidated' and id = object_id(N'[dbo].[bfcftChildWebMain]'))
drop index [dbo].[bfcftChildWebMain].[bfcftCWMConsolidated]
GO

 CREATE  INDEX [bfcftCWMConsolidated] ON [dbo].[bfcftChildWebMain]([Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'bfcftCWMLarge' and id = object_id(N'[dbo].[bfcftChildWebMain]'))
drop index [dbo].[bfcftChildWebMain].[bfcftCWMLarge]
GO

 CREATE  INDEX [bfcftCWMLarge] ON [dbo].[bfcftChildWebMain]([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'bfcftCWMINDEX1' and id = object_id(N'[dbo].[bfcftChildWebMain]'))
drop index [dbo].[bfcftChildWebMain].[bfcftCWMINDEX1]
GO

 CREATE  INDEX [bfcftCWMINDEX1] ON [dbo].[bfcftChildWebMain]([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO



if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdBrandCategoryMerchandiseSubCatMerchandiseCategoryManufactureEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [Brand], [Category], [MerchandiseSubCat], [MerchandiseCategory], [Manufacturer], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdManufacturerMerchandiseCategoryCategoryMerchandiseSubCatBrandEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [Manufacturer], [MerchandiseCategory], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdMerchandiseCategoryManufacturerCategoryMerchandiseSubCatBrandEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [MerchandiseCategory], [Manufacturer], [Category], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdCategoryMerchandiseCategoryManufacturerMerchandiseSubCatBrandEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [Category], [MerchandiseCategory], [Manufacturer], [MerchandiseSubCat], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdMerchandiseSubCatCategoryMerchandiseCategoryManufacturerBrandEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [MerchandiseSubCat], [Category], [MerchandiseCategory], [Manufacturer], [Brand], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc]
GO

 CREATE  INDEX [idxbfcftPDTPageEventRequiredQuantitySalePrice1Featurescomments1RegularPrice1FlyEtc] ON [dbo].[bfcftPageDetailTable]([PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [NorPrice], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc]
GO

 CREATE  INDEX [idxbfcftPDTFlyerIdPagePageDetailIDBrandManufacturerCategoryMerchandiseCategoryMEtc] ON [dbo].[bfcftPageDetailTable]([FlyerId], [Page], [PageDetailID], [Brand], [Manufacturer], [Category], [MerchandiseCategory], [MerchandiseSubCat], [NorPrice]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc]
GO

 CREATE  INDEX [idxbfcftPDTManufacturerMerchandiseCategoryCategoryBrandMerchandiseSubCatPageEveEtc] ON [dbo].[bfcftPageDetailTable]([Manufacturer], [MerchandiseCategory], [Category], [Brand], [MerchandiseSubCat], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc]
GO

 CREATE  INDEX [idxbfcftPDTMerchandiseSubCatManufacturerCategoryBrandMerchandiseCategoryPageEveEtc] ON [dbo].[bfcftPageDetailTable]([MerchandiseSubCat], [Manufacturer], [Category], [Brand], [MerchandiseCategory], [PageEvent], [RequiredQuantity], [SalePrice1], [Features], [Comments1], [RegularPrice1], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTMerchandiseCategoryFlyerIDPageDetailIDPage' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTMerchandiseCategoryFlyerIDPageDetailIDPage]
GO

 CREATE  INDEX [idxbfcftPDTMerchandiseCategoryFlyerIDPageDetailIDPage] ON [dbo].[bfcftPageDetailTable]([MerchandiseCategory], [FlyerId], [PageDetailID], [Page]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

if exists (select * from dbo.sysindexes where name = N'idxbfcftPDTPageEvent' and id = object_id(N'[dbo].[bfcftPageDetailTable]'))
drop index [dbo].[bfcftPageDetailTable].[idxbfcftPDTPageEvent]
GO

 CREATE  INDEX [idxbfcftPDTPageEvent] ON [dbo].[bfcftPageDetailTable]([PageEvent], [PageDetailID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


if exists (select * from dbo.sysindexes where name = N'bfcftINDEXMPV2' and id = object_id(N'[dbo].[bfcftMultiplePageValues]'))
drop index [dbo].[bfcftMultiplePageValues].[bfcftINDEXMPV2]
GO

 CREATE  INDEX [bfcftINDEXMPV2] ON [dbo].[bfcftMultiplePageValues]([FieldName]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Step 2 : Create Indexed on CWM,PDT,MPV tables -----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
