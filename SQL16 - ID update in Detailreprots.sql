Declare @RowCount Tinyint
			,@columnname Varchar(50)
			,@IDsql nvarchar(1000)
			,@Exist int = 0,
			@PDTTableName varchar(50),
			@adlertdatabase varchar(50),
			@ConversionDataDb varchar(50)
			
	Set @ConversionDataDb='SQL16'
     Set @adlertdatabase='tempdb'
      Set @PDTTableName='seaadl50DetailReports'
      
      
     
	EXEC('IF  EXISTS (SELECT * FROM '+@adlertdatabase+'.dbo.sysobjects WHERE  name = ''TempIDDBColumns'' AND type in (N''U'')) BEGIN DROP TABLE '+@adlertdatabase+'.dbo.[TempIDDBColumns] END')
	EXEC('SELECT CategoryValue,ROW_NUMBER() OVER (order By ID)  as RID into '+@adlertdatabase+'.dbo.TempIDDBColumns  From '+@ConversionDataDb+'.dbo.tbl_LookUp WHERE CategoryType=''IDDB Column For Detail''')
	SET @IDsql=N'Select @RowCount = COUNT(1) From '+@adlertdatabase+'.dbo.TempIDDBColumns'
	Execute sp_executesql @IDsql,N'@RowCount int output',@RowCount output
	WHILE @RowCount > 0
	BEGIN
	SET @IDsql='SELECT @columnname = CategoryValue FROM '+@adlertdatabase+'.dbo.TempIDDBColumns WHERE RID=@RowCount'
	Execute sp_executesql @IDsql,N'@RowCount int,@columnname varchar(100) output',@RowCount,@columnname output
	SET @IDsql=N'Select @Exist = COUNT(1) From '+@ConversionDataDb+'.dbo.' + @PDTTableName + ' Where ISNULL('+@columnname+','''')<>'''''
	Execute sp_executesql @IDsql,N'@Exist int output',@Exist output
	IF @Exist > 0
	BEGIN
	--INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values('' + @categorycode + '','START: mt_proc_Create_ID_Update - ' + @columnname ,getdate())
	--dynamic stored procedure change - nishant
	Exec('Exec '+@ConversionDataDb+'.dbo.mt_proc_Create_ID_Update '+@PDTTableName+', '''+@columnname+'''')
	--INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values('' + @categorycode + '','END: mt_proc_Create_ID_Update - ' + @columnname ,getdate())
	END
	SET @RowCount=@RowCount-1
	END	