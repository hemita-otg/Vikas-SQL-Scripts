Use Subscription

Select A.QueryID,vc.clientname,cc.category, vu.username,a.queryname,a.lastupdated--, b.sessionidname,b.sessionidvalue, A.QueryName, vu.UserName--, Case When vu.Type = 1 Then 'True' Else 'False' End IsClientUser, Replace(B.SessionIDName, 'Display', '') FieldName, SessionIDValue As FieldValue,*
From SavedQueries A
Join vwuser vu on A.UserID = vu.UserID and vu.ClientID in(112,119,87,81,109,225,200,99,13,213) 
join vwclient vc on vu.clientid=vc.clientid
join sitecontrol..categorycode cc on cc.id=a.categorycodeid
Join SavedQueriesDetail B ON A.QueryID = B.QueryID
Where --SessionIDValue Not In ('-1:', '') And 
--queryname='Test Prod Desc' and
(
(SessionIDName = 'FindTextText1' and SessionIDValue  <> '') or 
(SessionIDName = 'DisplayCategory' And (SessionIDValue like 'FMB%' Or SessionIDValue = 'beer' Or SessionIDValue Like 'Flavored_Malt_Beverages'))
) group by A.QueryID,vc.clientname,cc.category, vu.username,a.queryname,a.lastupdated
 having count(a.queryid) > 1 Order By 2,3


select *--distinct queryid ,sessionidname, sessionidvalue 
from SavedQueriesDetail where queryid in (197024)
select * from savedqueries where queryid in (197028)
