use subscription

declare @qid int
declare @newqid int
declare @fromuser varchar(50)
declare @touser varchar(50)
--select * from vwuser where defaultemailaddress in ('Schwab.Ryan@basco.com', 'Kieffer.Brian@basco.com')
--select * from vwuser where username in ('brg-45rschwa', 'brg-kieffb4')
--select * from savedqueries where userid  = 2012040
--Update SavedQueries Set UserID = 2008577 where userid  = 2006641
set @fromuser = 2213 --'gal-xwe15tgn'
set @touser = 2013503 --'gal-2p6tpvmn'

--2010575
--2013503

--select * from savedqueries where userid = 100796
-- 
-- selecT * from vwuser where username in ('rx-82gran', 'rx-35kapada', 'rx-cquick96')
-- 
-- select * from savedqueries where userid = 2010575 and queryid in (185590, 185625, 186688, 193977, 193980)

If Cursor_Status('variable', 'CategoryCursor') >= 0
	Begin
		Close CategoryCursor
		Deallocate CategoryCursor
	End

Declare CategoryCursor Cursor For select QueryID from savedqueries where userid = @fromuser --and queryid in (185590, 185625, 186688, 193977, 193980)

Open CategoryCursor 
Fetch Next From CategoryCursor Into @qid
While @@Fetch_Status=0
	Begin
		Insert into savedqueries ([UserID], [QueryName], [LastUpdated], [RightHeader], [CenterHeader], [LeftHeader], [RightFooter], [CenterFooter], [LeftFooter], [TabName], [CWMOnly], [SavedQueryType], [NumberQueryPasses], [LastExecuted], [SavedBy], [DisplayOption], [TemplateID], [DdrQuery], [CategoryCodeId], [IsPageQuery])
		select @touser as UserID, [QueryName], [LastUpdated], [RightHeader], [CenterHeader], [LeftHeader], [RightFooter], [CenterFooter], [LeftFooter], [TabName], [CWMOnly], [SavedQueryType], [NumberQueryPasses], [LastExecuted], [SavedBy], [DisplayOption], [TemplateID], [DdrQuery], [CategoryCodeId], [IsPageQuery] from savedqueries where queryid = @qid
		select @newqid = scope_identity()
		
		Insert into savedqueriesdetail ([QueryID], [SessionIDName], [SessionIDValue], [SequenceNo])
		select @newqid as [QueryID], [SessionIDName], [SessionIDValue], [SequenceNo] from savedqueriesdetail where queryid = @qid

		Fetch Next From CategoryCursor Into @qid
	End		
Close 	CategoryCursor
Deallocate CategoryCursor	
