select x.clientname,x.category,x.startdate,x.count,y.count
from
(select cp.clientname,cc.category,startdate,count(retmktid) as count 
from 
masterclientcwm mc JOIN mt2sql04.sitecontrol.dbo.categorycode cc
on mc.categorycodeid=cc.[id]
join mt2sql04.subscription.dbo.clientprofile cp
on mc.clientid=cp.clientid 
group by cp.clientname,cc.category,mc.startdate
--order by 1,2,3
) x
inner join
(
select cp.clientname,cc.category,count(retmktid) as count 
from 
masterclientcwm mc JOIN mt2sql04.sitecontrol.dbo.categorycode cc
on mc.categorycodeid=cc.[id]
join mt2sql04.subscription.dbo.clientprofile cp
on mc.clientid=cp.clientid 
group by cp.clientname,cc.category
--order by 1,2
) y
on
x.clientname=y.clientname and x.category=y.category
order by 1,2,3