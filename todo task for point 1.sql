--drop table tempdb..rm

select Distinct RetMktId,TradeClass,Advertiser,Market,null as AccountGroup ,Active,null as EntryProject into Tempdb..RM
from retmkt 

select * from tempdb..rm

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
r.retmktid=m.retmktid

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
r.advertiser=m.advertiser
where r.accountgroup is null

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
replace(r.advertiser,' - adams','')=m.advertiser
where r.accountgroup is null 

update r set Entryproject = ep.descrip
from tempdb..rm r join masterclientcoverage..MasterEntryCWM me
on r.retmktid=me.retmktid join masterclientcoverage..entryproject ep on 
ep.entryprojectid=me.entryprojectid
where ep.entryprojectid not in (14,15)

select * from masterclientcoverage..MasterEntryCWM where  retmktid=1
select * from masterclientcoverage..entryproject
select top 100 * from masteradviewdata..adviewmain


alter table tempdb..rm add CWMPublishTime int
alter table tempdb..rm add PDTEntryTime  int


select distinct r.* into tempdb..one 
from tempdb..rm r join masteradviewdata..adviewmain am on 
r.retmktid=am.retmktid join masteradviewdata..masterpagedetailtable m on 
am.flyerid=m.flyerid where am.addate between '7/31/2010' and '1/31/2011'


--drop table tempdb..one

select * from tempdb..one

select o.retmktid, avg(datediff(d, publishedon, addate))
from tempdb..one o join masteradviewdata..adviewmain am  
on o.retmktid=am.retmktid 
where am.addate between '7/31/2010' and '1/31/2011' 
group by o.retmktid

24100	-38
select datediff(d, publishedon, addate) as test, publishedon, addate,* from masteradviewdata..adviewmain
where retmktid=14 and 
addate between '7/31/2010' and '1/31/2011' 

update  oo set CWMPublishTime= x.daysdiff
from tempdb..one oo join 
(select o.retmktid, avg(datediff(d, publishedon, addate)) as daysdiff
from tempdb..one o join masteradviewdata..adviewmain am  
on o.retmktid=am.retmktid 
where am.addate between '7/31/2010' and '1/31/2011' 
group by o.retmktid) x on oo.retmktid=x.retmktid





select * from tempdb..one


select o.retmktid, avg(datediff(d, t.dtadded, t.addate)) as daysdiff into tempdb..temppdtwithavg
from tempdb..one o join tempdb..temppdt t on 
o.retmktid=t.retmktid
group by o.retmktid



select * from tempdb..temppdtwithavg

24061	-21	
select datediff(d, dtadded, addate) as test, dtadded, am.addate from masteradviewdata..adviewmain am join masteradviewdata..masterpagedetailtable m 
on am.flyerid=m.flyerid 
where am.retmktid=14 and 
am.addate between '7/31/2010' and '1/31/2011' 

update tempdb..one set PDTEntryTime=t.daysdiff from 
tempdb..one o join tempdb..temppdtwithavg t 
on o.retmktid=t.retmktid


select * from tempdb..one

/*
alter table tempdb..one add  ACOn bit
alter table tempdb..one add  ahld bit
alter table tempdb..one add  CGR bit
alter table tempdb..one add  EHP bit
alter table tempdb..one add  EPC bit
alter table tempdb..one add  HOR bit
alter table tempdb..one add  KEL bit
alter table tempdb..one add  MAY bit
alter table tempdb..one add  MIL bit
alter table tempdb..one add  PEP bit
alter table tempdb..one add  PGCORP bit
alter table tempdb..one add  PGNBDCon bit
alter table tempdb..one add  PGPR bit
alter table tempdb..one add  RAL bit
alter table tempdb..one add  SCJ bit
alter table tempdb..one add  svl bit
alter table tempdb..one add  svlSCApl bit 
alter table tempdb..one add  UNI bit
*/

select  * from masterclientcoverage..masterclientcwm

update o set acon=1
from tempdb..one o join masterclientcoverage..masterclientcwm m 
on o.retmktid=m.retmktid and m.categorycodeid=


select [id],category from mt2sql04.sitecontrol.dbo.categorycode where category in 
('ACOn', 'ahld', 'CGR', 'EHP', 'EPC', 'HOR', 'KEL', 'MAY', 'MIL', 'PEP', 'PGCORP', 'PGNBDCon', 'PGPR', 'RAL', 'SCJ', 'svl', 'svlSCApl', 'UNI')


update o set CGR=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=163
update o set HOR=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=269
update o set KEL=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=285
update o set MAY=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=289
update o set MIL=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=293
update o set PEP=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=305
update o set PGCORP=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=320
update o set PGPR=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=339
update o set RAL=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=364
update o set SCJ=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=375
update o set UNI=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=386
update o set ACOn=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=520
update o set PGNBDCon=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=873
update o set svl=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=969
update o set EHP=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=1106
update o set EPC=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=1107
update o set ahld=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=1114
update o set svlSCApl=1 from tempdb..one o join masterclientcoverage..masterclientcwm m on o.retmktid=m.retmktid and m.categorycodeid=1247



select * from tempdb..one


select * from masterclientcoverage..masterclientcwm where retmktid =18 and categorycodeid=163
select * from masterclientcoverage..masterclientcwm where retmktid =75 and categorycodeid=163