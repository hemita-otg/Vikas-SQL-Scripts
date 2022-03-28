select * from BeerFMB_CategoryBrand_Master order by category,brand
select * from beerfmb_data order by category,brand
select * from beerfmb_report order by category,brand
select * from BeerFMB_Tab2 order by category,brand


update 
beerfmb_report 
set totalads = t.totalads
from beerfmb_report mm 
join
(select m.category,m.brand,m.comments1,count(pagedetailid) as totalads  
from beerfmb_data  d join beerfmb_report m 
on d.category=m.category and d.brand=m.brand and d.comments1 like '%' + m.comments1 + '%'
group by m.category, m.brand, m.comments1) t
on t.category=mm.category and t.brand=mm.brand and t.comments1=mm.comments1

update 
beerfmb_report 
set Ads_2009 = t.Ads_2009
from beerfmb_report mm 
join
(select m.category,m.brand,m.comments1,count(pagedetailid) as Ads_2009  
from beerfmb_data  d join beerfmb_report m 
on d.category=m.category and d.brand=m.brand and d.comments1 like '%' + m.comments1 + '%'
where year(d.addate)='2009'
group by m.category, m.brand, m.comments1) t
on t.category=mm.category and t.brand=mm.brand and t.comments1=mm.comments1


update 
beerfmb_tab2
set totalads = t.totalads
from beerfmb_tab2 mm 
join
(select m.category,m.brand,count(pagedetailid) as totalads  
from beerfmb_data  d join beerfmb_tab2 m 
on d.category=m.category and d.brand=m.brand 
group by m.category, m.brand) t
on t.category=mm.category and t.brand=mm.brand 



update 
beerfmb_tab2 
set Ads_2009 = t.Ads_2009
from beerfmb_tab2 mm 
join
(select m.category,m.brand,count(pagedetailid) as Ads_2009  
from beerfmb_data  d join beerfmb_tab2 m 
on d.category=m.category and d.brand=m.brand 
where year(d.addate)='2009'
group by m.category, m.brand) t
on t.category=mm.category and t.brand=mm.brand 





select * from beerfmb_report order by category,brand
select * from beerfmb_tab2 order by category,brand
select * from beerfmb_data where category='beer' and brand='Acme California Ales'
select * from beerfmb_tab1_tab2_common where category='beer' and brand='Acme California Ales'

/*delete from beerfmb_tab2
where category+Brand in(
select category+brand from beerfmb_report )
order by 1,2


select * into dbo.beerfmb_tab1_tab2_common
from beerfmb_tab2
where category+Brand in(
select category+brand from beerfmb_report )
order by 1,2
*/


--alter table beerfmb_tab1_tab2_common add Ads2009_Missing integer



update 
beerfmb_tab1_tab2_common 
set TotalAds_Missing = t.TotalAds_Missing
from beerfmb_tab1_tab2_common mm 
join
(select distinct m.category,m.brand,count(pagedetailid) as TotalAds_Missing   
from beerfmb_data  d join beerfmb_report m 
on d.category=m.category and d.brand=m.brand and d.comments1 not like '%' + m.comments1 + '%'
group by m.category, m.brand, m.comments1) t
on t.category=mm.category and t.brand=mm.brand 




/*
select distinct m.category,m.brand,count(pagedetailid) as totalads  
from beerfmb_data  d join beerfmb_report m 
on d.category=m.category and d.brand=m.brand and d.comments1 not like '%' + m.comments1 + '%'
--where m.category='beer' and m.brand='Acme California Ales'
group by m.category, m.brand, m.comments1
order by 1,2
*/



update 
beerfmb_tab1_tab2_common 
set Ads2009_Missing = t.Ads2009_Missing
from beerfmb_tab1_tab2_common mm 
join
(select distinct m.category,m.brand,count(pagedetailid) as Ads2009_Missing    
from beerfmb_data  d join beerfmb_report m 
on d.category=m.category and d.brand=m.brand and d.comments1 not like '%' + m.comments1 + '%'
where year(d.addate)='2009'
group by m.category, m.brand, m.comments1) t
on t.category=mm.category and t.brand=mm.brand 


