select * from tempdb..adams order by advertiser, market

cnt010109
cnt030109
cnt060109

select * from tempdb..adamscounts 

select * from tempdb..noncat

update t
from tempdb..adamscounts t 
join masteradviewdata..adviewmain cwm on 


/*
update rm set AllOtherParkedCount=x.cnt 
-- select r.retmktid, x.cnt-- to cross check before update
from rm r
inner join 
(
select r.retmktid,count(pagedetailid) as cnt
from masteradviewdata.. masterarchivecategory pdt 
join tempdb..noncat c on pdt.category=c.category
join masteradviewdata..adviewmain cwm on pdt.flyerid=cwm.flyerid and cwm.addate between '7/1/2009' and '6/30/2010'
join rm r on r.retmktid=cwm.retmktid
group by r.retmktid
) x on r.retmktid=x.retmktid


select count(pagedetailid) from masteradviewdata.. masterpagedetailtable pdt 
inner join tempdb..cat c on c.category=pdt.category
inner join masteradviewdata.. adviewmain cwm on pdt.flyerid=cwm.flyerid
where cwm.retmktid=12221

