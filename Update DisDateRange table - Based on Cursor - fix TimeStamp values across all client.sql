declare @DisDateRangesTable varchar(35)
declare @SQL varchar(5000)

set @DisDateRangesTable = ''
set @SQL = ''

declare curFixTimeStamp cursor for
select [name] from sysobjects where xtype='u' and (name like '%Detailreports%' OR 
name like '%FlyerReports%' or name like '%pagereports%' OR name like '%childwebmain%')
order by 1
--name like '%disdateranges' or 
open curFixTimeStamp
fetch next from curFixTimeStamp
into @DisDateRangesTable

while @@fetch_Status = 0
begin
	--print @DisDateRangesTable

	Set @SQL= 'Update  ' + @DisDateRangesTable + 
				' set  weekof=''2012-12-30 00:00:00.000''
				where FlyerID in (''4132418'',''4132417'',''4132420'',''4132419'',''4132421'') and
				ADDATE = ''2013-01-02 00:00:00.000'''
	Print @DisDateRangesTable			
	Exec(@SQL)
	
	--print @SQL
	
fetch next from curFixTimeStamp
into @DisDateRangesTable

END                       
close curFixTimeStamp
deallocate curFixTimeStamp

-----------------------

declare @DisDateRangesTable varchar(35)
declare @SQL varchar(5000)

set @DisDateRangesTable = ''
set @SQL = ''

declare curFixTimeStamp cursor for
select [name] from sysobjects where xtype='u' and name like '%disdateranges' 
/*(name like '%Detailreports%' OR 
name like '%FlyerReports%' or name like '%pagereports%' OR name like '%childwebmain%')*/
order by 1

open curFixTimeStamp
fetch next from curFixTimeStamp
into @DisDateRangesTable

while @@fetch_Status = 0
begin
	--print @DisDateRangesTable

	Set @SQL= 'Update  ' + @DisDateRangesTable + 
				' set weekof=''2012-12-30 00:00:00.000''
				where ADDATE = ''2013-01-02 00:00:00.000'''
	Print @DisDateRangesTable
	Exec(@SQL)
	--print @SQL
	
fetch next from curFixTimeStamp
into @DisDateRangesTable

END                       
close curFixTimeStamp
deallocate curFixTimeStamp





