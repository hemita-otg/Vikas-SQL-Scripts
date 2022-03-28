
Select * from SiteControl..MasterFields where fieldname='Advertiser' 

Select CategoryCodeId, UserID, SessionIDValue  
into tempdb..Advertiser7050 
from SiteLog..queryexecutionlog L
Join SiteLog..queryexecutionlogdetail D
on L.querylogid=D.querylogid  
Where CategoryCodeId=7050 and SessionIDName='display1' 
Group by CategoryCodeId, UserID, SessionIDValue   

Select * from SiteLog..queryexecutionlog L
Join SiteLog..queryexecutionlogdetail D
on L.querylogid=D.querylogid  
Where CategoryCodeId=7050 and SessionIDvalue like '%Advertiser%' 

--IDDB
Select Distinct X.*,C.Advertiser 
into tempdb..Advertiser7050_1
from (
SELECT CategoryCodeId, UserID,  
     Split.a.value('.', 'VARCHAR(MAX)') AS String  
 FROM  (SELECT CategoryCodeId, UserID,  
         CAST ('<M>' + REPLACE([SessionIDValue], ',', '</M><M>') + '</M>' AS XML) AS String  
     FROM  tempdb..Advertiser7050 ) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
	 ) X Join MT2SQL00.IDDB.dbo.Advertiser C
	 on C.AdvertiserID = cast(X.String as int)
	 Where isnumeric(X.String)=1

--RetMkt
Select Distinct X.*,C.Advertiser+'-'+C.Market RetMkt
into tempdb..Advertiser7050_1
from (
SELECT CategoryCodeId, UserID,  
     Split.a.value('.', 'VARCHAR(MAX)') AS String  
 FROM  (SELECT CategoryCodeId, UserID,  
         CAST ('<M>' + REPLACE([SessionIDValue], ',', '</M><M>') + '</M>' AS XML) AS String  
     FROM  tempdb..Advertiser7050 ) AS A CROSS APPLY String.nodes ('/M') AS Split(a)
	 ) X Join MT2SQL00.MasterClientCoverage.dbo.RetMktpep C
	 on C.Advertiser = cast(X.String as int)
	 Where isnumeric(X.String)=1

Select Distinct CC.ClientName,CC.HomePageLink, C.UserID,   
STUFF((SELECT '; ' + US.Advertiser
          FROM tempdb..Advertiser7050_1 US
          WHERE US.UserID = C.UserID
          FOR XML PATH('')), 1, 1, '') Advertiser,
V.FirstName, V.LastName,V.DefaultEmailAddress  
from tempdb..Advertiser7050_1 C
Join Subscription..vwUser V
On C.UserID = V.UserID 
Join SiteControl..vw_catinfo CC
on CC.CategoryCodeId = C.CategoryCodeId  
Order by 1,2,4,5,6

Select * from tempdb..Advertiser7050_1 Where userid=16353