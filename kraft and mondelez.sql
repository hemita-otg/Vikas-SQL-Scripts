select * into tempdb..cwmfields from
(
select flyerid,Advertiser,AdDate,SaleStartDate,SaleEndDate,AdSalePeriod,AdSaleWeek,Market,Theme,AdSaleMonth,AdSaleYear,region
 from adtrakchildwebmain where year(addate) in ('2010','2011')
and retmktid in (select retmktid from masterclientcoverage..MasterClientCWM where categorycodeid=2417)
union
select flyerid,Advertiser,AdDate,SaleStartDate,SaleEndDate,AdSalePeriod,AdSaleWeek,Market,Theme,AdSaleMonth,AdSaleYear,region from adviewmain where year(addate) in ('2010','2011')
and retmktid in (select retmktid from masterclientcoverage..MasterClientCWM where categorycodeid=2417) 
) x 



select * into tempdb..pdt1 from masteradviewdata..admasterpagedetailtable where flyerid in 
(select flyerid from tempdb..cwm1)

select * from tempdb..pdt1 where manufacturer like 'kraft%'
select distinct manufacturer from tempdb..pdt1 where manufacturer like '%monde%'

select count(1) from tempdb..pdt1 where manufacturer='kraft'
select count(1) from tempdb..pdt1 where manufacturer='Mondelez'
select count(1) from tempdb..pdt1 where manufacturer='Mondelez International'


 select *  from tempdb..pdt1 where manufacturer='kraft'
select *  into tempdb..data2 from tempdb..pdt1 where manufacturer='Mondelez'


select Advertiser as [Account],AdDate as [Drop Date],SaleStartDate as [Start Date],SaleEndDate as [End Date],AdSalePeriod as [No. of Days],AdSaleWeek as [Week #],MediaDetail as [Collection Type],Market as [Market],Category as [Category],productterritorygroup as [Mondelez Category],productterritory as [Brand Group],Brand as [Brand],Comments3 as [Size],Comments4 as [Format],Comments1 as [Product Description],RequiredQuantity as [Purchase Quantity],SalePrice1 as [Sale Price],UnitPrice as [Unit Price - Sale],RegularPrice1 as [Reg. Price - Low],NORPrice as [NOR Price],RegularPrice2 as [Reg. Price - High],CouponValueP1 as [Percent Off],CouponValueD2 as [Dollar Off],OtherDiscountD2 as [Retailer Coupon Value],OtherDiscountD1 as [Manufacturer Coupon Value],NumberPackage as [Limit],LowestDiscountPrice as [Save Up To],TaggedCompany as [Ad Type],OfferDes as [Offer Description],Theme as [Theme],PageEvent as [Promotions],Features as [Page Position],Manufacturer as [Manufacturer],Promotions as [Retailer Points],AdSaleMonth as [Week # - Month],AdSaleYear as [Year],SKUDescription1 as [Segment],productterritorysubgroup as [Mondelez Sub Category],region as [Region]
 select Advertiser as [Account],AdDate as [Drop Date],SaleStartDate as [Start Date],SaleEndDate as [End Date],AdSalePeriod as [No. of Days],AdSaleWeek as [Week #],MediaDetail as [Collection Type],Market as [Market],Category as [Category],productterritorygroup as [Mondelez Category],productterritory as [Brand Group],Brand as [Brand],Comments3 as [Size],Comments4 as [Format],Comments1 as [Product Description],RequiredQuantity as [Purchase Quantity],SalePrice1 as [Sale Price],UnitPrice as [Unit Price - Sale],RegularPrice1 as [Reg. Price - Low],NORPrice as [NOR Price],RegularPrice2 as [Reg. Price - High],CouponValueP1 as [Percent Off],CouponValueD2 as [Dollar Off],OtherDiscountD2 as [Retailer Coupon Value],OtherDiscountD1 as [Manufacturer Coupon Value],NumberPackage as [Limit],LowestDiscountPrice as [Save Up To],TaggedCompany as [Ad Type],OfferDes as [Offer Description],Theme as [Theme],PageEvent as [Promotions],Features as [Page Position],Manufacturer as [Manufacturer],Promotions as [Retailer Points],AdSaleMonth as [Week # - Month],AdSaleYear as [Year],SKUDescription1 as [Segment],productterritorysubgroup as [Mondelez Sub Category],region as [Region]
 into tempdb..kraft
  from  tempdb..pdt1 p join  tempdb..cwmfields c 
   on c.flyerid=p.flyerid where manufacturer='kraft'


   select Advertiser as [Account],AdDate as [Drop Date],SaleStartDate as [Start Date],SaleEndDate as [End Date],AdSalePeriod as [No. of Days],AdSaleWeek as [Week #],MediaDetail as [Collection Type],Market as [Market],Category as [Category],productterritorygroup as [Mondelez Category],productterritory as [Brand Group],Brand as [Brand],Comments3 as [Size],Comments4 as [Format],Comments1 as [Product Description],RequiredQuantity as [Purchase Quantity],SalePrice1 as [Sale Price],UnitPrice as [Unit Price - Sale],RegularPrice1 as [Reg. Price - Low],NORPrice as [NOR Price],RegularPrice2 as [Reg. Price - High],CouponValueP1 as [Percent Off],CouponValueD2 as [Dollar Off],OtherDiscountD2 as [Retailer Coupon Value],OtherDiscountD1 as [Manufacturer Coupon Value],NumberPackage as [Limit],LowestDiscountPrice as [Save Up To],TaggedCompany as [Ad Type],OfferDes as [Offer Description],Theme as [Theme],PageEvent as [Promotions],Features as [Page Position],Manufacturer as [Manufacturer],Promotions as [Retailer Points],AdSaleMonth as [Week # - Month],AdSaleYear as [Year],SKUDescription1 as [Segment],productterritorysubgroup as [Mondelez Sub Category],region as [Region]
 into tempdb..Mondelez
  from  tempdb..pdt1 p join  tempdb..cwmfields c 
   on c.flyerid=p.flyerid where manufacturer='Mondelez'

select fieldname ,  displayname,displayseq from mt2sql14.sitecontrol.dbo.vw_reportfields where categorycodeid=2417 and ispdttemplate=1 and displayseq is not null and fieldtype=2 order by displayseq