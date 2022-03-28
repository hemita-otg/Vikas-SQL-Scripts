--Start : Tab1 --
drop table final10
drop table final11
/*drop table cwm
drop table pdt
drop table table1*/


CREATE TABLE tempdb..[table1] (
                [Retailer] [varchar] (50)  NULL ,
                [Market] [varchar] (50) NULL)



select * from  tempdb..[table1]

--alter table table1 add retmktid int


update table1 set retmktid=c.retmktid from table1 t join masteradviewdata..adviewmain c on c.advertiser=t.retailer and t.market=c.market


select * into tempdb..cwm10 from masteradviewdata..adviewmain where year(addate) in ('2010')
select * into tempdb..cwm11 from masteradviewdata..adviewmain where year(addate) in ('2011')

select distinct c.flyerid,pagedetailid into tempdb..pdt10 
from masteradviewdata..adviewmain c join masteradviewdata..masterpagedetailtable p
on c.flyerid=p.flyerid
where year(c.addate) in ('2010')

select distinct c.flyerid,pagedetailid into tempdb..pdt11 
from masteradviewdata..adviewmain c join masteradviewdata..masterpagedetailtable p
on c.flyerid=p.flyerid
where year(c.addate) in ('2011')
 
drop table final10
drop table final11
drop table final 

select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
count(p.pagedetailid) as [2010pdtcnt],0 as [2011pdtcnt]
into final10 
from tempdb..table1 t join cwm10 c 
on t.retmktid=c.retmktid join pdt10 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * from final10 order by 1,2,5,6,7



select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
0 as [2010pdtcnt],count(p.pagedetailid) as [2011pdtcnt]
into final11 
from tempdb..table1 t join cwm11 c 
on t.retmktid=c.retmktid join pdt11 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * into final_tab1
from 
(select distinct * from final10
union
select distinct * from final11
) x

select distinct * from final_tab1 order by 1,2,5,6,7

--select min(addate),max(addate) from masteradviewdata..adviewmain where advertiser='Beverage Depot' and market='Dallas, TX'

--START : count fonfirm 
select count(pagedetailid) from 
masteradviewdata..adviewmain c join
masteradviewdata..masterpagedetailtable p 
on c.flyerid=p.flyerid and c.retmktid=23025 and c.flyerid='2393567' and c.addate='2010-08-12 00:00:00.000'
--END : count fonfirm 

--END : Tab1 --

--Start : Tab2 --


drop table final10
drop table final11
/*drop table cwm
drop table pdt
drop table table2*/


CREATE TABLE tempdb..[table2] (
                [Retailer] [varchar] (50)  NULL ,
                [Market] [varchar] (50) NULL)



select * from  tempdb..[table2]

--alter table table2 add retmktid int


update table2 set retmktid=c.retmktid from table2 t join masteradviewdata..adviewmain c on c.advertiser=t.retailer and t.market=c.market



select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
count(p.pagedetailid) as [2010pdtcnt],0 as [2011pdtcnt]
into final10 
from tempdb..table2 t join cwm10 c 
on t.retmktid=c.retmktid join pdt10 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * from final10 order by 1,2,5,6,7



select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
0 as [2010pdtcnt],count(p.pagedetailid) as [2011pdtcnt]
into final11 
from tempdb..table2 t join cwm11 c 
on t.retmktid=c.retmktid join pdt11 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * into final_tab2
from 
(select distinct * from final10
union
select distinct * from final11
) x

select distinct * from final_tab2 order by 1,2,5,6,7

--select min(addate),max(addate) from masteradviewdata..adviewmain where advertiser='Beverage Depot' and market='Dallas, TX'

--START : count fonfirm 
select count(pagedetailid) from 
masteradviewdata..adviewmain c join
masteradviewdata..masterpagedetailtable p 
on c.flyerid=p.flyerid and c.retmktid=22816 and c.flyerid='2164831' and c.addate='2010-03-03 00:00:00.000'
--END : count fonfirm 

--END : Tab2 --

--Start : Tab3 --

drop table final10
drop table final11
/*drop table cwm
drop table pdt
drop table table3*/


CREATE TABLE tempdb..[table3] (
                [Retailer] [varchar] (50)  NULL ,
                [Market] [varchar] (50) NULL)



select * from  tempdb..[table3]

--alter table table3 add retmktid int


update table3 set retmktid=c.retmktid from table3 t join masteradviewdata..adviewmain c on c.advertiser=t.retailer and t.market=c.market



select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
count(p.pagedetailid) as [2010pdtcnt],0 as [2011pdtcnt]
into final10 
from tempdb..table3 t join cwm10 c 
on t.retmktid=c.retmktid join pdt10 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * from final10 order by 1,2,5,6,7



select  c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate,
0 as [2010pdtcnt],count(p.pagedetailid) as [2011pdtcnt]
into final11 
from tempdb..table3 t join cwm11 c 
on t.retmktid=c.retmktid join pdt11 p
on c.flyerid=p.flyerid --and year(c.addate) in ('2010','2011')
group by c.advertiser,t.market,t.retmktid,c.flyerid,c.publication,c.media,c.addate


select * into final_tab3
from 
(select distinct * from final10
union
select distinct * from final11
) x

select distinct * from final_tab3 order by 1,2,5,6,7

--select min(addate),max(addate) from masteradviewdata..adviewmain where advertiser='Beverage Depot' and market='Dallas, TX'

--START : count fonfirm 
select count(pagedetailid) from 
masteradviewdata..adviewmain c join
masteradviewdata..masterpagedetailtable p 
on c.flyerid=p.flyerid and c.retmktid=18 and c.flyerid='2151444' and c.addate='2010-03-05 00:00:00.000'
--END : count fonfirm 






--END : Tab3 --


--Start : Export to excel


select distinct * from final_tab1 order by 1,2,5,6,7

select distinct * from final_tab2 order by 1,2,5,6,7

select distinct * from final_tab3 order by 1,2,5,6,7

--Start : Export to excel