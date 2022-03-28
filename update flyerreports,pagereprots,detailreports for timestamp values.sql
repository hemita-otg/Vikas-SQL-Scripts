----
--check by below query whethere timestamp values are there or not --
SELECT distinct  weekof,admonthid,admonth,addate,convert(varchar, addate , 108),cast(convert(char(11), addate, 101) as datetime) 
 from pgcorp50detailReports 
where convert(varchar, addate , 108) <>'00:00:00'
--------
--Run below cursor for flyerreports
--replace flyerreprots with pagereports and rerun it

/*
declare @DisDateRangesTable varchar(35)
declare @SQL varchar(5000)

set @DisDateRangesTable = ''
set @SQL = ''

declare curFixTimeStamp cursor for
select [name] from sysobjects where xtype='u' and name like '%flyerreports'
open curFixTimeStamp
fetch next from curFixTimeStamp
into @DisDateRangesTable

while @@fetch_Status = 0
begin
	--print @DisDateRangesTable

	Set @SQL= 'Update  ' + @DisDateRangesTable + ' set addate=cast(convert(char(11), addate, 101) as datetime), weekof=cast(convert(char(11), weekof, 101) as datetime), admonthid=cast(convert(char(11), admonthid, 101) as datetime) where month(addate) =''9'' and year(addate) in (''2012'')'
	--Exec(@SQL)
	print @SQL
	
fetch next from curFixTimeStamp
into @DisDateRangesTable

END                       
close curFixTimeStamp
deallocate curFixTimeStamp
*/
--Run below cursor for detailreports
declare @DisDateRangesTable varchar(35)
declare @SQL varchar(5000)

set @DisDateRangesTable = ''
set @SQL = ''

declare curFixTimeStamp cursor for
select [name] from sysobjects where xtype='u' and name like '%detailreports'
open curFixTimeStamp
fetch next from curFixTimeStamp
into @DisDateRangesTable

while @@fetch_Status = 0
begin
	--print @DisDateRangesTable

	Set @SQL= 'Update  ' + @DisDateRangesTable + ' set addate=cast(convert(char(11), addate, 101) as datetime), weekof=cast(convert(char(11), weekof, 101) as datetime), admonthid=cast(convert(char(11), admonthid, 101) as datetime) where month(addate) =''9'' and year(addate) in (''2012'')'
	--Exec(@SQL)
	print @SQL
	
fetch next from curFixTimeStamp
into @DisDateRangesTable

END                       
close curFixTimeStamp
deallocate curFixTimeStamp