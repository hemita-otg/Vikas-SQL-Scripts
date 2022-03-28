select distinct category from TempACFVDetailReports  where category like '%frozen%' order by 1 


select distinct category from sql03..ACFVDetailReports  where category like '%frozen%'

select distinct category from mt2sql16.sql16.dbo.acfvdisquerypage  where category like '%frozen%'


select category,count(1) from mt2sql16.sql16.dbo.acfvdetailreports where category in ('Frozen Prepared Food','Frozen Desserts','Frozen Dinners&Entrees','Frozen Dough&Baked Goods','Frozen Meat-Prepared','Frozen Pasta','Frozen Poultry','Frozen Poultry-Prepared','Frozen Sandwiches&Pockets','Frozen Seafood-Prepared','Frozen Side Dishes','Frozen Snacks','Frozen Stir Fry&Skillet Meals')
group by category
order by 1 

select category,count(1) from mt2bu1.sql16.dbo.acfvdetailreports where category in ('Frozen Prepared Food','Frozen Desserts','Frozen Dinners&Entrees','Frozen Dough&Baked Goods','Frozen Meat-Prepared','Frozen Pasta','Frozen Poultry','Frozen Poultry-Prepared','Frozen Sandwiches&Pockets','Frozen Seafood-Prepared','Frozen Side Dishes','Frozen Snacks','Frozen Stir Fry&Skillet Meals')
group by category
order by 1 


select originalpagedetailid,pagedetailid  from mt2sql16.sql16.dbo.acfvdetailreports  where category ='Frozen Prepared Food'
group by Category, Brand, comments3
order by Category, Brand, comments3


select Category, Brand, comments3, count(pagedetailid) from mt2bu1.sql16.dbo.acfvdetailreports  where category ='Frozen Prepared Food'
group by Category, Brand, comments3
order by Category, Brand, comments3