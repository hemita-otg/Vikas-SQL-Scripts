--run on mt2sql04..sql04

drop table tempdb..c

select distinct category,comments1,mpvvariety,count(mpvvariety) cnt
into tempdb..c
 from carg50DetailReports where isnull(expanded,0)=0 and category in 
('Fr. Meat','Fr. Poultry','Meat - Beef - Butcher Block', 'Meat - Beef - Retail Ready', 'Meat - Chicken - Retail Ready', 'Meat - Pork - Retail Ready','Meat - Beef - Butcher Block', 'Meat - Beef - Ground', 'Meat - Beef - Retail Ready',
'Meat - Chicken', 'Meat - Chicken - Retail Ready','Meat - Pork', 'Meat - Pork - Ground', 'Meat - Pork - Retail Ready') 
group by category,comments1,mpvvariety
having count(mpvvariety) >= 1 and mpvvariety =''

/*

select  distinct category,comments1,mpvvariety   from carg50DetailReports where category='Fr. meat' and comments1='2 lb, patty, angus bf'
select distinct category,comments1,mpvvariety from tempdb..c where category='Fr. meat' and comments1='2 lb, patty, angus bf'
select distinct category,comments1,mpvvariety from tempdb..c1 where category='Fr. meat' and comments1='2 lb, patty, angus bf'

select distinct category,comments1,mpvvariety from  tempdb..c 
*/

drop table tempdb..c1
select distinct d.category,d.comments1,d.mpvvariety into tempdb..c1  from carg50DetailReports d  join  tempdb..c on d.category=c.Category and d.comments1=c.Comments1 and isnull(d.mpvvariety,'')<>''
/*
select * from tempdb..c1
select distinct d.category,d.comments1,d.mpvvariety,c1.mpvvariety  from carg50DetailReports d  join  tempdb..c1 on d.category=c1.Category and d.comments1=c1.Comments1 and isnull(d.mpvvariety,'') =''
*/
update d set mpvvariety=c1.mpvvariety from carg50DetailReports d  join  tempdb..c1 on d.category=c1.Category and d.comments1=c1.Comments1 and isnull(d.mpvvariety,'') =''

