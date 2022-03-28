/*

select * from masterentrycwm where entryprojectid=6

select advertiser,market from retmkt
where retmktid in 
(select retmktid from masterentrycwm where entryprojectid=6)


select * from entryproject

select * from entrydata..JaAllDisplayCategory
where categorygroup in ( 'Home/Clothing', 'Service/Promotions', 'Auto/Hardware/Outdoor', 'Electronics/Toys')

*/


create table tempdb..RetMktCat
(
Retailer varchar(100),
Market varchar(50),
Category varchar(50),
Count08 int,
Count09 int
)


create table tempdb..tempRetMkt
(
Retailer varchar(100),
Market varchar(50)

)


create table tempdb..tempCat
(

Category varchar(50)

)


select * from tempretmkt
select * from tempcat

select * from retmktcat




/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterRetMktCat from 
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate) >= '2008' and year(cwm.addate) <= '2009'
*/


select * from tempdb..MasterRetMktCat

select min(addate),max(addate) from masterretmktcat

/*
insert into retmktcat 
select distinct advertiser,m.market,c.category,0,0 from masterretmktcat m join 
tempretmkt rm on m.advertiser=rm.retailer and m.market=rm.market join
tempcat c on m.category=c.category
*/


select * from RetMktCat order by 1,2,3

/*
update retmktcat 
set count09= m.cnt
from retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where year(addate)='2009'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/

/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
 from 
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate) >= '2008' and year(cwm.addate) <= '2009'
and advertiser='Target' and market='Detroit, MI' and category='PDAs'
*/