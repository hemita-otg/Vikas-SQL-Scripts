﻿/*
Columns are defined as follows:
•	SalesStrategy1 (How many retailer/markets advertised in the selected weeks?) – Did they have any flyerID for that WeekOfN?
*/
 select * from sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-02 00:00:00.000'
 select * from mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-12-03 00:00:00.000'

 /*
•	SalesStrategy2 (How many ad blocks of Beer did they advertise?) – Unique Count of the number of ad blocks
*/

 select * from sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-02 00:00:00.000'
  select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mil50detailreports where flyerid='7132600'
/*
•	SalesStrategy3 (How many ad blocks of Beer had a MillerCoors product?) - Unique Count of the number of ad blocks that had a [manufacturer] value of MillerCoors for any product record within it
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-09 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid='7145345' and manufacturer = 'MillerCoors'
/*
•	SalesStrategy4 (Did the retailer advertise a Large Pack Premium Light Tri-Brew?) – all three of the following PLUS [SKUDescription1] on all the records for these brands = 15 or higher
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Budweiser ( Bud )”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Coors”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Miller”
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-09 00:00:00.000'
 select skudescription1, ProductTerritoryGroup, brand from mt2bu2.sql08.dbo.mil50DetailReports where flyerid = '7145345' and [ProductTerritoryGroup] = 'Premium' and [Brand] in ('Budweiser ( Bud )','Coors','Miller')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-06 00:00:00.000'
 select skudescription1, ProductTerritoryGroup, brand from mt2bu2.sql08.dbo.mil50DetailReports where flyerid = '7226062' and [ProductTerritoryGroup] = 'Premium' and [Brand] in ('Budweiser ( Bud )','Coors','Miller')
 --in skudescrition this count is not matching. as it gives in Range.
/*

o	Note: it’s ok if there are additional products beyond these three in the block; but it MUST contain all three brands
•	SalesStrategy5 (Did the retailer advertise a Small Pack Premium Light Tri-Brew?) – all three of the following PLUS [SKUDescription1] on all the records for these brands = 12 or less.
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Budweiser ( Bud )”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Coors”
o	[ProductTerritoryGroup] = “Premium” and [Brand] = “Miller” 
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-27 00:00:00.000'
 select distinct skudescription1, ProductTerritoryGroup, brand from mt2bu2.sql08.dbo.mil50DetailReports where flyerid = '7296237' and [ProductTerritoryGroup] = 'Premium' and [Brand] in ('Budweiser ( Bud )','Coors','Miller')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-02 00:00:00.000'
 select distinct skudescription1, ProductTerritoryGroup, brand from mt2bu2.sql08.dbo.mil50DetailReports where flyerid = '7132600' and [ProductTerritoryGroup] = 'Premium' and [Brand] in ('Budweiser ( Bud )','Coors','Miller')
/*

o	Note: it’s ok if there are additional products beyond these three in the block; but it MUST contain all three brands
•	SalesStrategy6 (*NEW* How many ad blocks did the retailer advertise that had any Premium Light in it?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Premium Light’ or ‘Premium Regular’ 
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-16 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7169027','7172639') and ProductTerritorySubGroup in ('Premium Light','Premium Regular')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-09 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7145345') and ProductTerritorySubGroup in ('Premium Light','Premium Regular')
/*

•	SalesStrategy7 (Did the retailer advertise Blue Moon on Leinenkugels?) – Unique Count of the number of ad blocks that has either [Brand] = “Blue Moon” or [Brand] = “Leinenkugels”
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-06 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7226062') and brand in ('Blue Moon','Leinenkugels')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-16 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7435889') and brand in ('Blue Moon','Leinenkugels')
/*

•	SalesStrategy8 (How many ad blocks did they advertise that had any Craft product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘Craft/Micro’
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-06 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7226062') and ProductTerritorySubGroup in ('Craft/Micro')
 
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-05-07 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7538367','7542715') and ProductTerritorySubGroup in ('Craft/Micro')
/*

•	SalesStrategy9 (Did the retailer advertise Henrys or Redds?) – Unique Count of the number of ad blocks that has either [Brand] = “Redds” or [Brand] = “Henrys Hard Soda”
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-06 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7226062') and brand in ('Redds','Henrys Hard Soda')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-16 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7435889') and brand in ('Redds','Henrys Hard Soda')
/*

•	SalesStrategy10 (How many ad blocks did they advertise that had any FMB product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of ‘FMB’
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-02-06 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7226062') and ProductTerritorySubGroup in ('FMB')
 
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-23 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7188169') and ProductTerritorySubGroup in ('FMB')
/*

•	SalesStretegy11 (Did the retailer advertise Miller High Life, Keystone, or Milwaukee’s Best?) – Unique Count of the number of ad blocks that has any one of the following three conditions:
o	[Brand] = Miller AND [ProductTerritorySubGroup] = Near Premium
o	[Brand] = Keystone
o	[Brand] = Milwaukees Best
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-23 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7446828') and brand = 'Miller' and ProductTerritorySubGroup in ('Near Premium')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-23 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7446828') and brand = 'Keystone' 

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-23 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7446828') and brand = 'Milwaukees Best' 
/*

•	SalesStrategy12 (How many ad blocks did the retailer advertise that had any Economy product?) – Unique Count of the number of ad blocks that has at least one product record with a [ProductTerritorySubGroup] value of either ‘Budget’ or ‘Near Premium’
*/
 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-23 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('7446828') and ProductTerritorySubGroup in ('Budget','Near Premium')

 select * from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-08-27 00:00:00.000'
 Select distinct topleftx ,toplefty ,bottomrightx ,bottomrighty  from mt2bu2.sql08.dbo.mil50detailreports where flyerid in ('10153136') and ProductTerritorySubGroup in ('Budget','Near Premium')
/*
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

 select * from mt2bu2.sql08.dbo.mil50_SummaryForMTA where advertiser='safeway' order by 2,3
 select tradeclass,* from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-04-23 00:00:00.000'
 select tradeclass,* from mt2bu2.sql08.dbo.mil50flyerreports where advertiser='safeway' and market='Alexandria, VA' and  weekofn='2016-01-02 00:00:00.000'

 
