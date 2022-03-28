/*

select * from masterentrycwm where entryprojectid=6

insert into tempdb..tempretmkt
select advertiser,market from masterclientcoverage..retmkt
where retmktid in 
(select retmktid from masterclientcoverage..masterentrycwm) order by 1,2-- where entryprojectid=6)


select * from entryproject

insert into tempdb..tempcat
select distinct category from mt2sql00.entrydata.dbo.JaAllDisplayCategory
where categorygroup in ( 'Home/Clothing', 'Service/Promotions', 'Auto/Hardware/Outdoor', 'Electronics/Toys')

*/


create table tempdb..RetMktCat
(
Retailer varchar(100),
Market varchar(50),
Category varchar(50),
DetailCnt int,
Pep int,
Cok int,
Gen int,
Pg int, 
sup int
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


select * from tempdb..tempretmkt
select * from tempdb..tempcat

select * from tempdb..retmktcat
select top 5 * from tempdb..masterretmktcat



/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterRetMktCat from 
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate) = '2009'
*/


/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterFSIRetMktCat 
from  adviewmain  cwm with (nolock) 
join masterfsipagedetailtable  pdt with (nolock)on cwm.flyerid=pdt.flyerid and
year(cwm.addate) = '2009'
*/


select top 5 * from tempdb..MasterRetMktCat

select min(addate),max(addate) from tempdb..masterretmktcat

/*
insert into tempdb..retmktcat 
select distinct advertiser,m.market,c.category,0,0,0,0,0,0 
from tempdb..masterretmktcat m 
join tempdb..tempretmkt rm on m.advertiser=rm.retailer and m.market=rm.market 
join tempdb..tempcat c on m.category=c.category
*/

/*
insert into tempdb..retmktcat 
select distinct advertiser,m.market,c.category,0,0,0,0,0,0,null,null
from tempdb..masterFSIretmktcat m 
join tempdb..tempretmkt rm on m.advertiser=rm.retailer and m.market=rm.market 
join tempdb..tempcat c on m.category=c.category
*/

select * from tempdb..RetMktCat order by 1,2,3

/*
update tempdb..retmktcat 
set DetailCnt= m.cnt
from tempdb..retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from tempdb..masterretmktcat where year(addate)='2009'
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


--Alter table tempdb..retmktcat add RetMktId int 

/*
update tempdb..retmktcat 
set RetMktId= m.RetMktId
from tempdb..retmktcat rmc 
join (select advertiser,market,RetMktId from masterclientcoverage..retmkt
where retmktid in 
(select retmktid from masterclientcoverage..masterentrycwm)) m on 
rmc.retailer=m.advertiser and rmc.market=m.market 


*/



select * from tempdb..retmktcat

--Alter Table tempdb..retmktcat add FSICnt int


/*
update tempdb..retmktcat 
set FSICnt= m.cnt
from tempdb..retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt,retmktid 
	from adviewmain  cwm with (nolock) join 
	masterfsipagedetailtable pdt with (nolock)
	on cwm.flyerid=pdt.flyerid  where year(addate)='2009'
	group by advertiser,market,category,retmktid) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/


/*

update tempdb..retmktcat 
set sup= m.present
from tempdb..retmktcat rmc 
join (select A.retmktid,A.Category,1 as present from
	mt2sql00.tempdb.dbo.tmpretmktcat A join
	tempdb..retmktcat B on A.Retmktid= B.Retmktid  and A.category=B.category where A.categorycodeid=969
	) m on 
rmc.retmktid=m.retmktid and rmc.category=m.category
*/

--update tempdb..retmktcat set pep=0,cok=0,gen=0,sup=0,pg=0 

/*
update tempdb..retmktcat 
set pg= m.present
from tempdb..retmktcat rmc 
join (select A.retmktid,B.Category,1 as present from
	sql02..fsidetailchildwebmain A  join
	tempdb..retmktcat R on A.Retmktid=R.Retmktid join 
	mt2sql00.tempdb.dbo.tmpfsicat B on R.category=b.category and B.categorycodeid=245	
	) m on 
rmc.retmktid=m.retmktid and rmc.category=m.category
*/

select top 1 * from mt2sql00.tempdb.dbo.tmpretmktcat
select top 1 * from mt2sql00.tempdb.dbo.tmpfsicat

--pep 305
--ccc 161
--gen 258
--pg 320
--sup 969
232	45	FSIGEN
245	3	FSIPNG

/*
update tempdb..retmktcat 
set gen= m.present
from tempdb..retmktcat rmc 
join (select A.retmktid,B.Category,1 as present
	from sql02..fsidetailchildwebmain A  join 
	mt2sql00.masterclientcoverage.dbo.retmktcattable B 
	on A.Retmktid=B.RetMktId join
	tempdb..retmktcat R on R.Retmktid= A.Retmktid  and B.category=R.category where A.categorycodeid=232
	) m on 
rmc.retmktid=m.retmktid and rmc.category=m.category
*/

232	45	FSIGEN
245	3	FSIPNG


select top 5 * from mt2sql00.masterclientcoverage.dbo.masterclientcwm

select top 5 * from mt2sql00.masterclientcoverage.dbo.retmktcattable

select * from tempdb..retmktcat 
--pep 305
--ccc 161
--gen 258
--pg 320
--sup 969

select * from sql02..fsidetailchildwebmain where retmktid in 
(select distinct retmktid from tempdb..retmktcat)

select * from Mt2SQL02.tempdb.dbo.retmktcat where --fsicnt is not null and 
not (pep =0 and cok=0 and gen=0 and pg=0 and sup=0)


select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid from
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate) = '2009' and cwm.advertiser='A & P' and cwm.market='New York, NY' and pdt.category='Drinks - Sodas'



/*

update tempdb..retmktcat 
set FSICnt= m.cnt
from tempdb..retmktcat rmc 
join (select  advertiser,market,category,count(pagedetailid) as cnt
	from adviewmain  cwm with (nolock) join 
	masterfsipagedetailtable pdt with (nolock)
	on cwm.flyerid=pdt.flyerid  where year(addate)='2009'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category

*/


select count(*) from mt2sql03.sql03.dbo.FSIPNGpagedetailtable
select count(*) from mt2sql03.sql03.dbo.PGCORPpagedetailtable
select count(*) from mt2sql06.sql06.dbo.PEPpagedetailtable
select count(*) from mt2sql06.sql06.dbo.GENpagedetailtable
select count(*) from mt2sql06.sql06.dbo.FSIGENpagedetailtable
select count(*) from mt2sql07.sql07.dbo.CCCpagedetailtable
select count(*) from MT2SQL07.sql07.dbo.svlpagedetailtable