Declare @Cat nvarchar(50)=''
Declare @NSQL nvarchar(max)=''
Declare @SQL nvarchar(max)=''
declare @Ftbl varchar(100)=''
declare @cols varchar(max)=''
declare @colsIns varchar(max)=''

	IF Cursor_Status('variable', 'OrphCursor') >= 0
	 Begin
	  Close OrphCursor
	  Deallocate OrphCursor  
	 End

	Set @NSQL='Declare OrphCursor Cursor Static For Select  Category from MT2SQL14.SiteControl.dbo.CategoryCode Where ClientPDT=1 and 
	Isnull(IsAdlert,0)=0 and  ClientServer = '''+@@SERVERNAME+'''' 
	Exec (@NSQL)
	 
	Open OrphCursor 
	Fetch Next From OrphCursor Into @Cat
	While @@Fetch_Status=0
	 Begin
		
	------ Orphaned 

--	Set @SQL='Select @Ftbl = ClientTableName from MT2SQL14.SiteControl.dbo.TableNames Where TableID = 3
--	And  CategoryCodeID in (Select ID from MT2SQL14.SiteControl.dbo.CategoryCode Where Category='''+@Cat+''') '
--	execute sp_executesql @SQL,N'@Ftbl varchar(100) output',@Ftbl output

--	Set @SQL='select @cols = stuff((select '',''+quotename(C.name)
--    FROM sys.columns c
--    WHERE c.object_id = OBJECT_ID(''dbo.'+@Cat+'DetailReports_Orphaned'') 
--    for xml path('''')), 1, 1, '''')'
--	execute sp_executesql @SQL,N'@cols nvarchar(max) output', @cols output
--	Set @cols = Replace (@cols,',[Orphaned_DateTime]','')
--	Set @colsIns = @cols
----	Set @cols = Replace (@cols,',[FVDisplayPage]',','''' as [FVDisplayPage]')

--	Set @SQL='Insert into '+@Cat+'DetailReports ('+@colsIns+')
--	Select Distinct '+@cols+' from (
--	Select Distinct '+@cols+',ROW_NUMBER() over(PARTITION BY PageDetailID ORDER BY Orphaned_DateTime Desc) RW 
--	from '+@Cat+'DetailReports_Orphaned
--	Where FlyerID in (Select FlyerID from '+@Ftbl+')
--	And PageDetailID not in (Select PageDetailID from '+@Cat+'DetailReports)
--	) Q Where RW = 1'
--	Exec (@SQL)

	----- Future Delete 
	Set @SQL = ''
	Set @cols=''

	Set @SQL='select @cols = stuff((select '',''+quotename(C.name)
    FROM sys.columns c
    WHERE c.object_id = OBJECT_ID(''dbo.'+@Cat+'DetailReports_FutureDelete'') 
    for xml path('''')), 1, 1, '''')'
	execute sp_executesql @SQL,N'@cols nvarchar(max) output', @cols output
	Set @cols = Replace (@cols,',[FD_DateTime]','')
	Set @colsIns = @cols
--	Set @cols = Replace (@cols,',[FVDisplayPage]',','''' as [FVDisplayPage]')

	Set @SQL='Insert into '+@Cat+'DetailReports  ('+@cols+')
	Select Distinct '+@cols+' from (
	Select Distinct '+@cols+',ROW_NUMBER() over(PARTITION BY PageDetailID ORDER BY FD_DateTime Desc) RW 
	from '+@Cat+'DetailReports_FutureDelete
	where flyerid in (''8030985'', ''8030986'', ''8028494'', ''8028495'', ''8029444'', ''8029445'', ''8029446'', ''8029447'') and pagedetailid not in (select pagedetailid from '+@Cat+'DetailReports)
	) P Where RW = 1'
	exec (@SQL)

	  Fetch Next From OrphCursor Into @Cat
	 End  
	Close  OrphCursor
	Deallocate OrphCursor

