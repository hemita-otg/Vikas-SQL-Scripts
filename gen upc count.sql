Use Sql06

select * from genupc

select * from genupcpdt p join genupc u
on p.category=u.category and p.brand=u.brand and p.comments1=u.pd


update p
set skutype=u.upc
from genupcpdt p join genupc u
on p.category=u.category and p.brand=u.brand and p.comments1=u.pd


select count(*) from genupcpdt
select count(*) from genupcpdt where isnull(skutype,'')<>''
select count(*) from genupcpdt where manufacturer='general mills'
select count(*) from genupcpdt where manufacturer='general mills' and  isnull(skutype,'')=''
select count(*) from genupcpdt where manufacturer='general mills' and isnull(skutype,'')<>''



select count(*) from genupcpdt where isnull(skutype,'')<>'' and features like '%front page%'
select count(*) from genupcpdt where isnull(skutype,'')='' and features like '%front page%'


select * from genupcpdt


select count(*) from genupcpdt where isnull(skutype,'')<>'' and features like '%front page%' and manufacturer='general mills'
select skutype,features from genupcpdt where isnull(skutype,'')='' and features like '%front page%'
