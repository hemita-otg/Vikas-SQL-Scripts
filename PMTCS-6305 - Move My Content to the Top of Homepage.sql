
Select * from SiteControl..vw_catinfo where ClientName like '%Crayola%' 

Select MyContentOnTopHomePage,* from Subscription..vwclient   
Where ClientID=1268    or MyContentOnTopHomePage = 1


--Update MyContentOnTopHomePage =1 for client

--Update Subscription..ClientControl  
--Set MyContentOnTopHomePage=1
--Where ClientID=1268    

select * from subscription..PageWidgetSequence where userid = 2459704
--UserID	Page	Widget
--2459704	116	'119,117,118'


Select * from Subscription..vwUser 
Where ClientID=1268 and SiteAccess=1 

--Insert into subscription..PageWidgetSequence
--values (2459713,116,'119,117,118')

--Insert into subscription..PageWidgetSequence
Select V.UserID, 116,'119,117,118' 
from Subscription..vwUser V
Left Join subscription..PageWidgetSequence P
on V.UserID = P.UserID 
Where ClientID=1268 and SiteAccess=1 
and P.UserID is null