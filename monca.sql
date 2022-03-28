select min(addate),max(addate) from EPCANChildWebMain 
select min(addate),max(addate) from EPCANadChildWebMain 

select * from MasterClientCWM where categorycodeid=2417

select * into tempdb..moncacwm from EPCANChildWebMain
where retmktid in (select retmktid from MasterClientCWM where categorycodeid=2417)
and year(addate) in ('2010','2011')

select * into tempdb..moncapdt from masteradviewdata..admasterpagedetailtable where flyerid in 
(select flyerid from tempdb..moncacwm)


select  min(addate),max(addate) from tempdb..moncacwm
select  * from tempdb..moncacwm
select  * from tempdb..moncapdt

select 
Advertiser as [Account],AdDate as [Drop Date],SaleStartDate as [Start Date],SaleEndDate as [End Date],AdSalePeriod as [No. of Days],AdSaleWeek as [Week #],MediaDetail as [Collection Type],Market as [Market],Category as [Category],productterritorygroup as [Mondelez Category],productterritory as [Brand Group],Brand as [Brand],Comments3 as [Size],Comments4 as [Format],Comments1 as [Product Description],RequiredQuantity as [Purchase Quantity],SalePrice1 as [Sale Price],UnitPrice as [Unit Price - Sale],RegularPrice1 as [Reg. Price - Low],NORPrice as [NOR Price],RegularPrice2 as [Reg. Price - High],CouponValueP1 as [Percent Off],CouponValueD2 as [Dollar Off],OtherDiscountD2 as [Retailer Coupon Value],OtherDiscountD1 as [Manufacturer Coupon Value],NumberPackage as [Limit],LowestDiscountPrice as [Save Up To],TaggedCompany as [Ad Type],OfferDes as [Offer Description],Theme as [Theme],PageEvent as [Promotions],Features as [Page Position],Manufacturer as [Manufacturer],Promotions as [Retailer Points],AdSaleMonth as [Week # - Month],AdSaleYear as [Year],SKUDescription1 as [Segment],productterritorysubgroup as [Mondelez Sub Category],region as [Region]
into tempdb..monca
from  tempdb..moncacwm c join  tempdb..moncapdt p on c.flyerid=p.flyerid 


select fieldname,displayname from mt2sql14.sitecontrol.dbo.vw_reportfields where categorycodeid=2417 and ispdttemplate=1 and displayseq is not null order by displayseq



 select * from tempdb..monca
 order by 1


 select distinct brand from sql08..moncadetailreports where brand like 'rit%'
 select distinct brand from sql08..moncadetailreports where brand like 'tris%'
 select distinct brand from sql08..moncadetailreports where brand like 'chips%'
 select distinct brand from sql08..moncadetailreports where brand like 'oreo%'

 select * from sql08..moncadisquerypage 


 select distinct brand  from masteradviewdata..adtrakmasterpagedetailtable where brand like 'rit%'
  select distinct brand from masteradviewdata..admasterpagedetailtable where brand like 'tris%'
 select distinct brand from masteradviewdata..admasterpagedetailtable where brand like 'chips%'
 select distinct brand from masteradviewdata..admasterpagedetailtable where brand like 'oreo%'


 select top 10 * from tempdb..moncacwm c join masteradviewdata..admasterpagedetailtable p on c.flyerid=p.flyerid
 where year(addate) in ('2010','2011')




 select * into tempdb..cwm from (
 select flyerid from adtrakchildwebmain where year(addate) in ('2010','2011')
and retmktid in (select retmktid from masterclientcoverage..MasterClientCWM where categorycodeid=2417)
union
 select flyerid from adviewmain where year(addate) in ('2010','2011')
and retmktid in (select retmktid from masterclientcoverage..MasterClientCWM where categorycodeid=2417) )x 



select * into tempdb..pdt from masteradviewdata..admasterpagedetailtable where flyerid in 
(select flyerid from tempdb..cwm)


select distinct brand  from tempdb..pdt  where brand like 'rit%'
select distinct brand  from tempdb..pdt  where brand like 'tris%'
select distinct brand  from tempdb..pdt  where brand like 'chips%'
select distinct brand  from tempdb..pdt  where brand like 'oreo%'


select count(1) from tempdb..cwm
select count(1) from tempdb..pdt