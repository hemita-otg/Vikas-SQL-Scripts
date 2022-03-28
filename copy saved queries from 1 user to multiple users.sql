use subscription

declare @qid int
declare @newqid int
declare @fromuser varchar(50)
declare @touser varchar(50)
--select * from vwuser where clientid=418 and type=2 and defaultemailaddress not in ('ahain@markettrack.com','ramt@markettrack.com')
--select userid into tempdb.dbo.UserIDTableType2 from vwuser where clientid=418 and type=2 and defaultemailaddress not in ('ahain@markettrack.com','ramt@markettrack.com')
--select * from vwuser where clientid=418 and type=1
--select userid into tempdb.dbo.UserIDTableType1 from vwuser where clientid=418 and type=1
--select * from vwuser where username in ('amyhkra')
--select * from savedqueries where userid  = 2043902

set @fromuser = 2043902 --'ahain@markettrack.com'
set @touser = '' --'ramt@markettrack.com'

-- select * from savedqueries where userid = 2043912 and queryid in (204112,204113)


declare curUserID cursor for
select userid from tempdb..useridtabletype2

open curUserID

fetch next from curUserID into @touser

while @@fetch_Status = 0
begin
	
	
	If Cursor_Status('variable', 'CategoryCursor') >= 0
		Begin
			Close CategoryCursor
			Deallocate CategoryCursor
		End
	
	Declare CategoryCursor Cursor For select QueryID from savedqueries where userid = @fromuser --and queryid in (204112,204113)
	
	Open CategoryCursor 
	Fetch Next From CategoryCursor Into @qid
	While @@Fetch_Status=0
		Begin
-- 			Insert into savedqueries ([UserID], [QueryName], [LastUpdated], [RightHeader], [CenterHeader], [LeftHeader], [RightFooter], [CenterFooter], [LeftFooter], [TabName], [CWMOnly], [SavedQueryType], [NumberQueryPasses], [LastExecuted], [SavedBy], [DisplayOption], [TemplateID], [DdrQuery], [CategoryCodeId], [IsPageQuery])
-- 			select @touser as UserID, [QueryName], [LastUpdated], [RightHeader], [CenterHeader], [LeftHeader], [RightFooter], [CenterFooter], [LeftFooter], [TabName], [CWMOnly], Cast(1 as Int) [SavedQueryType], [NumberQueryPasses], [LastExecuted], [SavedBy], [DisplayOption], [TemplateID], [DdrQuery], [CategoryCodeId], [IsPageQuery] from savedqueries where queryid = @qid
-- 			select @newqid = scope_identity()
-- 			
-- 			Insert into savedqueriesdetail ([QueryID], [SessionIDName], [SessionIDValue], [SequenceNo])
-- 			select @newqid as [QueryID], [SessionIDName], [SessionIDValue], [SequenceNo] from savedqueriesdetail where queryid = @qid

			print 'From : ' + @fromuser
			print 'To :' + @touser
			print 'QID :' + cast(@qid as varchar(50))
	
			Fetch Next From CategoryCursor Into @qid
		End		
	Close 	CategoryCursor
	Deallocate CategoryCursor	



	
fetch next from curUserID
into @touser

END                       
close curUserID
deallocate curUserID
