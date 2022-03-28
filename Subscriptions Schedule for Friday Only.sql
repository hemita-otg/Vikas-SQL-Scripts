



Select Distinct ClientName, HomePageLink, SubscriptionName, FirstName+' '+LastName [Contact Person], DefaultEmailAddress [Contact Email], E.EmailAddresses    
into tempdb..SubsCanada
from Subscription..Subscription S
Left Join (Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmail Union
Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmailGroups) E
On S.SubscriptionID = E.SubscriptionID 
Join Subscription..vwUser U
On U.USerID = S.UserID   
Join (select distinct subscriptionid, DeliveryDate from Subscription..PendingSubscriptions Where datepart(weekday, DeliveryDate) = 6  ) b 
on S.subscriptionid = b.subscriptionid -- Only Friday Condition
Join SiteControl..vw_catinfo C
On C.CategoryCodeId = S.CategoryCodeId 
Where FVCCType = 3 -- Canada Clients 
Order by 1,2,3,4

Select * from tempdb..SubsCanada

Update tempdb..SubsCanada Set EmailAddresses = [Contact Email] Where ISNULL(EmailAddresses,'')=''


SELECT 
   SS.[ClientName],SS.[HomePageLink],SS.[SubscriptionName],SS.[Created By],SS.[Contact Email],SS.[DateTimeSaved],SS.[DateTimeExecuted],SS.[StartDate],SS.[EndDate],
   STUFF((SELECT '; ' + US.EmailAddresses 
          FROM tempdb..SubsCanada US
          WHERE US.ClientName = SS.ClientName
		  AND US.HomePageLink = SS.HomePageLink
		  AND US.SubscriptionName = SS.SubscriptionName
		  AND US.[Contact Email] = SS.[Contact Email]
          ORDER BY SS.[Contact Email]
          FOR XML PATH('')), 1, 1, '') [Recipients] 
FROM tempdb..SubsCanada SS
GROUP BY SS.[ClientName],SS.[HomePageLink],SS.[SubscriptionName],SS.[Created By],SS.[Contact Email],SS.[DateTimeSaved],SS.[DateTimeExecuted],SS.[StartDate],SS.[EndDate]
ORDER BY 1,2,3,4







Select Distinct ClientName, HomePageLink, SubscriptionName, FirstName+' '+LastName [Created By], DefaultEmailAddress [Contact Email], E.EmailAddresses,
DateTimeSaved, DateTimeExecuted ,StartDate,EndDate     
into tempdb..SubsCanada
from Subscription..Subscription S
Left Join (Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmail Union
Select Distinct SubscriptionID,EmailAddresses from Subscription..SubscriptionEmailGroups) E
On S.SubscriptionID = E.SubscriptionID 
Join Subscription..vwUser U
On U.USerID = S.UserID   
Join SiteControl..vw_catinfo C
On C.CategoryCodeId = S.CategoryCodeId 
Join Subscription..SubscriptionSchedule SS
On SS.SubscriptionID = S.SubscriptionID  
Where ClientNAme ='Walmart'
Order by 1,2,3,4
