use Subscription 

update subscription set DateTimeExecuted = getdate() - 7 where subscriptionid = 170399       
insert into temppendingsubscriptions values (170399 , Convert(varchar(10), getdate(), 101), 0)


Select Distinct Hostname, a.Error, Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken,Category,ClientServer, * 
From sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
Where stdttm > Convert(varchar(10), getdate(), 101) and Subtype < 3  
--and a.error like '%cross.gif%' 
--and executeid is null--order by 2 desc 
--and categorycodeid in (2596, 2124, 2225, 2226, 2227, 2101, 2518, 3044, 3106, 4489, 4500, 4514, 4554, 4572)
--and hostname = 'mt2sql00'
--and subscriptionname like '%Current Week Security Software%'
--and Eddttm is null 
--and subscriptionid in (171094 ) order by subscriptionid
--And Error <> '' --and error like '%missing%'
--and userid = 2044060
Order By stdttm Desc
GO


select Hostname,ClientServer, Category, SubscriptionID, a.Error,userid, stdttm, eddttm , Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, HasAttachment
 from sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' --and error like '%cross%' 
) 
order by   categorycodeid, subscriptionid desc 


