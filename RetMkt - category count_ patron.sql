create table tempdb..RetMktCat
(
Retailer varchar(100),
Market varchar(50),
State varchar(50),
Category varchar(50),
PDTCount int
)


create table tempdb..tempRetMkt
(
Retailer varchar(100),
Market varchar(50),
State varchar(50)
)


create table tempdb..tempCat
(

Category varchar(50)

)


select * from tempretmkt
select * from tempcat

select * from tempdb..retmktcat

--Insert into tempretmkt
select distinct advertiser,market from sql03..AdviewMain 

--Insert into tempcat
select distinct category from sql03..MasterPageDetailTable
 
/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterRetMktCat from 
AdviewMain  cwm with (nolock) join 
MasterPageDetailTable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
cwm.addate between '03/01/2010' and '10/31/2010'
*/

--drop table tempdb..MasterRetMktCat 
select * from tempdb..MasterRetMktCat

select min(addate),max(addate) from tempdb..masterretmktcat

/*
insert into tempdb..retmktcat 
select distinct retailer,market,state,category,0 from 
tempdb..tempretmkt  cross join tempdb..tempcat
*/
--delete from tempdb..retmktcat 
select * from tempdb..RetMktCat order by 1,2,3
update tempdb..retmktcat set pdtcount=0
/*
update retmktcat 
set PDTCount= m.cnt
from retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from masterretmktcat where addate between '03/01/2010' and '10/01/2010'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


select * from RetMktCat order by 1,2,3
select * from tempcat
/*
select distinct tradeclass,advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
 from 
AdviewMain  cwm with (nolock) join 
MasterPageDetailTable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
cwm.addate between '03/01/2010' and '10/01/2010'
and advertiser='67 Wine & Spirits' and market='Miami, FL' and category='vodka'
*/



select distinct category from masterpagedetailtable where category like '%cock%' order by 1 desc


select * from tempdb..tempretmkt

--alter table RetMktCat add Tradeclass varchar(50)

update RetMktCat set tradeclass=a.tradeclass 
from masteradviewdata..adviewmain a join retmktcat r on a.advertiser=r.retailer and a.market=r.market


select distinct retailer,market from retmktcat where tradeclass is  null and pdtcount = 0

select * from retmktcat

select distinct advertiser,market from adviewmain where advertiser in 
('3rd Base Discount Beverag',
'Ballpark Liquors',
'Discount Liquor',
'El Patron Liq & Sport Bar',
'Everetts Wines Spirits',
'Golden Ox Liquors',
'Jessies Liquors',
'Nicolas',
'One Stop Smokers Shop',
'Star Liquors',
'Tcs Liquor & Smoke Shops',
'The Liquor Store',
'Town & Country Beverage Mart',
'Westmore-ABC Group')


select AVTradeclass, * from retmkt a join mastertradeclass b on a.retid=b.retid join tblavtradeclass c on b.avtcid = c.avtcid 
where advertiser = 'One Stop Smokers Shop'
