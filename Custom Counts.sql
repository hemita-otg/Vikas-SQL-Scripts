select * from tempdb..adams order by advertiser, market

--alter table tempdb..adams add retmktid int

--update tempdb..adams set retmktid=r.retmktid from tempdb..adams a join masterclientcoverage..retmkt r 
--on a.advertiser=r.advertiser and a.market=r.market

select retmktid, category, null cnt010109,null cnt030109,null cnt060109,
null parkedcnt010109, null parkedcnt030109,null parkedcnt060109
into tempdb..adamscounts 
from tempdb..adams a, entrydata..jaalldisplaycategory where category in (
'Blended Whisky','Brandy','Canadian Whisky','Cigarettes','Cigars & Tobacco','Cordials & Liqueurs','Dessert Wines',
'Drink Mixes/Garnish','Gin','Lighters','Misc Bar Supplies','Non-Alcoholic Wines','Rum','Scotch Whisky',
'Smokeless Tobacco','Smoking Accessories','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila',
'Vodka','Wine')

select * from tempdb..adamscounts

--Detail/Regular/NotParked Entry = Masterpagedetailtable
--Archived/Parked Entry = Masterarchivecategory


-- Regular count
update c set cnt060109=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterpagedetailtable pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate < '6/1/2009' 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------
-- parked count--------------------------------------------------
update c set parkedcnt060109=x.cnt
--select c.retmktid, category, x.cnt-- to cross check before update
from tempdb..adamscounts c
inner join 
(
select c.retmktid, c.category, count(pagedetailid) as cnt
from masteradviewdata.. Masterarchivecategory pdt 
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate < '6/1/2009' 
join tempdb..adamscounts c on pdt.category=c.category and cwm.retmktid=c.retmktid
group by c.retmktid, c.category
) x on c.retmktid=x.retmktid and c.category=x.category
-----------------------------------------------------------------

select * from tempdb..adamscounts



/*
select count(pagedetailid) from masteradviewdata.. masterpagedetailtable pdt 
--inner join tempdb..adamscounts c on c.category=pdt.category
inner join masteradviewdata.. adviewmain cwm on pdt.flyerid=cwm.flyerid
where cwm.retmktid=14 and pdt.category='Blended Whisky' and cwm.addate < '1/1/2009' 

*/