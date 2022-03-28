--MT2sql07
select distinct advertiser from bcrFTP50disadvertisermarket union 
select distinct advertiser from BFCb50disadvertisermarket union 
select distinct advertiser from bmidisadvertisermarket union 
select distinct advertiser from cwudisadvertisermarket union 
select distinct advertiser from CWU50disadvertisermarket union 
select distinct advertiser from dga50disadvertisermarket union 
select distinct advertiser from futb50disadvertisermarket union 
select distinct advertiser from hbcdisadvertisermarket union 
select distinct advertiser from moet50disadvertisermarket union 
select distinct advertiser from NHLCdisadvertisermarket union 
select distinct advertiser from pat50disadvertisermarket union 
select distinct advertiser from rndcKdisadvertisermarket union 
select distinct advertiser from rndctdisadvertisermarket union 
select distinct advertiser from rnnodisadvertisermarket union 
select distinct advertiser from rntadisadvertisermarket union 
select distinct advertiser from sazdisadvertisermarket union 
select distinct advertiser from SWStest50disadvertisermarket union 
select distinct advertiser from twinedisadvertisermarket union 
select distinct advertiser from wbg50disadvertisermarket union 
select distinct advertiser from wbgnvdisadvertisermarket union 
select distinct advertiser from ymktdisadvertisermarket  


----------------------------------------------


--MT2SQL11
select distinct advertiser from sql11..prdBA50DisAdvertiserMarket




--------------MT2sql07
select * from MasterBevAL..MasterBevALDetailReports where FlyerId in (select flyerid from MasterAdviewData..AdviewMain where advertiser in ('23rd Avenue Liquor','707 Liquors','A & P','AAA Discount Liquor Outlet','Acquistapaces Covington Sprmkt','Advance Food Market','Albertsons (V6)','Albertsons (V9)','Amity Wine & Spirit','Apollo','Arcade Package Store','Austin Liquors','Bashas','Bevmax','Big Beverage','Big Red Liquors','Biggs','Brix','Brown Jug Friendly Spirits ','Busters Liquors & Wines','Buy Rite Liquor','Cambridge Village Market','Champagnes Marche','Churchills','Cost Plus Supermercado','Costco','Crown Wine & Spirits','Dirt Cheap','Drug City Liquors','DTs Discount Liquors','Duane Reade','El Ranchito Super Mercado','Elm Discount Pkge Store','Exotic Wines & Lq','Fairgrounds Liquor','Festival (KC)','Fishers Lq Barn','Food Basics','Food King','Food Pantry','Fossil Creek Liquor','Fresh & Easy','G & G Food','Galles Liquor Mart','Gerlands Food Fair','Giant - Carlisle','Global Wine & Spirits','Gold Coast Liquors','Harvest Foods (WA)','Henry Street Liquor','Holden Liquor Group','Holyoke Liquor Mart','Illinois Liquor Marts','Ishihara Market Ltd','Kahns Fine Wines & Spirits','Kenyons Variety','Kings','Kirby Wines & Liquors','Kmart','Kroger - Fresh Fare','La Princesa','La Vinat','Lake View Farm Market','Leblancs Pay-Less Fd','Licores El Potrillo','Lidl','Liquor & Wine Depot','Liquor Barn (IL)','Liquors 44','Lowes','Lowes Big 8','Macs Market','Macys Liquors','Marsh','Martignetti Liquors','Martins Food Store','Minyard','Miskas Liquors','New Hampshire State Liqr','Original Canals','Pascales','Pathmark','Petes Fresh Market','Poplar Pike Wine & Liquor','Powers Liquor Mart','Purdys Dscnt Wns & Liqs','Rainbow Foods','Royal Liquors','Safeway (E5)','Save A Lot','Sears','Sherry-Lehmann','Shoprite Wines & Spirits','Skytop Disc Liquor','Sunset Plaza Wn&Lq','Super Fresh','Teddys Wine Liquor','The Andersons','The Fresh Market','Thrifty Disc Liquor/ Mr. Thrifty','Times','Total Wine & More - MD','Total Wine & More - VA','Trader Joes','Trail Creek Liquors','Valley Supreme Liquors','Vincents 12th Street','Waldbaums','Walnut St. Liquor','WB Liquor','Weis','Westfield Spirit Shop','Windham Wine & Spirits','Wine Factory Liquor','Wine World Outlet')
and advertiser not in ('Bashas','Buy Rite Liquor','Buy Rite Liquor','Global Wine & Spirits','Pascales','Times','Wine Factory Liquor','Lowes Big 8','Skytop Disc Liquor','Windham Wine & Spirits','Exotic Wines & Lq','Arcade Package Store','Advance Food Market','Fishers Lq Barn','DTs Discount Liquors','Amity Wine & Spirit','Illinois Liquor Marts','Lowes Big 8','Big Beverage','Petes Fresh Market')

)



select * from MasterClientCoverage..MasterClientCWM  a
join MasterClientCoverage..RetMkt  b
on a.retmktid = b.retmktid
where CategoryCodeID = 3145 
and advertiser in ('23rd Avenue Liquor','707 Liquors','A & P','AAA Discount Liquor Outlet','Acquistapaces Covington Sprmkt','Advance Food Market','Albertsons (V6)','Albertsons (V9)','Amity Wine & Spirit','Apollo','Arcade Package Store','Austin Liquors','Bashas','Bevmax','Big Beverage','Big Red Liquors','Biggs','Brix','Brown Jug Friendly Spirits ','Busters Liquors & Wines','Buy Rite Liquor','Cambridge Village Market','Champagnes Marche','Churchills','Cost Plus Supermercado','Costco','Crown Wine & Spirits','Dirt Cheap','Drug City Liquors','DTs Discount Liquors','Duane Reade','El Ranchito Super Mercado','Elm Discount Pkge Store','Exotic Wines & Lq','Fairgrounds Liquor','Festival (KC)','Fishers Lq Barn','Food Basics','Food King','Food Pantry','Fossil Creek Liquor','Fresh & Easy','G & G Food','Galles Liquor Mart','Gerlands Food Fair','Giant - Carlisle','Global Wine & Spirits','Gold Coast Liquors','Harvest Foods (WA)','Henry Street Liquor','Holden Liquor Group','Holyoke Liquor Mart','Illinois Liquor Marts','Ishihara Market Ltd','Kahns Fine Wines & Spirits','Kenyons Variety','Kings','Kirby Wines & Liquors','Kmart','Kroger - Fresh Fare','La Princesa','La Vinat','Lake View Farm Market','Leblancs Pay-Less Fd','Licores El Potrillo','Lidl','Liquor & Wine Depot','Liquor Barn (IL)','Liquors 44','Lowes','Lowes Big 8','Macs Market','Macys Liquors','Marsh','Martignetti Liquors','Martins Food Store','Minyard','Miskas Liquors','New Hampshire State Liqr','Original Canals','Pascales','Pathmark','Petes Fresh Market','Poplar Pike Wine & Liquor','Powers Liquor Mart','Purdys Dscnt Wns & Liqs','Rainbow Foods','Royal Liquors','Safeway (E5)','Save A Lot','Sears','Sherry-Lehmann','Shoprite Wines & Spirits','Skytop Disc Liquor','Sunset Plaza Wn&Lq','Super Fresh','Teddys Wine Liquor','The Andersons','The Fresh Market','Thrifty Disc Liquor/ Mr. Thrifty','Times','Total Wine & More - MD','Total Wine & More - VA','Trader Joes','Trail Creek Liquors','Valley Supreme Liquors','Vincents 12th Street','Waldbaums','Walnut St. Liquor','WB Liquor','Weis','Westfield Spirit Shop','Windham Wine & Spirits','Wine Factory Liquor','Wine World Outlet')




