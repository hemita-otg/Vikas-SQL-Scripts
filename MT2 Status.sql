

select * into tempdb..fullruncodes from 
(select ClientServer,CategoryList = STUFF((SELECT distinct  ' | ' + x.Category
FROM (select ClientServer,cast(COUNT(IsFull) as varchar(10)) as Category
 from mt2sql14.sitecontrol.dbo.categorycode 
where (isnull(isfsi,0)=0 and clientpdt=1 and isfull=1  and ClientServer not in ('MT2SQL00A'))
or Category in (select cc.databasecategory
from MT1SQL01.MasterData.dbo.AdlertToFV ata join MT2SQL01.Conversioncontrol.dbo.conversioncategory cc
on ata.DatabaseName=cc.ClientName
left join MT1SQL01.MasterData.dbo.vwAdlertToFVProcRelationship pr
on (ata.typeofexport = pr.fullID OR ata.typeofexport = pr.incrementalID)
where ata.enabled = 1 and ata.typeofexport = pr.fullID) group by ClientServer UNION
select ClientServer,Category from mt2sql14.SiteControl.dbo.FullCodePDTCount)  x WHERE  x.ClientServer = t.ClientServer  
ORDER BY ' | ' + x.Category FOR XML PATH('')), 1, 1, '') 
from (select ClientServer,cast(COUNT(IsFull) as varchar(10)) as Category from mt2sql14.sitecontrol.dbo.categorycode 
where (isnull(isfsi,0)=0 and clientpdt=1 and isfull=1  and ClientServer not in ('MT2SQL00A'))
or category in (select cc.databasecategory
from MT1SQL01.MasterData.dbo.AdlertToFV ata join MT2SQL01.Conversioncontrol.dbo.conversioncategory cc
on ata.DatabaseName=cc.ClientName
left join MT1SQL01.MasterData.dbo.vwAdlertToFVProcRelationship pr
on (ata.typeofexport = pr.fullID OR ata.typeofexport = pr.incrementalID)
where ata.enabled = 1 and ata.typeofexport = pr.fullID) group by ClientServer UNION
select ClientServer,Category from mt2sql14.SiteControl.dbo.FullCodePDTCount)  t
group by ClientServer
) x
	


SELECT     ActiveLocation, sqlserver, processing, dataloaded, enabledsettime, conversionstarttime, conversionendtime, backupstarttime, backupendtime,BackupLocation
into tempdb..ConversionStatus
FROM         (SELECT     TOP (5) case when V.ActiveLocation ='Backup' then  V.ActiveLocation+' - '+rl.restoreserver else V.ActiveLocation end as ActiveLocation, NC.sqlserver, NC.processing, NC.dataloaded, NC.enabledSetTime, NC.conversionStartTime, NC.conversionEndTime, BackupLocation,
                                              NC.backupStartTime, NC.backupEndTime
                       FROM          mt2sql14.Connection.dbo.NightlyConversion AS NC LEFT OUTER JOIN
                                              mt2sql14.Connection.dbo.vw_MT2Status AS V ON NC.sqlserver = V.SQLServer
                                              left join mt2sql14.connection.dbo.DBBackupLocation bl on NC.SQLSERVER=bl.backupserver
											left join mt2sql14.connection.dbo.DBRestoreLocation rl on rl.backupid = bl.id
                       WHERE      (NC.sqlserver IN ('MT2SQL01', 'MT2SQL03','MT2SQL12', 'MT2SQL05','MT2SQL09'))
                       ORDER BY NC.id DESC) AS d
ORDER BY sqlserver

select * into tempdb..NPStatus from sitecontrol..prakash_packagemanager

;With categoryCodeStatus(mt2ClientServer,Total,Pending,Completed)
AS 
(
select main.ClientServer as mt2ClientServer,COUNT(main.ClientServer)  as Total, 
(
 select COUNT(1) 
 from mt2sql14.sitecontrol.dbo.categorycode WITH (NOLOCK)
 where LEN(isnull(ClientServer,''))>1 and ClientRun = 1 and ClientServer = main.ClientServer
 --and ISNULL(isadlert,0)=0
 group by ClientServer
) as Pending ,
 (
 select COUNT(1) 
 from mt2sql14.sitecontrol.dbo.categorycode WITH (NOLOCK)
 where LEN(isnull(ClientServer,''))>1 and ClientRun = 0 and ClientServer = main.ClientServer
 --and ISNULL(isadlert,0)=0
 group by ClientServer

 )as Completed
from mt2sql14.sitecontrol.dbo.categorycode  main WITH (NOLOCK)
where LEN(isnull(main.ClientServer,''))>1
 --and ISNULL(isadlert,0)=0
group by main.ClientServer

 
)
select * into tempdb..codeStatus from categoryCodeStatus



select * into FvDataLoad..MT2Status3 from tempdb..codestatus
select * into FvDataLoad..MT2Status1 from tempdb..npstatus
select * into FvDataLoad..MT2Status2 from tempdb..conversionstatus
select * into FvDataLoad..MT2Status4 from tempdb..fullruncodes 



select * from  FvDataLoad..MT2Status1
select * from  FvDataLoad..MT2Status2
select * from  FvDataLoad..MT2Status3
select * from  FvDataLoad..MT2Status4

use ApimaPractice 



select * into CodeStatus from mt2sql14.tempdb.dbo.codestatus
select * into NPStatus from mt2sql14.tempdb.dbo.npstatus
select * into ConversionStatus from mt2sql14.tempdb.dbo.conversionstatus
select * into FullRunCodes from mt2sql14.tempdb.dbo.fullruncodes 


select * from NPStatus
select * from ConversionStatus 
select * from CodeStatus
select * from Fullruncodes