
--Run below cursor for detailreports
declare @CatCode varchar(35)
declare @SQL varchar(5000)
declare @CWMTable varchar(500)
declare @catid int 

set @CatCode = ''
set @SQL = ''
set @CWMTable =''

declare curFixTimeStamp cursor for

select [category],id  from mt2sql14.sitecontrol.dbo.categorycode where isadlert=1 and clientserver=@@servername
open curFixTimeStamp
fetch next from curFixTimeStamp
into @CatCode,@catid

while @@fetch_Status = 0
begin
	--print @CatCode

	select @CWMTable=mastertablename from mt2sql14.sitecontrol.dbo.tablenames where categorycodeid=@catid and tableid = 3 

	--update d set media=f.media,mediaid=f.mediaid from lev50flyerreports f join lev50detailreports d on f.flyerid=d.flyerid and f.media <> d.media and f.media='mailer'
	SET @SQL = 'UPDATE D SET media=f.media, mediaid=f.mediaid FROM ' + @CWMTable + ' f join ' + @CatCode + 'detailreports d ON f.flyerid=d.flyerid AND f.media <> d.media AND f.media=''mailer'''
	--print @SQL
	Exec(@SQL)


	SET @SQL = 'UPDATE P SET media=f.media, mediaid=f.mediaid FROM ' + @CWMTable + ' f join ' + @CatCode + 'pagereports P ON f.flyerid=P.flyerid AND f.media <> P.media AND f.media=''mailer'''
	--print @SQL


	Exec(@SQL)
	
	
fetch next from curFixTimeStamp
into @CatCode,@catid

END                       
close curFixTimeStamp
deallocate curFixTimeStamp