--For Robin
Drop table tempdb.dbo.chrPePDetailReports

Select Distinct acadcompbrandid,originalpagedetailid,mpvvariety 
into tempdb.dbo.chrPePDetailReports
from SQL13..chrPePDetailReports 

--For MT2SQL13
Drop table tempdb.dbo.chrPePDetailReports

select * from dbo.chrpepDetailReports Where mpvvariety <> MPVVarietyNew 


Select Distinct *
into tempdb.dbo.chrPePDetailReports
from Robin.tempdb.dbo.chrPePDetailReports 

select b.dtadded, b.mpvvariety, a.MPVVarietyNew ,* from tempdb.dbo.chrpepDetailReports a join sql13..chrPePDetailReports b 
on a.OriginalPageDetailID=b.OriginalPageDetailID  and  a.ACAdCompBrandId = b.ACAdCompBrandId Where b.mpvvariety <> a.MPVVarietyNew 
and DTAdded <= '2019-04-05 00:00:00.000'




		update a set MPVVariety = b.MPVVarietyNew,dtadded='2019-04-08 00:00:00.000'
				from chrPEPDetailReports a with (nolock)
				join tempdb.dbo.chrpepDetailReports b with (nolock)
				on a.ACAdCompBrandId = b.ACAdCompBrandId
				and a.OriginalPageDetailID=b.OriginalPageDetailID
				Where Isnull(a.MPVVariety,'') <> Isnull(b.MPVVarietyNew,'')
				
				truncate table chrPEPMPVVariety
				
				insert into chrPEPMPVVariety
				select A.pagedetailid, A.varietyid, ltrim(rtrim(split.a.value('.','varchar(max)'))) as Variety
				from
				(SELECT pagedetailid, 0 as varietyid , cast('<M>' + replace((select MPVVariety + '' for xml path('')),',', '</M><M>')+ '</M>' AS XML) as Variety
				  FROM chrPEPDetailReports with (nolock) where isnull(MPVVariety,'') != '') A 
				  CROSS APPLY Variety.nodes ('/M') AS Split(a); --36697
				
				Exec mt_proc_Create_ID_Update 'chrPEPMPVVariety', 'Variety'
				
				truncate table chrPEPDisVariety
				
				insert into chrPEPDisVariety
				SELECT DISTINCT [VarietyId], Isnull([Variety] ,'') Variety
							FROM [dbo].[chrPEPMPVVariety] with(nolock)

Select MPVVariety,* from chrPePDetailReports 
Where OriginalPageDetailID=153059944 

Select MPVVariety,* from chrPePDetailReports 
Where OriginalPageDetailID=182703083



select distinct  a.pagedetailid,a.mpvvariety,b.MPVVariety  from chrpepdetailreports a join chrPePdetailreports_bkup b on
a.pagedetailid=b.pagedetailid where 
 isnull(a.mpvvariety,'') <> isnull(b.mpvvariety,'')


 select count(1) from chrpepdetailreports where mpvvariety is not null 
 select count(1) from chrpepdetailreports_bkup where mpvvariety is not null 


 
 select count(1) from chrPEPMPVVariety 
 select count(1) from chrPEPMPVVariety_bkup 


 