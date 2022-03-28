IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = 'tempdata' AND xtype = 'u')
	drop table tempdb..tempdata

select Distinct x.*, Cast(0 As Int) ID_Num
Into tempdb..tempdata
from uniodpagedetailtable x, (
select flyerID, ProductTerritory, unitprice, topleftx, toplefty, bottomrightx, bottomrighty
from uniodpagedetailtable where category in ('Deodorants')
group by flyerID, ProductTerritory, unitprice, topleftx, toplefty, bottomrightx, bottomrighty
having count(pagedetailid) > 1
) y
where x.category in ('Deodorants') and x.flyerid=y.flyerid and 
isnull(x.ProductTerritory,'')=isnull(y.ProductTerritory,'') and 
isnull(x.unitprice,0)=isnull(y.unitprice,0) and 
isnull(x.topleftx,0)=isnull(y.topleftx,0) and 
isnull(x.toplefty,0)=isnull(y.toplefty,0) and 
isnull(x.bottomrightx,0)=isnull(y.bottomrightx,0) and 
isnull(x.bottomrighty,0)=isnull(y.bottomrighty,0)


Delete from tempdb..tempdata where pagedetailid not in (
select min(pagedetailid)
 from tempdb..tempdata 
group by flyerid,ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, brand)


Update X Set 
ID_NUM = (
Select Count(*) From tempdb..tempdata y 
Where x.flyerid=y.flyerid and 
isnull(x.ProductTerritory,'')=isnull(y.ProductTerritory,'') and 
isnull(x.unitprice,0)=isnull(y.unitprice,0) and 
isnull(x.topleftx,0)=isnull(y.topleftx,0) and 
isnull(x.toplefty,0)=isnull(y.toplefty,0) and 
isnull(x.bottomrightx,0)=isnull(y.bottomrightx,0) and 
isnull(x.bottomrighty,0)=isnull(y.bottomrighty,0)
And PageDetailID <= X.PageDetailID
)
from tempdb..tempdata X

/*
select id_num,flyerid, ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, pagedetailid,brand, variety 
from tempdb..tempdata 
order by 2,3,4,5,6,7
where flyerid = '2307202'
*/
IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = 'pdtid_brand' AND xtype = 'u')
	drop table tempdb..pdtid_brand

select distinct id_num, flyerid,pagedetailid,brand into tempdb..pdtid_brand from tempdb..tempdata
/*
select * from tempdb..pdtid_brand where id_num=2 order by 2,3

select flyerid, ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, pagedetailid,brand, variety 
 from tempdb..tempdata where flyerid='0149296M500'
*/
IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = 'MPV_Records' AND xtype = 'u')
	drop table tempdb..MPV_Records

select distinct pagedetailid,'variety' as fieldname ,brand as fieldvalue into tempdb..MPV_Records
from tempdb..pdtid_brand where id_num > 2

delete from tempdb..pdtid_brand where id_num > 2

IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = 'PDT_Records' AND xtype = 'u')
	drop table tempdb..PDT_Records

select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,
TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,
SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,
Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,
OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,
CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,
Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,
CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,comments2,comments3,comments4,topleftx,toplefty,
bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,
Origin,Variety,UnitType,PkgSize,OfferId,Offer,OfferType,MainOffer
into tempdb..PDT_Records
 from tempdb..tempdata where id_num=1



update X
 set variety=y.brand
from tempdb..PDT_Records X join 
(
select flyerid, ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, pagedetailid,brand, variety 
 from tempdb..tempdata where id_num=2
) y on x.flyerid=y.flyerid and 
isnull(x.ProductTerritory,'')=isnull(y.ProductTerritory,'') and 
isnull(x.unitprice,0)=isnull(y.unitprice,0) and 
isnull(x.topleftx,0)=isnull(y.topleftx,0) and 
isnull(x.toplefty,0)=isnull(y.toplefty,0) and 
isnull(x.bottomrightx,0)=isnull(y.bottomrightx,0) and 
isnull(x.bottomrighty,0)=isnull(y.bottomrighty,0)


/*
select distinct  brand from tempdb..tempdata where id_num=2 and  flyerid='2139739'


select id_num,flyerid, ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, pagedetailid,brand, variety 
 from tempdb..tempdata where flyerid='0149296M500'

select flyerid, ProductTerritory,  unitprice , topleftx, toplefty, bottomrightx, bottomrighty, pagedetailid,brand, variety 
 from tempdb..pdt_records where flyerid='0149296M500'

select * from tempdb..MPV_records where pagedetailid='2313552I141'
select * from tempdb..tempdata order by flyerid,id_num
*/

select * into dbo.uniodpagedetailtable083109 from uniodpagedetailtable
select * into dbo.uniodmultiplepagevalues083109 from uniodmultiplepagevalues

insert into uniodpagedetailtable
select * from tempdb..PDT_records
where pagedetailid not in 
(select pagedetailid from uniodpagedetailtable)

insert into uniodmultiplepagevalues
select * from tempdb..MPV_records
where fieldname='variety' and pagedetailid not in 
(select pagedetailid from uniodmultiplepagevalues)

update uniodpagedetailtable set variety=brand 
where category='Deodorants' 

Execute procGenerateDisQueryPage 'uniod', 0