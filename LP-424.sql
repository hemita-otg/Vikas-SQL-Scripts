


Select Distinct S.QueryName,S.CategoryCodeId, Q.SessionIDName, Q.SessionIDValue     
from Subscription..SavedQueries S
Join Subscription..SavedQueriesDetail Q 
on S.QueryID = Q.QueryID   
Join SiteControl..vw_catinfo C
on S.CategoryCodeId = C.CategoryCodeId 
Join Subscription..vwUser V
on V.UserID =S.UserID 
Where FVCCType in (2,4,6) 
and SiteAccess=1
And ( SessionIDValue Like  '%,10693837,%'
OR SessionIDValue Like  '10693837,%'
OR SessionIDValue Like  '%,10693837'
OR SessionIDValue Like  '10693837') 
and SessionIDName='display1' 


--Update Q Set SessionIDValue = 
--	Case When SessionIDValue Like '%,10693837,%' Then Replace(SessionIDValue, ',10693837,',',10876754,')
--	When SessionIDValue Like '10693837,%' Then Replace(SessionIDValue, '10693837,','10876754,')
--	When SessionIDValue Like '%,10693837' Then Replace(SessionIDValue, ',10693837',',10876754')
--	When SessionIDValue Like '10693837' Then Replace(SessionIDValue, '10693837','10876754')
--	Else SessionIDValue End
--from Subscription..SavedQueries S
--Join Subscription..SavedQueriesDetail Q 
--on S.QueryID = Q.QueryID   
--Join SiteControl..vw_catinfo C
--on S.CategoryCodeId = C.CategoryCodeId 
--Join Subscription..vwUser V
--on V.UserID =S.UserID 
--Where SiteAccess=1 
--And ( SessionIDValue Like  '%,10693837,%'
--OR SessionIDValue Like  '10693837,%'
--OR SessionIDValue Like  '%,10693837'
--OR SessionIDValue Like  '10693837') 
--and SessionIDName='display1' 

Select S.QueryName,S.CategoryCodeId, Q.SessionIDName, Q.SessionIDValue     
from Subscription..SavedQueries S
Join Subscription..SavedQueriesDetail Q 
on S.QueryID = Q.QueryID   
Join SiteControl..vw_catinfo C
on S.CategoryCodeId = C.CategoryCodeId 
Join Subscription..vwUser V
on V.UserID =S.UserID 
Where FVCCType in (2,4,6) 
and SiteAccess=1
and (SessionIDValue like '%Advertiser%' OR SessionIDValue like '%Id:"1"%') and (SessionIDValue like '%FSI%')