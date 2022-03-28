----------------------------------------------
--Create temp tables on MT4SQL01 for PDT and MPV as below
----------------------------------------------
--drop table tempdb..usacmpagedetailtable
--drop table tempdb..usacmmultiplepagevalues

select * into tempdb..usacmpagedetailtable from mt4sql12.sql12.dbo.usacmpagedetailtable

select * into tempdb..usacmmultiplepagevalues from mt4sql12.sql12.dbo.usacmmultiplepagevalues

----------------------------------------------
--Go To MT2SQL00 - enter records in EntryData database via below query for PDT and MPV
----------------------------------------------
insert into usacmpagedetailtable 
select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes
 from mt4sql01.tempdb.dbo.usacmpagedetailtable

insert into usacmmultiplepagevalues 
select * from mt4sql01.tempdb.dbo.usacmmultiplepagevalues

----------------------------------------------


----------------------------------------------
--On MT2SQL00 - perform below updates for MFR,weight etc updates 
----------------------------------------------

IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE xtype = 'U' AND [name] = 'vwWeightScore')
	DROP TABLE TempDB..vwWeightScore
GO
SELECT * INTO tempdb..vwWeightScore FROM MT2SQL14.SiteControl.DBO.vwWeightScore
GO




--Update MasterACPAgeDetailTable for US Mfr
UPDATE MasterACPAgeDetailTable 
SET Manufacturer = MF.Manufacturer
FROM MasterACPAgeDetailTable pdt join 
	(SELECT Manufacturer, Category, Case when PL=0 then Brand Else PLBrand end Brand 
	from MasterAdViewData.DBO.[TEMPManufacturer]) MF 
on pdt.category = MF.category and pdt.brand = MF.brand 
option(maxdop 1)
GO

UPDATE MasterACPAgeDetailTable SET Manufacturer = 'Other' WHERE Manufacturer is null
GO


-- Update MasterACPAgeDetailTable Weight
update pdt
set pdt.weight = ws.score
from MasterACPAgeDetailTable pdt
join masteradviewdata.dbo.adviewmain cwm with (nolock) on cwm.flyerid = pdt.flyerid
join tempdb.dbo.vwWeightScore ws with (nolock) on cwm.retmktid = ws.retmktid and pdt.features = ws.features and pdt.taggedcompany = ws.taggedcompany
where pdt.weight is null

-- Update MasterACPAgeDetailTable PagePosition
Update P Set Features = FVSystemValue
from MasterACPAgeDetailTable P
inner join masteradviewdata..MCAPVehiclePages M on M.FlyerId = P.FlyerId and M.PageNumber = P.Page
where isnull(ltrim(rtrim(Features)),'')<>FVSystemValue 
Option (Maxdop 1)
----------------------------------------------

----------------------------------------------
--On MT2SQL12 - insert below on Tempdb on MT2SQL12
----------------------------------------------
insert into dbo.MasterACPAgeDetailTable
(FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes)
 select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes
 from mt2sql00.entrydata.dbo.usacmpagedetailtable 

insert into dbo.MasterACMultiplePageValues 
select * from mt2sql00.entrydata.dbo.usacmMultiplePageValues
----------------------------------------------

----------------------------------------------
--On MT2SQL14 - On Off ACFVD code like below
----------------------------------------------
Update MT2SQL14.SiteControl.dbo.CategoryCode set ispdt=0,clientpdt=0,cwmfull=null, IsFull=0  where category in ('ACFVD')
Update MT2SQL14.SiteControl.dbo.CategoryCode set ispdt=1,clientpdt=1,cwmfull=1, IsFull=1  where category in ('ACFVD')
----------------------------------------------






----------------------------------------------
--On MT2SQL00 - for Manual PI Creation - Perform below tasks
----------------------------------------------

Select PageDetailId into tempdb.dbo.tempJAPDTIDs From mt2sql12.tempdb.dbo.MasterACPAgeDetailTable


Insert Into mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable
(FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,pagedetailidint)
select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,ROW_NUMBER() OVER( ORDER BY PageDetailID) 
 From mt2sql12.tempdb.dbo.MasterACPAgeDetailTable


update mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable set prodimagecreated = 0 
where pagedetailid  in (select pagedetailid from tempdb.dbo.tempJAPDTIDs ) 


update  mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable
set normalimagepath='UnSized'
where pagedetailid  in (select pagedetailid from tempdb.dbo.tempJAPDTIDs ) 


Exec mt2sql00.masterclientcoverage.dbo.mtproc_GetPIToProcessRecsMCAP 0, 0, '', '[MT2SQL14]', '', 1

/*
select * from  mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP 
Where pagedetailid  in (select pagedetailid from tempdb.dbo.tempJAPDTIDs) 
*/
Delete from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP 
Where pagedetailid not in (select pagedetailid from tempdb.dbo.tempJAPDTIDs) 

--Create PI from mt2dev1 server from path \\adview\dfsfolders\MTData\VB\Product Images New\

use connection
GO

delete from PDTProcessed where PageDetailID in (select pctemp.PageDetailID from PDTProcessedTEMP pctemp ) option(maxdop 1)
GO

insert into PDTProcessed select * from PDTProcessedTEMP
GO

delete from PDTProcessedTEMP
GO


--Delete
--select *
 from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable --with(nolock) 
where pagedetailid in (select pagedetailid from tempdb.dbo.tempJAPDTIDs)


