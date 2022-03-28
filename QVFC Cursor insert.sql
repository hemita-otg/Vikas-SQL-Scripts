select count(1) from ReportFormatTemplatesDetail--91672
select count(1) from ReportFormatTemplatesDetail_040819--91672
select 91672-91078--594
--select * Into ReportFormatTemplatesDetail_040819 From ReportFormatTemplatesDetail
--select * From ReportFormatTemplatesDetail where rpttemplateid=3590 and fieldid in (103,105)
--select A.PageDetailId as PageDetailIdInt,B.* Into  tempdb.dbo.MissingRecords from tempdb.dbo.cccdtpdtid A JOIN Entrydata.dbo.USACMCPromotionInfoTbl B ON A.OriginalPageDetailId=B.PageDetailID  where 1=2
Declare @Category varchar(255)
		,@SQL varchar(max)
		,@F1 Int
		,@F2 Int

IF Cursor_Status('variable', 'CategoryCursor') >= 0
	Begin
		Close CategoryCursor
		Deallocate CategoryCursor		
	End

Declare CategoryCursor Cursor Static For 
Select distinct rpttemplateID
from vw_catinfo a
join vw_ReportFields b on a.CategoryCodeId=b.CategoryCodeId
where ClientServer in ('MT2SQL04','MT2SQL07','MT2SQL08','MT2SQL11') and (ispdt=1 or ClientPDT=1) and b.DisplaySeq is not null
and b.FieldName='offerdes'


Open CategoryCursor 
Fetch Next From CategoryCursor Into @Category
While @@Fetch_Status=0
	Begin
		Print '----------------------------'+@Category+'----------------------------'
		Select @F1= Max(DisplaySeq)+1 From ReportFormatTemplatesDetail Where rpttemplateID=@Category
		Select @F2=Max(DisplaySeq)+2 From ReportFormatTemplatesDetail Where rpttemplateID=@Category
		
		Print (@F1)
		Print (@F2)
		Set @SQL='Insert Into ReportFormatTemplatesDetail(RptTemplateID,FieldID,DisplaySeq,DisplayName,Filter,Link,AdsDisplaySeq,IsPage) Values('+cast(@Category as varchar)+',103,'+Cast(@F1 as varchar)+',''Limited Time Start Date'',1,0,NULL,NULL)'
		Exec (@SQL)
		Set @SQL='Insert Into ReportFormatTemplatesDetail(RptTemplateID,FieldID,DisplaySeq,DisplayName,Filter,Link,AdsDisplaySeq,IsPage) Values('+Cast(@Category as varchar)+',105,'+Cast(@F2 as varchar)+',''Limited Time End Date'',1,0,NULL,NULL)'
		Exec (@SQL)

		Fetch Next From CategoryCursor Into @Category
	End		
Close 	CategoryCursor
Deallocate CategoryCursor