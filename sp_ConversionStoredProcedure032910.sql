SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



ALTER           Procedure sp_ConversionStoredProcedure
	@categorycode as varchar(255),  -- AdView category code to be processed
	@adlertdatabase as varchar(255), -- ClientName column value of ConversionCategory
	@PIPathTablePrefix varchar(1000) = '[mt2sql04\connections1].connection.dbo.',
	@CBETableLocation varchar(100) = '[mt2sql04].SiteControl.dbo.',
	@MT2FilePath VARCHAR(255) = '\\ftp\AdViewFTP\Chicago\ADlertToFVConversion\PDTIDFlyerIDFiles\',
	@MT2AFilePath VARCHAR(255) = '\\mt2asql01\Share\Conversion\',
	@ConversionDataDb VARCHAR(255) = 'SQL01'
AS 
SET nocount on
Begin
	DECLARE @sql varchar(8000)
	Declare @catsql varchar(8000)
	Declare @tempsql varchar(8000)
	DECLARE @isprintpcsmasters varchar(6)
	DECLARE @IsRepOnly bit
	DECLARE @conversiondb varchar(255)
	Declare @tableviewname varchar(255)
	Declare @PCSFields varchar(6000)
	Declare @PCSMastersFields varchar(6000)
	Declare @IsAdspace bit
	Declare @MCTableExists bit
	Declare @MCTableName varchar(50)
	Declare @CWMTableName varchar(255)
	Declare @PDTTableName varchar(255)
	Declare @MPVTableName varchar(255)
	Declare @PAGETableName varchar(255)
	Declare @PGCatsTableName varchar(255)
	Declare @CWMTableName_catonly varchar(255)
	Declare @PDTTableName_catonly varchar(255)
	Declare @MPVTableName_catonly varchar(255)
	Declare @PAGETableName_catonly varchar(255)
	Declare @SelectTrackNo varchar(50)
	Declare @PDTFields varchar(8000)
	Declare @MPVFields varchar(100)
	Declare @PDTIDTable varchar(20)
	Declare @MadCodeOrCatID varchar(10)
	Declare @IsRegular bit
	Declare @IsCatOnly bit
	Declare @DatabaseCategory_CatOnly varchar(20)
	Declare @IsPrePrint bit
	Declare @ISADRSite bit
	Declare @IsPgCats bit 
	--ItemID : 7064
	Declare @ReleaseStatusSql VARCHAR(8000)
	--ItemID : 7064

	Declare @intCategoryCodeId INT
	Declare @NSQL NVARCHAR(4000)
	SET @intCategoryCodeId = 0
	SET @NSQL = 'SELECT @intCategoryCodeId = [ID] from ' + @CBETableLocation + 'CategoryCode where category = ''' + @categorycode + ''''
	execute sp_executesql @NSQL, N'@intCategoryCodeId INT output', @intCategoryCodeId output	

	SET @ISADRSite = 0
	SET @IsPrePrint = 0
	SET @CWMTableName = @CategoryCode + 'ChildWebMain'
	SET @PDTTableName = @CategoryCode + 'PageDetailTable'
	SET @MPVTableName = @CategoryCode + 'MultiplePageValues'
	SET @PAGETableName = @CategoryCode + 'Pages'
	SET @PGCatsTableName = @CategoryCode + 'PgCats'

	SET @IsRegular = 1
	SET @IsCatOnly = 0
	SET @tempsql = ''

	IF NOT EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE = 'U' AND [NAME] = 'Ads')
		SET @IsRegular = 0 

	IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE = 'U' AND [NAME] = 'PDTInfo')
	BEGIN
		SET @ISADRSite = 1
		--EXEC('update pdtinfo set IBEEnteredDate = CAST(CONVERT(VARCHAR(10),IBEEnteredDate,101) AS SMALLDATETIME), IBEQcedDate= CAST(CONVERT(VARCHAR(10),IBEQcedDate,101) AS SMALLDATETIME)')
		SET @sql = 'update pdtinfo set IBEEnteredDate = CAST(CONVERT(VARCHAR(10),IBEEnteredDate,101) AS SMALLDATETIME), 
			IBEQcedDate = CASE WHEN IBEQcedDate = ''1/1/1900'' THEN NULL 
					ELSE CAST(CONVERT(VARCHAR(10),IBEQcedDate,101) AS SMALLDATETIME) END,
			IBEQcedBy = CASE WHEN ISNULL(IBEQcedBy,'''') = '''' THEN ''Not Qced'' ELSE IBEQcedBy END '
		EXEC(@sql)
		SET @SQL = 'Delete from PDTInfo Where IsNull(PageDetailID, '''') = '''' '
		Exec(@SQL)
	END	

	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Conversion Started',getdate())
	--set @IsAdspace = 0
	-- Define whether AdSpace columns needs to be populated or not in CWM Table.
	select @IsPgCats = CASE WHEN ISNULL(IsPgCats,'') = '' THEN 0 ELSE 1 END,
		@IsCatOnly = CASE WHEN ISNULL(DatabaseCategory_CatOnly,'') = '' THEN 0 ELSE 1 END, 
		@DatabaseCategory_CatOnly = ISNULL(DatabaseCategory_CatOnly,'') from conversioncontrol..conversioncategory 
		where DatabaseCategory = @CategoryCode
	
	SET @IsRepOnly  = 0
	SET @isprintpcsmasters = 'False'

	SET @sql = ''
	SET @conversiondb = 'conversioncontrol..'

	SET @sql = 'use ' + @adlertdatabase
	exec(@sql)

	/*Check whether PrintPCS Master table exists or not in ADlert export*/
	IF exists (select * from sysobjects where name = 'printpcsmasters' and XType = 'U') 
		SET @isprintpcsmasters = 'True'
	-- IF RepOnly is SET to 0, process the tables conventionally
	-- IF RepOnly is set to 1, all the market value has to set to Representative regardless of existing value.
	if not exists(select * from conversioncontrol..ConversionMergeCategory where MergeCategory = @Categorycode)
		select @IsRepOnly = IsNull(RepOnly,0) , @IsPrePrint = IsNull(IsPrePrint,0) ,
		@MCTableName = IsNull(MCTable,'')  
		     from conversioncontrol..conversioncategory 
		     where DatabaseCategory = @categorycode
	else
		/*If category code is of merge category Use control parameter of master category code from ConversionCategory table.*/
		select @IsRepOnly = IsNull(RepOnly,0) , @IsPrePrint = IsNull(IsPrePrint,0),
			@MCTableName = IsNull(MCTable,'') 
		    from conversioncontrol..conversioncategory CC, conversioncontrol..conversionmergecategory CMC
		    where MergeCategory = @categorycode and MasterCategory = DatabaseCategory

	/*If RepOnly is true then PrintPCSMasters table is discarded*/
	IF @IsRepOnly = 1
		SET @isprintpcsmasters = 'False'


	set @PCSFields = '[TrackNo], P.[EnvId], [ThemeId], [RetId], [MktId], [NewsId], [StartDt], [EndDt], [BreakDt], [WkNum], [MasPtr], [Entry], [AdDUsr], [AdCUsr], [AdFUsr], [PgCat], [PgCDUsr], [PgCCUsr], [PgCFUsr], [Status], [CheckInDt], [CheckInUsr], [PageCatDueDt], [EntryDueDt], [PageCatCheckDueDt], [PageCatCorrectDueDt], [EntryCheckDueDt], [EntryCorrectDueDt], [ScanDueDt], [PageCatCompDt], [EntryCompDt], [PageCatCheckCompDt], [PageCatCorrectCompDt], [EntryCheckCompDt], [EntryCorrectCompDt], [ScanCompDt], [TtlEntries], [AvgEntries], [ModTime], [CopiedFromInd], [RemoteEntry], [RemoteEntryCompDt], [RemoteEntryProjectId], [RemoteEntrySendDt], [PurposeCodeId], [TrackNo] AS NTrackNo'
	--IF @categorycode = 'slbADlM' or @categorycode = 'slbADlA' or @categorycode = 'slbADlI' or @categorycode = 'slbADlC'
	IF @IsPrePrint = 1
		SET @PCSFields = @PCSFields + ',case when Type = ''AUD'' then ''In-Store'' when Type = ''FSI'' then ''Preprint'' when Type = ''WWW'' then ''Website'' else isnull(type,'''') end AS Media '
	ELSE	
		SET @PCSFields = @PCSFields + ',case when Type = ''AUD'' then ''In-Store'' when Type = ''FSI'' then ''Insert'' when Type = ''WWW'' then ''Website'' else isnull(type,'''') end AS Media '


	/* For PrintPCSMaster's trackno, trackno value is getting incremented by 500000000 value so that it can have different flyerid.*/
	set @PCSMastersFields = '[TrackNo], P.[EnvId], [ThemeId], [RetId], [MktId], [NewsId], [StartDt], [EndDt], [BreakDt], [WkNum], [MasPtr], [Entry], [AdDUsr], [AdCUsr], [AdFUsr], [PgCat], [PgCDUsr], [PgCCUsr], [PgCFUsr], [Status], [CheckInDt], [CheckInUsr], [PageCatDueDt], [EntryDueDt], [PageCatCheckDueDt], [PageCatCorrectDueDt], [EntryCheckDueDt], [EntryCorrectDueDt], [ScanDueDt], [PageCatCompDt], [EntryCompDt], [PageCatCheckCompDt], [PageCatCorrectCompDt], [EntryCheckCompDt], [EntryCorrectCompDt], [ScanCompDt], [TtlEntries], [AvgEntries], [ModTime], [CopiedFromInd], [RemoteEntry], [RemoteEntryCompDt], [RemoteEntryProjectId], [RemoteEntrySendDt], [PurposeCodeId], ([TrackNo] + 500000000) AS NTrackNo'
	--IF @categorycode = 'slbADlM' or @categorycode = 'slbADlA' or @categorycode = 'slbADlI' or @categorycode = 'slbADlC'
	IF @IsPrePrint = 1
		SET @PCSMastersFields = @PCSMastersFields + ',case when Type = ''AUD'' then ''In-Store'' when Type = ''FSI'' then ''Preprint'' when Type = ''WWW'' then ''Website'' else isnull(type,'''') end AS Media '
	ELSE	
		SET @PCSMastersFields = @PCSMastersFields + ',case when Type = ''AUD'' then ''In-Store'' when Type = ''FSI'' then ''Insert'' when Type = ''WWW'' then ''Website'' else isnull(type,'''') end AS Media '

	SET @PCSFields = @PCSFields + ', DatePart(dw, BreakDt) as AdDay, dateadd(dd,-(day(BreakDt)-1),BreakDt) as AdMonth '	
	SET @PCSMastersFields = @PCSMastersFields + ', DatePart(dw, BreakDt) as AdDay, dateadd(dd,-(day(BreakDt)-1),BreakDt) as AdMonth '


	--Create MCTable in Device Database
	SET @MCTableExists = 0
	IF @MCTableName <> ''
	BEGIN 
		SET @sql = 'IF EXISTS (SELECT * FROM Sysobjects WHERE [Name] = ''' + @MCTableName + ''' AND XType = ''U'') 
			DROP TABLE ' + @MCTableName
		EXEC(@sql)

		SET @sql = 'SELECT MC.* INTO ' + @MCTableName + ' FROM ' + @CBETableLocation + 'vw_MerchandiseCategory MC Where CategoryCodeID = ' +  Cast(@intCategoryCodeId as varchar)
		EXEC(@sql)

		SET @MCTableExists = 1
	
		--if exists(select name from conversioncontrol..sysobjects where name = @MCTableName and xtype='U')
		--	SET @MCTableExists = 1
		--Else
		--	SET @MCTableExists = 0	
		--SET @MCTableName = @conversiondb + @MCTableName 
	END
	--Create MCTable in Device Database

	--ItemID : 6360
	IF @categorycode = 'has' 
	BEGIN
		SET @sql = 'IF EXISTS (SELECT * FROM Sysobjects WHERE [Name] = ''hasmfrupdate'' AND XType = ''U'') 
			DROP TABLE hasmfrupdate'
		EXEC(@sql)

		SET @sql = 'SELECT * INTO hasmfrupdate FROM ' + @CBETableLocation + 'hasmfrupdate '
		EXEC(@sql)		
	END
	--ItemID : 6360
	
	--Start : Changes
	/*
	Create a consolidated table of "PrintPCS" and "PrintPCSMasters" with name "PrintPCSConsolidated"
	->1. Transfer records from "PrintPCS" to "PrintPCSConsolidated"
	->2. If @isprintpcsmasters = true than transfer records from "PrintPCSMasters" to "PrintPCSConsolidated" with TrackNo Incremented
	->3. Add a new column named "NTrackNo" to "PrintPCSConsolidated" which contains the trackno values from both tables. 
	     Trackno of "PrintPCSMasters" would have the incremented value.
	*/
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : PrintPCSConsolidated Create',getdate())

	exec('if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[PrintPCSConsolidated]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
		drop table [dbo].[PrintPCSConsolidated]')

	--Transfer Records From "PrintPCS"
	set @sql = 'SELECT ' + @PCSFields + 'into PrintPCSConsolidated from PrintPcs P JOIN ENVS E ON P.ENVID = E.ENVID'
	exec(@sql)

	--Transfer Records From "PrintPCSMasters"
	IF @isprintpcsmasters = 'True'
	begin
		set @sql = 'INSERT INTO PrintPCSConsolidated Select ' + @PCSMastersFields + ' from printpcsmasters P JOIN ENVS E ON P.ENVID = E.ENVID '		
		exec(@sql)
	end
	EXECUTE('Create Clustered Index idx_PrintPCSConsolidated on PrintPCSConsolidated(TrackNo, NTrackNo)')
	
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : PrintPCSConsolidated Create',getdate())
	SET @tableviewname = 'PrintPCSConsolidated'

	SET @sql = @adlertdatabase + '..'

	--if @IsRegular = 1	
	exec conversioncontrol..NewFlyeridPDTId @categorycode, @sql, @tableviewname, @PIPathTablePrefix, 0, @IsRegular, @MT2FilePath, @MT2AFilePath

	if @IsCatOnly = 1
		exec conversioncontrol..NewFlyeridPDTId @categorycode, @sql, @tableviewname, @PIPathTablePrefix, 1, 1

	--Add Flyerid column to PrintPCSConsolidated
	set @sql = 'ALTER TABLE ' + @tableviewname + ' ADD FLYERID VARCHAR(11)'
	exec(@sql)

	set @sql = 'Update ' + @tableviewname + ' set flyerid = F.flyerid FROM ' + @tableviewname + ' a JOIN conversioncontrol..FlyerId F ON a.NTrackNo = F.TrackNo '
	exec(@sql)

	--End : Changes
	SET @adlertdatabase = @adlertdatabase + '..Temp'


	--Sizes : Copy Sizes table from ConversionControl.
	SET @SQL = 'IF exists (select * from sysobjects where id = object_id(''[Sizes]'') 
		and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [Sizes]'
	EXEC(@SQL)

	SET @SQL = 'SELECT * INTO Sizes FROM ConversionControl.dbo.Sizes'
	EXEC(@SQL)

	--if @IsAdSpace = 1
	--begin
		SET @SQL = 'Alter table Sizes Add Space Decimal(9,2) '
		Exec(@SQL)
		SET @SQL = 'Update Sizes set Space = Width * Height '
		Exec(@SQL)
		SET @SQL = 'Create clustered Index idx_Sizes on Sizes(SizeID)'
		Exec(@SQL)
	--end
	--Sizes : Copy Sizes table from ConversionControl.

	/*---------------------------INDEXES ON MASTER TABLES.------------------------------*/
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Index On Master Tables',getdate())	
	exec('IF exists (select * from dbo.sysindexes where name = ''rets_retid'' and id = object_id(''[Rets]'')) drop index Rets.rets_retid')
	create clustered index rets_retid on Rets(retid) on [primary]
	
	exec('IF exists (select * from dbo.sysindexes where name = ''envs_envid'' and id = object_id(''[envs]'')) drop index [envs].[envs_envid]')
	create clustered index envs_envid on envs(envid) on [primary]
	
	exec('IF exists (select * from dbo.sysindexes where name = ''themes_themeid'' and id = object_id(''[themes]'')) drop index [themes].[themes_themeid]')
	create clustered index themes_themeid on themes(themeid) on [primary]
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Index On Master Tables',getdate())	
	/*---------------------------INDEXES ON MASTER TABLES.------------------------------*/

	/*-------------------------INCREMENTAL AND MERGECATEGORY LOAD SETTINGS-------------------------*/
	/*Check Incremental Load*/
	DECLARE @TableNames varchar(255)
	Declare @IncrementalLoad bit
	declare @ismergecategory bit
	declare @mastercategory varchar(20)
	declare @cwmwhereclause varchar(1000)
	declare @pdtwhereclause varchar(1000)
	declare @mpvwhereclause varchar(1000)
	declare @pagewhereclause varchar(1000)

	declare @ismergecategory_catonly bit
	declare @cwmwhereclause_catonly varchar(1000)
	declare @pdtwhereclause_catonly varchar(1000)
	declare @mpvwhereclause_catonly varchar(1000)
	declare @pagewhereclause_catonly varchar(1000)

	SET @cwmwhereclause = ''
	SET @pdtwhereclause = ''
	SET @mpvwhereclause = ''
	SET @pagewhereclause = ''

	SET @cwmwhereclause_catonly = ''
	SET @pdtwhereclause_catonly = ''
	SET @mpvwhereclause_catonly = ''
	SET @pagewhereclause_catonly = ''

	SET @IncrementalLoad = 0
	SET @ismergecategory = 0
	SET @ismergecategory_catonly = 0

	IF EXISTS(SELECT [Name] FROM sysobjects where [Name] = 'Delete_TrackNo')
		SET @IncrementalLoad = 1		
	/*Check Incremental Load*/

	--if @IsRegular = 1
	--begin
		if exists(select * from conversioncontrol..conversionmergecategory where mergecategory = @categorycode)
		begin
			set @ismergecategory = 1
			select @mastercategory = MasterCategory from conversioncontrol..conversionmergecategory where mergecategory = @categorycode
			set @CWMTableName = @mastercategory + 'ChildWebMain'			set @PDTTableName = @mastercategory + 'PageDetailTable'
			set @MPVTableName = @mastercategory + 'MultiplePageValues'
			set @PAGETableName = @mastercategory + 'Pages'
	
			set @cwmwhereclause = ' and F.flyerid not in (select flyerid from ' + @ConversionDataDb + '.dbo.' + @cwmtablename + ')'
			set @pdtwhereclause = ' and pid.pagedetailid not in (select pagedetailid from ' + @ConversionDataDb + '.dbo.' + @pdttablename + ')'
			set @mpvwhereclause = ' and pid.pagedetailid not in (select pagedetailid from ' + @ConversionDataDb + '.dbo.' + @pdttablename + ')'
			set @pagewhereclause = ' and a.trackno not in ( select trackno from ' + @ConversionDataDb + '.dbo.' + @PAGETableName + ')'
		end
		else
		begin
			set @ismergecategory = 0
		end
	--end
	
	if @DatabaseCategory_CatOnly <> '' and @IsCatOnly = 1 
	begin
		SET @CWMTableName_catonly = @DatabaseCategory_CatOnly + 'ChildWebMain'
		SET @PDTTableName_catonly = @DatabaseCategory_CatOnly + 'PageDetailTable'
		SET @MPVTableName_catonly = @DatabaseCategory_CatOnly + 'MultiplePageValues'
		SET @PAGETableName_catonly = @DatabaseCategory_CatOnly + 'Pages'

		if exists(select * from conversioncontrol..conversionmergecategory where mergecategory = @DatabaseCategory_CatOnly)
		begin
			set @ismergecategory_catonly = 1
			select @mastercategory = MasterCategory from conversioncontrol..conversionmergecategory where mergecategory = @DatabaseCategory_CatOnly			set @CWMTableName_catonly = @mastercategory + 'ChildWebMain'
			set @PDTTableName_catonly = @mastercategory + 'PageDetailTable'
			set @MPVTableName_catonly = @mastercategory + 'MultiplePageValues'
			set @PAGETableName_catonly = @mastercategory + 'Pages'
	
			set @cwmwhereclause_catonly = ' and F.flyerid not in (select flyerid from ' + @ConversionDataDb + '.dbo.' + @cwmtablename_catonly + ')'
			set @pdtwhereclause_catonly = ' and pid.pagedetailid not in (select pagedetailid from ' + @ConversionDataDb + '.dbo.' + @pdttablename_catonly + ')'
			set @mpvwhereclause_catonly = ' and pid.pagedetailid not in (select pagedetailid from ' + @ConversionDataDb + '.dbo.' + @pdttablename_catonly + ')'
			set @pagewhereclause_catonly = ' and a.trackno not in ( select trackno from ' + @ConversionDataDb + '.dbo.' + @PAGETableName_catonly + ')'
		end
		else
		begin
			set @ismergecategory_catonly = 0
		end
	end
	
	/*Check Incremental Load*/
	IF @IncrementalLoad = 1
	BEGIN
		SET @ismergecategory = 1
		SET @ismergecategory_catonly = 1
	END
-- -- 	PRINT 'MergeCategory = ' + cast(@ismergecategory as varchar)

	--APPLY INCREMENTAL UPDATES.
	/*Check Incremental Load*/
	IF @IncrementalLoad = 1
	BEGIN
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Incremental Load Deletes',getdate())	
		exec('IF exists (select * from dbo.sysobjects where name = ''TrackNoToBeDeleted'' and xtype =''u'') drop table TrackNoToBeDeleted')
		SET @sql = 'Create Table TrackNoToBeDeleted (TrackNo int)'
		Exec(@sql)

		SET @sql = 'Insert into TrackNoToBeDeleted Select TrackNo From Delete_Trackno UNION ALL Select TrackNo + 500000000 From Delete_Trackno '
		SET @sql = @sql + ' UNION Select NTrackNo From ' + @tableviewname 
		exec(@sql)

		--SET @sql = 'If Exists(select name from Sysobjects where name = ''PrintPcsMasters'' and xtype = ''U'') Insert into TrackNoToBeDeleted Select TrackNo From PrintPcsMasters UNION ALL Select TrackNo + 500000000 From PrintPcsMasters  '		
		--Exec(@sql)

		SET @sql = 'CREATE clustered INDEX IDX_tRACKNO ON TrackNoToBeDeleted(Trackno)'
		exec(@sql)

		--DELETE RECORDS FROM TABLES
		set @sql='DELETE FROM ' + @ConversionDataDb + '.dbo.' + @cwmtablename + ' WHERE 
				FlyerID IN(SELECT FLYERID FROM conversioncontrol..FLYERID FLY, (SELECT TRACKNO FROM TrackNoToBeDeleted ) T 
				WHERE Fly.TRACKNO = T.TRACKNO ) option (maxdop 1)'
		Exec (@sql)

		set @sql='DELETE FROM ' + @ConversionDataDb + '.dbo.' + @pagetablename + ' WHERE 
				TRACKNO IN(SELECT TRACKNO FROM TrackNoToBeDeleted )'
		exec(@sql)

		set @sql='DELETE FROM ' + @ConversionDataDb + '.dbo.' + @PGCatsTableName + ' WHERE 
				TRACKNO IN(SELECT TRACKNO FROM TrackNoToBeDeleted )'
		exec(@sql)

		if @IsRegular = 1
		begin	
			set @sql = 'If not exists(select name from sysobjects where name = ''Delete_Ads'')				     begin
					DELETE FROM ' + @ConversionDataDb + '.dbo.' + @pdttablename + ' WHERE PAGEDETAILID IN(SELECT PAGEDETAILID FROM conversioncontrol..PDTID AS PDTID, (SELECT TRACKNO FROM TrackNoToBeDeleted ) T WHERE PDTID.TRACKNO = T.TRACKNO) option (maxdop 1)
					DELETE FROM ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' WHERE PageDetailID IN (SELECT PAGEDETAILID FROM conversioncontrol..PDTID AS PDTID, (SELECT TRACKNO FROM TrackNoToBeDeleted ) T WHERE PDTID.TRACKNO = T.TRACKNO) option (maxdop 1)
				     End
				     Else
				     begin
					IF exists (select * from dbo.sysindexes where name = ''IDX_delete_Ads'' and id = object_id(''[Delete_Ads]'')) drop index [Delete_Ads].[IDX_delete_Ads] 					CREATE clustered INDEX IDX_delete_Ads ON Delete_Ads(MadCode, Trackno, Page)

					DELETE ' + @ConversionDataDb + '.dbo.' + @pdttablename + ' from ' + @ConversionDataDb + '.dbo.' + @pdttablename + ' pdt with (nolock) 
						inner join conversioncontrol..pdtid AS PDTID with (nolock) on pdt.pagedetailid = pdtid.pagedetailid 
						inner join ' + @tableviewname + ' AS P with (nolock) ON P.NTrackNo = pdtid.TrackNo 
						inner join Ads A with (nolock) on pdtid.Madcode = A.Madcode And p.Trackno = A.TrackNo and pdtid.Page = A.Page option (maxdop 1)

					DELETE ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' from ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' pdt with (nolock) 
						inner join conversioncontrol..pdtid AS PDTID with (nolock) on pdt.pagedetailid = pdtid.pagedetailid 
						inner join ' + @tableviewname + ' AS P with (nolock) ON P.NTrackNo = pdtid.TrackNo 
						inner join Ads A with (nolock) on pdtid.Madcode = A.Madcode And P.Trackno = A.Trackno and pdtid.Page = A.Page option (maxdop 1)

					DELETE ' + @ConversionDataDb + '.dbo.' + @pdttablename + ' from ' + @ConversionDataDb + '.dbo.' + @pdttablename + ' pdt with (nolock) 
						inner join conversioncontrol..pdtid AS PDTID with (nolock) on pdt.pagedetailid = pdtid.pagedetailid 
						inner join ' + @tableviewname + ' AS P with (nolock) ON P.NTrackNo = pdtid.TrackNo 
						inner join Delete_Ads A with (nolock) on pdtid.Madcode = A.Madcode And p.Trackno = A.TrackNo and pdtid.Page = A.Page option (maxdop 1)

					DELETE ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' from ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' pdt with (nolock) 
						inner join conversioncontrol..pdtid AS PDTID with (nolock) on pdt.pagedetailid = pdtid.pagedetailid 
						inner join ' + @tableviewname + ' AS P with (nolock) ON P.NTrackNo = pdtid.TrackNo 
						inner join Delete_Ads A with (nolock) on pdtid.Madcode = A.Madcode And P.Trackno = A.Trackno and pdtid.Page = A.Page option (maxdop 1)

					DELETE ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' from ' + @ConversionDataDb + '.dbo.' + @mpvtablename + ' pdt with (nolock) 
						inner join conversioncontrol..pdtid AS PDTID with (nolock) on pdt.pagedetailid = pdtid.pagedetailid 
						inner join ' + @tableviewname + ' AS P with (nolock) ON P.NTrackNo = pdtid.TrackNo 
						inner join Adnote A with (nolock) on pdtid.Madcode = A.Madcode And P.Trackno = A.Trackno and pdtid.Page = A.Page option (maxdop 1)
				     end'	
			Exec(@sql)	
		end

		if @IsCatOnly = 1
		begin	
			set @sql = 'DELETE FROM ' + @ConversionDataDb + '.dbo.' + @pdttablename_catonly + ' WHERE PAGEDETAILID IN(SELECT PAGEDETAILID FROM conversioncontrol..PDTID_catonly AS PDTID, (SELECT TRACKNO FROM TrackNoToBeDeleted ) T WHERE PDTID.TRACKNO = T.TRACKNO) option (maxdop 1)'
			exec(@sql)
		end

		--DELETE RECORDS FROM TABLES		
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Incremental Load Deletes',getdate())	
	END
	/*Check Incremental Load*/
	--APPLY INCREMENTAL UPDATES.
	/*-------------------------INCREMENTAL AND MERGECATEGORY LOAD SETTINGS-------------------------*/

	/*-------------------------------CWM BASE TABLES------------------------------------*/
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : CWM Process Functions and Base Tables.',getdate())	
	--CWM : RETAILER [AdlertDB] 
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_retailer]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_retailer]')
	SET @sql = 'CREATE FUNCTION fun_retailer (@retid varchar(10))'
	SET @sql = @sql + ' RETURNS varchar(255) '
	SET @sql = @sql + ' AS	'
	SET @sql = @sql + ' begin'
	SET @sql = @sql + '	DECLARE @val varchar(255)'
	SET @sql = @sql + '	select @val = RTrim(isnull(Descrip,''''))  from Rets where retid = @retid'
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + ' end'
	exec(@sql)
	--CWM : RETAILER

	--CWM : MARKET [AdlertDB]
	--Create TempTable
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[TempMarket]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [TempMarket]')
	exec('select distinct e.envid,isnull(m.descrip,'''') descrip into TempMarket from Envs e,Mkts m where e.mktid = m.mktid')
	exec('Create Clustered Index TempMarket_envid on TempMarket(envid) on [primary]')
	--End Create TempTable

	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_market]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_market]')
	SET @sql = 'CREATE FUNCTION fun_market (@envid int) '
	SET @sql = @sql + 'RETURNS varchar(255) '
	SET @sql = @sql + 'AS	'
	SET @sql = @sql + 'begin '
	SET @sql = @sql + '	DECLARE @val varchar(255) '
	SET @sql = @sql + '	select @val = isnull(descrip,'''')  from TempMarket where envid = @envid '
	SET @sql = @sql + ' '
	SET @sql = @sql + 'return(@val) '
	SET @sql = @sql + 'end '
	exec(@sql)

	--CWM : MARKET

	--CWM : TRADECLASS [AdlertDB]
	--Create TempTable
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[TempTradeClass]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [TempTradeClass]')
	exec('select distinct r.retid,isnull(t.descrip,'''') descrip into TempTradeClass from rets r,RetChans t where t.RetChanId = r.RetChanId')
	exec('Create Clustered Index TempTradeClass_retid on TempTradeClass(retid) on [primary]')
	--End Create TempTable

	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_tradeclass]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_tradeclass] ')
	SET @sql = 'CREATE FUNCTION fun_tradeclass (@retid varchar(10)) '
	SET @sql = @sql + 'RETURNS varchar(255) ' 
	SET @sql = @sql + 'AS '	
	SET @sql = @sql + 'begin '
	SET @sql = @sql + '	DECLARE @val varchar(255) '
	SET @sql = @sql + '	select @val = isnull(descrip,'''')  from TempTradeClass where retid = @retid '
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + 'end	'	exec(@sql)
	--CWM : TRADECLASS

	--CWM : THEMES [AdlertDB] 
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_theme]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_theme] ')
	SET @sql = 'CREATE FUNCTION fun_theme (@ThemeId varchar(10)) '
	SET @sql = @sql + 'RETURNS varchar(255) '
	SET @sql = @sql + 'AS	'
	SET @sql = @sql + 'begin	' 
	SET @sql = @sql + '	DECLARE @val varchar(255) '
	SET @sql = @sql + '	select @val = isnull(Descrip,'''') from Themes where ThemeId = @ThemeId '
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + 'end '
	exec(@sql)
	--CWM : THEMES

	--CWM : NEWSPAPER
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[TempNewsPaper]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [TempNewsPaper]')
	exec('Select distinct e.envid,n.descrip into TempNewsPaper from Envs e,News n where e.newsid = n.newsid and upper(e.Type) = ''ROP''')
	exec('Create Clustered Index TempNewsPaper_envid on TempNewsPaper(envid) on [primary]')
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_newspaper]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_newspaper] ')
	SET @sql = 'CREATE FUNCTION fun_newspaper (@envid int) '
	SET @sql = @sql + 'RETURNS varchar(255) '
	SET @sql = @sql + 'AS	'
	SET @sql = @sql + 'begin '
	SET @sql = @sql + '	DECLARE @val varchar(255) '
	SET @sql = @sql + '	select @val = isnull(Descrip,'''') from TempNewsPaper where EnvId = @envid '
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + 'end '
	exec(@sql)
	--CWM : NEWSPAPER

	--CWM : PAGES [AdlertDB] 
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[TempPageCount]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [TempPageCount]')
	exec('select distinct TrackNo,count(distinct Page) Page into TempPageCount from pages group by Trackno')
	exec('Create Clustered Index TempPageCount_TrackNo on TempPageCount(TrackNo) on [primary]')
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_pages]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_pages] ')

	SET @sql = 'CREATE FUNCTION fun_pages (@TrackNo int) '
	SET @sql = @sql + 'RETURNS varchar(255) '
	SET @sql = @sql + 'AS	' 
	SET @sql = @sql + 'begin '
	SET @sql = @sql + '	DECLARE @val varchar(255) '
	SET @sql = @sql + '	select @val = Page from TempPageCount where TrackNo = @TrackNo or TrackNo = (@TrackNo - 500000000) '
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + 'end '
	exec(@sql)
	--CWM : PAGES [AdlertDB] 

	--CWM : RetChanId [AdlertDB] 
	exec('IF exists (select * from dbo.sysobjects where id = object_id(''[dbo].[fun_retchanid]'') and xtype in (''FN'', ''IF'', ''TF'')) drop function [dbo].[fun_retchanid]')
	SET @sql = 'CREATE FUNCTION fun_retchanid (@retid varchar(10))'
	SET @sql = @sql + ' RETURNS int'
	SET @sql = @sql + ' AS	'
	SET @sql = @sql + ' begin'
	SET @sql = @sql + '	DECLARE @val int'
	SET @sql = @sql + '	select @val = retChanId from Rets where retid = @retid'
	SET @sql = @sql + '	return(@val) '
	SET @sql = @sql + ' end'
	exec(@sql)
	--CWM : RetChanId
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : CWM Process Functions and Base Tables.',getdate())	
	/*-------------------------------CWM BASE TABLES------------------------------------*/

	--------------------------CREATE CWM TABLE.-------------------------
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create CWM Table.',getdate())
	if @ismergecategory = 0 
	begin	
		exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @CWMTableName + ''' and XType = ''U'') drop table ' + @ConversionDataDb + '.dbo.' + @CWMTableName)
		SET @sql = ' CREATE TABLE ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' ('
		SET @sql = @sql + ' [FlyerID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,'
		SET @sql = @sql + ' [Advertiser] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [AdDate] [datetime] NULL ,'
		SET @sql = @sql + ' [WeekOf] [datetime] NULL ,'
		SET @sql = @sql + ' [media] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [event] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [theme] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [market] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [publication] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [salestartdate] [datetime] NULL ,'
		SET @sql = @sql + ' [saleenddate] [datetime] NULL ,'
		SET @sql = @sql + ' [pages] [int] NULL ,'
		SET @sql = @sql + ' [size] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [tradeclass] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [coupon] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [img] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [url] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [webcreated] [smallint] NULL ,'
		SET @sql = @sql + ' [PublishedOn] [datetime] NULL ,'
		SET @sql = @sql + ' [recordenteredby] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [datetimerecordentered] [datetime] NULL ,'
		SET @sql = @sql + ' [Region] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [District] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [SalesTerritory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [SalesTerritoryGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [SalesTerritorySubGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [DateTimeAdded] [datetime] NULL ,'		SET @sql = @sql + ' [TcUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql + ' [DistUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql + ' [RegionUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql + ' [StUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql + ' [StgUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql + ' [StsgUpdatedOn] [smalldatetime] NULL ,'
		SET @sql = @sql +  '[AdMonth] [smalldatetime] NULL ,' 
		SET @sql = @sql +  '[AdDay] [tinyint] NULL ,' 
		SET @sql = @sql + ' [TrackNo] [int] NULL ,'
		SET @sql = @sql + ' [WeekNum] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '

		SET @sql = @sql + ' [AdRetId] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [ThemeId] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [NewsId] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [AdMktId] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
		SET @sql = @sql + ' [RetChanId] [int] NULL,'
		SET @sql = @sql + ' ) ON [PRIMARY]'
		SET @sql = @sql + ' '
		exec(@sql)
	end

	--INSERT RECORDS.
	SET datefirst 1
	SET @sql = 'insert into ' + @ConversionDataDb + '.dbo.' + @CWMTableName + '(Flyerid,Advertiser, Addate, Weekof, media, event, theme, market, publication, '
	SET @sql = @sql + 'salestartdate, saleenddate, pages, tradeclass, webcreated, datetimerecordentered, a.TrackNo, WeekNum,[img],[url],AdMonth, AdDay,
				PublishedOn, AdRetId, ThemeId, NewsId, AdMktId, RetChanId) '

	SET @sql = @sql + 'select F.FlyerID,RTRIM(dbo.fun_retailer(retid)), BreakDt,dateadd(day,-(datepart(dw,BreakDt)-1), BreakDt)'	


	--SET @sql = @sql + ', dbo.fun_media(EnvId), ''NONE'' ,'
	SET @sql = @sql + ', RTRIM(A.Media) , ''NONE'' ,'
	SET @sql = @sql + 'RTRIM(dbo.fun_theme(ThemeId))'

	--Start: ItemID - 1997 Change
	IF @IsRepOnly = 1 
		SET @sql = @sql + ', ''Representative'''
	else
		SET @sql = @sql + ', RTRIM(isnull(dbo.fun_market(envid),''Representative''))'
	--End: ItemID - 1997 Change

	SET @sql = @sql + ', RTRIM(isnull(dbo.fun_newspaper(envid),''Multiple'')), StartDt, enddt '

	--Start : Changes - Replace a.TrackNo with a.NTrackNo
	SET @sql = @sql + ', dbo.fun_pages(a.NTrackNo) '
	SET @sql = @sql + ', RTRIM(dbo.fun_tradeclass(retid)), 1, getdate(), a.NTrackNo, cast(year(startdt) as varchar) + ''/week'' + case len(cast(datepart(wk,StartDt) as varchar)) when 1 then ''0'' + cast(datepart(wk,StartDt) as varchar) else cast(datepart(wk,StartDt) as varchar) end as WeekNum, '
	--END : Changes - Replace a.TrackNo with a.NTrackNo

	SET @sql = @sql + '''/XXXXXXX/001s.jpg'',''/XXXXXXX/main.asp'',AdMonth, AdDay, a.ModTime, RetId, ThemeId, NewsId, MktId, dbo.fun_retchanid(retid) '
	--Start : Changes
	SET @sql = @sql + 'from ' + @tableviewname + ' a, ConversionControl..FlyerID F Where A.NTrackno = F.TrackNo ' + @cwmwhereclause + ' option (maxdop 1)' 
	--End : Changes
	exec(@sql)

	--print @sql
	SET datefirst 7

	--PRINT 'UPDATE conversioncontrol..' + @CWMTableName + ' SET Weekof = dateadd(day,-(datepart(dw,AdDate)-1), AdDate)'
	EXECUTE('UPDATE ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' SET Weekof = dateadd(day,-(datepart(dw,AdDate)-1), AdDate)')

	--Start: ItemID - 1997 Change
	IF @isprintpcsmasters = 'True'
	begin
		--Start : Changes
		--set @sql = 'update conversioncontrol..' + @CWMTableName + ' set Market = ''Representative'' where Trackno in (select trackno + 500000000 from printpcsmasters)'
		set @sql = 'update ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' set Market = ''Representative'',AdMktId = case when len(ADMktID) = 3 Then ''R'' + AdMktId Else ADMktID End where Trackno > 500000000'
		exec(@sql)
		--End : Changes
	end
	--End : ItemID - 1997 Change

	--########## RETID, MKTID, RETMKID CHANGES. ##########	-------------CREATE CLUSTERED INDEX ON TRACKNO USED FOR PDT PROCESSING
	if @ismergecategory = 0	begin
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'CWM Table Indexes.',getdate())
		--exec('create clustered index ' + @CWMTableName + '_TrackNo on conversioncontrol..' + @CWMTableName + '(TrackNo) on [primary]')		exec('create index ' + @CWMTableName + '_AdvMkt on ' + @ConversionDataDb + '.dbo.' + @CWMTableName + '(Advertiser, Market) on [primary]')
	end
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create CWM Table.',getdate())

	--ItemID : 7316
	IF EXISTS(SELECT * FROM ConversionControl..TradeClassUpdate WHERE DatabaseCategory = @categorycode)
	BEGIN
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : TradeClass Update.',getdate())		
		
		SET @SQL = 'UPDATE ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' SET TradeClass = T.TradeClass 
				FROM ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' C JOIN 
				(SELECT * FROM ConversionControl..TradeClassUpdate WHERE DatabaseCategory = ''' + @categorycode + ''') T 
				ON C.Advertiser = T.RealAdvertiser AND C.TradeClass = T.RealTradeClass'
		EXEC(@SQL)		

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : TradeClass Update.',getdate())		
	END
	--ItemID : 7316

	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Rets, Mkts, ADRetMkts Changes.',getdate())

	--Retailer
	SET @SQL = 'INSERT INTO conversioncontrol..Rets(Advertiser) SELECT distinct Advertiser FROM ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' WHERE  
			Advertiser NOT IN(SELECT Advertiser FROM conversioncontrol..Rets) and Advertiser is not null group by Advertiser'
	EXEC(@SQL)

	--Market
	SET @SQL = 'INSERT INTO conversioncontrol..Mkts(Market) SELECT distinct Market FROM ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' WHERE  
			Market NOT IN(SELECT Market FROM conversioncontrol..Mkts) and market is not null group by Market'
	EXEC(@SQL)

	--RetMktId
	SET @SQL = 'INSERT INTO conversioncontrol..ADRetMkts(RetId,MktId,Advertiser,Market, Tradeclass) 
		SELECT R.AVRetId,M.AVMktId,A.Advertiser,A.Market,Tradeclass  FROM 
		(
		SELECT DISTINCT ADVERTISER,MARKET, Tradeclass FROM ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' 
			WHERE Advertiser + Market + Tradeclass NOT IN(SELECT DISTINCT Advertiser+Market+Tradeclass FROM conversioncontrol..ADRetMkts)
		) A JOIN conversioncontrol..Rets R ON A.Advertiser = R.Advertiser JOIN conversioncontrol..Mkts M ON A.Market = M.Market'
	EXEC(@SQL)

	if @ismergecategory = 0	begin
		SET @SQL = 'Alter Table ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' Add RetID int, MktID Int, RetMktID int'
		Exec(@SQL)
	end

	SET @SQL = 'Update cwm set cwm.retid = m.retid, cwm.mktid = m.mktid, cwm.retmktid = m.retmktid '
	SET @SQL = @SQL + ' from ' + @ConversionDataDb + '.dbo.' + @CWMTableName + ' CWM, ConversionControl..ADRetMkts m '
	--SET @SQL = @SQL + ' Where cwm.advertiser = m.advertiser and cwm.market = m.market and cwm.tradeclass = m.tradeclass and cwm.retmktid is null'
	SET @SQL = @SQL + ' Where cwm.advertiser = m.advertiser and cwm.market = m.market and cwm.tradeclass = m.tradeclass '
	Exec (@SQL)
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Rets, Mkts, ADRetMkts Changes.',getdate())
	--########## RETID, MKTID, RETMKID CHANGES. ##########


	---------------------------END :: CREATE CWM TABLE.-------------------------

	---------------------------START :: CREATE TEMPPAGES TABLE.-------------------------
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create TempPagesView',getdate())
	--TempPageValuesView
	exec('IF exists (select * from dbo.sysobjects where id = object_id(N''[TempPageValuesView]'') and OBJECTPROPERTY(id, N''IsTable'') = 1)  Drop Table TempPageValuesView') 
	--Start : Changes
	--SET @sql = ' Select Pages.trackno, pages.page, pages.sizeid, pages.color, pages.image,' 
	SET @sql = ' Select B.NTrackno As TrackNo, pages.page, pages.image,pages.sizeid, pages.color,s.Height as PageHeight,s.Width as PageWidth,s.Space As PageSpace,' 
	--End : Changes
	SET @sql = @sql + ' pages.scan,' 
	SET @sql = @sql + ' PageValue=case isnumeric(Pages.Page)' 
	SET @sql = @sql + '                                                 when 1 then cast(page as int)' 
	SET @sql = @sql + '                                                 else  case left(Page,1) when ''W'' then' 
	SET @sql = @sql + '                                                             case charindex(''-'',page)' 
	SET @sql = @sql + '                                                             when  0  then 13000' 
	SET @sql = @sql + '                                                             else case isnumeric (Substring(page,charindex(''-'',page) +1,len(page)))' 
	SET @sql = @sql + '                                                                         when 1 then 10000 + convert(int,Substring(page,charindex(''-'',page) +1,len(page)) )' 
	SET @sql = @sql + '                                                                         else 10000 end' 
	SET @sql = @sql + '                                                             End' 
	SET @sql = @sql + '                                                       Else' 
	SET @sql = @sql + '                                                             Case IsNumeric(Substring(Page, 2, 1))' 
	SET @sql = @sql + '                                                             when 1 then' 
	SET @sql = @sql + '                                                             case charindex(''-'',page)' 
	SET @sql = @sql + '                                                             when  0  then 11000' 
	SET @sql = @sql + '                                                             else case isnumeric (Substring(page,charindex(''-'',page) +1,len(page)))' 
	SET @sql = @sql + '                                                                         when 1 then convert(int,substring (Page,2,1))* 1000 + Convert(int, Substring(page,charindex(''-'',page) +1,len(page)) )' 
	SET @sql = @sql + '                                                                         else 12000 end' 
	SET @sql = @sql + '                                                             End'
	SET @sql = @sql + '                                                       Else' 
	SET @sql = @sql + '                                                             case charindex(''-'',page)' 
	SET @sql = @sql + '                                                             when  0  then 10000' 
	SET @sql = @sql + '                                                             else case isnumeric (Substring(page,charindex(''-'',page) +1,len(page)))' 
	SET @sql = @sql + '                                                                         when 1 then Substring(page,charindex(''-'',page) +1,len(page))' 
	SET @sql = @sql + '                                                                         else 1000 end' 
	SET @sql = @sql + '                                                             End' 
	SET @sql = @sql + '                                                             End' 
	SET @sql = @sql + '                                                       End' 
	SET @sql = @sql + '                                                 End' 
	SET @sql = @sql + '  Into TempPageValuesView From Pages JOIN ' + @tableviewname + ' b ON Pages.Trackno = b.trackno  
				LEFT OUTER JOIN Sizes S ON Pages.SizeId = S.SizeId option (maxdop 1)'
	--SET @sql = @sql + ', ' + @tableviewname + ' b where Pages.Trackno = b.trackno '
	exec(@sql)
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create TempPagesView',getdate())
	--End : Changes

	--TempPages
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create Pages Table',getdate())
	if @ismergecategory = 0
		exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @PAGETableName + ''' and XType = ''U'') 
			drop table ' + @ConversionDataDb + '.dbo.' + @PAGETableName)

	SET @sql = ''
	if @ismergecategory = 1
		SET @sql = 'INSERT INTO ' + @ConversionDataDb + '.dbo.' + @PAGETableName + '(TrackNo,Page,[Image],SizeId,Color,PageHeight,PageWidth,PageSpace,PageNo,Features) '
	SET @sql = @sql + ' select a.TrackNo,a.Page, a.[Image], a.SizeId, a.Color,a.PageHeight,a.PageWidth,a.PageSpace, c.PageNo, Features = case'
	SET @sql = @sql + ' when b.cnt <=  2 then ''Single Page Ad'''
	SET @sql = @sql + ' when PageValue = 1 then ''Front Page'''
	SET @sql = @sql + ' when PageValue = 2 then ''Inside Front Page'''
	SET @sql = @sql + ' when PageValue > 10000 then ''Wrap'''
	SET @sql = @sql + ' when PageValue > 1000  then ''Interior Page'''
	SET @sql = @sql + ' when PageValue = b.sums then ''Back Page'''
	SET @sql = @sql + ' when PageValue = b.sums - 1 then ''Inside Back Page'''
	SET @sql = @sql + ' Else ''Interior Page'' end '

	if @ismergecategory = 0
		SET @sql = @sql + ' Into ' + @ConversionDataDb + '.dbo.' + @PAGETableName + ''
	SET @sql = @sql + ' from TempPageValuesView a, (select trackno, sum(case when isnumeric(page) = 1 then 1 else 0 end) as sums, count(pagevalue) as cnt from TempPageValuesView'
	SET @sql = @sql + ' group by trackno) b,'
	SET @sql = @sql + ' (select a.trackno, b.Page, count(b.Page) PageNo from TempPageValuesView a, TempPageValuesView b where'	SET @sql = @sql + ' a.trackno = b.trackno And a.pagevalue <= b.pagevalue'
	SET @sql = @sql + ' group by a.trackno, b.page'
	SET @sql = @sql + ' ) c'
	SET @sql = @sql + ' Where a.trackno = b.trackno'
	SET @sql = @sql + '    and a.trackno = c.trackno'
	SET @sql = @sql + '    and a.Page = c.Page ' + @pagewhereclause + ' option (maxdop 1)'
	exec(@sql)
	
	--CREATE CLUSTERED INDEX ON TRACKNO, PAGE USED FOR PDT PROCESSING
	if @ismergecategory = 0
		exec('create clustered index ' + @PAGETableName + '_TrackNoPage 
				on ' + @ConversionDataDb + '.dbo.' + @PAGETableName + '(TrackNo,Page) on [primary]')	

	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create Pages Table',getdate())
	---------------------------END :: CREATE TEMPPAGES TABLE.-------------------------

	---------------------------START :: CREATE ADLERTADVIEWPRO TABLE.-------------------------
	IF @IsRegular = 1
	BEGIN
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create TempADlertAdviewPro Table',getdate())
		exec('IF exists (select * from dbo.sysobjects where id = object_id(N''[TempADlertAdviewPro]'') 
				and OBJECTPROPERTY(id, N''IsTable'') = 1)  Drop Table TempADlertAdviewPro') 
		SET @sql = 'CREATE TABLE [TempADlertAdviewPro] ('
		SET @sql = @sql + '    [adnoteid] [char] (3) NULL ,'
		SET @sql = @sql + '    [FieldName] [varchar] (37)  NULL ,'
		SET @sql = @sql + '    [FieldValue] [varchar](37) NULL ,'
		SET @sql = @sql + '    [PageEvent] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL'
		SET @sql = @sql + '    ) ON [PRIMARY]'
		exec(@sql)
	
		SET @sql = 'insert into TempADlertAdviewPro select distinct AAP.adnoteid, FieldName = case '
		SET @sql = @sql + ' when RebateAmount is not null then ''RebateAmount'''
		SET @sql = @sql + ' when RequiredQuantity is not null then ''RequiredQuantity'''
		SET @sql = @sql + ' when CouponValueP1 is not null then ''CouponValueP1'''
		SET @sql = @sql + ' when CouponValueD2 is not null then ''CouponValueD2'''
		SET @sql = @sql + ' when NumberPackage is not null then ''NumberPackage'''
		SET @sql = @sql + ' when OtherDiscountD2 is not null then ''OtherDiscountD2'''
		SET @sql = @sql + ' when HighDOff is not null then ''HighDOff'''
		SET @sql = @sql + ' when HighRebateAmount is not null then ''HighRebateAmount'''
		SET @sql = @sql + ' when GiftCardD is not null then ''GiftCardD'''
		SET @sql = @sql + ' when BuyNumber is not null then ''BuyNumber'''
		SET @sql = @sql + ' when GetNumber is not null then ''GetNumber'''
		SET @sql = @sql + ' when HighPOff is not null then ''HighPOff'''
		SET @sql = @sql + ' when ExtraPOff is not null then ''ExtraPOff'''
		SET @sql = @sql + ' when RequiredNumberOffer is not null then ''RequiredNumberOffer'''
		SET @sql = @sql + ' when OfferDes is not null then ''OfferDes'''
		SET @sql = @sql + ' when HiGiftCard is not null then ''HiGiftCard'''
		SET @sql = @sql + ' else NULL end,'

		SET @sql = @sql + ' FieldValue = case when RebateAmount is not null then cast(RebateAmount as varchar)'
		SET @sql = @sql + ' when RequiredQuantity is not null then cast(RequiredQuantity as varchar)'
		SET @sql = @sql + ' when CouponValueP1 is not null then cast(CouponValueP1 as varchar)'
		SET @sql = @sql + ' when CouponValueD2 is not null then cast(CouponValueD2 as varchar)'
		SET @sql = @sql + ' when NumberPackage is not null then cast(NumberPackage as varchar)'		SET @sql = @sql + ' when OtherDiscountD2 is not null then cast(OtherDiscountD2 as varchar)'
		SET @sql = @sql + ' when HighDOff is not null then cast(HighDOff as varchar)'
		SET @sql = @sql + ' when HighRebateAmount is not null then cast(HighRebateAmount as varchar)'
		SET @sql = @sql + ' when GiftCardD is not null then cast(GiftCardD as varchar)'
		SET @sql = @sql + ' when BuyNumber is not null then cast(BuyNumber as varchar)'
		SET @sql = @sql + ' when GetNumber is not null then cast(GetNumber as varchar)'
		SET @sql = @sql + ' when HighPOff is not null then cast(HighPOff as varchar)'
		SET @sql = @sql + ' when ExtraPOff is not null then cast(ExtraPOff as varchar)'
		SET @sql = @sql + ' when RequiredNumberOffer is not null then cast(RequiredNumberOffer as varchar)'
		SET @sql = @sql + ' when OfferDes is not null then OfferDes'
		SET @sql = @sql + ' when HiGiftCard is not null then cast(HiGiftCard as varchar)'
		SET @sql = @sql + ' else NULL end,'
		SET @sql = @sql + ' PageEvent'

		SET @sql = @sql + ' from ' + @conversiondb + 'adlertadviewpromotions AAP join ' + @conversiondb + 'AdlertAdviewPromotionsValues AAPV'

		SET @sql = @sql + ' on AAP.Adnoteid = AAPV.adnoteid'


		SET @sql = @sql + ' where finansinginterestrate is null and finansingminpurchase is null and finansingtermlength is null and (finansingtermlengthtype is null or finansingtermlengthtype = '''')'
		SET @sql = @sql + ' union '
		SET @sql = @sql + ' select distinct AAP.adnoteid, '
		SET @sql = @sql + ' ''FinansingInterestRate'', '
		SET @sql = @sql + ' cast(FinansingInterestRate as varchar), ''Financing Available'''
		SET @sql = @sql + ' From ' + @conversiondb + 'adlertadviewpromotions AAP join ' + @conversiondb + 'AdlertAdviewPromotionsValues AAPV'
		SET @sql = @sql + ' on AAP.Adnoteid = AAPV.adnoteid'
		SET @sql = @sql + ' Where FinansingInterestRate is not null'
		SET @sql = @sql + ' UNION ' 
		SET @sql = @sql + ' select distinct AAP.adnoteid, '
		SET @sql = @sql + ' ''finansingminpurchase'', '
		SET @sql = @sql + ' cast(finansingminpurchase as varchar), ''Financing Available'''
		SET @sql = @sql + ' From ' + @conversiondb + 'adlertadviewpromotions AAP join ' + @conversiondb + 'AdlertAdviewPromotionsValues AAPV'
		SET @sql = @sql + ' on AAP.Adnoteid = AAPV.adnoteid'
		SET @sql = @sql + ' Where finansingminpurchase is not null'
		SET @sql = @sql + ' UNION '
		SET @sql = @sql + ' select distinct AAP.adnoteid, '
		SET @sql = @sql + ' ''finansingtermlength'', '
		SET @sql = @sql + ' cast(finansingtermlength as varchar), ''Financing Available'''
		SET @sql = @sql + ' From ' + @conversiondb + 'adlertadviewpromotions AAP join ' + @conversiondb + 'AdlertAdviewPromotionsValues AAPV'
		SET @sql = @sql + ' on AAP.Adnoteid = AAPV.adnoteid'
		SET @sql = @sql + ' Where finansingtermlength is not null'
		SET @sql = @sql + ' UNION '		SET @sql = @sql + ' select distinct AAP.adnoteid, '
		SET @sql = @sql + ' ''finansingtermlengthtype'', '
		SET @sql = @sql + ' cast(finansingtermlengthtype as varchar), ''Financing Available'''
		SET @sql = @sql + ' From ' + @conversiondb + 'adlertadviewpromotions AAP join ' + @conversiondb + 'AdlertAdviewPromotionsValues AAPV'
		SET @sql = @sql + ' on AAP.Adnoteid = AAPV.adnoteid'
		SET @sql = @sql + ' Where finansingtermlengthtype is not null AND finansingtermlengthtype <> '''''

		exec(@sql)

		exec(' Create Clustered Index [Ix_Adnotid_TempADlertAdviewPro] On TempADlertAdviewPro([adnoteid]) On [Primary] ')
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create TempADlertAdviewPro Table',getdate())
	
		/* Create TempADlertAdviewProAds Table */		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create TempADlertAdviewProAds Table',getdate())		exec('IF exists (select * from dbo.sysobjects where id = object_id(N''[TempADlertAdviewProAds]'') and 			OBJECTPROPERTY(id, N''IsTable'') = 1)  Drop Table TempADlertAdviewProAds') 
		SET @sql = 'select Trackno,Page,Madcode,rtrim(B.AdnoteId) as AdnoteID,rtrim(PageEvent) as PageEvent,
			FieldName,FieldValue into TempADlertAdviewProAds from TempADlertAdviewPro A,adnote B where a.Adnoteid = b.adnoteid'
		exec(@sql)
		exec('CREATE  CLUSTERED  INDEX [TempADlertAdviewProAds_TracknoMadeCodePage] ON [TempADlertAdviewProAds]([TrackNo], 
			[MadCode], [Page]) ON [PRIMARY]')	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create TempADlertAdviewProAds Table',getdate())
		

		/* Create TempPriceValues Table */
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create TempPriceValues Table',getdate())
		exec('IF exists (select * from sysobjects where id = object_id(''[TempPriceValues]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) 
			drop table [TempPriceValues]')
		SET @sql = 'select TrackNo,Page,Madcode,count(*) as mpvcount,'
		SET @sql = @sql + 'max(case When Fieldname = ''RebateAmount'' then FieldValue end ) as RebateAmount, '
		SET @sql = @sql + 'max(case When Fieldname = ''OtherDiscountD2'' then FieldValue end ) as OtherDiscountD2,    '
		SET @sql = @sql + 'max(case When Fieldname = ''CouponValueD2'' then FieldValue end ) as CouponValueD2, '
		SET @sql = @sql + 'max(case When Fieldname = ''CouponValueP1'' then FieldValue end ) as CouponValueP1, '
		SET @sql = @sql + 'max(case When Fieldname = ''RequiredQuantity'' then FieldValue end ) as RequiredQuantity, '
		SET @sql = @sql + 'max(case When Fieldname = ''NumberPackage'' then FieldValue end ) as NumberPackage, '
		SET @sql = @sql + 'max(case When Fieldname = ''HighDOff'' then FieldValue end ) as HighDOff, '
		SET @sql = @sql + 'max(case When Fieldname = ''HighRebateAmount'' then FieldValue end ) as HighRebateAmount, '
		SET @sql = @sql + 'max(case When Fieldname = ''GiftCardD'' then FieldValue end ) as GiftCardD, '
		SET @sql = @sql + 'max(case When Fieldname = ''BuyNumber'' then FieldValue end ) as BuyNumber, '
		SET @sql = @sql + 'max(case When Fieldname = ''GetNumber'' then FieldValue end ) as GetNumber, '	
		SET @sql = @sql + 'max(case When Fieldname = ''HighPOff'' then FieldValue end ) as HighPOff , '
		SET @sql = @sql + 'max(case When Fieldname = ''ExtraPOff'' then FieldValue end ) as ExtraPOff , '
		SET @sql = @sql + 'max(case When Fieldname = ''RequiredNumberOffer'' then FieldValue end ) as RequiredNumberOffer , '
		SET @sql = @sql + 'max(case When Fieldname = ''OfferDes'' then FieldValue end ) as OfferDes , '

		SET @sql = @sql + 'max(case When Fieldname = ''FinansingInterestRate'' then FieldValue end ) as FinansingInterestRate , '
		SET @sql = @sql + 'max(case When Fieldname = ''FinansingMinPurchase'' then FieldValue end ) as FinansingMinPurchase , '
		SET @sql = @sql + 'max(case When Fieldname = ''FinansingTermLength'' then FieldValue end ) as FinansingTermLength , '
		SET @sql = @sql + 'max(case When Fieldname = ''FinansingTermLengthType'' then FieldValue end ) as FinansingTermLengthType , '
		SET @sql = @sql + 'max(case When Fieldname = ''HiGiftCard'' then FieldValue end ) as HiGiftCard '

		SET @sql = @sql + 'into TempPriceValues '
		SET @sql = @sql + 'from TempADlertAdviewProAds '
		SET @sql = @sql + 'group by trackno, page, madcode '
		exec(@sql)
		exec('create clustered index TempPriceValues_TrackMadcodePagePageEvent on TempPriceValues(trackno,madcode,page) on [Primary]')
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create TempPriceValues Table',getdate())
		/* Create TempPriceValues Table */
	END
	--####################################### PDT LEVEL CONVERSIONS.#######################################-- 
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : PDT Process Functions and Base Tables.',getdate())	

	--PDT : Update Products..StartDt Column to remove Time value
	EXECUTE('UPDATE Products SET StartDt = CONVERT(DATETIME, CONVERT(VARCHAR, StartDt, 101), 101)')  
	--PDT : Update Products..StartDt Column to remove Time value

	
	--PDT : Consolidated Table For 
	IF @IsRegular = 1 or @IsCatOnly = 1
	begin
		exec('IF exists (select * from sysobjects where id = object_id(''[disquerypage]'') 
			and OBJECTPROPERTY(id, ''IsUserTable'') = 1) drop table [disquerypage]')
		If @MCTableExists = 0
		begin
			SET @sql = 'select distinct p.madcode,RTRIM(g.descrip) as MerchandiseCategory,RTRIM(c.descrip) as MerchandiseSubCat,RTRIM(s.descrip) as Category,
			RTRIM(m.descrip) as Manufacturer,RTRIM(b.Descrip) as Brand, ltrim(rtrim(ISNULL(p.ModelNo,''''))) as SKUDescription2,ISNULL(RTRIM(p.descrip),'''') as Comments1  
			, C.CatID, G.GrpID, p.StartDt, p.BrandId, b.MfrId, p.SubCatId, bf.BrandFamilyId, bf.Descrip AS BrandFamilyDescrip    
			into disquerypage
			from products p 
			join brands b on p.brandid = b.brandid
			join mfrs m on b.mfrid = m.mfrid
			join subcats s on p.subcatid = s.subcatid
			join cats c on s.catid = c.catid
			join grps g on c.grpid = g.grpid
			left outer join BrandFamily bf on b.brandfamilyid = bf.brandfamilyid' 	
			EXEC(@SQL)
		end
		else
		begin
			SET @sql = 'select distinct p.madcode,'
			--ItemId : 9438
			IF @categorycode = 'wlmadl' 
			        SET @sql = @sql + ' ISNULL(RTRIM(MC.MerchandiseCategory),''Z - ''  + RTRIM(g.descrip) + '' - OTHER'') AS MerchandiseCategory,'
			ELSE
			        SET @sql = @sql + ' ISNULL(RTRIM(MC.MerchandiseCategory),RTRIM(g.descrip)) as MerchandiseCategory, '			

			SET @sql = @sql + ' ISNULL(RTRIM(MC.MerchandiseSubCat),RTRIM(c.descrip)) as MerchandiseSubCat,
			IsNULL(RTRIM(MC.Category),RTRIM(s.descrip)) as Category,
			RTRIM(m.descrip) as Manufacturer,RTRIM(b.Descrip) as Brand,
			ltrim(rtrim(ISNULL(p.ModelNo,''''))) as SKUDescription2,ISNULL(RTRIM(p.descrip) ,'''') as Comments1  
			, C.CatID, G.GrpID, p.StartDt, p.BrandId, b.MfrId, p.SubCatId, bf.BrandFamilyId, bf.Descrip AS BrandFamilyDescrip    
			into disquerypage
			from products p 
			join brands b on p.brandid = b.brandid
			join mfrs m on b.mfrid = m.mfrid
			join subcats s on p.subcatid = s.subcatid
			join cats c on s.catid = c.catid
			join grps g on c.grpid = g.grpid 
			left outer join BrandFamily bf on b.brandfamilyid = bf.brandfamilyid  
			left outer join ' + @MCTableName + ' MC on MC.RealCategory = s.descrip'
			EXEC(@SQL)			
		end
		
		EXEC('CREATE CLUSTERED INDEX idx_disquerypage ON disquerypage(MadCode)')

		--ClientBrandException Changes.
		SET @SQL = 'UPDATE disquerypage SET MerchandiseCategory = Rtrim(ISNULL(CBE.MerchandiseCategory,D.MerchandiseCategory)) 
				,MerchandiseSubCat = RTrim(ISNULL(CBE.MerchandiseSubCat,D.MerchandiseSubCat)) 
				,Category = RTrim(CASE WHEN CBE.CategorySet = 1 THEN CBE.Category ELSE CBE.RealCategory END)
				,Brand = RTrim(CASE WHEN CBE.BrandSet = 1 THEN CBE.Brand ELSE CBE.RealBrand END)
				FROM Disquerypage D JOIN ' + @CBETableLocation + 'ClientBrandException CBE 
				ON D.Category = CBE.RealCategory AND D.Brand = CBE.RealBrand
				 WHERE CBE.CategoryCodeID = ' +  Cast(@intCategoryCodeId as varchar)
		EXEC(@SQL)
		--ClientBrandException Changes.

		EXEC('ALTER TABLE disquerypage ALTER COLUMN MerchandiseCategory VARCHAR(37)')
		EXEC('ALTER TABLE disquerypage ALTER COLUMN MerchandiseSubCat VARCHAR(37)')
		EXEC('ALTER TABLE disquerypage ALTER COLUMN Category VARCHAR(37)')

		--SkuDescription3 Logic
		EXEC('ALTER TABLE disquerypage ADD SkuDescription3 VARCHAR(37)')
		IF EXISTS(SELECT * FROM ConversionControl.dbo.ConversionModel WHERE DatabaseCategory = @categorycode)
		BEGIN
			SET @SQL = 'UPDATE disquerypage SET SkuDescription3 = RTRIM(M.SkuDescription3) '
			SET @SQL = @SQL + ' FROM Disquerypage D JOIN ConversionControl.dbo.ConversionModel M '
			SET @SQL = @SQL + ' ON D.Category = M.Category AND D.Brand = M.Brand AND D.Comments1 = M.SkuDescription1 '
			EXEC(@SQL)
		END
		--SkuDescription2 Logic

		--ItemID : 6360
		IF @categorycode = 'has' 
		BEGIN
			SET @SQL = 'UPDATE Disquerypage SET Manufacturer = Mfr.Manufacturer '
			SET @SQL = @SQL + ' FROM Disquerypage D '
			SET @SQL = @SQL + 'INNER JOIN hasmfrupdate Mfr '
			SET @SQL = @SQL + ' ON D.Brand = Mfr.Brand AND D.Category=Mfr.Category'
			EXEC(@SQL)

			SET @SQL = 'UPDATE Disquerypage SET Manufacturer = ''Z-Unassigned'' '
			SET @SQL = @SQL + ' WHERE Category + ''~'' + Brand NOT IN(SELECT Category + ''~'' + Brand FROM hasmfrupdate) '
			EXEC(@SQL)

			--Item ID: 9082 
			EXEC('ALTER TABLE disquerypage ADD ProductTerritory VARCHAR(37)')

			SET @SQL = 'UPDATE Disquerypage SET ProductTerritory = Mfr.ProductTerritory '
			SET @SQL = @SQL + ' FROM Disquerypage D '
			SET @SQL = @SQL + 'INNER JOIN hasmfrupdate Mfr '
			SET @SQL = @SQL + ' ON D.Brand = Mfr.Brand AND D.Category=Mfr.Category'
			EXEC(@SQL)

			SET @SQL = 'UPDATE Disquerypage SET ProductTerritory = ''Z-Unassigned'' '
			SET @SQL = @SQL + ' WHERE Category + ''~'' + Brand NOT IN(SELECT Category + ''~'' + Brand FROM hasmfrupdate) '
			EXEC(@SQL)
			--Item ID: 9082
		END
		--ItemID : 6360

		--ItemId : 7553 BOS - Translation requested for 10.8V items 
		IF @categorycode = 'bos'
		BEGIN
			SET @SQL = 'UPDATE Disquerypage SET Category = ''CORDLESS DRILL-12.0v'', SubCatId = ''Y2M'' '
			SET @SQL = @SQL + ' WHERE Category = ''CORDLESS - OTHER'' AND Comments1 LIKE ''%10.8%'' '
			EXEC(@SQL)
		END
		--ItemId : 7553 BOS - Translation requested for 10.8V items 

		--ItemID : 7074
		IF EXISTS(SELECT * FROM ConversionControl..CategoryUpdate WHERE DatabaseCategory = @categorycode)
		BEGIN
			SET @SQL = 'INSERT INTO ConversionControl..CategoryUpdate(DatabaseCategory, RealCategory, RealBrand, Comments1, 
						MerchandiseSubCat, Category, SubCatId, CatId) '
			SET @SQL = @SQL + 'SELECT ''' + @categorycode + ''', D.Category, D.Brand, D.Comments1, ''Z - Needs Review'',
						''Z - Needs Review'', ''ZZS'', ''ZZC'' 
						FROM Disquerypage D LEFT OUTER JOIN 
						(SELECT * FROM ConversionControl..CategoryUpdate WHERE DatabaseCategory = ''' + @categorycode + ''') C  
						ON D.Category = C.RealCategory AND D.Brand = C.RealBrand AND D.Comments1 = C.Comments1 
						WHERE C.DatabaseCategory IS NULL'
			EXEC(@SQL)

			SET @SQL = 'UPDATE Disquerypage SET MerchandiseSubCat = C.MerchandiseSubCat, Category = C.Category, CatId = C.CatId, 
					SubCatId = C.SubCatId FROM Disquerypage D JOIN 
					(SELECT * FROM ConversionControl..CategoryUpdate WHERE DatabaseCategory = ''' + @categorycode + ''') C 
					ON D.Category = C.RealCategory AND D.Brand = C.RealBrand AND D.Comments1 = C.Comments1 '
			EXEC(@SQL)
			/*
			SET @SQL = 'UPDATE Disquerypage SET MerchandiseSubCat = ISNULL(C.MerchandiseSubCat,''Z - Needs Review''), 
							Category = ISNULL(C.Category,''Z - Needs Review''), 
							CatId = ISNULL(C.CatId,''ZZC''), 
							SubCatId = ISNULL(C.SubCatId,''ZZS'')'
			SET @SQL = @SQL + ' FROM Disquerypage D '
			SET @SQL = @SQL + ' LEFT OUTER JOIN ConversionControl..CategoryUpdate C '
			SET @SQL = @SQL + ' ON D.Category = C.RealCategory AND D.Brand = C.RealBrand AND D.Comments1 = C.Comments1'
			EXEC(@SQL)	
			*/	
		END
		--ItemID : 7074

		--Apply Minimum Ids.
		SET @SQL = 'UPDATE disquerypage SET GrpId = T.GrpId FROM
		Disquerypage D JOIN (SELECT MerchandiseCategory, MIN(GrpId) GrpId from disquerypage group by MerchandiseCategory) T
		ON D.MerchandiseCategory = T.MerchandiseCategory 
		
		UPDATE disquerypage SET CatId = T.CatId FROM
		Disquerypage D JOIN (SELECT MerchandiseSubCat, MIN(CatId) CatId from disquerypage group by MerchandiseSubCat) T
		ON D.MerchandiseSubCat = T.MerchandiseSubCat 
		
		UPDATE disquerypage SET SubCatID = T.SubCatId FROM
		Disquerypage D JOIN (SELECT Category, MIN(SubcatID) SubCatId from disquerypage group by Category) T
		ON D.Category = T.Category 
		
		UPDATE disquerypage SET BrandId = T.BrandId FROM
		Disquerypage D JOIN (SELECT Brand, MIN(BrandId) BrandId from disquerypage group by Brand) T
		ON D.Brand = T.Brand 
		
		UPDATE disquerypage SET MfrId = T.MfrId FROM
		Disquerypage D JOIN (SELECT Manufacturer, MIN(MfrId) MfrId from disquerypage group by Manufacturer) T
		ON D.Manufacturer = T.Manufacturer '
		EXEC(@SQL)
		--Apply Minimum Ids.
	End
	--PDT : Consolidated Table For 

	--CREATE TEMPPageEvent Table.
	IF @IsRegular = 1
	BEGIN
		exec('IF exists (select * from sysobjects where id = object_id(''[TempPageEvent]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) 
			drop table [TempPageEvent]')
		exec('select trackno, madcode, page, min(pageevent) pageevent,''X'' as tp into TempPageEvent from Tempadlertadviewproads 
			group by trackno, madcode, page')
		exec('create clustered index TempPageEvent_TrackMadcodePagePageEvent on TempPageEvent(trackno,madcode,page) on [Primary]')

		--Report Table Changes.
		exec('CREATE INDEX IDX_TempPageEvent_PageEvent ON TempPageEvent(PageEvent)')
		exec('ALTER TABLE TempPageEvent ADD PageEventId CHAR(3)')
		exec('UPDATE TEMPPAGEEVENT SET PageEventId = M.PageEventId FROM TempPageEvent T 
			JOIN Conversioncontrol.dbo.MasterPromotionValues M ON M.PageEvent = T.PageEvent')
	END
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : PDT Process Functions and Base Tables.',getdate())	

	--CREATE PDT TABLE.
	--DROP TABLE
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create PDT Table',getdate())

	SET @tempsql = ' [FlyerId] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,'
	IF @categorycode = 'ADR'	
		SET @tempsql = @tempsql + ' [Page] INT, '
	ELSE
		SET @tempsql = @tempsql + ' [Page] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [PageDetailID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, '
	SET @tempsql = @tempsql + ' [ThumbImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [NormalImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [FullImagePath] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [ProductImagePath] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [MultipleValues] [bit] NULL, '
	SET @tempsql = @tempsql + ' [DTAdded] [datetime] NULL, '
	SET @tempsql = @tempsql + ' [Retailer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [TaggedCompany] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [Manufacturer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [MerchandiseCategory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '	SET @tempsql = @tempsql + ' [MerchandiseSubCat] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [Category] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [Brand] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [SKUDescription1] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [SKUDescription2] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [SKUDescription3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [SKUType] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, '
	SET @tempsql = @tempsql + ' [SalePrice1] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [SalePrice2] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [RegularPrice1] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [RegularPrice2] [numeric](18, 2) NULL,'
	SET @tempsql = @tempsql + ' [NORPrice] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [RebateAmount] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [LowestRebatePrice] [numeric](18, 2) NULL, '
	SET @tempsql = @tempsql + ' [LowestDiscountPrice] [numeric](18, 2) NULL, '	SET @tempsql = @tempsql + ' [UnitPrice] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [Promotions] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [PageEvent] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [PageTheme] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Features] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [NumberPackage] [int] NULL ,'
	SET @tempsql = @tempsql + ' [Coupon] [numeric](8, 0) NULL ,'
	SET @tempsql = @tempsql + ' [CouponValueD1] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [CouponValueD2] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [CouponValueP1] [int] NULL ,'
	SET @tempsql = @tempsql + ' [CouponValueP2] [int] NULL ,'
	SET @tempsql = @tempsql + ' [OtherDiscountD1] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [OtherDiscountD2] [numeric](18, 2) NULL ,'	SET @tempsql = @tempsql + ' [OtherDiscountD3] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [RequiredQuantity] [int] NULL ,'
	SET @tempsql = @tempsql + ' [MaximumQuantity] [int] NULL ,'
	SET @tempsql = @tempsql + ' [AdSize] [int] NULL ,'
	SET @tempsql = @tempsql + ' [AdCost] [int] NULL ,'
	SET @tempsql = @tempsql + ' [Illustrated] [numeric](8, 0) NULL ,'
	SET @tempsql = @tempsql + ' [Color] [numeric](8, 0) NULL ,'
	SET @tempsql = @tempsql + ' [NoOfColors] [int] NULL ,'
	SET @tempsql = @tempsql + ' [SaleStDt] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [SaleEndDt] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [CouponExpirationDate] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [Optional1] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional2] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional4] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional5] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional6] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'	SET @tempsql = @tempsql + ' [Optional7] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'	SET @tempsql = @tempsql + ' [Optional8] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional9] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional10] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional11] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Optional12] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [Comments] [numeric](8, 0) NULL ,'
	SET @tempsql = @tempsql + ' [ProductTerritory] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [ProductTerritorySubGroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [ProductTerritoryGroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [EnteredClient] [numeric](8, 0) NULL ,'
	SET @tempsql = @tempsql + ' [CouponExpirationDate1] [smalldatetime] NULL ,'	SET @tempsql = @tempsql + ' [CouponExpirationDate2] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [OtherDiscountP1] [int] NULL ,'
	SET @tempsql = @tempsql + ' [OtherDiscountP2] [int] NULL ,'
	SET @tempsql = @tempsql + ' [OtherDiscountP3] [int] NULL ,'
	SET @tempsql = @tempsql + ' [comments1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [comments2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [comments3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [comments4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [topleftx] [int] NULL ,'
	SET @tempsql = @tempsql + ' [toplefty] [int] NULL ,'
	SET @tempsql = @tempsql + ' [bottomrightx] [int] NULL ,'
	SET @tempsql = @tempsql + ' [bottomrighty] [int] NULL ,'
	SET @tempsql = @tempsql + ' [McUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [MscUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [MfrUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [PtUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [PtgUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [PtsgUpdatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [ProdImageCreated] [numeric](8, 0) NULL ,'	SET @tempsql = @tempsql + ' [ProdImageCreatedOn] [smalldatetime] NULL ,'
	SET @tempsql = @tempsql + ' [FullProductImageSize] [numeric](18, 0) NULL ,'
	SET @tempsql = @tempsql + ' [ThumbnailProductImageSize] [numeric](18, 0) NULL ,'
	SET @tempsql = @tempsql + ' [HighDOff] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [HighRebateAmount] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [GiftCardD] [numeric](18, 2) NULL ,'
	SET @tempsql = @tempsql + ' [BuyNumber] [int] NULL ,'
	SET @tempsql = @tempsql + ' [GetNumber] [int] NULL ,'
	SET @tempsql = @tempsql + ' [HighPOff] [int] NULL ,'
	SET @tempsql = @tempsql + ' [ExtraPOff] [int] NULL ,'
	SET @tempsql = @tempsql + ' [RequiredNumberOffer] [int] NULL ,'
	SET @tempsql = @tempsql + ' [OfferDes] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'

	SET @tempsql = @tempsql + ' [FinansingInterestRate] [numeric](9, 2) NULL ,'
	SET @tempsql = @tempsql + ' [FinansingMinPurchase] [numeric](9, 2) NULL ,'
	SET @tempsql = @tempsql + ' [FinansingTermLength] [int] NULL ,'
	SET @tempsql = @tempsql + ' [FinansingTermLengthType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,'
	SET @tempsql = @tempsql + ' [HiGiftCard] [numeric](9, 2) NULL ,'

	SET @tempsql = @tempsql + ' [TrackNo] [int] NOT NULL ,'
	SET @tempsql = @tempsql + ' [MadCode] [int] NULL ,'
	SET @tempsql = @tempsql + ' [AdlertPage] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL '	
	SET @tempsql = @tempsql + ' ,[CatID] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL '
	SET @tempsql = @tempsql + ' ,[GrpID] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL '
	SET @tempsql = @tempsql + ' ,[SubCatID] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL '
	SET @tempsql = @tempsql + ' ,[BrandId] [int] NULL '
	SET @tempsql = @tempsql + ' ,[MfrId] [int] NULL '
	SET @tempsql = @tempsql + ' ,[AdNoteId] [char] (3) NULL '
	SET @tempsql = @tempsql + ' ,[BrandFamilyId] [int] NULL '
	SET @tempsql = @tempsql + ' ,[BrandFamilyDescrip] [varchar] (50) NULL '
	SET @tempsql = @tempsql + ' ,[CropHeight] [decimal](5, 2) NULL '
	SET @tempsql = @tempsql + ' ,[CropWidth] [decimal](5, 2) NULL '
	SET @tempsql = @tempsql + ' ,[ImageProductCount] [int] NULL'


	--if @IsAdSpace = 1 
	--begin
		SET @tempsql = @tempsql + ', [Adwidth] [Decimal] (4,2) '
		SET @tempsql = @tempsql + ', [AdHeight] [Decimal] (4,2) '
		SET @tempsql = @tempsql + ', [AdSpace] [Decimal] (9,2) '
	--end
	if @ISADRSite = 1
	begin
		SET @tempsql = @tempsql + ', [EnteredAt] [Varchar] (10) '
		SET @tempsql = @tempsql + ', [EnteredBy] [Varchar] (37) '
		SET @tempsql = @tempsql + ', [EnteredDate] [SmallDateTime]  '
		SET @tempsql = @tempsql + ', [QcedBy] [Varchar] (37) '
		SET @tempsql = @tempsql + ', [QcedDate] [SmallDateTime] '
	end

	--ItemID : 7064
	SET @tempsql = @tempsql + ', [ReleaseStatus] [VARCHAR] (37) NULL '
	--ItemID : 7064

	if @ismergecategory = 0 and @IsRegular = 1
	begin		
		exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @PDTTableName + ''' and XType = ''U'') 
			drop table ' + @ConversionDataDb + '.dbo.' + @PDTTableName)

		SET @sql = ' CREATE TABLE ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' ('
		SET @sql = @sql + @tempsql + ' ) ON [PRIMARY]'
		exec(@sql)
	end

	if @ismergecategory_catonly = 0	and @IsCatOnly = 1
	begin
		exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @PDTTableName_catonly + ''' and XType = ''U'') 
			drop table ' + @ConversionDataDb + '.dbo.' + @PDTTableName_catonly)

		SET @catsql = ' CREATE TABLE ' + @ConversionDataDb + '.dbo.' + @PDTTableName_catonly + ' ('
		SET @catsql = @catsql + @tempsql 
		SET @catsql = @catsql + ' ) ON [PRIMARY]'
		exec(@catsql)
	end

	--INSERT RECORDS.
	--Start : Changes - Changes a.TrackNo
	SET @SelectTrackNo = 'a.TrackNo'
	IF @isprintpcsmasters = 'True'
	Begin
		SET @SelectTrackNo = 'P.NTrackNo'
	End
	-- ItemID: 5050 - Point 2	EXECUTE('update ads set rebamt = null where RebAmt < 0 ')

	IF @IsRegular = 1
	BEGIN
		SET @sql = 'insert into ' + @ConversionDataDb + '.dbo.' + @PDTTableName + '(Flyerid, Page, PageDetailID, MultipleValues, DTAdded, TaggedCompany, '
		SET @sql = @sql + 'Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category,'
		SET @sql = @sql + 'brand,  SKUDescription2, SalePrice2, RegularPrice2 '
		SET @sql = @sql + ', PageEvent,'
		SET @sql = @sql + 'OtherDiscountD2, Optional1, Comments1, SKUDescription1,SKUDescription3, '
		SET @sql = @sql + 'Features, TrackNo, Madcode, AdlertPage, CouponValueD2, '
		SET @sql = @sql + 'CouponValueP1, '
		SET @sql = @sql + 'NumberPackage, HighDOff, '
		SET @sql = @sql + 'HighRebateAmount, GiftCardD,'
		SET @sql = @sql + 'BuyNumber, GetNumber,'
		SET @sql = @sql + 'HighPOff, ExtraPOff,'
		SET @sql = @sql + 'RequiredNumberOffer, OfferDes'

		SET @sql = @sql + ',FinansingInterestRate, FinansingMinPurchase, FinansingTermLength, FinansingTermLengthType, HiGiftCard'

		SET @SQL = @SQL + ', RebateAmount'
		SET @SQL = @SQL + ', SalePrice1'
		SET @SQL = @SQL + ', UnitPrice'
		SET @SQL = @SQL + ', RequiredQuantity'
		SET @SQL = @SQL + ', RegularPrice1'
		SET @SQL = @SQL + ', NORPrice'

		--if @IsAdSpace = 1	
		--begin
			SET @sql = @sql + ', Adwidth, AdHeight,AdSpace'
		--end
		SET @sql = @sql + ', CatID, GrpID, SubCatId, BrandId, MfrId, AdNoteId, BrandFamilyId,BrandFamilyDescrip,CropHeight,CropWidth,ImageProductCount'
		SET @sql = @sql + ', topleftx, toplefty, bottomrightx, bottomrighty, SaleStDt'

		if @ISADRSite = 1
		begin
			SET @sql = @sql + ', [EnteredAt] '
			SET @sql = @sql + ', [EnteredBy]'
			SET @sql = @sql + ', [EnteredDate]'
			SET @sql = @sql + ', [QcedBy]'
			SET @sql = @sql + ', [QcedDate] '
		end

		--ItemID : 7064
		SET @sql = @sql + ', [ReleaseStatus] '
		--ItemID : 7064

		--Item ID: 9082
		IF @categorycode = 'has' 
		BEGIN
			SET @sql = @sql + ', [ProductTerritory] '		
		END
		--Item ID: 9082
		
		SET @sql = @sql + ')'

		SET @sql = @sql + ' select P.Flyerid,Pag.PageNo as Page, pid.PageDetailId as PageDetailID, case when mpvcount > 1 then 1 else 0 end as MultipleValues, a.modtime as DTAdded, 
					CASE WHEN Grade = ''D'' THEN ''C'' WHEN RTRIM(Pag.features) = ''Front Page'' OR RTRIM(Pag.features) = ''Back Page'' THEN ''A''
					ELSE ''B'' END AS TaggedCompany,'
		SET @sql = @sql + 'd.Manufacturer, d.MerchandiseCategory, d.MerchandiseSubCat, d.Category,'
		SET @sql = @sql + 'd.Brand, d.SKUDescription2, case when HiPrice = 0 then NULL ELSE HiPrice end as SalePrice2, 
					case when HiRegPrice = 0 then NULL ELSE HiRegPrice end as RegularPrice2 '
		SET @sql = @sql + ', RTRIM(tpe.PageEvent),'
		SET @sql = @sql + 'case when CoupAmt is null then b.OtherDiscountD2 else case when convert(varchar,CoupAmt) = ''0.00'' Then Null Else convert(varchar,CoupAmt) End end as OtherDiscountD2, a.Madcode as Optional1, d.Comments1, d.Comments1 as SKUDescription1, d.SKUDescription3 AS SKUDescription3, '
		SET @sql = @sql + 'CASE WHEN RTRIM(P.Media) = ''ROP'' THEN RTRIM(P.MEDIA) ELSE RTRIM(Pag.features) END AS Features,P.NTrackNo as TrackNo, a.Madcode, a.Page as AdlertPage, b.CouponValueD2, '
		SET @sql = @sql + 'b.CouponValueP1, '
		SET @sql = @sql + 'b.NumberPackage,b.HighDOff, '
		SET @sql = @sql + 'b.HighRebateAmount,b.GiftCardD, '
		SET @sql = @sql + 'b.BuyNumber, b.GetNumber, '
		SET @sql = @sql + 'b.HighPOff,b.ExtraPOff, '
		SET @sql = @sql + 'b.RequiredNumberOffer, b.OfferDes '

		SET @sql = @sql + ',b.FinansingInterestRate, b.FinansingMinPurchase, b.FinansingTermLength, b.FinansingTermLengthType, b.HiGiftCard'

		SET @SQL = @SQL + ', case when 
					case when RebAmt is null then b.RebateAmount else convert(varchar,RebAmt) end 
					>
					case when LoPrice = 0 then NULL 					when isnull(cast(b.requiredquantity as numeric(18,2)), 0) > 0 then cast(b.requiredquantity as numeric(18,2)) * cast(LoPrice as numeric(18,2)) 
					ELSE cast(LoPrice as numeric(18,2)) end
				   Then NULL
				   Else
					case when RebAmt is null then b.RebateAmount else convert(varchar,RebAmt) end 
				   End			
				as RebateAmount'
		SET @SQL = @SQL + ', case when LoPrice = 0 then NULL 
					when isnull(cast(b.requiredquantity as numeric(18,2)), 0) > 0 then cast(b.requiredquantity as numeric(18,2)) * cast(LoPrice as numeric(18,2)) 
					ELSE cast(LoPrice as numeric(18,2)) end as SalePrice1'
		SET @SQL = @SQL + ', case when LoPrice = 0 then NULL ELSE cast(LoPrice as numeric(18,2)) end as UnitPrice'
		SET @SQL = @SQL + ', b.RequiredQuantity'
		SET @SQL = @SQL + ', case when LoRegPrice = 0 then NULL When isnull(cast(b.requiredquantity as numeric(18,2)), 0) > 0 Then cast(b.requiredquantity as numeric(18,2)) * cast(LoRegPrice as numeric(18,2)) Else LoRegPrice END AS RegularPrice1 '
		SET @SQL = @SQL + ', Case when case 
						when LoPrice = 0 then NULL 
						when isnull(cast(b.requiredquantity as numeric(18,2)), 0) > 0 
							then cast(b.requiredquantity as numeric(18,2)) * cast(LoPrice as numeric(18,2)) 
						ELSE cast(LoPrice as numeric(18,2)) end  
				    - case when cast(RebAmt as numeric(18,2)) is null then cast(b.RebateAmount as numeric(18,2)) 
						else cast(RebAmt as numeric(18,2)) end 
					> 0 Then case 
						when LoPrice = 0 then NULL 
						when isnull(cast(b.requiredquantity as numeric(18,2)), 0) > 0 
							then cast(b.requiredquantity as numeric(18,2)) * cast(LoPrice as numeric(18,2)) 
						ELSE cast(LoPrice as numeric(18,2)) end  				    - case when cast(RebAmt as numeric(18,2)) is null then cast(b.RebateAmount as numeric(18,2)) 
						else cast(RebAmt as numeric(18,2)) end 
				   Else NULL End
				As NorPrice'

		--if @IsAdSpace = 1	
		--begin
			SET @sql = @sql + ',S.Width as Adwidth, S.Height as AdHeight, S.Space as AdSpace '
		--end
		SET @sql = @sql + ', d.CatID, d.GrpID, d.SubCatId, d.BrandId, d.MfrId, tpe.PageEventId,BrandFamilyId,
					BrandFamilyDescrip,CropHeight,CropWidth,ImageProductCount'
		SET @sql = @sql + ', a.X, a.Y, a.X2, a.Y2, d.StartDt '

		if @ISADRSite = 1
		begin
			SET @sql = @sql + ', Case When A.SessID = ''-12345'' Then ''JA'' Else ''CHI'' End '
			SET @sql = @sql + ', IBEEnteredBy'
			SET @sql = @sql + ', IBEEnteredDate'
			SET @sql = @sql + ', IBEQcedBy'
			SET @sql = @sql + ', IBEQcedDate '
		end

		--ItemID : 7064
		IF EXISTS(SELECT * FROM ConversionControl..ReleaseStatusSql WHERE DatabaseCategory = @categorycode)
		BEGIN
			SELECT @ReleaseStatusSql = Sql FROM ConversionControl..ReleaseStatusSql WHERE DatabaseCategory = @categorycode
			SET @sql = @sql + ', ' + @ReleaseStatusSql
		END
		ELSE
			SET @sql = @sql + ', NULL '	
		--ItemID : 7064

		--Item ID: 9082
		IF @categorycode = 'has' 
		BEGIN
			SET @sql = @sql + ', d.ProductTerritory '		
		END
		--Item ID: 9082


		SET @sql = @sql + ' from ads a left outer join TempPriceValues b on a.Trackno = b.trackno and a.madcode = b.madcode and a.page = b.page'
		SET @sql = @sql + ' left outer join TempPageEvent tpe on a.Trackno = tpe.trackno and a.madcode = tpe.madcode and a.page = tpe.page '

		--if @IsAdSpace = 1	
		--begin
			SET @sql = @sql + ' left outer join Sizes S on a.SizeID = S.SizeID '	
		--end

		SET @sql = @sql + ' join ' + @tableviewname + ' P on A.Trackno = P.Trackno '		SET @sql = @sql + ' join conversioncontrol..PDTID pid ON P.Ntrackno = pid.trackno and a.madcode = pid.madcode and a.page = pid.page '
		SET @sql = @sql + ' join disquerypage d on d.madcode = a.madcode '
		SET @sql = @sql + ' join ' + @ConversionDataDb + '.dbo.' + @PAGETableName + ' Pag ON Pag.Trackno = P.NTrackNo and Pag.Page = a.Page ' 

		if @ISADRSite = 1
		begin
			SET @sql = @sql + ' left outer join PDTInfo on a.PageDetailID = PDTInfo.PageDetailID '				
		End

		SET @sql = @sql + @pdtwhereclause + ' option (maxdop 1)'
		exec(@sql)

-- -- 		SET @SQL = 'Update conversioncontrol..' + @PDTTableName + ' SET RebateAmount = NULL Where RebateAmount > SalePrice1'
-- -- 		exec(@sql)		
	End

	IF @IsCatOnly = 1
	Begin
		SET @sql = 'insert into ' + @ConversionDataDb + '.dbo.' + @PDTTableName_catonly + ' (Flyerid, Page, PageDetailID, MultipleValues, DTAdded, '
		SET @sql = @sql + ' MerchandiseSubCat, Category,Features,CouponValueP1, TrackNo, AdlertPage,CatID,GrpId)'
		SET @sql = @sql + ' select P.Flyerid as Flyerid,Pag.PageNo as Page, pid.PageDetailId as PageDetailID, 0 as MultipleValues, getdate() as DTAdded,'
		SET @sql = @sql + ' g.Descrip as MerchandiseSubCat, c.Descrip as Category,'
		SET @sql = @sql + ' CASE WHEN P.Media = ''ROP'' THEN P.MEDIA ELSE Pag.features END AS Features,a.pct as CouponValueP1, P.NTrackNo, '
		SET @sql = @sql + ' a.Page as AdlertPage, a.CatID, g.GrpId '
		SET @sql = @sql + ' from pgcats a '
		SET @sql = @sql + ' join ' + @tableviewname + ' P on A.Trackno = P.Trackno '

		SET @sql = @sql + ' join conversioncontrol..PDTID_CatOnly pid ON P.Ntrackno = pid.trackno and a.catid = pid.catid and a.page = pid.page '
		SET @sql = @sql + ' join ' + @ConversionDataDb + '.dbo.' + @PAGETableName + ' Pag ON Pag.Trackno = P.NTrackNo and Pag.Page = a.Page ' 
		SET @sql = @sql + ' join conversioncontrol..cats c ON a.catid = c.catid ' 
		SET @sql = @sql + ' join conversioncontrol..grps g ON g.grpid = c.grpid ' 
		SET @sql = @sql + @pdtwhereclause_catonly
-- -- 		print @sql
		exec(@sql)
	end
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create PDT Table',getdate())	

	--Item	::	10222
	IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @categorycode)
	BEGIN
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Brand Based Updates',getdate())
			
		SET @sql  = 'UPDATE ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
					MerchandiseSubCat = T.MerchandiseSubCat 
					FROM ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
					ON PDT.MerchandiseCategory = T.MerchandiseCategory AND PDT.Brand = T.RealBrand
					WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
		EXEC(@sql)
	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,@sql,getdate())			

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Brand Based Updates',getdate())			
	END
	--Item	::	10222

	--Item	::	10632
	IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @categorycode)
	BEGIN
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : PT Based Updates',getdate())
			
		SET @sql  = 'UPDATE ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
					ProductTerritory = T.ProductTerritory 
					FROM ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
					ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand
					WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
		EXEC(@sql)
	
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,@sql,getdate())			

		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : PT Based Updates',getdate())			
	END
	--Item	::	10632


	--Item	::	11272
	IF @categorycode = 'TFN'
	BEGIN
		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @categorycode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : TFN Updates',getdate())

			Declare @vchrComments1 VARCHAR(4000)
			Declare @vchrSQL VARCHAR(8000)
			Declare @vchrCategory VARCHAR(255)
			Declare @vchrRenamedCategory VARCHAR(255)
			Set @vchrComments1 = ''
			Set @vchrSQL = ''

			DECLARE curCat cursor  
			FOR SELECT DISTINCT Category, RenamedCategory FROM ConversionControl..MCUpdate where DatabaseCategory='TFN' and RealBrand = ''
			OPEN curCat
			FETCH NEXT FROM curCat INTO @vchrCategory, @vchrRenamedCategory
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @vchrComments1 = ''
				SELECT @vchrComments1 = @vchrComments1 + ' (COMMENTS1 LIKE ' + Comments1 + ') OR ' FROM ConversionControl..MCUpdate 
				WHERE DatabaseCategory='TFN' AND RealBrand = '' AND Category = @vchrCategory
				SET @vchrcomments1 = '(Category = ''' + @vchrCategory + ''' AND (' + LEFT(@vchrComments1, len(@vchrComments1)-2) + '))'
				SET @vchrSQL = @vchrSQL + 'UPDATE ' + @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET Category = ''' + @vchrRenamedCategory + ''' WHERE ' + @vchrComments1 + ' OPTION (MAXDOP 1);'
			FETCH NEXT FROM curCat INTO @vchrCategory, @vchrRenamedCategory
			END
			CLOSE curCat
			DEALLOCATE curCat
			EXEC(@vchrSQL)

			SET @sql  = 'UPDATE '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
			Category = T.RenamedCategory
			FROM '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
			ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand
			WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
			Exec(@sql)
 
			SET @sql  = ' UPDATE '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
			Category = T.RenamedCategory
			FROM '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
			ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand AND PDT.Comments1 = T.Comments1
			WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
			Exec(@sql)				

			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : TFN Updates',getdate())			
		END
	END
	--Item	::	11272

	--Item	::	11464
	IF @categorycode = 'sco'
	BEGIN
		IF EXISTS(SELECT * FROM ConversionControl..MCUpdate WHERE DatabaseCategory = @categorycode)
		BEGIN
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : SCO Updates',getdate())

			SET @sql  = 'UPDATE '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
			skudescription3 = T.ProductTerritory  
			FROM '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
			ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand AND PDT.Comments1 = T.Comments1
			WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
			Exec(@sql)
 
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : SCO Updates',getdate())			
		END
	END
	--Item	::	11464


	--Start : Create MPV Table.
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create MPV Table',getdate())	
	if @ismergecategory = 0 and @IsRegular = 1
	begin
	 	exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @MPVTableName + ''' and XType = ''U'') 
			drop table ' + @ConversionDataDb + '.dbo.' + @MPVTableName)
	
		SET @sql = ' CREATE TABLE ' + @ConversionDataDb + '.dbo.' + @MPVTableName + '('
		SET @sql = @sql + ' [PageDetailId] [varchar] (11)  not null , '
		SET @sql = @sql + ' [FieldName] [varchar] (50) not null  , '
		SET @sql = @sql + ' [FieldValue] [varchar] (50) not null,  '
		SET @sql = @sql + ' [AdNoteId] [char] (3) null  '
		SET @sql = @sql + ' ) ON [PRIMARY] '
		exec(@sql) 
	end

	--Insert Records into MPV Table.
	IF @IsRegular = 1
	BEGIN
		SET @sql = 'Insert into ' + @ConversionDataDb + '.dbo.' + @MPVTableName 
		SET @sql = @sql + ' select distinct pid.PageDetailID as PageDetailId, ''PageEvent'' as FieldName, x.pageevent as FieldValue,  '
		SET @sql = @sql + ' M.PageEventId AS AdNoteId from TempADlertAdviewProAds x join ' + @tableviewname + ' y on x.trackno = y.trackno '
		SET @sql = @sql + ' left outer  join TempPageEvent mpv1 on '
		SET @sql = @sql + ' x.trackno = mpv1.trackno '
		SET @sql = @sql + ' and x.madcode = mpv1.madcode '
		SET @sql = @sql + ' and x.page = mpv1.page '
		SET @sql = @sql + ' and x.pageevent = mpv1.pageevent '
		SET @sql = @sql + ' join conversioncontrol..PDTID pid ON y.Ntrackno = pid.trackno 
					and x.madcode = pid.madcode and x.page = pid.page 
				     join conversioncontrol..MasterPromotionValues M ON X.PageEvent = M.PageEvent ' 
		SET @sql = @sql + ' where mpv1.tp is null ' + @mpvwhereclause + ' option (maxdop 1)'			
 		--print @sql
		exec(@sql)
	END
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create MPV Table',getdate())	
	--End : Create MPV Table.

	---------------------------START :: CREATE PGCATS TABLE.-------------------------
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Start : Create PgCats Table',getdate())	
	if @ismergecategory = 0 and @IsRegular = 1
	begin
	 	exec('IF exists (select * from ' + @ConversionDataDb + '.dbo.sysobjects where name = ''' + @PGCatsTableName + ''' and XType = ''U'') 
			drop table ' + @ConversionDataDb + '.dbo.' + @PGCatsTableName)

		SET @sql = 'CREATE TABLE ' + @ConversionDataDb + '.dbo.' + @PGCatsTableName + ' (
			[TrackNo] [int] NOT NULL ,
			[Page] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
			[CatId] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
			[Pct] [tinyint] NOT NULL ,
			[SessId] [int] NOT NULL ,
			[ModTime] [datetime] NULL,
			[CatDescrip] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL , 
			[GrpId] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
			[GrpDescrip] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
		) ON [PRIMARY]'
		exec(@sql)
	end

	if @IsRegular = 1 and @IsPgCats = 1	
	begin
		if exists(select * from sysobjects where xtype = 'U' and [name] = 'PgCats')
		begin
			set @sql = 'SELECT DISTINCT MerchandiseCategory, MerchandiseSubCat, GrpId, CatId Into DisQueryPage1 from disquerypage'
			Exec(@SQL)
			SET @SQL = 'CREATE CLUSTERED INDEX IDX_DISQUERYPAGE1 ON DISQUERYPAGE1(GRPID, CATID)'			Exec(@SQL)
			SET @SQL = ''
			SET @sql = 'Insert into ' + @ConversionDataDb + '.dbo.' + @PGCatsTableName 
			set @sql = @sql + ' SELECT distinct b.NTrackNo,Pc.Page,Pc.CatId,Pc.Pct,Pc.SessId,Pc.ModTime,
					ISNULL(D.MerchandiseSubCat,C.Descrip)As CatDescrip,G.GrpId,ISNULL(D.MerchandiseCategory,G.Descrip) AS GrpDescrip 
					FROM PgCats As Pc JOIN conversioncontrol..Cats C on Pc.CatId = C.CatId
					JOIN conversioncontrol..Grps G ON C.GrpId = G.GrpId 
					JOIN ' + @tableviewname + ' b ON (Pc.Trackno = b.trackno)
					LEFT OUTER JOIN DisQueryPage1 D
					ON G.GrpId = D.GrpId AND C.CatId = D.CatId option (maxdop 1)'
			exec(@sql)				
		end
	end
	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'End : Create PgCats Table',getdate())	

	---------------------------END :: CREATE PGCATS TABLE.-------------------------

	INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@categorycode,'Conversion Completed',getdate())		

End















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

