----

sp_whoisactive

Select count(1) ,'1' from ACFVINCR.dbo.PDTList_ACDetailReports_1 With(nolock) union
Select count(1) ,'2' from ACFVINCR.dbo.PDTList_ACDetailReports_2 With(nolock) union
Select count(1) ,'3' from ACFVINCR.dbo.PDTList_ACDetailReports_3 With(nolock) union
Select count(1) ,'4' from ACFVINCR.dbo.PDTList_ACDetailReports_4 With(nolock)


  select count(1) from ACFVINCR.dbo.TempACFVDetailReports_4 With(nolock)
select count(1) from tempdb.dbo.PDTIDACDetailReports_4 with (nolock)

-----


select * from MasterACFV.dbo.CategoryCodeRunFlag order by 2 desc  
select * from mt2sql14.sitecontrol.dbo.vw_catinfo where category='nwpep'clientname ='walgreens' or clientid=1270 or 
select * from mt2sql14.sitecontrol.dbo.vw_MasterCustomStep where Id in (9410) 
select * from mt2sql14.sitecontrol.dbo.vw_mastersegmentation where Id in (9410)
select count(1) from tempdb.dbo.tempACfvPDTDelete with (nolock)
select count(1) from ACFVINCR.dbo.PDT_Delete with (nolock)
select * from vw_catinfo where FVCCType in (2) and  isfull=1 
--update vw_catinfo set isfull =0  where FVCCType in (2) and  isfull=1 
use Subscription 


select * from UserMyFVLinks where linkrefid=4677

--job on SQL13 : for additional push records 35L,10L-- jobname : MasterPEP Rebuild - RetMktImport on Robin

select * from mt2sql13.masteracfv.dbo.CategoryCodeRunFlag where clientrun=1  or HTMLRun = 1 or clientrun=2
--update mt2sql13.masteracfv.dbo.CategoryCodeRunFlag set clientrun=1 where category in ('lo','walPeP')

--Start - Pending Subs status -------------------------------------------------------------------
    Select * from 
	MT2SQL14.Subscription.dbo.pendingsubscriptions  p join 
	MT2SQL14.Subscription.dbo.Subscription s on p.subscriptionid=s.subscriptionid join 
	MT2SQL14.sitecontrol.dbo.categorycode c on s.categorycodeid=c.id
		where deliverydate = convert(varchar(10), getdate(), 101) 

--End - Pending Subs status -------------------------------------------------------------------

--Start - Todays Pending Status -------------------------------------------------------------------

select * from
(select * from (select top 1 'sql02'DataDb,* from mt2sql02.sql02.dbo.categorycodelog order by id desc) A UNION
select * from (select top 1 'sql03'DataDb,* from mt2sql03.sql03.dbo.categorycodelog order by id desc) b UNION
select * from (select top 1 'sql04'DataDb,* from mt2sql04.sql04.dbo.categorycodelog order by id desc) c UNION
select * from (select top 1 'sql06'DataDb,* from mt2sql06.sql06.dbo.categorycodelog order by id desc) d UNION
select * from (select top 1 'sql07'DataDb,* from mt2sql07.sql07.dbo.categorycodelog order by id desc) e UNION
select * from (select top 1 'sql08'DataDb,* from mt2sql08.sql08.dbo.categorycodelog order by id desc) f UNION
select * from (select top 1 'sql11'DataDb,* from mt2sql11.sql11.dbo.categorycodelog order by id desc) g UNION
select * from (select top 1 'sql15'DataDb,* from mt2sql15.sql15.dbo.categorycodelog order by id desc) h UNION
select * from (select top 1 'sql01'DataDb,Id,CategoryCode,Details,Details as SQL,dttm from mt2sql01.conversioncontrol.dbo.conversionlog order by dttm desc) i UNION
select * from (select top 1 'sql05'DataDb,Id,CategoryCode,Details,Details as SQL,dttm from mt2sql05.conversioncontrol.dbo.conversionlog order by dttm desc) j UNION
select * from (select top 1 'sql09'DataDb,Id,CategoryCode,Details,Details as SQL,dttm from mt2sql09.conversioncontrol.dbo.conversionlog order by dttm desc) k
)Final order by datadb




select clientserver,count(category) PendingCodes,'FV' from categorycode where clientrun=1 group by clientserver
UNION
select 'MT2SQL01',count(cc.databasecategory),'Adlert'
from mt2sql01.conversioncontrol.dbo.ConversionCategory cc
join mt2sql01.sql01.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where ftpstatus=1 and  conversiondone=0
UNION
select 'MT2SQL05', count(cc.databasecategory),'Adlert'
from mt2sql05.conversioncontrol.dbo.ConversionCategory cc
join mt2sql05.sql05.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where ftpstatus=1 and  conversiondone=0
UNION
select 'MT2SQL09',count(cc.databasecategory),'Adlert'
from mt2sql09.conversioncontrol.dbo.ConversionCategory cc
join mt2sql09.sql09.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where ftpstatus=1 and  conversiondone=0
--End - Todays Pending Status -------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------
--Start : Nightly Processing
---------------------------------------------------------------------------------------------------------------------
select *  from categorycode where clientrun=1 and clientserver='mt2sql02' order by ProcessOrder 
select clientserver,count(category) PendingCodes from categorycode where clientrun=1 group by clientserver
select clientserver,count(category) PendingCodes from categorycode where clientrun=1 and isfull=1 group by clientserver
Date,
select *  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver  like 'sql08%' and sqlserver  not in ('SQL00') and DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE() -1 ),0)  order by ProcessID desc 
select * from [MT2SQL14].[connection].dbo.nightlyconversion where sqlserver not like 'mt2a%' and sqlserver  not in ('SQL00') and DateAdd(d, 0, DateDiff(d, 0, enabledsettime)) = DATEADD(d,DATEDIFF(d,0,GETDATE() -2 ),0)  order by enabledsettime desc 
--update  [MT2SQL14].[connection].dbo.nightlyprocessing set clientrunset='2018-03-21 22:32:00' where processid in (66706,66705,66704,66703,66702,66701,66700,66699,66698,66697)

--update [MT2SQL14].[connection].dbo.nightlyprocessing set processingstart='2018-07-12 22:45:00' , clientrunset='2018-07-12 22:45:00' where processid in (69135,69134,69133,69132,69131)
---------------------------------------------------------------------------------------------------------------------
--End : Nightly Processing
---------------------------------------------------------------------------------------------------------------------
---Start : Check PI Status
-------------------------------------------------------------------------
select count(*) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable where prodimagecreated=0
select count(*) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable t join mt2sql00.MasterAdviewData.dbo.adviewmain a on t.flyerid=a.flyerid and a.active=1  where prodimagecreated=0 and pagedetailid not like '%DC'
select * from MT2SQL14.Connection.dbo.piprocessinghealthcheck
--delete from MT2SQL14.Connection.dbo.piprocessinghealthcheck where server in ('MT2DEV0','MT2BU2','MT2RPT1','MT2STG0')
select * from MT2SQL14.Connection.dbo.piprocessinghealthcheck_dur


select Year(addate),Month(addate), count(1)
from  MasterClientCoverage..PIProcessingTableTempMCAP A 
JOIN MasterClientCoverage.dbo.TempJAPageDetailTable B ON A.pagedetailid=B.PageDetailID
JOIN MasterAdviewData.dbo.AdviewMain C ON C.FlyerID=B.FlyerId
Where isnull(B.ProdImageCreated,0)=0 
group by  Year(addate),Month(addate)
order by 1,2 


select  count(1)
from  MasterClientCoverage..PIProcessingTableTempMCAP A 
JOIN MasterClientCoverage.dbo.TempJAPageDetailTable B ON A.pagedetailid=B.PageDetailID
JOIN MasterAdviewData.dbo.AdviewMain C ON C.FlyerID=B.FlyerId
Where isnull(B.ProdImageCreated,0)=0 


---------------------------------------------------------------------------------------------------------------------
---End : Check PI Status
---------------------------------------------------------------------------------------------------------------------
select clientserver,count(category) as PendingCodes from categorycode where clientrun=1 group by clientserver
select MT2aclientserver,count(category) from mt2asql06.sitecontrol.dbo.categorycode where clientrun=1 group by MT2aclientserver
select * from mt2asql06.sitecontrol.dbo.categorycode where mt2aclientserver='mt2asql03' and clientrun=1 order by ProcessOrder 
 order by ProcessOrder 
select * from mt2sql14.sitecontrol.dbo.categorycode where clientserver='mt2sql02' and clientrun=1 order by ProcessOrder 

select * from mt2asql06.sitecontrol.dbo.categorycode where mt2aclientserver='mt2asql05' and category like 'bar%'
--update mt2asql06.sitecontrol.dbo.categorycode set isfull=1  where category ='wda'
--update mt2asql08.master.dbo.localcategorycode set isfull=1  where category ='pr50'
select isfull,processorder,* from categorycode where clientserver='mt2sql15' and CWMFull=1 and not  catonly=1 and not IsFSI=1 and ismaster=1 order by processorder
select isfull,processorder,* from categorycode where clientserver='mt2sql02'  and ClientRun=1   order by processorder

select isfull,processorder,* from categorycode where clientserver='mt2sql04'  order by processorder
select isfull,processorder,* from categorycode where clientserver='mt2sql12' and clientrun=1  order by processorder
select isfull,processorder,* from categorycode where clientserver='mt2sql15' and clientrun=1  order by processorder
select isfull,* from mt2asql06.sitecontrol.dbo.categorycode where mt2aclientserver='mt2asql11' and run=1  order by processorder


select top 100 * from mt2sql01.conversioncontrol.dbo.conversionlog order by dttm desc
select * from categorycode where fullrundate > '10-09-10' and isnull(isadlert,0) <>1 and category not like 'fsi%' order by clientserver,category
select processorder,isfull,* from categorycode where clientserver='mt2sql04'  and clientrun=1 order by [processorder]

select * from categorycode where sourcecwm='tempchildwebmain'fv50=1 -- category like  'acami%'
select * from subscription..clientprofile where clientname like '%dura%'
select isfull,* from categorycode where  clientid=1009category='adjaAdam50'
select mt2aclientserver,* from categorycode where sourcecwm like '%masterflyer%'
select mt2aclientserver,fv50,isfull,* from categorycode where category like 'wbg%' 
--update mt2asql06.sitecontrol.dbo.categorycode set isfull=1 where category in ('bar50')
--update categorycode set isfull=0 where category in ('prdba50')
select * from categorycode where category in ('pepfri50','pep50','peppcn50','pepqtg50','adpep50')
--insert into categorymarkedfull
select * from categorycode where category in ('chrpep')
select * from categorycode where clientid=1056

select * from categorycode where mt2aclientserver='mt2asql11' and isadlert is null

select * from categorycode where  Category  like '%unipep%' 

select top 1000 *  from conversioncontrol.dbo.conversionlog order by dttm desc

select * from categorycode where mt2aclientserver='mt2asql02' and clientid=8 and cwmfull=1isnull(fv50,0) = 1
select * from categorycode where clientserver='mt2sql08' and isnull(fv50,0) <> 1
---------------------------------------------------------------------------------------------------------------------
--Start : Nightly Processing
---------------------------------------------------------------------------------------------------------------------
select clientserver,count(category) PendingCodes from categorycode where clientrun=1 group by clientserver

select * from [MT2SQL14].[connection].dbo.nightlyprocessing
where DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE()-1),0)
---------------------------------------------------------------------------------------------------------------------
--End : Nightly Processing
---------------------------------------------------------------------------------------------------------------------
--Start : Conversion Pending codes
---------------------------------------------------------------------------------------------------------------------
Select * from mt2sql01.conversioncontrol.dbo.vwConversionStatus where category='sym' order by conversionstart desc , sequence
Select top 100 * from mt2sql01.conversioncontrol.dbo.conversionlog order by dttm desc
-- covnersiondone=0
select ltrim(rtrim(cc.DatabaseCategory)) as DataBaseCategory,  ltrim(rtrim(cc.ClientName)) as ClientName, 
cc.IndexType, cc.DAA  
from mt2sql01.conversioncontrol.dbo.ConversionCategory cc
join mt2sql01.sql01.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where ftpstatus=1 and  conversiondone=0
order by cc.[sequence]

select ltrim(rtrim(cc.DatabaseCategory)),  ltrim(rtrim(cc.ClientName)), 
cc.IndexType, cc.DAA  
from mt2sql01.conversioncontrol.dbo.ConversionCategory cc
join mt2sql01.sql01.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where cc.ftpstatus = 1 --and conversiondone=0
order by cc.[sequence]
--update mt2sql01.conversioncontrol.dbo.ConversionCategory set ftpstatus=0,conversiondone=1 where databasecategory in ('adl360')
--update mt2asql09.conversioncontrol.dbo.ConversionCategory set ftpstatus=0,conversiondone=1 where databasecategory in ('taradl50')


select ltrim(rtrim(cc.DatabaseCategory)) as DataBaseCategory,  ltrim(rtrim(cc.ClientName)) as ClientName, 
cc.IndexType, cc.DAA  
from mt2sql05.conversioncontrol.dbo.ConversionCategory cc
join mt2sql05.sql05.dbo.localconversioncategories c on cc.databasecategory = c.databasecategory
where conversiondone=0
order by cc.[sequence]

use ConversionControl 


select top 10000 * from conversionlog where categorycode='seaadl50' and details in 
('5.0 Display Tables created.','Conversion started','Conversion completed')
order by ID desc 

---------------------------------------------------------------------------------------------------------------------
--End : Conversion Pending codes
---------------------------------------------------------------------------------------------------------------------
---Start : Subscription Send Delay
---------------------------------------------------------------------------------------------------------------------
select distinct sqlserver,subscriptionready  from connection..vwCategoryCodeIDSubscriptionReady  where type='adlerttofv'
fcati
select * from subscription..ScheduleSubsProcessTime
--update subscription..ScheduleSubsProcessTime  set processtime='08:00:00.0000000' where processday in (4)
--update subscription..ScheduleSubsProcessTime  set processtimeDUR='07:00:00.0000000' where processday in (6) and ProcessTimeDur = '04:00:00.0000000'
--update subscription..ScheduleSubsProcessTime  set processtime='02:00:00.0000000',processtimedur='08:00:00.0000000' where processday in (2)
---------------------------------------------------------------------------------------------------------------------
---End : Subscription Send Delay
---------------------------------------------------------------------------------------------------------------------
---Start : Check PI Status
---------------------------------------------------------------------------------------------------------------------
select count(*) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable where prodimagecreated=0
select count(*) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable t join mt2sql00.MasterAdviewData.dbo.adviewmain a on t.flyerid=a.flyerid  where prodimagecreated=0
select * from MT2SQL14.Connection.dbo.piprocessinghealthcheck
---------------------------------------------------------------------------------------------------------------------
---End : Check PI Status
---------------------------------------------------------------------------------------------------------------------
---Start : Check Server held for Subscription Send
---------------------------------------------------------------------------------------------------------------------
Select distinct sqlserver from MT2SQL14.Connection.dbo.vwCategoryCodeIDSubscriptionReady Where SubscriptionReady = 0
---------------------------------------------------------------------------------------------------------------------
---End : Check Server held for Subscription Send
---------------------------------------------------------------------------------------------------------------------
---Start : Check particular word/text in stored procedures
---------------------------------------------------------------------------------------------------------------------
select distinct  OBJECT_NAME (id) from syscomments where text like '%\conn%'
---------------------------------------------------------------------------------------------------------------------
---End : Check particular word/text in stored procedures
---------------------------------------------------------------------------------------------------------------------
---Start : Check for Canada records PI done or not
select count(*) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from mt2sql00.tempdb.dbo.canflyerids)
---End : Check for Canada records PI done or not

--start : total canada pdt records in tempja
select count(pagedetailid) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid 
where pdt.flyerid in (select flyerid from mt2sql00.tempdb.dbo.canflyerids)
--end : total canada pdt records in tempja
---------------------------------------------------------------------------------------------------------------------
---Start : Count of  Fv4 , FV 5 on Different ClientServer
---------------------------------------------------------------------------------------------------------------------
select Distinct ClientServer,sum(fv4) as FV4,sum(fv5) as FV5
from (
select distinct clientserver,
case when isnull(fv50,0)=0 then count(isnull(fv50,0))  else 0 end as FV4,
case when isnull(fv50,0)=1 then count(isnull(fv50,0))  else 0 end as FV5
from categorycode 
group by clientserver,isnull(fv50,0)
) x 
Group by ClientServer 
order by 1 

select Distinct MT2aClientServer,sum(fv4) as FV4,sum(fv5) as FV5
from (
select distinct MT2aClientServer,
case when isnull(fv50,0)=0 then count(isnull(fv50,0))  else 0 end as FV4,
case when isnull(fv50,0)=1 then count(isnull(fv50,0))  else 0 end as FV5
from categorycode 
group by MT2aClientServer,isnull(fv50,0)
) x 
Group by MT2aClientServer 
order by 1 
---------------------------------------------------------------------------------------------------------------------
---End : Count of  Fv4 , FV 5 on Different ClientServer
---------------------------------------------------------------------------------------------------------------------
---Start : subs send view
---------------------------------------------------------------------------------------------------------------------
Select * from Connection.dbo.vwCategoryCodeIDSubscriptionReady Where SubscriptionReady = 0
---------------------------------------------------------------------------------------------------------------------
---End : subs send view
---------------------------------------------------------------------------------------------------------------------
---Start : In Package : Tiem taken by each step during run
---------------------------------------------------------------------------------------------------------------------
select computer, operator, [source], min(starttime), max(endtime), DATEDIFF(minute, min(starttime), max(endtime)) 
from msdb.dbo.sysssislog 
where starttime between GETDATE()-1 and GETDATE() 
and [source] not in ('Nightly Load - SQL11')
group by computer, operator, [source] 
order by MIN(starttime) desc
---------------------------------------------------------------------------------------------------------------------
---END : In Package : Tiem taken by each step during run
---------------------------------------------------------------------------------------------------------------------
---Start : SPOTFire Category Check
---------------------------------------------------------------------------------------------------------------------
select 	 *  from sitecontrol..vwSpotfireCategory where  category in ( 'hpca')

select * from spotfirecategory where categorycodeid=3354

--insert into sitecontrol..spotfirecategory(categorycodeid,startdt,enddt) values(3354,getdate(),null)
---------------------------------------------------------------------------------------------------------------------
---END : SPOTFire Category Check
---------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------
 ---START : Time taken by each code in cwm run
---------------------------------------------------------------------------------------------------------------------
--CWM - Regular
select replace(t1.sql,'EndCWM - ','') as Categorycode, 
datediff(minute, t2.QueryTime, t1.QueryTime) ProcessTime,
@@SERVERNAME as ServerName,
CONVERT(varchar,t1.QueryTime,101) as ProcessDate 
from
     (select *, row_number() over (order by QueryTime desc) as rowid from CategoryCodeLog 
where (SQL like 'startCWM%' or SQL like 'EndCWM%' )
and QueryTime >= GETDATE() - 10 
) t1
 inner join 
     (select *, row_number() over (order by QueryTime desc) as rowid from CategoryCodeLog 
where (SQL like 'startCWM%' or SQL like 'EndCWM%')
and QueryTime >= GETDATE() - 10 
) t2
 on t1.rowid = t2.rowid - 1
 where t1.SQL like 'EndCWM%'
 and replace(t1.sql,'EndCWM - ','') in (select category from mt2sql14.sitecontrol.dbo.categorycode where Category='adra50')
 order by categorycode,t1.QueryTime
 
 --CWM - Increment 
 select replace(t1.sql,'EndIncrCWM - ','') as Categorycode, 
datediff(SECOND, t2.QueryTime, t1.QueryTime) ProcessTime,
@@SERVERNAME as ServerName,
CONVERT(varchar,t1.QueryTime,101) as ProcessDate 
from
     (select *, row_number() over (order by QueryTime desc) as rowid from CategoryCodeLog 
where (SQL like 'StartIncrCWM%' or SQL like 'EndIncrCWM%' )
and QueryTime >= GETDATE() - 10 
) t1
 inner join 
     (select *, row_number() over (order by QueryTime desc) as rowid from CategoryCodeLog 
where (SQL like 'StartIncrCWM%' or SQL like 'EndIncrCWM%')
and QueryTime >= GETDATE() - 10 
) t2
 on t1.rowid = t2.rowid - 1
 where t1.SQL like 'EndIncrCWM%'
 and month(t1.querytime)=1 and year(t1.querytime)=2014
 order by categorycode,t1.QueryTime
---------------------------------------------------------------------------------------------------------------------
 ---END : Time taken by each code in cwm run
---------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------
 ---Start : categorycodelog for particular code on mt2a
---------------------------------------------------------------------------------------------------------------------

select  mt2aclientserver from mt2asql06.sitecontrol.dbo.categorycode where Category='adAGR50'

select * from CategoryCodeLog where ID between 
(select MAX(id) from CategoryCodeLog where SQL in ('StartcWM - adAGR50'))
and 
(select MAX(id) from CategoryCodeLog where SQL in ('EndCWM - adAGR50') )
order by ID desc

---------------------------------------------------------------------------------------------------------------------
 ---END : categorycodelog for particular code on mt2a
---------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------
 ---Start : Segmentation custom udpate or not for category code
---------------------------------------------------------------------------------------------------------------------



select *
from mt2sql14.sitecontrol.dbo.categorycode categorycode
 inner join mt2sql14.subscription.dbo.clientexceptionalcatcode clientexceptionalcatcode
  on categorycode.clientid =clientexceptionalcatcode.clientid 
   and clientexceptionalcatcode.categorycodeid=categorycode.id 
 inner join mt2sql14.subscription.dbo.mastercustomdataupdategroup mastercustomdataupdategroup
  on categorycode.clientid =mastercustomdataupdategroup.clientid 
   and categorycode.id=mastercustomdataupdategroup.categorycodeid 
Where categorycode.Category in ('unica50','jnjca50','wlmca50','scjca50','clxca50','acoca50','asmca50')
and isnull(clientexceptionalcatcode.allowdefinecustupdt,0)=1  and ISNULL(categorycode.IsAdlert,0)=0 and categorycode.id not in (2176,2378,2513)
order by categorycode.clientid


---------------------------------------------------------------------------------------------------------------------
 ---END : Segmentation custom udpate or not for category code
---------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------
 ---Start : mdf,ldf file size check
---------------------------------------------------------------------------------------------------------------------
SELECT
      Name
    , Filename
    , convert(decimal(12,2),round(size/128.000,2)) as FileSizeMB
    , convert(decimal(12,2),round(fileproperty(name,'SpaceUsed')/128.000,2)) as SpaceUsedMB
    , convert(decimal(12,2),round((size-fileproperty(name,'SpaceUsed'))/128.000,2)) as FreeSpaceMB
FROM dbo.sysfiles


---------------------------------------------------------------------------------------------------------------------
 ---END : mdf,ldf file size check
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
 ---Start : Expanded records count
---------------------------------------------------------------------------------------------------------------------

 select 
CASE WHEN Right(PageDetailId,2)='AC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='EC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='DC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='MT' THEN Right(PageDetailId,2) 
	 WHEN Right(PageDetailId,2)='EM' THEN Right(PageDetailId,2)
	 WHEN Right(PageDetailId,2)='RM' THEN Right(PageDetailId,2)
ELSE 'Other' END
,count(1) 
from MasterClientCoverage.dbo.TempFuturePDT
Group By CASE WHEN Right(PageDetailId,2)='AC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='EC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='DC' THEN Right(PageDetailId,2) 
     WHEN Right(PageDetailId,2)='MT' THEN Right(PageDetailId,2) 
	 WHEN Right(PageDetailId,2)='EM' THEN Right(PageDetailId,2)
	 WHEN Right(PageDetailId,2)='RM' THEN Right(PageDetailId,2)
ELSE 'Other' END
With Rollup
Order by 1
---------------------------------------------------------------------------------------------------------------------
 ---End : Expanded records count
---------------------------------------------------------------------------------------------------------------------
--To check --To check delete status of MT2SQL06 records-------------------------------
select count(1) from acfvincr..tempacfvpdtdelete  with (nolock) 
---------------------------------------------------------------------------------------------------------------------

select * from categorycode where category like 'tar%'

select * from categorycode where ID=2345

select top 1 * from sitelog..MT2AExportTrackId




select count( * ) from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from mt2sql00.tempdb.dbo.canflyerids)


select distinct cp.clientid,clientname,category,[id],clientcode from subscription..clientprofile cp
join categorycode cc on cc.clientid=cp.clientid
order by 1

where clientid in (8,13)
select * from categorycode where clientserver='mt2sql11' and clientid=227 and cwmfull=1
select * from categorycode where clientserver='mt2sql11' and clientid=227 and clientpdt=1


SELECT * from categorycode where id=2379
SELECT * from categorycode where clientid in (7,319,422,227) and fv50=1

select * from categorycode where MT2aclientserver='mt2asql08' and clientid=7 and cwmfull=1

SELECT * from categorycode where clientid =27 (7,319,8,13,227)  and fv50=1


select * from connection..nightlyprocessing where sqlserver like 'MT2a%'


select * from spotfirecategory where categorycodeid=2627

--insert into spotfirecategory values(2627,getdate(),null)
select 	 *  from vwSpotfireCategory where  category in ( 'sfrd50')

select * from categorycode where id in (
select categorycodeid FROM         dbo.SpotfireCategory
where categorycodeid in (
select id from categorycode where clientserver='mt2sql06'))


select * from vw_qvfcfields where displayname like 'uniq%'





select * from categorycode where category='pgpep'
--update categorycode set clientserver='MT2SQL06'
where clientid in (146,147) and clientserver='mt2sql02'

           




select * from subscription..clientcontrol where clientid=4


select processorder, * from categorycode where clientserver = 'mt2sql08' and ispdt = 0 and clientpdt = 0 and cwmfull is null 




select * from vw_merchandisecategory where categorycodeid=2101




Select * from MT2SQL14.connection.dbo.nightlyprocessing where clientrunset > dateadd(dd, -1, convert(varchar,getdate(), 101))



select * from CSMasterAdvQPDisplaySeq


select  * from categorycode where isnull(fv50,0)=0 and clientserver='mt2sql13'
select  * from categorycode where isnull(fv50,0)=1 and clientserver='mt2sql13'





select p.clientname,c.category from vwspotfirecategory s join sitecontrol..categorycode c on s.category=c.category 
join subscription..clientprofile p on c.clientid=p.clientid where c.clientserver='mt2sql05'


select distinct defaultemailaddress from vwuser where firstname='craig' and lastname='martin'


select * from MT2SQL00.MasterAdviewData.dbo.MasterCanadaSaleCalendar order by month,year



select distinct v.clientid,clientname,cc.category,cc.ispdt,cc.clientpdt,cc.cwmfull,isadlert
 from subscription..vwclient v join categorycode cc on v.clientid=cc.clientid
where v.fv40=46 and isnull(cc.fv50,0)=0  and v.clientid not in (4,65)
order by v.clientid


select clientid,clientname,clientcode from subscription..clientprofile where clientid in (
select  mt2aClientServer , category from sitecontrol..categorycode where mt2aClientServer in ('mt2asql07','mt2asql05') order by 1,2




select * from subscription..clientexceptionalcatcode where categorycodeid=2352





select * from sitecontrol..tablenames where categorycodeid in (2940) and tableid in (3,22)

select * from CategoryCode where clientserver ='mt2sql04' and CWMFull=1 
select * from CategoryCode where  Category like '%pgcorp%'
select * from CategoryCode where clientrun=1 and isfull=1 and isfsi <> 1 
--update categoryCode set cwmfull=1,sourcecwm='SQL03..acfvFlyerReports' where category='resspep'
--update mt2asql06.sitecontrol.dbo.categoryCode set incradrun=0 where category='prod50'

update CategoryCode set isfull=0 where clientserver in ('mt2sql13','mt2sql06') and isfull=1

select * from sitecontrol..vw_catinfo where fvcctype in (2,4,6) HomePageLink   like '%store%'
select * from tablenames where CategoryCodeID in (2176) and tableid=24
select * from MasterCanProductTerritory

select * from ArchiveSub..clientprofile  where clientname  like '%acosta%'
select * from subscription..clientprofile where clientname  like '%real%'
select * from categorycode where clientid=472
select * from sitecontrol..categorycode where id=3354
select * from tablenames where CategoryCodeID in (2176) and tableid=24,2391) and TableID in (3,22,56)

2588	BFCb50
2274	CWU50
2538	BAR50

select * from tablenames where categorycodeid in (2274,2538,2588) and tableid=12
select * from categorycode where id in (2274,2538,2588) and tableid=12
update categorycode set cwmfull=null,ispdt=0,clientpdt=0 where category='pgcorp50'
select clientserver,count(id) countofcodes from CategoryCode where not isnull(IsIntegerID,0) =1 and ClientID < 900
and ISNULL(fv50,0) = 1
group by ClientServer  order by 1 


--insert into tempdb..counttable
select clientserver,category,0 from CategoryCode where not isnull(IsIntegerID,0) =1 and ClientID < 900
and ISNULL(fv50,0) = 1 and (ispdt=1 or clientpdt=1)

select * from tempdb..counttable where pdtCOUNT <> 0 order by 1,3


select 'update mt2sql14.tempdb.dbo.counttable set pdtcount=(
 select count(1) as pdtcount from ' + clientserver + '.' + RIGHT(clientserver,5) +'.dbo.' +  Category +'detailreports ) 
 where category= ''' +Category  + ''''
from CategoryCode where not isnull(IsIntegerID,0) =1 and ClientID < 900 and (ispdt=1 or clientpdt=1) and ISNULL(fv50,0) = 1 
order by 1 


select mt2aClientServer ,* from CategoryCode where clientid=92 and ISNULL(IsAdlert,0)=0 and (IsPDT=1 or clientpdt=1) and FullSourceCode ='wlm50'
select * from CategoryCode where clientid=92 and ISNULL(IsAdlert,0)=0 and CWMFull=1 


--update categorycode set mt2aclientserver=null where clientid=92 and ISNULL(IsAdlert,0)=0 

select mt2aclientserver,* from CategoryCode where Category in ('per50','wlmca50')
select * from CategoryCode where ClientID =162 and (ispdt=1 or clientpdt=1) and ISNULL(isadlert,0) = 0 and FullSourceCode ='wlm50'




select distinct mt2aClientServer from categorycode where sourcecwm like '%EPCanADChildWebMain%' and incr=1

select * from CategoryCode where IsConcat =3 order by category



select * from categorycode where ClientServer='mt2sql06' and  fv50=1 and IsIntegerID =0
select * from categorycode where iSNULL(IsAdlert,0)=0 and IsIntegerID =0 and fv50=1

select * from subscription..clientdatabases where clientid=511 homepagelink  like '%ecomm%'
select * from subscription..clientprofile where clientname  like '%3m%'
select * from vw_catinfo where homepagelink like '%social%'

select * from vwspotfirecategory where categorycodeid in (
select id from categorycode where category in 
('mmmca50','bgf50','bgfMGF50','blaca','bpc','cbca50','cra50','DGL50','droca','femca','flo50','glfca50','henca','fpusc','IPC50','IPCcan50','ippca','jlca50','kelca50','sor50','LoL50','lolca','mcca50','mrica50','molsca','nchca50','POM50','RAY50','sfwca','sanca','jffca50','srpca50','wafCAN50','waf50','wlmhnw50','WLM50','WMC50','wlmOPT50','WLMhisp50','wlmhispcat50','wlmPR50','adWLM50','adWLMPR50','wlmappb50','wlmfdc50','wlmhdl50','wlmgr50','wlmhom50','wlmCON50','ADWMC50','wlmtad50','wwv')
)

select Category,clientserver,mt2aclientserver,* from CategoryCode where ID not  in (
select id from CategoryCode where ISNULL(IsIntegerID ,0)=0 and fv50=1 and isnull(isadlert,0)=0 and  (CWMFull =1 or (IsPDT=1 or ClientPDT=1))
) and ISNULL(IsIntegerID ,0)=0 and fv50=1 and isnull(isadlert,0)=0 


select  Category,clientserver,mt2aclientserver
 from CategoryCode where ISNULL(IsIntegerID ,0)=0 and fv50=1 and isnull(isadlert,0)=0 and  (CWMFull =1 or (IsPDT=1 or ClientPDT=1))
order by ClientServer ,Category 

select * from vwspotfirecategory where categorycodeid in (2101,2416)

select * from mt2asql06.sitecontrol.dbo.categorycode where incradrun=1
select MAX(id) from CategoryCode 
select * from categorycode where clientserver='mt2sql08' and IsIntegerID =1 and mt2aclientserver='mt2asql08'category like '%mil%'


select * into NightlyProcessingSQL03 from connection..NightlyProcessing  where ProcessID=40143
select *  from connection..NightlyProcessing  where ProcessID=40143

--update connection..NightlyProcessing set Processing =1,DataLoaded =0,ProcessingEnd=null ,PDTEnd=null  where ProcessID=40143



--update categorycode set IsFull=0 where category='adv11'


drop table categorycode01152014



/*
update categorycode set ClientRun=1 where clientserver='mt2sql08'  and clientrun=0 and (IsPDT=1 or ClientPDT=1) and IsIntegerID =1 
select isfull,processorder,* from categorycode where clientserver='mt2sql08'  and clientrun=0 and (IsPDT=1 or ClientPDT=1) and IsIntegerID =1 
*/



select * from CategoryCode where ClientServer='mt2sql04' and clientid=92 and isnull(IsIntegerID,0) <> 1  and (ispdt=1 or clientpdt=1) 




select * from CategoryCode where ISNULL(IsIntegerID ,0)=0 and IsMaster=0 and ISNULL(IsFSI  ,0)=0 and ISNULL(IsAdlert ,0)=0 


select ClientServer,COUNT(1) from CategoryCode where SourceCWM like '%epcan%' and ISNULL(IsFSI  ,0)=0 and ISNULL(IsAdlert ,0)=0 
group by ClientServer 

select * from CategoryCode where Category like 'pel%'
--update CategoryCode set mt2aClientServer =null where Category ='pgfeed50'

select * from CategoryCode where ClientServer ='mt2sql02' and SourceCWM like '%epcan%'


select * from CategoryCode where isadlert=1 and clientpdt=1
--Update MT2SQL14.SiteControl.dbo.CategoryCode set ispdt=0,clientpdt=0,cwmfull=null, IsFull=0  where category in ('fpcanc')
--update categorycode set SourceCWM ='masterclientcoverage..EPAMBBDAAAChildWebMain' ,fullsourcecode='MasterBevAl..BevALMaster' where category in ('FUTb50')

--update categorycode set SourceCWM ='masterclientcoverage..EPAMBBDAAAFlyerReports' ,fullsourcecode='MasterBevAl..MasterBevAL',isfull=1 where category in ('futb50')
--insert into categorycode_nf_mt2 values('FUTcen50')
('FUTcen50','FUTctr50','FUTest50','futb50')

--update categorycode set isfull=1 where category='adv10bf'
select * from CategoryMarkedFull 


select *
from mt2sql14.sitecontrol.dbo.categorycode categorycode
 inner join mt2sql14.subscription.dbo.clientexceptionalcatcode clientexceptionalcatcode
  on categorycode.clientid =clientexceptionalcatcode.clientid 
   and clientexceptionalcatcode.categorycodeid=categorycode.id 
 inner join mt2sql14.subscription.dbo.mastercustomdataupdategroup mastercustomdataupdategroup
  on categorycode.clientid =mastercustomdataupdategroup.clientid 
   and categorycode.id=mastercustomdataupdategroup.categorycodeid 
Where categorycode.Category in ('unica50','jnjca50','wlmca50','scjca50','clxca50','acoca50','asmca50')
and isnull(clientexceptionalcatcode.allowdefinecustupdt,0)=1  and ISNULL(categorycode.IsAdlert,0)=0 and categorycode.id not in (2176,2378,2513)
order by categorycode.clientid

select mt2aClientServer,Category,cwmfull from CategoryCode where ClientID in (95,98) and  cwmfull=1 

select distinct  fieldid,fieldname,displayname,* from mt2sql14.sitecontrol.dbo.vw_QvfcFields 
select distinct fieldid,fieldname,displayname,* from mt2sql14.sitecontrol.dbo.vw_reportfields

select * from categorycode_nf_mt2
--insert into categorycode_nf_mt2 values('ADV10bf')

select * from categorycode where (fullsourcecode like '%beval%' or PartialSourceCode like '%bev%')
select * from categorycode where category in ('parpep')
--update categorycode set isfull=1 where  category in ('parpep')
--update categorycode set sourcecwm=replace(sourcecwm,'childwebmain','FlyerReports') where category in ('bcrFTP50','BFCb50','CWU50','dga50','futb50','FUTcen50','FUTctr50','FUTest50','galba')
--update categorycode set fullsourcecode='MasterBevAl..MasterBevAl' where fullsourcecode='MasterBevAl..BevAlMaster' and  category in ('bcrFTP50','BFCb50','CWU50','dga50','futb50','FUTcen50','FUTctr50','FUTest50','galba')

select * from categorycode c join subscription..clientprofile cp on c.clientid=cp.clientid join  where category in ('bcrFTP50','BFCb50','CWU50','dga50','futb50','FUTcen50','FUTctr50','FUTest50','galba')

select * from categorycode where id=2983

select * from vwSpotfireCategory where category='avcd'
select * from vwcubecategory where category like '%nst%'
select * from cubecategory where categorycodeid in (select id from categorycode where clientid=91) --categorycodeid=1841

insert into cubecategory values(1841,getdate(),null)


select * from vw_MasterCustomStep where Category ='ahld50'


select * from ClientBrandException  where categorycodeid=1824
select * from ClientRetMktException   where categorycodeid=1824




select * from categorycode where category='hdmerge'
--update categorycode set isfull=1 where category='wnpca50'


select clientserver,count(1) from categorycode 
where customstep=1 and clientid < 9999 
group by clientserver 







select * from mt2sql00.MasterClientCoverage.dbo.jaAdamsChildWebMain


Select ClientCWMFullRunDate,* from categorycode where clientid=999 and Category like 'adja%'
Select mt2aClientServer ,* from categorycode where category='emlap50'

Select * from Subscription.dbo.ClientDatabases where CategoryCodeID in (Select [ID] from sitecontrol..categorycode where clientid=999 )



select * from clientdatabases where clientid=719 and yourweb like '%food%'


select  * from Subscription..clientprofile where clientname like '%office%'
select * from sitecontrol..categorycode where clientid=87 like '%bui%'
select * from sitecontrol..categorycode where category like '%ehuspep%' and cwmfull=1

select * from tablenames where categorycodeid = 4670 
select * from sitecontrol..categorycode where clientserver='mt2sql08'category like 'fsi%'

select * from sitecontrol..MasterCustomUpdate  where CategoryID in (2608,2669)
select * from sitecontrol..MasterCustomUpdate  where CategoryID in (2110,2449)

select * from sitecontrol..MasterCustomUpdatedur  where category='emla50'

select * from MasterFields where fieldname ='channel'

select * from vw_MasterSegmentation where clientid=349



select * from Subscription.dbo.CustomDataUpdateControl
 select * from Subscription.dbo.SavedCustomDataUpdates where categorycodeid=2193
 select * from Subscription.dbo.SavedCustomDataUpdatesDetail where CustomDataUpdateId =103
select * from MasterCustomUpdate where fieldname='weight'

select * from mt2sql01.conversioncontrol.dbo.mcupdate where databasecategory='lgt50'

select * from merchandisecategorycontrol where categorycodeid=2770
  
select * from MerchandiseCategoryTemplatesdetail where MCTemplateID =2022

/*
delete from MerchandiseCategoryTemplatesdetail where realcategory in ('English Muffins')			and mctemplateid=3380 
delete from MerchandiseCategoryTemplatesdetail where realcategory in ('Morning Goods')				and mctemplateid=3380 
delete from MerchandiseCategoryTemplatesdetail where realcategory in ('Shelf Stable Croissants') 	and mctemplateid=3380 
delete from MerchandiseCategoryTemplatesdetail where realcategory in ('Tortillas\Pitas') 			and mctemplateid=3380 
*/



SELECT * FROM MT2DEV0.SITECONTROL50.DBO.MASTERFVCCTYPES
SELECT * FROM SITECONTROL..MASTERFVCCTYPES
select * from sitecontrol..categorycode where category='prdbev50'clientserver='mt2sql07' and FullSourceCode like '%beval%'
--INSERT INTO SITECONTROL..MASTERFVCCTYPES VALUES (4,'Ad Comparision	Custom',0,NULL,NULL)
--UPDATE sitecontrol..categorycode SET FVCCTYPE=4 WHERE CLIENTPDT=1 AND FVCCTYPE=2 



select * from mt2sql00.masterclientcoverage.dbo.masterclientcwm where categorycodeid in (select id from sitecontrol..categorycode where category like '%av%')

select * from tablenames where categorycodeid=4681


select * from merchandisecategorycontrol where categorycodeid=4673
select * from merchandisecategorytemplates where mctemplateid =3378
select * from MerchandiseCategoryTemplatesDetail where mctemplateid =3378



-----------------CATEGORYCODE INFO----------------------------------
select * from sitecontrol..vw_catinfo where category like '%hmlpep%'

-----------------------PENDING SUBS FOR DAY -----------------------------------
select s.SubscriptionID, s.subscriptionname, cc.category, cc.ClientServer, c.clientname 
from subscription..subscription s 
		join subscription..TempPendingSubscriptions t With (NoLock) 
			on s.SubscriptionID = t.subscriptionid
		join sitecontrol..categorycode cc
			on s.CategoryCodeId = cc.ID
		join subscription..clientprofile c
			on cc.clientid = c.ClientID
Where SubType < 3
	and ClientServer IN('MT2SQL16')
order by s.SubscriptionID 

----------------------------------------------------------------------------------
--ACFVIncr count daily from mt2sql03 - demo pep server 
select * from mt2sql03.sql03.dbo.acfvprocesstime order by id desc

----------------------------------------------------------------------------------
select date,count(1) from mt2sql01.master.dbo.FuturePDT_Dur_dailycheck   group by date  order by date desc 

----------------------------------------------------------------------------------
--get count of all tables for particular code ---------------
select 'select count(1) , ''' + name  + ''' from ' + name + ' union '  from sysobjects where name like 'barpep%' and xtype='u' 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--ANH Data Check---------------
select * from mt2sql08.sql08.dbo.anh50matrixreport order by 1 desc 
----------------------------------------------------------------------------------


select * from categorycode order by id desc  where category like  ('prdcnBA%') 


select * from vwcubecategory where category in 
('tmgpep') 



--update categorycode set isfull=0 where category in ('rndct','rnta') 



select * from vw_catinfo where category like 'wlmavcd%' order by clientname 
select * from vw_catinfo where clientid=159 
select * from vw_catinfo where clientname like '%target%'

select * from archivesub..categorycode where category='wlmavcd'
select * from archivesub..clientprofile where clientname like '%Briggs & Stratton%'



select * from  CategoryCode where category='chrpep'
--update c set isfull=0 from  CategoryCode c where  category='tarpep'
select * from categoryfields where categorycodeid=4733
select  * from masterfields where fieldid in (142)

/*

select * from DashboardReport where CategoryCodeId in (select CategoryCodeId from sitecontrol..vw_catinfo where clientname like '%whirl%')


select top 1 * from sitelog..useractivity with(nolock) where category=1358

select top 1 * from sitelog..queryexecutionlog  with(nolock) where category=1358

*/

select * from vw_catinfo where clientname like 
select * from vw_catinfo where category like '%adcnlPeP%'
select * from  vw_MerchandiseCategory where categorycodeid=  3000

update categorycode set isfull=0 where fvcctype in (2,4,6) and isfull=1 
select * from archivesub..categorycode where category='adcnlPeP'



select max(categorycodeid) from vw_catinfo where category='fpuscpep'
select * from vw_catinfo where FullSourceCode like '%beval%'


select * from clientbrandexception where categorycodeid=1726 and brand like 'E%j'








select * from sitecontrol..MasterPEPdistrictupdate


select * from 

sp_rename 'wlmppdistrictupdate','MasterPEPdistrictupdate'





select * from tablenames where categorycodeid=4770



select * from mt2sql01.conversioncontrol.dbo.ConversionCategory where databasecategory='adr50'


select * from Subscription..clientprofile where clientid=12clientname like '%kim%'
select * from vw_catinfo where clientname like '%kim%'
select * from categorycode where category='pgcca'


select * from Mil50ProductTerritory where category='FMBs' and brand='Truly Hard Seltzer'





select * from clientbrandexception where categorycodeid=2538 and brandset <> 1 




select distinct clientname,homepagelink  from vw_catinfo where clientserver in ('mt2sql06','mt2sql13') and ( ispdt=1 or cwmfull=1) order by 1,2 

select  distinct clientname,homepagelink  from vw_catinfo where clientserver in ('mt2sql16','mt2sql17') and ( clientpdt=1 ) order by 1,2 


select * from mt2sql01.conversioncontrol.dbo.conversioncategory where databasecategory='eup50'



select distinct sourcecwm,*  from vw_catinfo where clientid=1268category='lnv50'
select * from mt2sql14.sitecontrol.dbo.vw_catinfo where clientname like '%can%' and fvcctype in (2,4,6)


select * from mt2sql00.masterclientcoverage.dbo.masterclientcwm a join mt2sql00.masterclientcoverage.dbo.retmkt b on a.retmktid=b.retmktid  where categorycodeid=2426
and advertiser like '%pigg%'
masterclientcoverage..EPAMBBDAAAChildWebMain

s


select *  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver='sql16' order by 2 desc 



select * from MasterCanProductTerritory
select * from FVVersion 

select * from sitecontrol..categorycode  where IsIntegerID =0 and isadlert <> 1 and ( cwmfull=1 or clientpdt=1)

select * from sitecontrol..vw_catinfo  where fvcctype in (0) 
and clientid not in (select clientid from Subscription..vwuser )



select * from subscription..clientprofile where clientname like '%dura%'
select isfull,* from sitecontrol..categorycode where  clientid=1009
select * from  UserHomePageLinkAccess a join vwuser b on a.userid=b.userid where categorycodeid=  4507