--FTFVChildwebmain
--FTFVPagedetailtable

--any 2009 records in the cwm that have the same advertiser, market, addate(+/- 1)


select count(*) from FTFVChildwebmain
select count(*) from FTFVPagedetailtable

select distinct advertiser,market,addate from FTFVChildwebmain


SELECT  distinct a.advertiser,a.market,a.addate, b.advertiser,b.market,b.addate
FROM FTFVChildwebmain a join FTFVChildwebmain b on
a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
and year(a.addate)='2009'
order by 1,2,3
--order by 1,4,2,5,3,6
--GROUP BY advertiser,market,addate
--HAVING ( COUNT(advertiser) > 1 and COUNT(market) > 1 and COUNT(addate )


SELECT advertiser+market+addate, 
 COUNT(advertiser) AS advertiser_count,market,COUNT(market) AS market_count
FROM FTFVChildwebmain
GROUP BY advertiser,market
HAVING ( COUNT(advertiser) > 1 and count(market) > 1)



SELECT distinct a.flyerid,a.advertiser,a.market,a.addate,
		b.flyerid,b.advertiser,b.market,b.addate,datediff(d,a.addate, b.addate)
FROM FTFVChildwebmain a join FTFVChildwebmain b on
a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
and year(a.addate)='2009'
order by 2,3,4

SELECT distinct a.flyerid,a.advertiser,a.market,a.addate,
		b.advertiser,b.market,b.addate,datediff(d,a.addate, b.addate)
FROM FTFVChildwebmain a join 
	(SELECT  distinct a.advertiser, a.market, a.addate
	FROM FTFVChildwebmain a 
	where year(a.addate)='2009' 
	group by a.advertiser, a.market, a.addate
	having count(*)>1) b
on a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
order by 2,3,4

/*

select a.flyerid,a.advertiser,a.market,a.addate,b.flyerid,b.addate,datediff(d,a.addate, b.addate) from FTFVChildwebmain a join FTFVChildwebmain b on
a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
and year(a.addate)='2009' and a.addate > b.addate
order by 2,3,4


--select * into FTFVChildwebmain_020310 from FTFVChildwebmain

--delete from FTFVChildwebmain where flyerid in(
select a.flyerid from FTFVChildwebmain a join FTFVChildwebmain b on
a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
and year(a.addate)='2009' and a.addate > b.addate
)

*/

insert into ftfvreport
SELECT distinct a.flyerid,a.advertiser,a.market,a.addate,
		b.advertiser,b.market,b.addate,datediff(d,a.addate, b.addate) ,0
FROM FTFVChildwebmain a join 
	(SELECT  distinct a.advertiser, a.market, a.addate
	FROM FTFVChildwebmain a 
	where year(a.addate)='2009' 
	group by a.advertiser, a.market, a.addate
	having count(*)>1) b
on a.advertiser=b.advertiser and a.market=b.market and datediff(d,a.addate, b.addate) between -1 and 1
order by 2,3,4

/*
create table ftfvreport
(a_flyerid  varchar(15)
 ,a_advertiser  varchar(35),a_market  varchar(35),a_addate datetime,
		b_advertiser  varchar(35),b_market varchar(35),b_addate datetime ,datedifference  int,
PDTCount  int
)*/

insert into ftfvreport
select r.a_flyerid,r.a_advertiser,r.a_market,r.a_addate,
		r.b_advertiser,r.b_market,r.b_addate,r.datedifference,count(pdt.pagedetailid) from ftfvreporttemp r join ftfvpagedetailtable pdt on
r.a_flyerid=pdt.flyerid
group by r.a_flyerid,r.a_advertiser,r.a_market,r.a_addate,
		r.b_advertiser,r.b_market,r.b_addate,r.datedifference
order by 2,3,4

--select * into dbo.ftfvreporttemp from ftfvreport

select * from ftfvreport order by 2,3,4
