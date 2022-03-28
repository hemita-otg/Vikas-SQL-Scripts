select * from emailattributes

update C 
set salesterritory=e.subject 
from sql01..JCPdChildWebMain c join commonadtofv..emailattributes e 
on c.trackno=e.trackno
where e.subject is not null 

select distinct coupon,advertiser,market from jcpdchildwebmain


select max(len(subject)) from commonadtofv..emailattributes

--ALTER TABLE JCPdChildWebMain ALTER Column salesterritory	varchar(200)



select distinct salesterritory from jcpdchildwebmain


--update jcpdchildwebmain set coupon=null 