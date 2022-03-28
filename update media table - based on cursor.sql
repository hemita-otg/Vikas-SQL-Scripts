declare @MediaTable varchar(35)
declare @SQL varchar(5000)

set @MediaTable = ''
set @SQL = ''

declare curRMC cursor for
select [name] from sysobjects where xtype='u' and name like '%media'
open curRMC
fetch next from curRMC
into @MediaTable

while @@fetch_Status = 0
begin
	print @MediaTable

	Set @SQL= ' Update m set media=''Insert-Paper'' from ' + @MediaTable  + ' m  where media=''Insert'''
	Exec(@SQL)
	Set @SQL= ' Update m set media=''Insert-Digital'' from ' + @MediaTable  + ' m  where media=''Internet'''
	Exec(@SQL)
	Set @SQL= ' Update m set media=''Insert-Digital'' from ' + @MediaTable  + ' m where media=''Online'''
	Exec(@SQL)
	
	
fetch next from curRMC
into @MediaTable

END                       
close curRMC
deallocate curRMC



--select * from adcamedia
