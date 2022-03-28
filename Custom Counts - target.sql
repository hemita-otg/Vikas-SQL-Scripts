
select advertiser,market into tempdb..adams from masterclientcoverage.dbo.retmkt where 1=2


--alter table tempdb..adams add retmktid int

--update tempdb..adams set retmktid=r.retmktid from tempdb..adams a join masterclientcoverage..retmkt r 
on a.advertiser=r.advertiser and a.market=r.market


------------------------------------------------------------------------------------------------------
--Core Grocery
------------------------------------------------------------------------------------------------------

select retmktid, category, null entered_count,null parked_count 
into tempdb..adamscounts 
from tempdb..adams a, entrydata..jaalldisplaycategory where category in (
select distinct category from entrydata..jaalldisplaycategory
where categorygroup not in ('Auto/Hardware/Outdoor', 'Electronics/Toys', 'Financial Cards', 'Home/Clothing')
)

select * from tempdb..adamscounts

--Detail/Regular/NotParked Entry = Masterpagedetailtable
--Archived/Parked Entry = Masterarchivecategory


-- Regular count
update c set entered_count=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterpagedetailtable pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate between '07/01/2009'  and '06/30/2010' 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------
-- parked count--------------------------------------------------
update c set parked_count=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterarchivecategory pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate between '07/01/2009'  and '06/30/2010' 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------

select a.retmktid,a.advertiser,a.market,sum(entered_count),sum(parked_count) from tempdb..adamscounts ac join tempdb..adams a on ac.retmktid=a.retmktid
group by a.retmktid,a.advertiser,a.market


------------------------------------------------------------------------------------------------------
--Core Grocery
------------------------------------------------------------------------------------------------------
/*
select count(pagedetailid) from masteradviewdata.. masterpagedetailtable pdt 
--inner join tempdb..adamscounts c on c.category=pdt.category
inner join masteradviewdata.. adviewmain cwm on pdt.flyerid=cwm.flyerid
where cwm.retmktid=14 and pdt.category='Blended Whisky' and cwm.addate < '1/1/2009' 

*/



------------------------------------------------------------------------------------------------------
--All other
------------------------------------------------------------------------------------------------------

select retmktid, category, null allother_entered_count,null allother_parked_count 
into tempdb..adamscounts_allother 
from tempdb..adams a, entrydata..jaalldisplaycategory where category in (
select distinct category from entrydata..jaalldisplaycategory
where categorygroup  in ('Auto/Hardware/Outdoor', 'Electronics/Toys', 'Financial Cards', 'Home/Clothing')
)

select * from tempdb..adamscounts_allother

--Detail/Regular/NotParked Entry = Masterpagedetailtable
--Archived/Parked Entry = Masterarchivecategory


-- Regular count
update c set allother_entered_count=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts_allother c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterpagedetailtable pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate between '07/01/2009'  and '06/30/2010' 
join tempdb..adamscounts_allother c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------
-- parked count--------------------------------------------------
update c set allother_parked_count=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts_allother c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterarchivecategory pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate between '07/01/2009'  and '06/30/2010' 
join tempdb..adamscounts_allother c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------

select a.retmktid,a.advertiser,a.market,sum(allother_entered_count),sum(allother_parked_count) from tempdb..adamscounts_allother ac join tempdb..adams a on ac.retmktid=a.retmktid
group by a.retmktid,a.advertiser,a.market


------------------------------------------------------------------------------------------------------
--All other
------------------------------------------------------------------------------------------------------