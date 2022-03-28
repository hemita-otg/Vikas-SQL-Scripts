 select top 100 *from AdViewMain 
 
select * into tempdb..CWM from adviewmain where retmktid in 
(78,
4475,
6086,
7492,
7494,
8322,
18332,
12246)
 
 
 
  select FlyerId,PageDetailID,Category,Page  into tempdb..pdt from MasterPageDetailTable 
  where flyerid in (select flyerid from tempdb..CWM)
  
  insert into tempdb..pdt
  select FlyerId,PageDetailID,Category,Page from FVHistory..FVHistoryPageDetailTable  
  where flyerid in (select flyerid from tempdb..CWM)
  
  
  
  select top 10 * from tempdb..cwm
  select top 10  * from tempdb..pdt 
  
  
  
  
  
  
  select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2008
from cwm c join pdt p on c.flyerid=p.flyerid
 where convert(date,c.addate) between '2008-07-01'  and   '2009-06-30'


select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2014
from cwm c join pdt p on c.flyerid=p.flyerid and convert(date,c.addate) between '2013-07-01' and '2014-07-30'

select distinct advertiser,market from data2008 
select distinct advertiser,market from data2014


SELECT *
FROM (
    SELECT 
        category,advertiser,market,year(addate) as [year],left(datename(month,addate),3)as [month], 
        page as page 
    FROM data2008 where page=1
) as s
PIVOT
(
    count(page)
    FOR [month] IN (jan, feb, mar, apr,     may, jun, jul, aug, sep, oct, nov, dec)
)AS x



select * from data2008 where category='beer' and page=1 
select * from data2014 where category='beer' order by 3,4



  select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2008
from tempdb..cwm c join tempdb..pdt p on c.flyerid=p.flyerid
 where convert(date,c.addate) between '2008-01-01'  and   '2008-12-31'



  select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2009
from tempdb..cwm c join tempdb..pdt p on c.flyerid=p.flyerid
 where convert(date,c.addate) between '2009-01-01'  and   '2009-12-31'

select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2010
from tempdb..cwm c join tempdb..pdt p on c.flyerid=p.flyerid
 where convert(date,c.addate) between '2010-01-01'  and   '2010-12-31'


select c.flyerid,pagedetailid,advertiser,market,addate,category,page into tempdb..data2013
from tempdb..cwm c join tempdb..pdt p on c.flyerid=p.flyerid
 where convert(date,c.addate) between '2013-01-01'  and   '2013-12-31'
 
 select * from mt2sql00.tempdb.dbo.data2008 
 select * from mt2sql00.tempdb.dbo.data2009
 select * from mt2sql00.tempdb.dbo.data2010 
 select * from mt2sql00.tempdb.dbo.data2013 
