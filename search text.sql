
--================================================-------Search Text in Job-----================================================--------------------
USE [msdb]
GO
SELECT j.job_id,
       s.srvname,
       j.name,
       js.step_id,
       js.command,
       j.enabled 
FROM   dbo.sysjobs j
JOIN   dbo.sysjobsteps js
       ON     js.job_id = j.job_id 
JOIN   master.dbo.sysservers s
       ON     s.srvid = j.originating_server_id
WHERE  js.command LIKE N'%casPEP Brand Family Assignment%'
Go
--================================================-------Search Text in Objects-----================================================--------------------


If exists(select top 1 * from tempdb.dbo.sysobjects where name='TextSearchObject')
Drop Table tempdb.dbo.TextSearchObject
Go

Create Table Tempdb.dbo.TextSearchObject(DBName varchar(50),ObjectName varchar(100),OType varchar(10),ServerName varchar(15))
Go

Declare @SQL varchar(max)

;With CTE
As
(
select 'Use '+name+char(13)+' insert into Tempdb.dbo.TextSearchObject
select distinct '''+name+''' as DBName,object_name(sc.id) as Objectname,so.Type,@@ServerName as ServerName from '+name+'..syscomments sc Join '+name+'..sysobjects so  
on sc.id=so.id
and sc.text like ''%KEYWORD_SEARCH%'' ' As Query 
from sys.databases where state_desc='ONLINE'
)
SELECT @sql = COALESCE(@sql + CHAR(13), '') + CAST(Query AS varchar(max))from cte 

exec (@sql)


select * from tempdb.dbo.TextSearchObject
Go
--================================================-------Search Text in SSIS Package-----================================================--------------------
use tempdb
Declare @FolderPath varchar(max)='\\mediatrack.net\FVData\SQL\Packages\MT2SQL00\Master Packages\DataProcessing\'
Declare @subdirectory varchar(max)
Declare @SQL varchar(max)

IF OBJECT_ID('tempdb..#DirectoryTree') IS NOT NULL
      DROP TABLE #DirectoryTree;

CREATE TABLE #DirectoryTree (
       id int IDENTITY(1,1)
      ,subdirectory nvarchar(512)
      ,depth int
      ,isfile bit);

If exists(select top 1 * from sysobjects where name='PkgXML')
Drop Table PkgXML

create table PkgXML (xmldata xml,PkgName Varchar(200))

INSERT #DirectoryTree (subdirectory,depth,isfile)
EXEC ('master.sys.xp_dirtree '''+@FolderPath+''',1,1;')


IF Cursor_Status('variable', 'PkgCheckCursor') >= 0
       Begin
              Close PkgCheckCursor
              Deallocate PkgCheckCursor         
       End



Declare PkgCheckCursor Cursor Static For Select subdirectory 
FROM #DirectoryTree
WHERE isfile = 1 AND RIGHT(subdirectory,5) = '.dtsx'
ORDER BY id;


Open PkgCheckCursor 
Fetch Next From PkgCheckCursor Into @subdirectory
While @@Fetch_Status=0
       Begin

              Exec('insert into PkgXML SELECT  CAST(pkgblob.BulkColumn AS XML) pkgXML,'''+@subdirectory+'''  FROM  OPENROWSET(bulk '''+@FolderPath+@subdirectory+''',single_blob) AS pkgblob')
              
Fetch Next From PkgCheckCursor Into @subdirectory
       End           
Close PkgCheckCursor
Deallocate PkgCheckCursor  

Go

WITH XMLNAMESPACES('www.microsoft.com/SqlServer/Dts' AS DTS,'www.microsoft.com/sqlserver/dts/tasks/sqltask' as SQLTask)
Select 
        T1.C1.value('@DTS:ObjectName[1]','varchar(max)') as StepName
       ,T2.C2.value('@SQLTask:SqlStatementSource[1]','varchar(max)') as ComponentName,PkgName 
    
FROM 
       PkgXML
       CROSS APPLY xmldata.nodes('//DTS:Executable') as T1(C1)
       CROSS APPLY C1.nodes('DTS:ObjectData/SQLTask:SqlTaskData') as T2(C2)
WHERE 
       T2.C2.value('@SQLTask:SqlStatementSource[1]','varchar(max)') like '%KEYWORD_SEARCH%'

Go
--================================================-------Search Column in Tables-----================================================--------------------
If exists(select top 1 * from tempdb.dbo.sysobjects where name='TextSearchObject')
Drop Table tempdb.dbo.TextSearchObject
Go

Create Table Tempdb.dbo.TextSearchObject(DBName varchar(50),ObjectName varchar(100))
Go

Declare @SQL varchar(max)

;With CTE
As
(
select 'Use ['+name+']'+char(13)+' insert into Tempdb.dbo.TextSearchObject
select distinct '''+name+''' as DBName,TABLE_NAME
from ['+name+'].INFORMATION_SCHEMA.COLUMNS
where column_name =''KEYWORD_SEARCH''
' As Query 
from sys.databases where state_desc='ONLINE'
)
SELECT @sql = COALESCE(@sql + CHAR(13), '') + CAST(Query AS varchar(max))from cte 
--print (@sql)
exec (@sql)
select * from  tempdb.dbo.TextSearchObject

