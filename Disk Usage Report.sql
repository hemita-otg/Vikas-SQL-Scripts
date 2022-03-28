declare @svrName varchar(255)
declare @sql varchar(400)

set @svrName = @@SERVERNAME
set @sql = 'powershell.exe -c "Get-WmiObject -ComputerName ' + QUOTENAME(@svrName,'''') + ' -Class Win32_Volume -Filter ''DriveType = 3'' | select name,capacity,freespace | foreach{$_.name+''|''+$_.capacity/1048576+''%''+$_.freespace/1048576+''*''}"'

-- 1....Drive with Capacity + FreeSpace
if exists (Select * from tempdb.sys.objects where name='outputdrive')
	drop table tempdb..outputdrive

CREATE TABLE tempdb..outputdrive
(line varchar(255))

insert tempdb..outputdrive
EXEC xp_cmdshell @sql

select @svrName as ServerName
   ,rtrim(ltrim(SUBSTRING(line,1,CHARINDEX('|',line) -1))) as DriveName
   ,round(cast(rtrim(ltrim(SUBSTRING(line,CHARINDEX('|',line)+1,
   (CHARINDEX('%',line) -1)-CHARINDEX('|',line)) )) as Float)/1024,0) as 'Capacity(GB)'
   ,round(cast(rtrim(ltrim(SUBSTRING(line,CHARINDEX('%',line)+1,
   (CHARINDEX('*',line) -1)-CHARINDEX('%',line)) )) as Float) /1024 ,0)as 'Freespace(GB)'
from tempdb..outputdrive
where line like '[A-Z][:]%'
order by drivename

-- 2...Database with DataFileSize + LogFileSize
if exists (Select * from tempdb.sys.objects where name='outputdb')
	drop table tempdb..outputdb

;with fs
as
(
    select database_id, type,  size, physical_name 
    from sys.master_files
)
select @svrName as ServerName,
    name,
    (select CAST((SUM(SIZE) * 8 / 1024.00 / 1024.00) AS NUMERIC(18,2))  from fs where type = 0 and fs.database_id = db.database_id) DataFileSizeGB,
    (select CAST((SUM(SIZE) * 8 / 1024.00 / 1024.00) AS NUMERIC(18,2))  from fs where type = 1 and fs.database_id = db.database_id) LogFileSizeGB,
    (select physical_name from fs where type = 0 and fs.database_id = db.database_id) DataFilePath,
    (select physical_name from fs where type = 1 and fs.database_id = db.database_id) LogFilePath
into tempdb..outputdb
from sys.databases db
order by DataFileSizeGB desc

Select * from tempdb..outputdb

-- 3...Top 10 Tables of all Databases
USE master;
GO

declare @dbname sysname
declare @dbid varchar(5)
declare @sql as varchar(4000)
declare @svrName varchar(255)=@@SERVERNAME
if exists (Select * from tempdb.sys.objects where name='sys_table_sizes')
	drop table tempdb..sys_table_sizes

CREATE TABLE tempdb..sys_table_sizes (
    database_id int,
    database_name SYSNAME, 
    schema_id int,
    schema_name sysname, 
    object_id int,
    object_name sysname, 
    row_count CHAR(11), 
    reserved_in_gb decimal(18,2),
    data_size_in_gb decimal(18,2),
    index_size_in_gb decimal(18,2),
    unused_size_in_gb  decimal(18,2)
)

if exists (Select * from tempdb.sys.objects where name='sys_table_sizes_xml_and_fulltext')
	drop table tempdb..sys_table_sizes_xml_and_fulltext

CREATE TABLE tempdb..sys_table_sizes_xml_and_fulltext (
    database_id int,
    schema_id int,
    object_id int,
    reserved_in_gb decimal(18,2),
    unused_size_in_gb  decimal(18,2)
)

declare dbname_cursor CURSOR FOR
SELECT name, database_id from sys.databases 
where database_id not in (1,2,3,4) and state=0

OPEN dbname_cursor

FETCH NEXT FROM dbname_cursor
INTO @dbname, @dbid

WHILE @@FETCH_STATUS = 0
BEGIN

set @sql = '
insert into tempdb..sys_table_sizes
select ''' +
@dbid + ''' database_id, 
''' +
@dbname + ''' database_name, 
o.schema_id schema_id,
object_schema_name (ps.object_id, ' + @dbid + ') schema_name,
ps.object_id object_id,
object_name(ps.object_id, '+ @dbid + ') object_name, 
row_count = sum (case when (index_id<2) then row_count else ''0'' end),
(SUM(reserved_page_count)*8) as reserved_in_gb, 
data_size_in_gb = sum (case when (index_id<2) 
                            then (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count) 
                            else ''0'' end)*8/1024.000/1024.000,
index_size_in_gb = (sum(used_page_count) - sum (case when (index_id<2) 
                            then (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count) 
                            else ''0'' end))*8/1024.000/1024.000,
unused_size_in_gb  = (SUM(reserved_page_count)-SUM(used_page_count))*8/1024.000/1024.000                
from [' + @dbname + '].sys.dm_db_partition_stats ps
join [' + @dbname + '].sys.objects o on ps.object_id=o.object_id
where o.type = ''U'' and is_ms_shipped = 0
group by o.schema_id, ps.object_id
'

--print @sql
exec (@sql)

set @sql = '
insert into tempdb..sys_table_sizes_xml_and_fulltext
select ''' +
@dbid + ''' database_id, 
(select schema_id from [' + @dbname + '].sys.objects where object_id = it.parent_object_id) schema_id,
it.parent_object_id object_id,
(SUM(reserved_page_count)*8/1024.000/1024.000) as reserved_in_gb, 
unused_size_in_gb  = (SUM(reserved_page_count)-SUM(used_page_count))*8/1024.000/1024.000                
from [' + @dbname + '].sys.dm_db_partition_stats ps
join [' + @dbname + '].sys.objects o on ps.object_id=o.object_id
join [' + @dbname + '].sys.internal_tables it  on ps.object_id = it.object_id
where it.internal_type IN (202,204,211,212,213,214,218,216) 
group by o.schema_id, it.parent_object_id
'

--print @sql
exec (@sql)

   FETCH NEXT FROM dbname_cursor
   INTO @dbname, @dbid
END
--cast(A.reserved_in_gb as float)/1024/1024
update A
set A.reserved_in_gb = convert(int, A.reserved_in_gb) + convert(int, B.reserved_in_gb),
A.index_size_in_gb = convert(int, A.index_size_in_gb) + (convert(int, B.reserved_in_gb) - convert(int, B.unused_size_in_gb )),
A.unused_size_in_gb  = convert(int, A.unused_size_in_gb ) + convert(int, B.unused_size_in_gb )
from tempdb..sys_table_sizes A
join tempdb..sys_table_sizes_xml_and_fulltext B on A.database_id=B.database_id and A.schema_id = B.schema_id and A.object_id=B.object_id

CLOSE dbname_cursor
DEALLOCATE dbname_cursor

--select * from tempdb..sys_table_sizes 
--select * from tempdb..sys_table_sizes_xml_and_fulltext

;WITH cte_table AS (
     SELECT
        ROW_NUMBER() OVER ( PARTITION BY database_name ORDER BY reserved_in_gb DESC ) AS 'RowNumber',
        database_name, schema_name, object_name, row_count, reserved_in_gb, 
        data_size_in_gb, index_size_in_gb, unused_size_in_gb , 
        [index_size > data_size] = case when convert(int, index_size_in_gb)>convert(int, data_size_in_gb) 
                                        then 'Yes' else 'No' end
      FROM tempdb..sys_table_sizes
)
SELECT	@svrName as ServerName,
        database_name, schema_name, object_name, row_count,
        data_size_in_gb, index_size_in_gb,
        [index_size > data_size] = case when convert(int, index_size_in_gb)>convert(int, data_size_in_gb) 
                                        then 'Yes' else 'No' end
FROM cte_table
WHERE RowNumber <= 10