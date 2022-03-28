use sql02

PDTJuly2010Cnt

select * from TCR0709vs0710 where ytd2010cnt=0 and pdtjuly2010cnt <> 0 

--update TCR0709vs0710 set PDTJuly2010Cnt=0

alter table TCR0709vs0710 add x2010cnt int
--update TCR0709vs0710 set x2010cnt=0

update TCR0709vs0710 set PDTJuly2010Cnt=x.pdtcount
from 
(select retmktid,category,count(pagedetailid) as pdtcount
from masteradviewdata..adviewmain a join masteradviewdata..masterpagedetailtable m
on a.flyerid=m.flyerid and month(a.addate)=7 and year(a.addate)='2010'
group by retmktid,category
) x join
TCR0709vs0710 t on t.retmktid=x.retmktid and x.category=t.category




update TCR0709vs0710 set YTD2010Cnt=x.pdtcount
from 
(select retmktid,category,count(pagedetailid) as pdtcount
from masteradviewdata..adviewmain a join masteradviewdata..masterpagedetailtable m
on a.flyerid=m.flyerid and  year(a.addate)='2010'
group by retmktid,category
) x join
TCR0709vs0710 t on t.retmktid=x.retmktid and x.category=t.category


select retailer,market,category,ytd2010cnt,x2010cnt from TCR0709vs0710 where ytd2010cnt=0 and pdtjuly2010cnt <> 0 


alter table TCR0709vs0710 drop column x2010cnt