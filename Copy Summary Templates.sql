use subscription

declare @qid int
declare @newqid int

declare @fromuser varchar(50)
declare @touser varchar(50)

--select * from vwuser where username in ('aco-edwag67', 'aco-hparker')
set @fromuser = 2012067 --'gal-xwe15tgn'
set @touser = 100796 --'gal-2p6tpvmn'

--select * from UserSavedSummaryFormats where userid = 100796

If Cursor_Status('variable', 'CategoryCursor') >= 0
	Begin
		Close CategoryCursor
		Deallocate CategoryCursor
	End

Declare CategoryCursor Cursor For select TemplateID from UserSavedSummaryFormats where userid = @fromuser

Open CategoryCursor 
Fetch Next From CategoryCursor Into @qid
While @@Fetch_Status=0
	Begin
		Insert into UserSavedSummaryFormats ([UserID], [Type], ReportTemplateName, SummaryTableFormatId, SummaryDisplayOption, ShowLinksOn, TopX, DisplayOnQuery,  RightHeader, CenterHeader, LeftHeader, RightFooter, CenterFooter, LeftFooter, TabName, DisplayOnQuery1,  displayon, IsWeighted, EventFormatTypeId, CategoryCodeId, AllSummarySubTotals, CreatedDate, IncludeDependentCols, IsStandard, TemplateSel, TemplateText)
		select @touser as UserID, [Type], ReportTemplateName, SummaryTableFormatId, SummaryDisplayOption, ShowLinksOn, TopX, DisplayOnQuery,  RightHeader, CenterHeader, LeftHeader, RightFooter, CenterFooter, LeftFooter, TabName, DisplayOnQuery1,  displayon, IsWeighted, EventFormatTypeId, CategoryCodeId, AllSummarySubTotals, CreatedDate, IncludeDependentCols, IsStandard, TemplateSel, TemplateText
				from UserSavedSummaryFormats where templateid = @qid
		select @newqid = scope_identity()
		
		Insert into UserSavedSummaryFormatDetails (TemplateID, ParamName, ParamValue)
		select @newqid as TemplateID, ParamName, ParamValue from UserSavedSummaryFormatDetails where templateid = @qid

		Fetch Next From CategoryCursor Into @qid
	End		
Close 	CategoryCursor
Deallocate CategoryCursor	
