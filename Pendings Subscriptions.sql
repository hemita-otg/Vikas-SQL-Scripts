

--ServerWise todays pending subs
WITH 
P AS (select * from temppendingsubscriptions),
S AS (SELECT * FROM subscription..subscription ),
C AS (SELECT * from sitecontrol..vw_catinfo  )
select Distinct c.clientserver,count( distinct p.subscriptionid) as PendingSubsForToday  from p join s on p.subscriptionid =s.SubscriptionID join c on  s.CategoryCodeId = c.Categorycodeid   
group by c.clientserver 



select c.ClientServer, b.subscriptionid, a.SubscriptionName from subscription a join temppendingsubscriptions b on a.subscriptionid = b.subscriptionid
join sitecontrol..categorycode c on a.categorycodeid = c.[id]
order by 1, 3 


--Total failed subs for today
select Hostname, Error, ExecuteId, Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, *, 'EXEC [Subscription].[dbo].[procReprocessFailedSub] ' + cast(subscriptionid as varchar(20)) + ',''MT2SQL10''' 
 from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' --and error like '%cross%' 
) 
order by   categorycodeid, subscriptionid desc 


--Pending subs for today
select * from temppendingsubscriptions order by deliverydate desc
