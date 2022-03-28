--select count(1)  from mil50detailreports where mpvbrandpacksize is  null

100863
select * from tempdb..b where salesterritory is null --800006
select * from tempdb..b where salesterritory is not null and ProductTerritory is null --39
select * from tempdb..b where not (salesterritory is not null and ProductTerritory is null)


--select * into tempdb..b from mil50detailreports where mpvbrandpacksize is  null

101011
select distinct advertiser,market,salesterritory from tempdb..b where salesterritory is null --80127
select * from tempdb..b where salesterritory is not null and ProductTerritory is null --39
select * from tempdb..b where  ProductTerritory is null



select * from mt2sql14.sitecontrol.dbo.milAdvertiserSalesTerritory

--------------day 2 ------------------------------------
--select * into tempdb..b2 from mil50detailreports where mpvbrandpacksize is  null

101011
select * from tempdb..b2 where salesterritory is null --80127
select * from tempdb..b2 where salesterritory is not null and ProductTerritory is null --39
select * from tempdb..b2 where  ProductTerritory is null