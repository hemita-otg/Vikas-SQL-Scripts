use sql03

select * from tempdb..tempRetMkt
select * from tempdb..tempcat
select * from tempdb..RetMktCat

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


create table tempdb..tempCat1
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


select * from tempdb..RetMktCat order by 1,2,3
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




insert into tempcat1
select category from tempcat where category not in (
'Cocktails',
'Drink Mixes/Garnish',
'LABs'
)

select * from tempcat1

/*

select distinct retailer,market,category,0 as PDTCount into tempdb..retmktcat1 from 
tempretmkt  cross join tempcat1
*/

select * from RetMktCat order by 1,2,3

/*
update retmktcat1
set PDTCount= m.cnt
from retmktcat1 rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where addate > = '03/01/2010'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


select * from retmktcat1


select category into tempdb..tempcat2 from tempcat where category  in (
'Cocktails',
'LABs'
)

select * from tempcat2

/*

select distinct retailer,market,category,0 as PDTCount into tempdb..retmktcat2 from 
tempretmkt  cross join tempcat2
*/

select * from RetMktCat order by 1,2,3

/*
update retmktcat2
set PDTCount= m.cnt
from retmktcat2 rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where addate > = '03/01/2010'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


select * from retmktcat2




select category into tempdb..tempcat3 from tempcat where category  in (
'Drink Mixes/Garnish'
)

select * from tempcat3

/*

select distinct retailer,market,category,0 as PDTCount into tempdb..retmktcat3 from 
tempretmkt  cross join tempcat3
*/

select * from RetMktCat order by 1,2,3

/*
update retmktcat3
set PDTCount= m.cnt
from retmktcat3 rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where addate > = '03/01/2010'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


select * from retmktcat3

