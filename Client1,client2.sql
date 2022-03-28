use tempdb
select clientname from mt2sql04.subscription.dbo.clientprofile where clientid in (
select distinct clientid from tempdb..tmpretmktcat where  retmktid=533 and category ='Fr. Single Srv Entrée'
)

update julytojuly set category='Fr. Fam Size Entrée' 
where category='Fr. Fam Size EntrTe' and clientcount=1 and client1 is null

Fr. Fam Size EntrTe
Fr. Single Srv EntrTe

Fr. Fam Size Entrée


select distinct category from julytojuly where clientcount=1 and client1 is null


update j set client1=x.clientname
from julytojuly j join 
(select p.clientname,j.retmktid,j.category from julytojuly j join tmpretmktcat t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
where j.clientcount=1
) x on j.retmktid=x.retmktid and j.category=x.category


select *  from julytojuly 
where clientcount=2
group by retmktid,cateogry 
order by 

select distinct retmktid,category,clientcount,clientid into tmpsource2 from tmpretmktcat where clientcount =2 

select * from tmpsource2 where clientcount=2 and retmktid=19163 and category='Bar Soap' order by 1,2,3
select * from julytojuly where clientcount=2 and retmktid=19163 and category='Bar Soap'

update j set client2=x.clientname
from julytojuly j join 
(select max(p.clientname) as ClientName,j.retmktid,j.category from julytojuly j join tmpsource2 t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
group by j.retmktid,j.category
--where j.clientcount=2
) x on j.retmktid=x.retmktid and j.category=x.category
where j.clientcount=2



select clientname from mt2sql04.subscription.dbo.clientprofile where clientid in 
(select * from tmpsource2 where clientcount=2 and retmktid=533 and category='Canned Vegetables' )
select * from julytojuly where clientcount=2 and retmktid=533 and category='Canned Vegetables'

select distinct  category from julytojuly where clientcount=2 and (client1 is null or client2 is null)

select * from tmpretmktcat where clientcount=2 and retmktid=533 and category='Canned Vegetables'

select retmktid,* from tmpretmktcat where category ='Canned Vegetables'  and retmktid=533
select * from julytojuly where category ='Canned Vegetables'  and retmktid=533




select distinct retmktid,category,clientcount,clientid into tmpsource3 from tmpretmktcat where clientcount =3



update j set client1=x.clientname
from julytojuly j join 
(select min(p.clientname) as ClientName,j.retmktid,j.category from julytojuly j join tmpsource3 t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
group by j.retmktid,j.category
--where j.clientcount=2
) x on j.retmktid=x.retmktid and j.category=x.category
where j.clientcount=3


update j set client1=x.clientname
from julytojuly j join 
(select min(p.clientname) as client1,max(p.clientname) as client2,j.retmktid,j.category from julytojuly j join tmpsource3 t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
group by j.retmktid,j.category
order by 3,4
--where j.clientcount=2
) x on j.retmktid=x.retmktid and j.category=x.category
where j.clientcount=3

select * from julytojuly where retmktid=1334 and category='Batteries'

1690
Cakes - Bakery	

select min(p.clientname) as client1,max(p.clientname) as client2,j.retmktid,j.category,j.clientcount
 from julytojuly j join tmpretmktcat t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
group by j.retmktid,j.category,j.clientcount
having j.clientcount < 4
order by 3,4,5





select min(p.clientname) as client1,max(p.clientname) as client2,j.retmktid,j.category,j.clientcount,p.clientname 
into tempclient
from julytojuly j join tmpretmktcat t on
j.retmktid=t.retmktid and j.category=t.category
join mt2sql04.subscription.dbo.clientprofile p on 
t.clientid=p.clientid 
group by j.retmktid,j.category,j.clientcount,p.clientname
having j.clientcount =3 
order by 3,4,5,6

--drop table tempclient

select min(clientname) clientname,retmktid,category,clientcount into tempdel from 
tempclient
group by retmktid,category,clientcount

insert into tempdel
select max(clientname) clientname,retmktid,category,clientcount  from 
tempclient
group by retmktid,category,clientcount


select * from tempclient
where cast(retmktid as varchar(50))+category+cast(clientcount as varchar(25))+clientname not in 
(
select cast(retmktid as varchar(50))+category+cast(clientcount as varchar(25))+clientname from tempdel
)
order by 3,4,5



