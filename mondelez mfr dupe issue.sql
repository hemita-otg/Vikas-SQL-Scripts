select category,brand,manufacturer,count(1) from moncaDetailReports where manufacturer like '%mondel%'
group by category,brand,manufacturer
order by category,brand,manufacturer


select category,brand,manufacturer,count(1) from masteradviewdata..MasterPageDetailTable where manufacturer like '%mondel%'
group by category,brand,manufacturer
order by category,brand,manufacturer


select category,brand,manufacturer,count(1) from moncaDetailReports where manufacturer like '%nestle%'
group by category,brand,manufacturer
order by category,brand,manufacturer


select category,brand,manufacturer,count(1) from masteradviewdata..MasterPageDetailTable where manufacturer like '%nestle%'
group by category,brand,manufacturer
order by category,brand,manufacturer