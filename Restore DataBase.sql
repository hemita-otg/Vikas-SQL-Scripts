Use Master
Declare @dbs table(tname varchar(50))
Declare @SQL varchar(2000)
Declare @DBName varchar(2000)
Declare @backupLoc varchar(2000)
Declare @spid varchar(10) 
Declare @start datetime

insert into @dbs values('SQL16')

SELECT @backuploc = '\\Mt2bu\mt2bud\MT2\ClientBU\'


declare dnamecur cursor for select tname from @dbs
open dnamecur
fetch next from dnamecur into @dbname
while @@Fetch_Status = 0
begin
	select @start = current_timestamp
	while(exists(Select * from sysprocesses where dbid = db_id(@dbname)) and
        	    datediff(mi, @start, current_timestamp) < 5)
	begin
        	    declare spids cursor for
                        select convert(varchar, spid) from sysprocesses
                                    where dbid = db_id(@dbname)
 
 	           open spids
        	    while(1=1)
		            begin
                	        fetch spids into @spid
                        	if @@fetch_status < 0 break
	                        exec('kill ' + @spid)
        		    end
	            deallocate spids
	end
	IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name =@DBName)
	begin
		set @SQL = 'DROP DATABASE [' + @DBName + ']'
		Exec (@SQL)
	end
	set @SQL = 'restore database ' + @DBName + ' from Disk =''' + @backuploc + @DBName + '.bak'' with Recovery, Replace,
		    MOVE ''SQL16'' TO ''D:\SQLData\SQL16.mdf'',	
		    MOVE ''SQL16'' TO ''D:\SQLData\SQL16_log.ldf'''
	eXEC(@sql)
fetch next from dnamecur into @dbname	
end
CLOSE dnamecur
DEALLOCATE dnamecur