select * from sitecontrol..masterfields where fieldname like '%advertiser%'

select * from mt2sql11.iddb.dbo.advertiser where advertiser in ('fsi','P&G Brand Saver','Smartsource','RedPlum','RetailMeNot')
10693837
12042854
4315
9226990
12042855


Select Distinct QueryName,DefaultEmailAddress,Q.CategoryCodeId,SessionIDValue   
from Subscription..SavedQueries Q
Join Subscription..SavedQueriesDetail D
on Q.QueryID = D.QueryID 
Join Subscription..vwUser V
on V.UserID =Q.UserID 
Join SiteControl..vw_catinfo C
on C.CategoryCodeId = Q.CategoryCodeId  
Where SiteAccess=1 and FVCCtype in (2,4,6)
And SessionIDName='display1' 
And ( SessionIDValue Like  '%,10693837,%'
OR SessionIDValue Like  '10693837,%'
OR SessionIDValue Like  '%,10693837'
OR SessionIDValue Like  '10693837') 

Select SessionIDValue,
--Update D Set SessionIDValue = 
	Case When SessionIDValue Like '%,10693837,%' Then Replace(SessionIDValue, ',10693837,',',12042854,4315,9226990,12042855,')
	When SessionIDValue Like '10693837,%' Then Replace(SessionIDValue, '10693837,','12042854,4315,9226990,12042855,')
	When SessionIDValue Like '%,10693837' Then Replace(SessionIDValue, ',10693837',',12042854,4315,9226990,12042855')
	When SessionIDValue Like '10693837' Then Replace(SessionIDValue, '10693837','12042854,4315,9226990,12042855')
	Else SessionIDValue End
from Subscription..SavedQueries Q
Join Subscription..SavedQueriesDetail D
on Q.QueryID = D.QueryID 
Join Subscription..vwUser V
on V.UserID =Q.UserID 
Join SiteControl..vw_catinfo C
on C.CategoryCodeId = Q.CategoryCodeId  
Where SiteAccess=1 and FVCCtype in (2,4,6)
And SessionIDName='display1' 
And ( SessionIDValue Like  '%,10693837,%'
OR SessionIDValue Like  '10693837,%'
OR SessionIDValue Like  '%,10693837'
OR SessionIDValue Like  '10693837') 

Select SessionIDValue,
--Update D Set SessionIDValue = 
	Case When SessionIDValue Like '%,10693837,%' Then Replace(SessionIDValue, ',10693837,',',11651139,10215971,')
	When SessionIDValue Like '10693837,%' Then Replace(SessionIDValue, '10693837,','11651139,10215971,')
	When SessionIDValue Like '%,10693837' Then Replace(SessionIDValue, ',10693837',',11651139,10215971')
	When SessionIDValue Like '10693837' Then Replace(SessionIDValue, '10693837','11651139,10215971')
	Else SessionIDValue End
from Subscription..SavedQueries Q
Join Subscription..SavedQueriesDetail D
on Q.QueryID = D.QueryID 
Join Subscription..vwUser V
on V.UserID =Q.UserID 
Join SiteControl..vw_catinfo C
on C.CategoryCodeId = Q.CategoryCodeId  
Where SiteAccess=1 and FVCCtype in (2,4,6)
And SessionIDName='display14' 
AND (SessionIDValue like '%Category%' OR SessionIDValue like '%Id:"14"%') and (SessionIDValue like '%Automotive Fluids&Filters%')

Select SessionIDValue,
--Update D Set SessionIDValue = 
	Case When SessionIDValue Like '%Automotive Fluids&Filters%' Then Replace(SessionIDValue, 'Automotive Fluids&Filters','Automotive Fluids&Filters,Car Care-Accessories,Car Care-Chemicals')
	Else SessionIDValue End
from Subscription..SavedQueries Q
Join Subscription..SavedQueriesDetail D
on Q.QueryID = D.QueryID 
Join Subscription..vwUser V
on V.UserID =Q.UserID 
Join SiteControl..vw_catinfo C
on C.CategoryCodeId = Q.CategoryCodeId  
Where SiteAccess=1 and FVCCtype in (2,4,6)
And SessionIDName='display14' 
And (SessionIDValue like '%Category%' OR SessionIDValue like '%Id:"14"%') and (SessionIDValue like '%Automotive Fluids&Filters%')
