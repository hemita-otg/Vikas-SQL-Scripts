select count(1) from MasterAdviewData..MasterPageDetailTable where FlyerId=16583383 
and category in (select distinct RealCategory from MasterClientCoverage..vw_MerchandiseCategory where CategoryCodeId=2940)

select * from Prod50FlyerReports where flyerid=16583383

select * from DigitalCompareCheck..DigitalCompareCheck where FlyerID=16583383

select * from EntryData..USACMCPageDetailTable where FlyerID=16583383

select * from EntryData..USACVCPageDetailTable where FlyerID=16583383