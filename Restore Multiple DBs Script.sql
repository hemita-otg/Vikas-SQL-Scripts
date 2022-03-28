--For Restoring multiple DBs there are 2 parts.
--Run Part1 as below
--Run Part2 for DBs to restore based on table created with Logical and PhysicalDataFileName in Part1
--Run Part2 one by one for each db

--------------------------------
--PART 1 
--------------------------------

if object_id('tempdb.dbo.Tempdb..DataBaseNames') is not null 
    drop TABLE Tempdb..DataBaseNames
go

create TABLE Tempdb..DataBaseNames(id INT identity ,
 name sysname,
 logicalfileName Varchar(50),
 DataFileName Varchar(50),
 logicalfilePath Varchar(150),
 DatafilePath Varchar(150)
)

go
set nocount on
declare @dbname sysname, @LogicalDataFile      sysname , @LogicalLogFile       sysname, @PhysicalDataFile     nvarchar(260) , @PhysicalLogFile      nvarchar(260)
insert into Tempdb..DataBaseNames(name)
select name
from sys.databases
--where name not in ('master','msdb','model', 'tempdb')
order by name



declare @id INT, @cnt INT, @sql NVARCHAR(max), @currentDb sysname;

select @id = 1, @cnt = max(id)
from Tempdb..DataBaseNames

while @id <= @cnt
BEGIN
select @dbname=name from Tempdb..DataBaseNames where id=@id
     
 
-- Data file
select  @LogicalDataFile = name
        , @PhysicalDataFile = physical_name
from    sys.master_files
where   database_id = db_id(@DBName)
        and type_desc = 'ROWS'
 
-- Log file
select  @LogicalLogFile = name
        , @PhysicalLogFile = physical_name
from    sys.master_files
where   database_id = db_id(@DBName)
        and type_desc = 'LOG'
 
 
update Tempdb..DataBaseNames 
        set DataFileName= @LogicalDataFile 
        ,logicalfileName= @LogicalLogFile
        , Datafilepath =@PhysicalDataFile 
        , logicalfilePath = @PhysicalLogFile 
 where id=@id       
 set @id = @id + 1;

END

----Change the destination path in below  syntax as per your envrionment 
--select 'RESTORE DATABASE ['+Name+'] FROM  DISK = N''F:\SQLBackup\Default\'+name+'.bak'' WITH  FILE = 1,  MOVE N'''+logicalfilename+''' TO N''F:\SQL\Logs\'+name+'_1.log'' ,MOVE N'''+DataFileName+''' TO N''F:\SQL\Logs\'+name+'_1.mdf'''
--from Tempdb..DataBaseNames

--drop table Tempdb..DataBaseNames
go



select * from tempdb..DataBaseNames 


--------------------------------
--PART 2
--------------------------------

Use Master
DECLARE @fileDate VARCHAR(20) -- used for file name
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 
Declare @SQL varchar(2000)
Declare @DBName varchar(2000)
Declare @BakName varchar(2000)
Declare @backupLoc varchar(2000)
Declare @restoreLoc varchar(2000)
Declare @restoreLogLoc varchar(2000)
Declare @filename varchar(2000)
Declare @logfilename varchar(2000)


select 
		@bakname=name,
		@DBName=name,
		@logfilename=logicalfilename,
		@filename=datafilename,
		@backuploc='\\mt2bu1\MT2BU1D\MT2SQL00\',
		@restoreLoc='D:\SQLData\'
		,@restoreLogLoc='D:\SQLData\' 
from tempdb..DataBaseNames where name='FVDataLog'

Set @SQL =  'restore database ' + @DBName + ' from Disk =''' + @backuploc + @BakName + '_' + @fileDate + '.bak'' WITH 
MOVE ''' + @filename + ''' TO ''' + @restoreLoc + @DBName + '.mdf'', MOVE ''' + @logfilename + ''' TO ''' + @restoreLogLoc + @DBName + '_log.ldf'', 
Recovery, Replace'

print @SQL

--exec(@SQL)


