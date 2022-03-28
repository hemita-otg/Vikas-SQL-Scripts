use tempdb
go
create table #DatabaseSize 
(fileid int, groupid int, size int, maxsize int, growth int, status int,perf int,name varchar(50),filename varchar(100))
go
insert into #DatabaseSize
exec sp_msforeachdb @command1='select * from [?]..sysfiles;'
go
select name [DB File Name] ,filename [DB File Path],size*8/1024 [DB Size (MB)] from #DatabaseSize
go
drop table #DatabaseSize
go

