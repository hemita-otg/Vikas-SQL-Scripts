--insert into acon50REtmktid
select distinct  fieldvalue from clientcwmexception where categorycodeid in (1903)

select distinct retmktid into acon50REtmktid from masterclientcwm where categorycodeid in (1903)


select distinct retmktid into asmn50REtmktid from masterclientcwm where categorycodeid in (2719)


select distinct advertiser,market from acon50REtmktid a join retmkt r on a.retmktid =r.retmktid order by 1,2 
select distinct advertiser,market from asmn50REtmktid a join retmkt r on a.retmktid =r.retmktid  order by 1,2 



select distinct advertiser,market  from acon50REtmktid a join  retmkt r on a.retmktid =r.retmktid where 
 a.retmktid not in (select retmktid from asmn50REtmktid)  order by 1,2 

select distinct advertiser,market  from asmn50REtmktid a join  retmkt r on a.retmktid =r.retmktid where 
 a.retmktid not in (select retmktid from acon50REtmktid)  order by 1,2 
 
 
 select  * from clientcwmexception where categorycodeid =1903