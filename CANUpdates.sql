Declare @Category varchar(50)
Declare @ID as integer
Declare @CategoryList Varchar(100)
Declare @CodeTable as varchar(50)
Declare @CategoryCodeTable varchar(255)
Declare @PDTTable as varchar(50)
Declare @CWMTable as varchar(50)
Declare @Categories as varchar(7500)
Declare @SQL as varchar(7500)
Declare @NSQL Nvarchar(1000)
SET @SQL=''

SET @CategoryCodeTable = 'MT2SQL13.CanUpdates.dbo.CategoryCode'
SET @CategoryList = 'MT2SQL13.CanUpdates.dbo.CategoryList'

execute('UPDATE ' + @CategoryCodeTable + ' SET ClientRun = 1 ' )

SET @NSQL = 'Select Top 1 @Category = Category From ' + @CategoryCodeTable + ' Where ClientRun=1 order by ProcessOrder '
execute sp_executesql @NSQL, N'@Category varchar(15) OUTPUT', @Category OUTPUT		
--print 	@Category			


While @Category <> ''
BEGIN

	SET @PDTTable='SQL13.dbo.' + @Category + 'PageDetailTable'
	SET @CWMTable='SQL13.dbo.' + @Category + 'ChildWebMain'
	SET @CodeTable='CANUpdates.dbo.' + @Category + 'PDT'

	SET @ID = 0
	SET @NSQL = 'SELECT @ID = [ID] from ' + @CategoryCodeTable + ' where category = ''' + @Category + ''''
	execute sp_executesql @NSQL, N'@ID INT output', @ID output	
	
	SET @NSQL = 'Select @Categories = Categories From ' + @CategoryList + ' Where CategoryCode=''' + @Category + ''''
	execute sp_executesql @NSQL, N'@Categories varchar(7500) OUTPUT', @Categories OUTPUT						
	--print @Categories


	IF EXISTS(SELECT * FROM CANUpdates..sysobjects WHERE xtype = 'U' AND [name] = '' + @Category + 'PDT')
		SET @SQL='DROP TABLE CANUpdates..' + @Category + 'PDT'
		Exec(@SQL)
		--	print @SQL

	SET @SQL='Select Distinct 
	PageDetailid,Category,Brand,Comments3,Comments4,Comments1,ProductTerritorySubGroup
	INTO ' + @CodeTable + '
	from ' + @PDTTable + '
	WHERE Category in 
	( ' + @Categories + ')'
	Exec (@SQL)
	--print (@SQL)

	SET @SQL=' Insert into ' + @CodeTable + '
	Select Distinct 
	T.PageDetailID,MC.Category,T.Brand,T.Comments3,T.Comments4,T.Comments1,T.ProductTerritorySubGroup
	FROM
	MasterClientCoverage.dbo.TempJAPageDetailTable T JOIN ' + @CWMTable + ' C 
	ON T.Flyerid=C.Flyerid 
	JOIN MT2SQL14.Sitecontrol.Dbo.vw_merchandisecategory MC on MC.RealCategory=T.Category 
	 WHERE MC.Category in 
	( ' + @Categories + ')' + '
	AND T.PageDetailID NOT IN
	(Select distinct PageDetailID from ' + @CodeTable + ')
	And MC.CategoryCodeID= ' + Cast(@ID as varchar(10))
	Exec (@SQL)
	--print (@SQL)

	execute('update  ' + @CategoryCodeTable + '  set ClientRun = 0 where Category = ''' + @Category + '''')
	
	SET @Category = ''
	SET @NSQL = 'Select Top 1 @Category = Category From ' + @CategoryCodeTable + ' Where ClientRun=1 order by ProcessOrder '
	execute sp_executesql @NSQL, N'@Category varchar(15) OUTPUT', @Category OUTPUT
	--print @Category						

END

