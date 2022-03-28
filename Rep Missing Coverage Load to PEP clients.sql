--select * into master..mastercliencwmpep_10262017 from masterclientcwmpep
--select distinct clientid from master..masterclientcwmpep_addition where categorycodeid in (select id from mt2sql14.sitecontrol.dbo.categorycode where clientserver = 'mt2sql13')

--drop table #fr
--select * into master..mastercliencwmpep_10262017 from masterclientcwmpep

/* Final 
select distinct clientid,categorycodeid, d.retmktid, d.advertiser, d.market,d.acretmktid, d.retid, d.mktid, d.tcid--, d.mediaid--, company_nm,c.market 
into #Fr 
from masterclientcwmpep  a
join mt2sql00.masterclientcoverage.dbo.retmktpep b
on a.RetMktID = b.retmktid
join mt2sql13.ACFVINCR.dbo.ad_DefaultMkt c
on b.advertiser = c.company_nm
--and b.market = c.market
join mt2sql00.masterclientcoverage.dbo.retmktpep d
on d.advertiser = c.company_nm
and d.market = c.market

insert into masterclientcwmpep (ClientId,CategoryCodeID,acretmktid,RetID,MktID,retmktid,TCID,StartDate)
select distinct b.ClientId, b.CategoryCodeID, b.acretmktid, b.retid, b.mktid, b.retmktid, b.tcid,'2015-01-01 00:00:00.000' 
--,CASE WHEN (ISNULL(a.mediaid,0)=ISNULL(b.mediaid,0)) OR (ISNULL(a.mediaid,0)=0  AND b.MediaID NOT IN (12010005,12010006,1)) THEN NULL ELSE b.mediaid end as mediaid --, count(*)  
from masterclientcwmpep  a
right join #Fr b
on a.RetMktID = b.retmktid
and a.clientid = b.ClientID
and a.CategoryCodeID = b.CategoryCodeID
where a.RetMktID is null
--group by b.clientid,b.categorycodeid
order by 1 */

insert into masterclientcwmpep (ClientId,CategoryCodeID,acretmktid,RetID,MktID,retmktid,TCID,StartDate)
select distinct a.clientid,a.categorycodeid,d.acretmktid, d.retid, d.mktid,d.retmktid, d.tcid,'2015-01-01 00:00:00.000'--, d.mediaid,d.advertiser, d.market,d.acretmktid,--, company_nm,c.market 
--into #Fr 
from masterclientcwmpep  a
join mt2sql00.masterclientcoverage.dbo.retmktpep b on a.RetMktID = b.retmktid
join mt2sql13.ACFVINCR.dbo.ad_DefaultMkt c on b.advertiser = c.company_nm
join mt2sql00.masterclientcoverage.dbo.retmktpep d on d.advertiser = c.company_nm and d.market = c.market 
left join masterclientcwmpep e on a.ClientId=e.ClientId and a.CategoryCodeID=e.CategoryCodeID and d.retmktid=e.retmktid and e.mediaid is null
where e.CategoryCodeID IS NULL 
order by 1

-- select * from mt2sql13.ACFVINCR.dbo.ad_DefaultMkt 

-- select distinct *  from retmktpep where retmktid = 9073

-- select * from MasterClientCWMPEP  where retmktid = 3425 and clientid = 3

--select * from MasterClientCWMPEP order by 1
--select distinct clientid, categorycodeid,a.retmktid, advertiser, market from MasterClientCWMPEP a
--join retmktpep b 
--on a.retmktid = b.retmktid
--order by 1