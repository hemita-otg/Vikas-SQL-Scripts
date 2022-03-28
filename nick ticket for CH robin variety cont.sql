--select * into tempdb..N from robin.acfv.dbo.variety_missing where mpvvariety_parent is not null


select * from tempdb..n

select distinct category,count(pagedetailid) from chrPePDetailReports where originalpagedetailid in (select top_parent_i from tempdb..n)
group by category 
order by 1 





WITH 
T AS (select category, count(*) as Variety from MT2BU3.sql13.dbo.chrpepdetailreports Group by category ),
f AS (select category, count(*) as Variety from MT2BU3.sql13.dbo.chrpepdetailreports where  mpvvariety is not NULL Group by category ),
b AS (select category, count(*) as Variety from MT2BU3.sql13.dbo.chrpepdetailreports where  mpvvariety is  NULL Group by category)
select t.category,t.variety,f.variety,b.variety from f join b on f.category=b.category 
join t on t.category=b.category 
order by 1 desc 



WITH 
T AS (select category, count(*) as Variety from MT2SQL13.sql13.dbo.chrpepdetailreports Group by category ),
f AS (select category, count(*) as Variety from MT2SQL13.sql13.dbo.chrpepdetailreports where  mpvvariety is not NULL Group by category ),
b AS (select category, count(*) as Variety from MT2SQL13.sql13.dbo.chrpepdetailreports where  mpvvariety is  NULL Group by category)
select t.category,t.variety,f.variety,b.variety from f join b on f.category=b.category 
join t on t.category=b.category 
order by 1 desc 

select * into sql13..chrpepdetailreports_previousday from  MT2BU3.sql13.dbo.chrpepdetailreports 