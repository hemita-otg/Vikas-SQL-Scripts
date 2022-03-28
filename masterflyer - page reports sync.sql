drop table tempdb..fr
drop table tempdb..pr 

 select * into tempdb..fr from mt2asql10.masteradviewdata.dbo.masterflyerreports  where flyerid not in 
 (select flyerid from mt2asql01.masteradviewdata.dbo.masterflyerreports)

  select * into tempdb..pr from mt2asql10.masteradviewdata.dbo.masterpagereports  where flyerid not in 
 (select flyerid from mt2asql01.masteradviewdata.dbo.masterpagereports)


 select * into tempdb..fr from mt2asql01.masteradviewdata.dbo.masterflyerreports  where flyerid not in 
 (select flyerid from mt2asql10.masteradviewdata.dbo.masterflyerreports)

  select * into tempdb..pr from mt2asql01.masteradviewdata.dbo.masterpagereports  where flyerid not in 
 (select flyerid from mt2asql10.masteradviewdata.dbo.masterpagereports)

 delete from masterflyerreports where flyerid in (select flyerid  from tempdb..fr)
 delete from masterpagereports where flyerid in (select flyerid  from tempdb..pr)
 insert into masterflyerreports
 select * from tempdb..fr


 
 insert into masterpagereports
 select * from tempdb..pr


 insert into masteradviewdata.dbo.MasterFlyerReports 
 select  * from MasterClientCoverage..MasterFlyerReportsUpdate 

 
Delete P from masteradviewdata.dbo.MasterPageReports P where Flyerid  in (select Flyerid from MasterClientCoverage.dbo.AdviewMainDelete union all select Flyerid from MasterClientCoverage.dbo.AdviewMainUpdate )


 insert into masteradviewdata.dbo.MasterPAgeReports 
 select  * from MasterClientCoverage..MasterPageReportsUpdate 

 ---End: for MasterFlyer and MasterPageReports