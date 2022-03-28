create table tempdb..RetMktCat
(
Retailer varchar(100),
Market varchar(50),
Category varchar(50),
PDTCount int
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

select * from tempdb..retmktcat

--Insert into tempretmkt
select distinct advertiser,market from sql03..BFCChildWebMain 

--Insert into tempcat
select distinct category from sql03..BFCPageDetailTable
 
/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterRetMktCat from 
BFCChildWebMain  cwm with (nolock) join 
BFCPageDetailTable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
cwm.addate > = '03/01/2010'
*/


select * from tempdb..MasterRetMktCat

select min(addate),max(addate) from tempdb..masterretmktcat

/*
insert into tempdb..retmktcat 
select distinct retailer,market,category,0 from 
tempretmkt  cross join tempcat
*/

select * from RetMktCat order by 1,2,3

/*
update retmktcat 
set PDTCount= m.cnt
from retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where addate > = '03/01/2010'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


select * from RetMktCat order by 1,2,3
select * from tempcat
/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
 from 
SQl03..BFCChildWebMain  cwm with (nolock) join 
SQL03..BFCPageDetailTable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
cwm.addate > = '03/01/2010'
and advertiser='21st Amendment Wine & Spirits' and market='IN, Indianapolis' and category='Brandy'
*/