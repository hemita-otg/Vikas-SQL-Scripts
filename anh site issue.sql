Select * from Connection..csloglive A
Where sql like '%7222%'
Order by ActionDateTime desc

Select * from Connection..csloglive A
Where sql like '%7222%' and sql like '%mlcc%'
Order by ActionDateTime desc


Select Distinct A.*,B.Type,DefaultEmailAddress from SiteLog..queryexecutionlog A
Join Subscription..vwUser B 
On A.UserID = B.UserID  
Where CategoryCodeId=7222
and starttime>='2020-12-07' 
and starttime<='2020-12-11'  
Order by starttime desc