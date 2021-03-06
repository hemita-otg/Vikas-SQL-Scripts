USE [MasterClientCoverage]
GO
/****** Object:  StoredProcedure [dbo].[mt_proc_UpdateMasterMapPagedetailID]    Script Date: 10/2/2014 1:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec CharSearch_InsertMasterMapPDT 'MasterClientCoverage.dbo.TEMPJAPageDetailTable','MasterAdViewData.DBO.MasterMapPagedetailID'
ALTER PROCEDURE [dbo].[mt_proc_UpdateMasterMapPagedetailID] (@SourceTables VARCHAR(max),@DestinationTable VARCHAR(max))
AS
BEGIN
	--DECLARE @tablenames VARCHAR(max) = 'dbo.Test_PDT1,dbo.Test_PDT2'
	DECLARE @tbl_AllPDTID TABLE (PDTChar VARCHAR(20))
	DECLARE @tbl_SinglePDT TABLE (SingleChar CHAR(1))
	DECLARE @Vars VARCHAR(MAX) = '', @cnt INT = 0
	DECLARE @string VARCHAR(max) = 'PageDetailID', @SQL VARCHAR(MAX)

	IF EXISTS (
			SELECT [Name]
			FROM tempdb.dbo.SysObjects
			WHERE xtype = 'U' AND NAME = '#Tbl_AllPDT'
			)
		DROP TABLE tempdb.dbo.#Tbl_AllPDT

	CREATE TABLE #Tbl_AllPDT (PageDetailID VARCHAR(max))
		--**insert all PDTID from tables**
		

	;WITH CTE
	AS (
		SELECT 'Select Distinct PageDetailID from ' + Data AS Query
		FROM dbo.SplitSource(@SourceTables)
		)
	SELECT @Vars = COALESCE(@Vars + CHAR(13), '') + CAST(Query AS VARCHAR(max))
	FROM cte

	--select @vars as main
	INSERT INTO #Tbl_AllPDT
	EXEC (@vars)

	--**insert all distinct alpha character from tables**
	INSERT INTO @tbl_AllPDTID (PDTChar)
	SELECT DISTINCT *
	FROM (
		SELECT [dbo].[RemoveNumericCharacters](PageDetailID) AS PDTChar
		FROM #Tbl_AllPDT
		) x

	--**Split string into charater**
	INSERT INTO @tbl_SinglePDT (SingleChar)
	SELECT DISTINCT newCol
	FROM (
		SELECT substring(PDTChar, num, 1) AS newCol
		FROM @tbl_AllPDTID
		CROSS APPLY (
			VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9)
			) d(num)
		) t
	WHERE newCol <> ''

	--**Insert Single charater into mapping table with Ref ID**
	IF NOT EXISTS (
			SELECT *
			FROM MasterAdViewData.DBO.SYSOBJECTS
			WHERE NAME = 'PDTCharMap' AND Type = 'U'
			)
	BEGIN
		CREATE TABLE MasterAdViewData.DBO.PDTCharMap (RefID INT Identity(10, 1), PDTChar CHAR(1))
	END

	SELECT @cnt = count(SingleChar)
	FROM @tbl_SinglePDT a
	LEFT JOIN MasterAdViewData.DBO.PDTCharMap b
		ON a.SingleChar = b.PDTChar
	WHERE b.PDTChar IS NULL

	--**IF new char found then notify by mail
	IF @cnt > 0
	BEGIN
		IF EXISTS (
				SELECT [Name]
				FROM tempdb.dbo.SysObjects
				WHERE xtype = 'U' AND NAME = 'charlist'
				)
			DROP TABLE tempdb.dbo.charlist

		SELECT SingleChar
		INTO TEMPDB..charlist
		FROM @tbl_SinglePDT a
		LEFT JOIN MasterAdViewData.DBO.PDTCharMap b
			ON a.SingleChar = b.PDTChar
		WHERE b.PDTChar IS NULL

		EXEC master.dbo.mt_proc_send_cdosysmail @from = 'sql@markettrack.com', @to = 'vkantawala@markettrack.com;vipuld@markettrack.com;ramt@markettrack.com;halapati@markettrack.com', @subject = 'New Character Found in PDTID', @body = 'Inserted New Character in CharMapTable', @bodytype = 'html', @query = 'Select * from tempdb..charlist'
	END

	INSERT INTO MasterAdViewData.DBO.PDTCharMap (PDTChar)
	SELECT SingleChar
	FROM @tbl_SinglePDT a
	LEFT JOIN MasterAdViewData.DBO.PDTCharMap b
		ON a.SingleChar = b.PDTChar
	WHERE b.PDTChar IS NULL
		
	--**Convert Original PDTID to BigInt and Insert into MasterMapPagedetailID
	;WITH CTE
	AS (
		SELECT ROW_NUMBER() OVER (
				ORDER BY RefId
				) AS Rid, 'REPLACE(' + @string + ',''' + pdtchar + ''',''' + convert(CHAR(2), refid) + ''')' AS a, pdtchar, refid
		FROM MasterAdViewData.DBO.PDTCharMap
		)
	SELECT @string = 'REPLACE((' + @string + '),''' + pdtchar + ''',''' + convert(CHAR(2), refid) + ''')'
	FROM CTE
	ORDER BY Rid

	
	SET @SQL = 'Insert into '+@DestinationTable+' (OriginalPagedetailID,PageDetailID)
			Select a.OriginalPagedetailID,a.PageDetailID from (
            Select PageDetailID as OriginalPagedetailID,Convert(bigint,' + @string + ') as PageDetailID 
            from  (Select PagedetailID from #Tbl_AllPDT)x) a Left Join MasterAdViewData.DBO.MasterMapPagedetailID b on a.PageDetailID=b.PageDetailID where b.PageDetailID is null'

	EXEC (@SQL)

	DROP TABLE #Tbl_AllPDT
END


