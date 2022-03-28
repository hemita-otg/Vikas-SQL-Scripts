
Select Distinct A.SubscriptionName,FirstName,LastName,DefaultEmailAddress,SQ.QueryName,SE.EmailAddresses,C.ClientName,C.HomePageLink 
from subscription A join vwUser B on A.UserID=B.UserID 
join SiteControl.dbo.vw_catinfo C on A.CategoryCodeId=C.CategoryCodeId 
join SubscriptionSavedQuery SSQ on SSQ.SubscriptionID=A.SubscriptionID
join SavedQueries SQ on SQ.QueryID=SSQ.SQID 
join SavedQueriesDetail SQD on SQ.QueryId=SQD.QueryID 
join PendingSubscriptions PS on A.SubscriptionID=PS.SubscriptionID
join SubscriptionEmail SE on A.SubscriptionID=SE.SubscriptionID
where A.CategoryCodeId in (Select CategoryCodeId from SiteControl..vw_catinfo Where ClientID in (783, 719, 1036, 1086, 1298, 92) and FVCCType in (2,4,6))
and B.SiteAccess=1 and (DefaultEmailAddress Like '%numerator.com' or DefaultEmailAddress Like '%markettrack.com')
order by 1,2,5


