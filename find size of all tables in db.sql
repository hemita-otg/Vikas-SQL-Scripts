-- Check size of all tables in a database --
use sitecontrol
go
create table #tablesize 
(name nvarchar(120),rows char(11),reserved varchar(18),
data varchar(18),index_size varchar(18),unused varchar(18))
go
insert into #tablesize
exec 
sp_msforeachtable @command1=
'exec sp_spaceused ''?'''
select * from #tablesize
go
drop table #tablesize
go