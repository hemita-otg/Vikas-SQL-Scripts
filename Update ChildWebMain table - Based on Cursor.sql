declare @CWMTable varchar(35)
declare @SQL varchar(5000)

set @CWMTable = ''
set @SQL = ''

declare curRMC cursor for
select [name] from sysobjects where xtype='u' and name like '%childwebmain'
open curRMC
fetch next from curRMC
into @CWMTable

while @@fetch_Status = 0
begin
	print @CWMTable

	Set @SQL= ' Update cwm set media=''Insert-Paper'' from ' + @CWMTable  + ' cwm  where media=''Insert'''
	Exec(@SQL)
	Set @SQL= ' Update cwm set media=''Insert-Digital'' from ' + @CWMTable  + ' cwm  where media=''Internet'''
	Exec(@SQL)
	Set @SQL= ' Update cwm set media=''Insert-Digital'' from ' + @CWMTable  + ' cwm where media=''Online'''
	Exec(@SQL)
	
	
fetch next from curRMC
into @CWMTable

END                       
close curRMC
deallocate curRMC


