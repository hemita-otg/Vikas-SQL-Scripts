-------------------------------------
--FV Session count for Thursday ( last 3 months )
--Run on MT2SQl14.sitelog
-------------------------------------
select clientname,month(starttime) 'Month' ,day(starttime) 'Thursday_date' ,count(distinct l.querylogid) 'Session_count'
from queryexecutionlog L
Join queryexecutionlogdetail D
on L.querylogid=D.querylogid  
join Subscription..vwuser u on l.UserID =u.userid 
join Subscription..ClientDatabases c on l.CategoryCodeId =c.CategoryCodeID 
join SiteControl..vw_catinfo  cl on cl.clientid=c.clientid 
and starttime between '08/01/20' and  '11/30/20' 
and  datepart(weekday, starttime) = 5 
and u.type=1 
where cl.clientserver='mt2sql17'
group by clientname,month(starttime),day(starttime)
order by 2,3,1

-------------------------------------
--Subscription list for Thursday
--Run on MT2SQl14.subscription
-------------------------------------

Select Distinct  HomePageLink, SubscriptionName, FirstName+' '+LastName [Contact Person], DefaultEmailAddress [Contact Email], E.EmailAddresses    
into tempdb..Thursday_subs_17
from Subscription..Subscription S
Left Join (Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmail 
Union
Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmailGroups) E
On S.SubscriptionID = E.SubscriptionID 
Join Subscription..vwUser U
On U.USerID = S.UserID   
Join (select distinct subscriptionid, DeliveryDate from Subscription..PendingSubscriptions Where datepart(weekday, DeliveryDate) = 5  ) b 
on S.subscriptionid = b.subscriptionid -- Only Thursday Condition
Join SiteControl..vw_catinfo C
On C.CategoryCodeId = S.CategoryCodeId 
Where ClientServer='mt2sql17'
Order by 1,2,3,4

select count(distinct subscriptionname) from tempdb..Thursday_subs_17