
if exists (select * from tempdb..sysobjects where name = 'BevALUARecords' and Xtype = 'U')
drop table tempdb..[BevALUARecords]
