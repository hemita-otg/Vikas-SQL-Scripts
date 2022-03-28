---
if object_id('tempdb.dbo.Mil_Core') is not null
	drop table tempdb.dbo.Mil_Core
--Create Cross table for Retailer/Market WeekOfN
select distinct Advertiser, Market, RetMktId, Weeks.WeekOfN
into tempdb.dbo.Mil_Core
from sql08.dbo.Mil50FlyerReports
Cross Join (Select distinct weekOfN from sql08.dbo.Mil50FlyerReports where WeekOfN >='1/1/2016') Weeks

--select * from tempdb.dbo.Mil_Core order by 1,2,4

if object_id('tempdb.dbo.Mil_Crop') is not null
	drop table tempdb.dbo.Mil_Crop
	
select distinct FlyerId, Page, topleftx, toplefty, bottomrightx, bottomrighty,IDENTITY( int ) CropId
into tempdb.dbo.Mil_Crop
 from Mil50detailReports

 select * from tempdb.dbo.Mil_Crop order by 7

if object_id('tempdb.dbo.Mil_PreSum') is not null
	drop table tempdb.dbo.Mil_PreSum

select distinct
C.Advertiser, C.Market,C.RetMktId, C.WeekOfN, CropId,
case when flyer.FlyerId is not null then 1 else 0 end SalesStrategy1,
Max(case when Category = 'Beer' then CropId else null end) SalesStrategy2,
Max(case when [manufacturer] ='MillerCoors' then CropId else null end) SalesStrategy3, 
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 >='15'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Budweiser ( Bud )')) then CropId else null end) SalesStrategy4_part1,
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 >='15'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Coors')) then CropId else null end) SalesStrategy4_part2,
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 >='15'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Miller')) then CropId else null end) SalesStrategy4_part3,
	cast(null as int) SalesStrategy4,
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 <='12'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Budweiser ( Bud )')) then CropId else null end) SalesStrategy5_part1,
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 <='12'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Coors')) then CropId else null end) SalesStrategy5_part2,
Max(case	when isnumeric(SKUDescription1)=1 and SKUDescription1 <='12'
	and
	(([ProductTerritoryGroup] = 'Premium' and [Brand] = 'Miller')) then CropId else null end) SalesStrategy5_part3,
	cast(null as int) SalesStrategy5,
	--SalesStrategy6 ( How many ad blocks did the retailer advertise that had any Premium Light in it?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Premium Light’ or ‘Premium Regular’ 
Max(case when [ProductTerritorySubGroup] in ('Premium Light', 'Premium Regular') then CropId else null end) SalesStrategy6, 
--SalesStrategy7 (Did the retailer advertise Blue Moon on Leinenkugels?) – Unique Count of the number of ad blocks that has either [Brand] = “Blue Moon” or [Brand] = “Leinenkugels”
Max(case when [Brand] in ('Blue Moon', 'Leinenkugels') then CropId else null end) SalesStrategy7, 
--SalesStrategy8 (How many ad blocks did they advertise that had any Craft product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘Craft/Micro’
Max(case when [ProductTerritorySubGroup] in ('Craft/Micro') then CropId else null end) SalesStrategy8, 
--SalesStrategy9 (Did the retailer advertise Henrys or Redds?) – Unique Count of the number of ad blocks that has either [Brand] = “Redds” or [Brand] = “Henrys Hard Soda”
Max(case when [Brand] in ('Redds', 'Henrys Hard Soda') then CropId else null end) SalesStrategy9, 
--SalesStrategy10 (How many ad blocks did they advertise that had any FMB product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘FMB’
Max(case when [ProductTerritorySubGroup]in ('FMB') then CropId else null end) SalesStrategy10, 
--SalesStretegy11 (Did the retailer advertise Miller High Life, Keystone, or Milwaukee’s Best?) – Unique Count of the number of ad blocks that has any one of the following three conditions:
Max(case when ([Brand] = 'Miller' AND [ProductTerritorySubGroup] = 'Near Premium'or [Brand] in ('Keystone', 'Milwaukees Best') )
	then CropId else null end) SalesStrategy11, 
--SalesStrategy12 (How many ad blocks did the retailer advertise that had any Economy product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Budget’ or ‘Near Premium’
Max(case when [ProductTerritorySubGroup] in ('Budget','Near Premium') then CropId else null end) SalesStrategy12, 
cast(null as int) as SalesStrategy13,
cast(null as int) as SalesStrategy14,
cast(null as int) as SalesStrategy15,
cast(null as int) as SalesStrategy16,
cast(null as int) as SalesStrategy17,
cast(null as int) as SalesStrategy18,
cast(null as int) as SalesStrategy19,
cast(null as int) as SalesStrategy20,
case when flyer.[Tradeclass] in ( 'Food - Ttl. Kroger', 'Food - Ttl. Roundys') then 'Total Kroger'
when flyer.[Tradeclass] in ('Food - Ttl. HEB') or flyer.Advertiser like 'HEB%' then 'HEB'
when flyer.[Tradeclass] in ('Food - Ttl. Publix') then 'Publix'
when flyer.[Tradeclass] in ('Food - Ttl. Meijer') then 'Meijer'
when flyer.[Tradeclass] in ('Food - Ttl. Delhaize', 'Food – Ttl. Ahold') then 'Ahold Delhaize'
when flyer.Advertiser in ('CVS') then 'CVS'
when flyer.Advertiser in ('Rite-Aid') then 'Rite-Aid'
when flyer.Advertiser in ('Walgreens') then 'Walgreens'
when flyer.[Tradeclass] in ('Food - Ttl. Albertsons') then 'Albertsons/Safeway'
else '' end SalesStrategy21

into tempdb.dbo.Mil_PreSum
from tempdb.dbo.Mil_Core c with(nolock)
left outer join sql08.dbo.Mil50FlyerReports flyer with(nolock) on c.RetMktId = flyer.RetmktId and c.WeekOfN = flyer.WeekofN
left outer join sql08.dbo.Mil50detailReports detail with(nolock) on detail.FlyerId = Flyer.FlyerId
left outer join tempdb.dbo.Mil_Crop crop with(nolock) on crop.FlyerId  = detail.flyerId
	and crop.Page = detail.Page
	and crop.topleftx = detail.topleftx
	and crop.toplefty = detail.toplefty
	and crop.bottomrightx = detail.bottomrightx
	and crop.bottomrighty = detail.bottomrighty
	group by Flyer.FlyerId, C.Advertiser, C.Market,C.RetMktId, C.WeekOfN, CropId,
case when flyer.[Tradeclass] in ( 'Food - Ttl. Kroger', 'Food - Ttl. Roundys') then 'Total Kroger'
when flyer.[Tradeclass] in ('Food - Ttl. HEB') or flyer.Advertiser like 'HEB%' then 'HEB'
when flyer.[Tradeclass] in ('Food - Ttl. Publix') then 'Publix'
when flyer.[Tradeclass] in ('Food - Ttl. Meijer') then 'Meijer'
when flyer.[Tradeclass] in ('Food - Ttl. Delhaize', 'Food – Ttl. Ahold') then 'Ahold Delhaize'
when flyer.Advertiser in ('CVS') then 'CVS'
when flyer.Advertiser in ('Rite-Aid') then 'Rite-Aid'
when flyer.Advertiser in ('Walgreens') then 'Walgreens'
when flyer.[Tradeclass] in ('Food - Ttl. Albertsons') then 'Albertsons/Safeway'
else '' end 
order by C.RetMktId, C.WeekOfN

select * from tempdb.dbo.Mil_PreSum where salesstrategy1 <> 1  order by 1,2,4


Update tempdb.dbo.Mil_PreSum set SalesStrategy4=1 where SalesStrategy4_part1 = SalesStrategy4_part2
	and SalesStrategy4_part2 = SalesStrategy4_part3
	and SalesStrategy4_part1 is not null

	
Update tempdb.dbo.Mil_PreSum set SalesStrategy5=1 where SalesStrategy5_part1 = SalesStrategy5_part2
	and SalesStrategy5_part2 = SalesStrategy5_part3
	and SalesStrategy5_part1 is not null

	 --drop table sql08.dbo.mil50_SummaryForMTA

select Advertiser, market, WeekofN, 
SalesStrategy1, 
count(distinct SalesStrategy2) SalesStrategy2, 
count(distinct SalesStrategy3) SalesStrategy3, 
Max(Isnull(SalesStrategy4, 0)) SalesStrategy4, 
Max(Isnull(SalesStrategy5, 0)) SalesStrategy5,
count(distinct SalesStrategy6) SalesStrategy6, 
count(distinct SalesStrategy7) SalesStrategy7, 
count(distinct SalesStrategy8) SalesStrategy8, 
count(distinct SalesStrategy9) SalesStrategy9, 
count(distinct SalesStrategy10) SalesStrategy10, 
count(distinct SalesStrategy11) SalesStrategy11, 
count(distinct SalesStrategy12) SalesStrategy12, 
count(distinct SalesStrategy13) SalesStrategy13, 
count(distinct SalesStrategy14) SalesStrategy14, 
count(distinct SalesStrategy15) SalesStrategy15, 
count(distinct SalesStrategy16) SalesStrategy16, 
count(distinct SalesStrategy17) SalesStrategy17, 
count(distinct SalesStrategy18) SalesStrategy18, 
count(distinct SalesStrategy19) SalesStrategy19,
count(distinct SalesStrategy20) SalesStrategy20, 
SalesStrategy21
into sql08.dbo.mil50_SummaryForMTA
 from tempdb.dbo.Mil_PreSum
 group by Advertiser, market, WeekofN, SalesStrategy1, SalesStrategy21
 
 
 select * from sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3

GRANT SELECT ON object :: sql08.dbo.mil50_SummaryForMTA TO sffvdatauser

/*

Columns are defined as follows:
•	SalesStrategy1 (How many retailer/markets advertised in the selected weeks?) – Did they have any flyerID for that WeekOfN?
•	SalesStrategy2 (How many ad blocks of Beer did they advertise?) – Unique Count of the number of ad blocks
•	SalesStrategy3 (How many ad blocks of Beer had a MillerCoors product?) - Unique Count of the number of ad blocks that had a [manufacturer] value of MillerCoors for any product record within it
•	SalesStrategy4 (Did the retailer advertise a Large Pack Premium Light Tri-Brew?) – all three of the following PLUS [SKUDescription1] on all the records for these brands = 15 or higher
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Budweiser ( Bud )”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Coors”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Miller”
o	Note: it’s ok if there are additional products beyond these three in the block; but it MUST contain all three brands
•	SalesStrategy5 (Did the retailer advertise a Small Pack Premium Light Tri-Brew?) – all three of the following PLUS [SKUDescription1] on all the records for these brands = 12 or less.
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Budweiser ( Bud )”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Coors”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Miller” 
o	Note: it’s ok if there are additional products beyond these three in the block; but it MUST contain all three brands
•	SalesStrategy6 (*NEW* How many ad blocks did the retailer advertise that had any Premium Light in it?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Premium Light’ or ‘Premium Regular’ 
•	SalesStrategy7 (Did the retailer advertise Blue Moon on Leinenkugels?) – Unique Count of the number of ad blocks that has either [Brand] = “Blue Moon” or [Brand] = “Leinenkugels”
•	SalesStrategy8 (How many ad blocks did they advertise that had any Craft product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘Craft/Micro’
•	SalesStrategy9 (Did the retailer advertise Henrys or Redds?) – Unique Count of the number of ad blocks that has either [Brand] = “Redds” or [Brand] = “Henrys Hard Soda”
•	SalesStrategy10 (How many ad blocks did they advertise that had any FMB product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘FMB’
•	SalesStretegy11 (Did the retailer advertise Miller High Life, Keystone, or Milwaukee’s Best?) – Unique Count of the number of ad blocks that has any one of the following three conditions:
o	[Brand] = Miller AND [ProductTerritorySubGroup] = Near Premium
o	[Brand] = Keystone
o	[Brand] = Milwaukees Best
•	SalesStrategy12 (How many ad blocks did the retailer advertise that had any Economy product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Budget’ or ‘Near Premium’
•	SalesStrategy13 through SalesStrategy20 – leave these blank, I’d say leave them in as placeholders if we expand the concept to other clients
•	SalesStrategy21 (indTop10Accounts) – Populate this with text values as:
o	When [Tradeclass] = “Food – Ttl. Kroger” then “Total Kroger”
	When [Tradeclass] = “Food – Ttl. Roundys” then “Total Kroger”
o	When [tradeclass] = “Food – Ttl. HEB” then “HEB”
	When [Account] starts with “HEB (“ then “HEB”
o	When [tradeclass] = “Food – Ttl. Publix” then “Publix” 
o	When [tradeclass] = “Food – Ttl. Meijer” then “Meijer” 
o	When [tradeclass] = “Food – Ttl. Delhaize” then “Ahold Delhaize”
o	When [tradeclass] = “Food – Ttl. Ahold” then “Ahold Delhaize”
o	When [Account] = “CVS” then “CVS”
o	When [Account] = “Rite-Aid” then “Rite-Aid”
o	When [Account] = “Walgreens” then “Walgreens”
o	When [tradeclass] = “Food – Ttl. Albertsons” then “Albertsons/Safeway”

*/

select * from mil50FlyerReports where  advertiser='safeway' and market='Alexandria, VA' and weekofn='2016-12-03 00:00:00.000' 
