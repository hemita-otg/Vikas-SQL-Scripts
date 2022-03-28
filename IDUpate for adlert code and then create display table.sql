--1)
--create tbl_lookup in Tempdb
	IF  EXISTS (SELECT * FROM sys.sysobjects WHERE name = N'tbl_lookup' AND Type='U')
		Exec SP_Rename 'tbl_lookup','New_tbl_lookup';
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'tbl_lookup')
				DROP SYNONYM [dbo].[tbl_lookup]

			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[MT2ASQL06].[SiteControl].[dbo].[tbl_lookup]
		END
	ELSE
		BEGIN
		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'tbl_lookup')
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[MT2SQL14].[SiteControl].[dbo].[tbl_lookup]
		END

--2)
--5.0 Set IDS
--Change TableName : TarCAN50DetailReports
--Change SQL05
Declare @RowCount Tinyint
			,@columnname Varchar(50)
			,@IDsql nvarchar(1000)
			,@Exist int = 0

	EXEC('IF  EXISTS (SELECT * FROM tempdb.dbo.sysobjects WHERE  name = ''TempIDDBColumns'' AND type in (N''U'')) BEGIN DROP TABLE tempdb.dbo.[TempIDDBColumns] END')
	EXEC('SELECT CategoryValue,ROW_NUMBER() OVER (order By ID)  as RID into tempdb.dbo.TempIDDBColumns  From dbo.tbl_LookUp WHERE CategoryType=''IDDB Column For Detail''')
	SET @IDsql=N'Select @RowCount = COUNT(1) From tempdb.dbo.TempIDDBColumns'
	Execute sp_executesql @IDsql,N'@RowCount int output',@RowCount output
	WHILE @RowCount > 0
	BEGIN
	SET @IDsql='SELECT @columnname = CategoryValue FROM tempdb.dbo.TempIDDBColumns WHERE RID=@RowCount'
	Execute sp_executesql @IDsql,N'@RowCount int,@columnname varchar(100) output',@RowCount,@columnname output
	SET @IDsql=N'Select @Exist = COUNT(1) From SQL05.dbo.TarCAN50DetailReports Where ISNULL('+@columnname+','''')<>'''''
	Execute sp_executesql @IDsql,N'@Exist int output',@Exist output
	IF @Exist > 0
	BEGIN
	
	--dynamic stored procedure change - nishant
	print('Exec SQL05.dbo.mt_proc_Create_ID_Update ''TarCAN50DetailReports'', '''+@columnname+'''')
	
	END
	SET @RowCount=@RowCount-1
	END	


--3) 
--Display table creation for ADlert FV 5

EXEC SQL05.dbo.mt_proc_Create_DisplayTables_AD 'TARCAN50'
