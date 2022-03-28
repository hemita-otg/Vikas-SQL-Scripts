

Select Distinct ClientName, FirstName,LastName, DefaultEmailAddress   
from Subscription..vwUser U
Join SiteControl..vw_catinfo C
on U.ClientID = C.ClientID  
Where isnull(frAccess,0)=1
and (FVCCType in (2,4,6) or ISNULL(IsAdlert,0)=1)

select Distinct VC.ClientName, FirstName, LastName, 
IsNull(DefaultEmailAddress, '') as EAddress, Case When FVCCType in (2,4,6) Then 'PEP' Else 'Durable' End ClientType 
FROM subscription..UserProfile UP JOIN subscription..frUserControl UC ON UP.UserRefId = UC.UserRefId
Join subscription..ClientProfile VC on UC.ClientID = VC.ClientID
left join subscription..clientdatabases cd on vc.clientid = cd.ClientID 
join sitecontrol..categorycode cc on cd.CategoryCodeID = cc.id 
where fraccess = 1 And (SiteAccess is null or SiteAccess =1 or (siteaccess = 0 and username is null))
And IsNull(CanadaFRAccess, 0) In (0, 2) and vc.Clientid not In (993, 986) and type = 1 
and (FVCCType in (2,4,6) or ISNULL(IsAdlert,0)=1)
order by 1,2,3