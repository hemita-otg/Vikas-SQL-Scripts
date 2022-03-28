/*
select distinct features from prdcnen50DetailReports 
select distinct features from prdcnen50PageReports 

select * from prdcnen50DisFeatures 


with

f as (select * from prdcnen50FlyerReports where advertiser='walmart supercentre' and addate in ('08/16/2017','08/17/2017')),
p as (select * from prdcnen50PageReports ),
d as (select * from prdcnen50DetailReports )
select distinct d.advertiser,d.market,d.addate,d.features,d.media  from f join p on f.flyerid=p.flyerid join d on f.flyerid=d.flyerid 

order by addate 


select features,* from prdcnen50DetailReports where pagedetailid =169472487
select features,* from prdcnen50pagereports where flyerid=18387250

*/


use MasterAdviewData 

select * from mt2sql00.masteradviewdata.dbo.MCAPVehiclePages where vehicleid in (12424786)

select features,* from mt2sql00.masteradviewdata.dbo.MasterPageDetailTable where pagedetailid='0016947Q7'



select features,* from mt2sql11.sql11.dbo.prdcnen50DetailReports where pagedetailid =169472487
select features,* from mt2sql11.sql11.dbo.prdcnen50pagereports where flyerid=18387250