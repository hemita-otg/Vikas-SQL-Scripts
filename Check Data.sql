---- CHECK ON CLIENT

with 
f as ( select * from kcprflyerreports ) , 
d as (select * from kcprDetailReports   )
select d.Advertiser,d.market,d.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by d.Advertiser,d.market,d.AdDate
GO 

select * from kcprflyerreports
where flyerid in ('9404352')


select * from Masterclientcoverage..TEMPJAPageDetailTable 
where flyerid in ('9404352')

select distinct category from kcprDisquerypage order by 1 

---- CHECK ON MAD

select * from MasterAdviewData..AdviewMain where flyerid in ('9404352')


select flyerid,count(pagedetailid) from MasterAdviewData..MasterPageDetailTable 
where flyerid in ('9404352')
group by flyerid 

select distinct category  from MasterAdviewData..MasterPageDetailTable 
where flyerid in ('9404352')
order by 1 


with 
f as ( select * from MasterAdviewData..AdviewMain ) , 
d as (select * from MasterAdviewData..MasterPageDetailTable   )
select f.Advertiser,f.market,f.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by f.Advertiser,f.market,f.AdDate
GO 

---- CHECK ON PRD

select * from MT2SQL11.SQL11.dbo.Prod50FlyerReports where flyerid in ('9404352')

with 
f as ( select * from MT2SQL11.SQL11.dbo.Prod50FlyerReports  ) , 
d as (select * from MT2SQL11.SQL11.dbo.PRD150DetailReports    )
select f.Advertiser,f.market,f.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by f.Advertiser,f.market,f.AdDate
GO 


with 
f as ( select * from MT2SQL11.SQL11.dbo.Prod50FlyerReports  ) , 
d as (select * from MT2SQL11.SQL11.dbo.PRD250DetailReports    )
select f.Advertiser,f.market,f.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by f.Advertiser,f.market,f.AdDate
GO 



with 
f as ( select * from MT2SQL11.SQL11.dbo.Prod50FlyerReports  ) , 
d as (select * from MT2SQL11.SQL11.dbo.PRD350DetailReports    )
select f.Advertiser,f.market,f.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by f.Advertiser,f.market,f.AdDate
GO 



with 
f as ( select * from MT2SQL11.SQL11.dbo.Prod50FlyerReports  ) , 
d as (select * from MT2SQL11.SQL11.dbo.PRD450DetailReports    )
select f.Advertiser,f.market,f.AdDate ,COUNT(pagedetailid) from f join d on f.FlyerID=d.FlyerId 
where d.flyerid in ('9404352')
group by f.Advertiser,f.market,f.AdDate
GO 
---- CHECK ON PRD