
select * from MasterClientCoverage.dbo.FlyersToChangeToPrint360



with
a as (select distinct Flyerid, Features from mt2sql06.sql06.dbo.wwvflyerreports where advertiser='meijer') --and flyerid not in ( select * from MasterClientCoverage.dbo.FlyersToChangeToPrint360)),
b as (select distinct Flyerid, Features from masterclientcoverage..EPAMFChildWebMain where advertiser='meijer')
select * from a join b on a.FlyerId =b.flyerid 
and a.Features <> b.Features 


with
a as (select distinct Flyerid, Features from mt2sql11.sql11.dbo.ad50PAgereports where advertiser='meijer'),
b as (select distinct Flyerid, fvdisplayvalue as features from MasterAdviewData..mcapvehiclepages)
select * from a join b on a.FlyerId =b.flyerid 
and a.Features <> b.Features where b.features='insert online' 

with
a as (select distinct Flyerid, Features, page from mt2sql06.sql06.dbo.wwvPagereports where advertiser='meijer'),
b as (select distinct Flyerid, fvdisplayvalue as features, pagenumber as page from MasterAdviewData..mcapvehiclepages)
select * from a join b on a.FlyerId =b.flyerid and a.page=b.page
and a.Features <> b.Features 


with
a as (select distinct Flyerid, Features, page from mt2sql11.sql11.dbo.ad50PAgereports where advertiser='meijer'),
b as (select distinct Flyerid, fvdisplayvalue as features, pagenumber as page from MasterAdviewData..mcapvehiclepages)
select * from a join b on a.FlyerId =b.flyerid and a.page=b.page
and a.Features <> b.Features 



with
a as (select distinct Flyerid, Features from mt2sql06.sql06.dbo.wwvdetailreports where advertiser='meijer'),
b as (select distinct Flyerid, Features from masterclientcoverage..EPAMFChildWebMain where advertiser='meijer')
select * from a join b on a.FlyerId =b.flyerid 
and a.Features <> b.Features 


