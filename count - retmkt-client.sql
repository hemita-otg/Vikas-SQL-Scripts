use MasterClientCoverage


select distinct  retmktid,clientid  into 
tempdb..S0 from MasterClientCWM 
where clientid  < 900 



alter table tempdb..s0 add ret varchar(200),mar varchar(200)

select * from tempdb..s0
select * from tempdb..c0
select * from masterclientcoverage..retmkt

update s set ret=rm.advertiser,mar=rm.market  from
tempdb..s0 s join masterclientcoverage..retmkt rm on
s.retmktid=rm.retmktid 

select distinct  clientid,ClientName into tempdb..C0 
from mt2sql14.subscription.dbo.clientprofile  
where clientid  < 900 


select ret,mar,clientname into tempdb..r0
 from tempdb..s0 s join tempdb..c0 c on s.clientid =c.clientid 

 
 
 select ret,mar,null as clientname into tempdb..s1 from tempdb..s0 where 1=2
 select ret,mar,null as clientname into tempdb..s2 from tempdb..s0 where 1=2
 select ret,mar,null as clientname into tempdb..s3 from tempdb..s0 where 1=2

 select * from tempdb..s1
 select * from tempdb..s2
 select * from tempdb..s3
 select * from tempdb..r0
 alter table r0 add retmktid int 

 
update r set retmktid=rm.retmktid   from
tempdb..r0 r join masterclientcoverage..retmkt rm on
r.ret=rm.advertiser and r.mar=rm.market 


update s set retmktid=rm.retmktid   from
tempdb..s1 s join masterclientcoverage..retmkt rm on
s.ret=rm.advertiser and s.mar=rm.market 

update s set retmktid=rm.retmktid   from
tempdb..s2 s join masterclientcoverage..retmkt rm on
s.ret=rm.advertiser and s.mar=rm.market 


update s set retmktid=rm.retmktid   from
tempdb..s3 s join masterclientcoverage..retmkt rm on
s.ret=rm.advertiser and s.mar=rm.market 



select s.ret,s.mar,clientname into tempdb..r1
 from tempdb..s1 s join tempdb..r0 c on s.retmktid =c.retmktid  



select s.ret,s.mar,clientname into tempdb..r2
 from tempdb..s2 s join tempdb..r0 c on s.retmktid =c.retmktid  



select s.ret,s.mar,clientname into tempdb..r3
 from tempdb..s3 s join tempdb..r0 c on s.retmktid =c.retmktid  

 
 select distinct s.retmktid,clientid  from s1 s join masterclientcoverage..masterclientcwm c on s.retmktid=c.retmktid where clientid < 900


 select * from r3