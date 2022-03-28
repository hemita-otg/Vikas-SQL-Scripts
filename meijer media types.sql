
select * from MasterClientCoverage.dbo.FlyersToChangeToPrint360

select top 100 * from MCAPVehiclePages 
--
with
a as (select distinct Flyerid, media from mt2sql06.sql06.dbo.wwvflyerreports where advertiser='meijer' and flyerid  in ( select * from MasterClientCoverage.dbo.FlyersToChangeToPrint360) ),
b as (select distinct Flyerid, media from masterclientcoverage..EPAMFChildWebMain where advertiser='meijer')
select * from a join b on a.FlyerId =b.flyerid 
and a.media <> b.media 


with
a as (select distinct Flyerid, media from mt2sql11.sql11.dbo.ad50Flyerreports where advertiser='meijer'),
b as (select distinct Flyerid, media from MasterAdviewData..adviewmain where advertiser='meijer')
select * from a join b on a.FlyerId =b.flyerid 
and a.media <> b.media 



with
a as (select distinct Flyerid, media from mt2sql06.sql06.dbo.wwvdetailreports where advertiser='meijer'),
b as (select distinct Flyerid, media from masterclientcoverage..EPAMFChildWebMain where advertiser='meijer')
select * from a join b on a.FlyerId =b.flyerid 
and a.media <> b.media 


