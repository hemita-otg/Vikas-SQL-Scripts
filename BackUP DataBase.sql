Declare @dbs table(tname varchar(50))
Declare @SQL varchar(2000)
Declare @DBName varchar(2000)
Declare @backupLoc varchar(2000)

insert into @dbs values('SQL16')


SELECT @backuploc = '\\Mt2bu\mt2bud\MT2\ClientBU\'


declare dnamecur cursor for select tname from @dbs
open dnamecur
fetch next from dnamecur into @dbname
while @@Fetch_Status = 0
begin
	set @SQL = 'BACKUP DATABASE ' + @DBName + ' To Disk = ''' + @backuploc + @dbname + '.bak'' WITH INIT '
	eXEC(@sql)
fetch next from dnamecur into @dbname	
end
CLOSE dnamecur
DEALLOCATE dnamecur
