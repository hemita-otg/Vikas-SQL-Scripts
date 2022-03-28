select distinct retmktid into tempdb..NDEReport
from masterbeval.dbo.BevALRetMkt


--alter table tempdb..NDEReport add  AdCount int,BeerMBevAl int ,BeerAlternativesMBevAl int ,BeerMPDT int,BeerAlternativesMPDT int

select * from tempdb..NDEReport 
/*
update r
set adcount= x.cnt
from 
(select rm.retmktid,COUNT(flyerid) cnt from MasterAdviewData..AdViewMain am join tempdb..NDEReport rm on am.RetMktID =rm.RetMktID 
group by rm.retmktid
) x join tempdb..NDEReport r on
x.retmktid=r.retmktid

select category,B.retmktid,COUNT(pagedetailid) cnt 
into tempdb..tempcnt
from MasterAdviewData..masterPAgedetailtable A join MasterAdviewData..adviewmain B
on A.flyerid =B.flyerid 
where category in ('beer','beer alternatives')
group by category,B.retmktid

select * from tempdb..tempcnt order by retmktid 
select * from tempdb..ndereport

update r
set BeerMPDT= x.cnt
from 
( select retmktid,cnt from tempdb..tempcnt where category='beer'
) x join tempdb..NDEReport r on
x.retmktid=r.retmktid


update r
set BeerAlternativesMPDT= x.cnt
from 
( select retmktid,cnt from tempdb..tempcnt where category='beer alternatives'
) x join tempdb..NDEReport r on
x.retmktid=r.retmktid


--count check
select * from masteradviewdata..adviewmain a join masteradviewdata..masterpagedetailtable b on
a.flyerid=b.flyerid and a.retmktid=2908 and b.category='beer alternatives'
--count check

select * from tempdb..ndereport

Select Distinct a.retmktid,a.Flyerid 
into tempdb..BevALMain
from masterclientcoverage..EPAMBBDAAAChildWebMain a join MasterBevAL..BevALRetMkt b on
a.retmktid=b.retmktid and a.addate >= '03/01/10'
GO

--Then pull from EPHSPChildWebMain where FlyerID’s are not already existing in the BevAlCWM.

Insert into tempdb..BevALMain
Select Distinct a.retmktid,a.Flyerid from masterclientcoverage..EPHSPChildWebMain a join MasterBevAL..BevALRetMkt b on
a.retmktid=b.retmktid and a.addate >= '03/01/10'
and FlyerID not in (Select Distinct FlyerID from tempdb..BevALMain)
GO

select count(1) from tempdb..bevalmain


select category,B.retmktid,COUNT(pagedetailid) cnt 
into tempdb..tempcntBevAL
from MAsterBevAL..bevalmasterPAgedetailtable A join tempdb..bevalmain B
on A.flyerid =B.flyerid 
where category in ('beer','beer alternatives')
group by category,B.retmktid


update r
set BeerMBevAl= x.cnt
from 
( select retmktid,cnt from tempdb..tempcntBevAl where category='beer'
) x join tempdb..NDEReport r on
x.retmktid=r.retmktid


update r
set BeerAlternativesMBevAl= x.cnt
from 
( select retmktid,cnt from tempdb..tempcntBevAl where category='beer alternatives'
) x join tempdb..NDEReport r on
x.retmktid=r.retmktid


select * from tempdb..ndereport R join masterbeval..BevALretmkt a 
on r.retmktid=a.retmktid

*/