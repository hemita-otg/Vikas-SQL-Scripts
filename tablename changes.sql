select * from  anhproductterritorygroups

select * from categorycode where clientid=92 and category like 'wlmadl%'


select * from tablenames where categorycodeid=1174
-- and mastertablename like '%disadvertisermarket%' -- 0,1,13,55
-- and mastertablename like '%childwebmain%' -- 3
-- and mastertablename like '%AdvertiserSalesTerritory%' -- 2
-- and mastertablename like '%disdateranges%' -- 4
-- and mastertablename like '%manufacturer%' -- 12
-- and mastertablename like '%marketsalesregion%' -- 14
-- and mastertablename like '%media%' -- 15
-- and mastertablename like '%multiplepagevalues%' -- 18

/*
update tablenames set mastertablename='WLMADLDisAdvertiserMarket',clienttablename='WLMADLDisAdvertiserMarket' where tableid in (0,1,13,55) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLChildWebMain',clienttablename='WLMADLChildWebMain' where tableid in (3) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLAdvertiserSalesTerritory',clienttablename='WLMADLAdvertiserSalesTerritory' where tableid in (2) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLDisDateRanges',clienttablename='WLMADLDisDateRanges' where tableid in (4) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLManufacturer',clienttablename='WLMADLManufacturer' where tableid in (12) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLMarketSalesRegions',clienttablename='WLMADLMarketSalesRegions' where tableid in (14) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLMedia',clienttablename='WLMADLMedia' where tableid in (15) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)

update tablenames set mastertablename='WLMADLMultiplePageValues',clienttablename='WLMADLMultiplePageValues' where tableid in (18) 
and categorycodeid in (1174,1175,1176,1177,1178,1179)
*/