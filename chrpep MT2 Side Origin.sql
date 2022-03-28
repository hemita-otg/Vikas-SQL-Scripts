--For Robin
Drop table tempdb.dbo.chrPePDetailReports_Origin

--For MT2SQL13

Drop table tempdb.dbo.chrPePDetailReports_Origin


Select Distinct acadcompbrandid,originalpagedetailid,mpvOrigin 
into tempdb.dbo.chrPePDetailReports_Origin
from SQL13..chrPePDetailReports 




Select Distinct *
into tempdb.dbo.chrPePDetailReports_Origin
from Robin.tempdb.dbo.chrPePDetailReports_Origin 

Select * from tempdb.dbo.chrPePDetailReports_Origin
Select Count(1) from chrPePDetailReports_Origin Where MPVOrigin is not null --735097

		update a set MPVOrigin = b.MPVOriginNew,dtadded='2019-04-08 00:00:00.000'
				from chrPePDetailReports a with (nolock)
				join tempdb.dbo.chrPePDetailReports_Origin b with (nolock)
				on a.ACAdCompBrandId = b.ACAdCompBrandId
				and a.OriginalPageDetailID=b.OriginalPageDetailID
				Where Isnull(a.MPVOrigin,'') <> Isnull(b.MPVOriginNew,'')
				
				truncate table chrPEPMPVOrigin
				
				insert into chrPEPMPVOrigin
				select A.pagedetailid, A.Originid, ltrim(rtrim(split.a.value('.','varchar(max)'))) as Origin
				from
				(SELECT pagedetailid, 0 as Originid , cast('<M>' + replace((select MPVOrigin + '' for xml path('')),',', '</M><M>')+ '</M>' AS XML) as Origin
				  FROM chrPePDetailReports with (nolock) where isnull(MPVOrigin,'') != '') A 
				  CROSS APPLY Origin.nodes ('/M') AS Split(a); --36697
				
				Exec mt_proc_Create_ID_Update 'chrPEPMPVOrigin', 'Origin'
				
				truncate table chrPEPDisOrigin
				
				insert into chrPEPDisOrigin
				SELECT DISTINCT [OriginId], Isnull([Origin] ,'') Origin
							FROM [dbo].[chrPEPMPVOrigin] with(nolock)

Select MPVOrigin,* from chrPePDetailReports_Origin 
Where OriginalPageDetailID=153059944 




select distinct  a.pagedetailid,a.MPVOrigin,b.MPVOrigin  from chrpepdetailreports a join chrPePdetailreports_bkup b on
a.pagedetailid=b.pagedetailid where 
 isnull(a.MPVOrigin,'') <> isnull(b.MPVOrigin,'')


 select count(1) from chrpepdetailreports where MPVOrigin is not null 
 select count(1) from chrpepdetailreports_bkup where MPVOrigin is not null 


 
 select count(1) from chrPEPMPVOrigin 
 select count(1) from chrPEPMPVOrigin_bkup 