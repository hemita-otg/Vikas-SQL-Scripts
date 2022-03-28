safeway(can) - internet -- 23584
subway - internet --23121


iga(can)-internet --46100
voila- internet  --46099


-------clients
paris presnt
mondelez canada
schools canada
last 2 clients - custom set




select * from retmkt where advertiser like '%sobe%' and market like '%inter%'

select entryprojectid, Active ,* from masteradviewdata..adviewmain where retmktid in ( 46100, 46099)

select * from masteradviewdata..MasterPageDetailTable  where flyerid in  (25621683,25634061)

select * from mt2sql14.sitecontrol.dbo.vw_catinfo where clientname like '%mond%'

select * from masterclientcoverage..EPCANChildWebMain where retmktid in ( 46100, 46099)

select * from can  where retmktid in ( 46100, 46099)

select * from CanFlyerIDs where flyerid in  (25621683,25634061)

select * from masterclientcoverage..MasterEntryCWM  where retmktid in ( 46100, 46099)








