SET NOCOUNT ON
Declare @cCategoryCode varchar(50)
Declare @cClientServer varchar(100)
Declare @cIsPdt bit
Declare @lCategoryCwmTable varchar(100)
Declare @lCategoryPdtTable varchar(100)
Declare @lCategoryMpvTable varchar(100)
Declare @lCategoryCwmRecordCount int
Declare @lCategoryPdtRecordCount int
Declare @lCategoryMpvRecordCount int
Declare @lSql varchar(1000)
Declare @CategoryCodeTable varchar(255)
Declare @ClientTable VARCHAR(50)
Declare @lAdviewMainCount int
Declare @lMasterPDTCount int
Declare @lMasterMPVCount int

SELECT @ClientTable = dbo.mtfunc_GetDatabasePrefix('Sub') + 'ClientProfile'

EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT

SET @lCategoryCwmTable = ''
SET @lCategoryPdtTable = ''
SET @lCategoryMpvTable = ''
SET @lSql = ''

IF Cursor_Status('variable', 'DisplayValue') >= 0
BEGIN
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
END

TRUNCATE TABLE MT2AClientRecordCounts

--DECLARE DisplayValue CURSOR FOR
--	SELECT Category, ClientServer, isPdt FROM CategoryCode ORDER BY Category
EXECUTE('DECLARE DisplayValue CURSOR FOR 
	SELECT Category, ''MT2ASQL07'' AS ClientServer, IsPDT FROM ' + @CategoryCodeTable + ' WHERE ISNULL(IsPdt,0) = 1 AND  
	(isadlert IS NULL OR isadlert = 0) AND ClientId IN(SELECT ClientId from ' + @ClientTable + ' WHERE IsActiveClient = 1)  
	ORDER BY Category')

OPEN DisplayValue
FETCH NEXT FROM DisplayValue INTO @cCategoryCode, @cClientServer, @cIsPdt
WHILE @@Fetch_Status=0
BEGIN		
	SET @lCategoryCwmTable = ''
	SET @lCategoryPdtTable = ''
	SET @lCategoryMpvTable = ''
	SET @lCategoryCwmRecordCount = 0
	SET @lCategoryPdtRecordCount = 0
	SET @lCategoryMpvRecordCount = 0
		
	EXECUTE GetTableName @cCategoryCode, 3, @lCategoryCwmTable OUTPUT		
	/*
	START : PDT
	--Fetch name of PDT table from tablenames for the CategoryCode.
	--Check whether Table exists if yes get the count of records from it.
	*/
	EXECUTE GetTableName @cCategoryCode, 22, @lCategoryPdtTable OUTPUT
	IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(@lCategoryPdtTable) AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	BEGIN
		SET @lSql = 'SELECT COUNT(PageDetailId) FROM ' + @lCategoryPdtTable + ' PDT JOIN ' + @lCategoryCwmTable + ' CWM ON CWM.FLYERID=PDT.FLYERID AND CWM.ADDATE BETWEEN ''11/1/2008'' AND ''10/31/2009'''
		--print @lSql
		EXECUTE sp_exec_sql_return_numeric @lSql,@lCategoryPdtRecordCount OUTPUT
	END
	/* END : PDT */

	
	--PRINT @cCategoryCode + ' >>> ' + @lCategoryCwmTable + ' = ' + CAST(@lCategoryCwmRecordCount AS VARCHAR(50)) + ', ' + @lCategoryPdtTable + ' = ' + CAST(@lCategoryPdtRecordCount AS VARCHAR(50)) + ', ' + @lCategoryMpvTable + ' = ' + CAST(@lCategoryMpvRecordCount AS VARCHAR(50))

	--Insert into [MT2SQL04\CONNECTIONS1].[connection].adview.ClientRecordCounts
	INSERT INTO MT2AClientRecordCounts VALUES(@cCategoryCode, @lCategoryCwmRecordCount, @lCategoryPdtRecordCount, @lCategoryMpvRecordCount, @cClientServer)

	FETCH NEXT FROM DisplayValue INTO @cCategoryCode, @cClientServer, @cIsPdt
END 
CLOSE DisplayValue
DEALLOCATE DisplayValue

SET NOCOUNT OFF


