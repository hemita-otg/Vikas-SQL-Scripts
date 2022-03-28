select advertiser,market into tempdb..adams from retmkt where 1=2




select * from tempdb..adams order by advertiser, market 


--alter table tempdb..adams add retmktid int

--update tempdb..adams set retmktid=r.retmktid from tempdb..adams a join masterclientcoverage..retmkt r 
on a.advertiser=r.advertiser and a.market=r.market

select retmktid, category, null Parked,null Entered
into tempdb..adamscounts 
from tempdb..adams a, entrydata..jaalldisplaycategory where category in (
'Blended Whisky','Brandy','Canadian Whisky','Rum','Scotch Whisky','Straight Bourbon Whiskey','Tequila',
'Vodka')

select * from tempdb..adamscounts

--Detail/Regular/NotParked Entry = Masterpagedetailtable
--Archived/Parked Entry = Masterarchivecategory


-- Regular count
update c set entered=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterpagedetailtable pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------
-- parked count--------------------------------------------------
update c set parked=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterarchivecategory pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------

select * from tempdb..adamscounts

update tempdb..adamscounts set entered=0 where entered is null
update tempdb..adamscounts set parked=0 where parked is null



/*
select count(pagedetailid) from masteradviewdata.. masterpagedetailtable pdt 
--inner join tempdb..adamscounts c on c.category=pdt.category
inner join masteradviewdata.. adviewmain cwm on pdt.flyerid=cwm.flyerid
where cwm.retmktid=8951 and pdt.category='vodka' 

*/





select distinct advertiser,market ,ep.descrip,min(startdate)
from retmkt r join 
(select distinct a.retmktid,c.entryprojectid entryprojectid ,min(c.startdate) startdate
from  tempdb..adams a left outer join masterentrycwm c on c.retmktid=a.retmktid
where entryprojectid is not null
group by a.retmktid,entryprojectid
) x on r.retmktid=x.retmktid join entryproject ep on x.entryprojectid=ep.entryprojectid 
group by advertiser,market 

order by 1,2,3


select distinct advertiser,market ,ep.descrip,min(startdate)
from tempdb..adams r join 
(select distinct a.retmktid,c.entryprojectid entryprojectid,min(c.startdate) startdate
from  tempdb..adams a left outer join masterentrycwm c on c.retmktid=a.retmktid
where entryprojectid is not null
group by a.retmktid,entryprojectid
) x on r.retmktid=x.retmktid join entryproject ep on x.entryprojectid=ep.entryprojectid 
group by r.advertiser,r.market ,ep.descrip





select * from tempdb..adams

select * from tempdb..adamscounts

alter table tempdb..adamscounts  add Ear_AdDate DAtetime
alter table tempdb..adamscounts  add Ear_Parked int
alter table tempdb..adamscounts  add Ear_Entered int




-- Regular count
update c set Ear_AdDate=x.dt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, min(addate) as dt
from  masteradviewdata..adviewmain cwm  
join tempdb..adamscounts c on cwm.retmktid=c.retmktid 
group by c.retmktid
) x on c.retmktid=x.retmktid 
-----------------------------------------------------------------



select * from tempdb..adamscounts



/*
select min(addate) from 
 masteradviewdata.. adviewmain cwm 
where cwm.retmktid=14 and pdt.category='vodka' 

*/




-- Regular count
update c set Ear_Entered=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterpagedetailtable pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid and cwm.addate =c.Ear_AdDate
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------


-- parked count--------------------------------------------------
update c set Ear_Parked=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterarchivecategory pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid and cwm.addate =c.Ear_AdDate
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------



/*
select count(pagedetailid) from masteradviewdata..Masterpagedetailtable pdt 
--inner join tempdb..adamscounts c on c.category=pdt.category
inner join masteradviewdata.. adviewmain cwm on pdt.flyerid=cwm.flyerid
where cwm.retmktid=91 and pdt.category='blended whisky' and cwm.addate= '09/01/2005'

*/


--select * into tempdb..adamscounts_old_wiht_01012009 from tempdb..adamscounts
select * from tempdb..adamscounts


update tempdb..adamscounts set Ear_Parked=0 where Ear_Parked is null
update tempdb..adamscounts set Ear_entered=0 where Ear_entered is null





select * from masterentrycwm where retmktid=16
select * from masterclientcwm where retmktid=16

select * from entryproject where entryprojectid=19



select * from tempdb..adamscounts_old_wiht_01012009 where ear_parked =0


/*
select x.retmktid, x.advertiser, x.market, ep.descrip, x.MinStartDt
from 
(
	select r.retmktid, r.advertiser, r.market, MinStartDt
	from tempdb..adams r 
		inner join (select retmktid, min(startdate) MinStartDt from masterentrycwm group by retmktid) cwm on r.retmktid=cwm.retmktid
) X 
	inner join (select distinct retmktid, startdate, entryprojectid from masterentrycwm) cwm on x.retmktid=cwm.retmktid and x.minstartdt=cwm.startdate
	inner join entryproject ep on cwm.entryprojectid=ep.entryprojectid
order by x.advertiser, x.market, x.MinStartDt
*/