USE [SQL06]
GO

/****** Object:  StoredProcedure [dbo].[AC_FV_Backup_Restore_Database]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[AC_FV_Backup_Restore_Database]
GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateFlyerReports]
GO

/****** Object:  StoredProcedure [dbo].[DebugOrExecute]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[DebugOrExecute]
GO

/****** Object:  StoredProcedure [dbo].[CWMUpdate_50]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CWMUpdate_50]
GO

/****** Object:  StoredProcedure [dbo].[GetTableName]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[GetTableName]
GO

/****** Object:  StoredProcedure [dbo].[GetServerType]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[GetServerType]
GO

/****** Object:  StoredProcedure [dbo].[BatchUpdate]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[BatchUpdate]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_ID_Update]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_ID_Update]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DisplayTables]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_DisplayTables]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DisplayTables_index]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_DisplayTables_index]
GO

/****** Object:  StoredProcedure [dbo].[PopulateOfferFields]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[PopulateOfferFields]
GO

/****** Object:  StoredProcedure [dbo].[CreateMPVFieldsTables]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateMPVFieldsTables]
GO

/****** Object:  StoredProcedure [dbo].[ConcatUpdates]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[ConcatUpdates]
GO

/****** Object:  StoredProcedure [dbo].[BUUpdate]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[BUUpdate]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Html_Call]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Html_Call]
GO

/****** Object:  StoredProcedure [dbo].[MasterCustomUpdate]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[MasterCustomUpdate]
GO

/****** Object:  StoredProcedure [dbo].[MasterSegmentation]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[MasterSegmentation]
GO

/****** Object:  StoredProcedure [dbo].[CustomUPC_Call_Test_Database]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomUPC_Call_Test_Database]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientDataDBBackups]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[sp_ClientDataDBBackups]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_nwrPeP]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSP_nwrPeP]
GO

/****** Object:  StoredProcedure [dbo].[CategorycodeIndex_old]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CategorycodeIndex_old]
GO

/****** Object:  StoredProcedure [dbo].[CategorycodeIndex]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CategorycodeIndex]
GO

/****** Object:  StoredProcedure [dbo].[ClientSwitchLiveBackup]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[ClientSwitchLiveBackup]
GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[PopulatePageReports]
GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports_Divyang]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[PopulatePageReports_Divyang]
GO

/****** Object:  StoredProcedure [dbo].[PopulateFlyerReports]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[PopulateFlyerReports]
GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports_Divyang]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateFlyerReports_Divyang]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSp_buac]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSp_buac]
GO

/****** Object:  StoredProcedure [dbo].[CreateDetailReports_Full]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateDetailReports_Full]
GO

/****** Object:  StoredProcedure [dbo].[CreateMPVTables]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateMPVTables]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_DataLoad_DetailReports_MPV_Update]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_DataLoad_DetailReports_MPV_Update]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_cccac]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSP_cccac]
GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports_INCRCWM]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[PopulatePageReports_INCRCWM]
GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports_INCRCWM]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateFlyerReports_INCRCWM]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DetailReports_Flyer_Field_Update_PEP]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_DetailReports_Flyer_Field_Update_PEP]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSp_sePEP]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSp_sePEP]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_sbaPep]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSP_sbaPep]
GO

/****** Object:  StoredProcedure [dbo].[CustomstepSP_asmpep]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomstepSP_asmpep]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_AdBlock_old]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_AdBlock_old]
GO

/****** Object:  StoredProcedure [dbo].[CreateDetailReports_acfv]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CreateDetailReports_acfv]
GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_AdBlock]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[mt_proc_Create_AdBlock]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_uniPep]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSP_uniPep]
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_TFPEP]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomStepSP_TFPEP]
GO

/****** Object:  StoredProcedure [dbo].[CustomstepSP_whoPep]    Script Date: 2/25/2019 9:16:53 PM ******/
DROP PROCEDURE [dbo].[CustomstepSP_whoPep]
GO

/****** Object:  StoredProcedure [dbo].[CustomstepSP_whoPep]    Script Date: 2/25/2019 9:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomstepSP_whoPep]
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @SQL NVARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')
-------------------------------------------------------------------------------------------------------------------------------------------------------
IF @Category='whoPep' and @Flag=1
Begin

	SET @SQL='if exists(select * from tempdb.sys.objects where name = '''+@category+'FoodFamily_Category'' and type=''u'')
				drop table tempdb.dbo.'+@category+'FoodFamily_Category'
	If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

	SET @SQL='select * into tempdb.dbo.'+@category+'FoodFamily_Category from '+@vchrControDbPrefix+@category+'FoodFamily_Category'
	If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='UPDATE PDT 
	SET PDT.ProductTerritory=CU.WholeFoodsFamily 
	, PDT.ProductTerritoryGroup=CU.WholeFoodsCategory 
	FROM ' + @Category + 'DetailReports PDT
	INNER JOIN tempdb.dbo.'+@category+'FoodFamily_Category CU
	ON PDT.Category=CU.Category 
	where (isnull(PDT.ProductTerritory,'''')!=CU.WholeFoodsFamily
	or isnull(PDT.ProductTerritoryGroup,'''')=CU.WholeFoodsCategory )
	Option (Maxdop 1)'
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='EXEC mt_proc_Create_ID_Update ''' + @Category + 'DetailReports'', ''ProductTerritory'''
		IF @IsDebug=1
	Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='EXEC mt_proc_Create_ID_Update ''' + @Category + 'DetailReports'', ''ProductTerritoryGroup'''
		IF @IsDebug=1
	Print @SQL
	Else
		Exec (@SQL)

	SET @SQL='Exec mt_proc_Create_DisplayTables '''+@Category+''' '
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)	

End
-------------------------------------------------------------------------------------------------------------------------------------------------------
End



GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_TFPEP]    Script Date: 2/25/2019 9:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 --exec [dbo].[CustomStepSP_TFPEP] 'TFPEP',1,1
CREATE PROCEDURE [dbo].[CustomStepSP_TFPEP] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @SQL NVARCHAR(max)
Declare @vchrControDbPrefix varchar(200)
Set @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')
---------------------------------------------------------------------------------------------------------------------------------------------
If @Category = 'TFPEP' and @Flag=2
Begin
    Set @SQL='update '+@category+'flyerreports set adtype = ''Primary Circular'' where adtype in (''Paper Circular'',''Electronic Circular'')'
    if @IsDebug=1
        Print @SQL
    else
        Exec (@SQL)

    Set @SQL='update '+@category+'pagereports set adtype = ''Primary Circular'' where adtype in (''Paper Circular'',''Electronic Circular'')'
    if @IsDebug=1
        Print @SQL
    else
        Exec (@SQL)

	Set @SQL='if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Category + 'ADType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Category + 'ADType] '
    if @IsDebug=1
        Print @SQL
    else
        Exec (@SQL)

	Set @SQL='Select Distinct ADType into ' + @Category + 'ADType from ' + @Category + 'FlyerReports '
    if @IsDebug=1
        Print @SQL
    else
        Exec (@SQL)

 End
---------------------------------------------------------------------------------------------------------------------------------------------
If @Category='TFPEP' and @Flag=1
Begin

	Set @SQL='update '+@category+'detailreports set adtype = ''Primary Circular'' where adtype in (''Paper Circular'',''Electronic Circular'')'
    if @IsDebug=1
        Print @SQL
    else
        Exec (@SQL)
	
End 
End




GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_uniPep]    Script Date: 2/25/2019 9:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  --exec [CustomStepSP_uniPep] 'TFPEP',1,1
 
 CREATE PROCEDURE [dbo].[CustomStepSP_uniPep] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @Alt nvarchar(max)
---------------------------------------------------------------------------------------------------------
IF @Category in ('uniPep','TFPEP') and @Flag=2
Begin

	Set @Alt='Update ' + @Category + 'FlyerReports
	Set Media = ''Big Brand Mailer''
	Where Advertiser = ''BJ''''s Wholesale Club''
	and media = ''Instore Coupon Books''
	and pages >= 35 '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='exec mt_proc_Create_ID_Update ''' + @Category + 'FlyerReports'',''Media'',0 '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='Update a Set a.Media = b.Media, a.MediaID = b.MediaID
	from ' + @Category + 'PageReports a
	join ' + @Category + 'FlyerReports b
	on a.FlyerID = b.FlyerID
	where a.Media <> b.Media '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='Update ' + @Category + 'FlyerReports
	Set AdType = ''Secondary Circular''
	Where AdType in (''Third Circular'',''Fourth Circular'',''Fifth Circular'') '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='Update a Set a.AdType = b.AdType
	from ' + @Category + 'PageReports a
	join ' + @Category + 'FlyerReports b
	on a.FlyerID = b.FlyerID
	where a.AdType <> b.AdType '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='exec mt_proc_Create_DisplayTables ''' + @Category + ''',1 '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='IF Exists (Select * from sysobjects where name=''' + @Category + 'AdType'' and type=''u'')
	Drop table ' + @Category + 'AdType'
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)

	Set @Alt='Select Distinct AdType into ' + @Category + 'AdType from ' + @Category + 'FlyerReports
	Where AdType not in (''Electronic Circular'',''Mailer'',''Paper Circular'',''Online'') '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)
End
---------------------------------------------------------------------------------------------------------
IF @Category in ('uniPep','TFPEP') and @Flag=1
Begin

	Set @Alt='Update ' + @Category + 'DetailReports Set MediaDetail = ''Big Brand Mailer''	Where Media = ''Big Brand Mailer'' '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)
	
	Set @Alt='exec mt_proc_Create_ID_Update ''' + @Category + 'DetailReports'',''MediaDetail'',0 '
	if @IsDebug=1
		Print @Alt
	else
		Exec (@Alt)
	
End
---------------------------------------------------------------------------------------------------------
End





GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_AdBlock]    Script Date: 2/25/2019 9:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Krunal Shah
-- Create date: <10-24-2018>
-- Description:	<Creation of AdBlock tables with Full and Incremental data. Table will be used for FV query execution>
-- exec mt_proc_Create_AdBlock 'ferpep',0
-- =============================================
CREATE PROCEDURE [dbo].[mt_proc_Create_AdBlock]
	@Category varchar(15)='',
	@IsDebug bit=0  --Values : "0 = Run / 1 = PRINT".
AS
BEGIN
	Declare @nSQL nvarchar(Max)=''
			,@SQL varchar(8000)=''
			,@DataDBPrefix varchar(15)=RIGHT(@@SERVERNAME,5)--'SQL02'
			,@ServerName varchar(15)=@@SERVERNAME--'MT2SQL02'
			,@IsFull Int
			,@PartialSourceCode varchar(50)
			,@FVCCType INT
			,@WhereClause varchar(max)=''

	SET NOCOUNT ON
	SET ANSI_WARNINGS ON
	/*
	Select MT2AClientServer,Count(1) 
	From CategorycodeTable 
	WHERE  ClientPDT=1 AND FVCCType=3
	Group by MT2AClientServer
	select top 11 * from categorycodelog order by 1 desc
	Drop Table CategoryCodeForAdBlock 

	Update CategoryCodeForAdBlock set adblockrun=1
	select * from categorycodetable where  ClientPDT=1 AND FVCCType=3 and clientserver=@@servername Order By ProcessOrder 
	Select * from CategoryCodeForAdBlock
	*/

	Select @IsFull = isfull From categorycodetable where category = @Category
	
	
		IF ISNULL(@IsFull,0)=1  --OR 1=1--Full
		BEGIN
			Set @SQL='
				IF OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'DetailReports]'', ''U'') IS NOT NULL
				BEGIN

				IF Not Exists(Select * From ' + @DataDBPrefix + '.dbo.sysindexes where name = ''idx_' + @Category + 'DetailReportsAdBlockId'')
				Begin
					CREATE NONCLUSTERED INDEX [idx_'+ @Category + 'DetailReportsAdBlockId] ON [' + @DataDBPrefix + '].[dbo].[' + @Category + 'DetailReports]
					(
						[AdBlockID] ASC
					) 
					INCLUDE ([PageDetailID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

					end

					/****** Object:  Index [idx_pgPepADBLOCK1]    Script Date: 11/29/2017 8:59:45 AM ******/

					IF Not Exists(Select * From ' + @DataDBPrefix + '.dbo.sysindexes where name = ''idx_' + @Category + 'ADBLOCK1'')
									Begin
					CREATE NONCLUSTERED INDEX [idx_'+ @Category + 'ADBLOCK1] ON [' + @DataDBPrefix + '].[dbo].[' + @Category + 'DetailReports]
					(	
						[ADBlockID] ASC,
						[FlyerId] ASC,
						[Page] ASC,
						[topleftx] ASC,
						[toplefty] ASC
					)
					INCLUDE ([PageDetailID],
						[OriginalPageDetailID],
						[MerchandiseCategory],
						[Category],
						[Brand],
						[Manufacturer],
						[MainOffer],
						[MPVOfferType],
						[Weight],
						[TaggedCompany],
						[Features],
						[UnitPrice],
						[SalePrice1]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

						end

					If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports]'', ''U'') IS NOT NULL
						Drop Table ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports]
					
					End'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'if exists(select name from dbo.sysobjects where name = ''' + @Category + 'DisAdBlockReports'' and xtype = ''U'')
							Drop table DBO.' + @Category + 'DisAdBlockReports
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							select  PDT.AdBlockId
							, PDT.Brand
							, PDT.Manufacturer
							, PDT.Category
							, PDT.SalePrice1
							, Case When PDT.MainOffer = '' '' Then NULL When PDT.MainOffer = '''' Then NULL Else PDT.MainOffer End MainOffer
							, PDT.MerchandiseCategory
							, Case When PDT.MPVOfferType = '''' Then NULL Else PDT.MPVOfferType End MPVOfferType
							into DBO.' + @Category + 'DisAdBlockReports
							from dbo.' + @Category + 'DetailReports PDT with(nolock) 
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			-- Step 2 : Delete duplicate if any
			SET @sql =	'
							;with cte as (
							select *, ROW_NUMBER()over(partition by AdBlockId,Brand,Manufacturer,Category,SalePrice1,MainOffer,MPVOfferType order by AdBlockId)cnt
							from DBO.' + @Category + 'DisAdBlockReports)
							delete  from cte 
							where cnt > 1
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

		
			SET @sql =	'
							If exists(select name from dbo.sysobjects where name = ''' + @Category + 'adblockid'' and xtype = ''U'')
								Drop table ' + @Category + 'adblockid
							
							Create table ' + @Category + 'adblockid (adblockid bigint not null)
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							insert into ' + @Category + 'adblockid
							select adblockid from ' + @Category + 'DisAdBlockReports with (nolock)
							group by adblockid
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							SELECT v1.adblockid, 
							case when len(D.brand) = 0 then '''' else replace(substring(D.brand,1,(len(D.brand)-1)),''&amp;'',''&'') end brand, 
							case when len(E.Manufacturer) = 0 then '''' else replace(substring(E.Manufacturer,1,(len(E.Manufacturer)-1)),''&amp;'',''&'') end Manufacturer, 
							case when len(F.Category) = 0 then '''' else replace(substring(F.Category,1,(len(F.Category)-1)),''&amp;'',''&'') end Category, 
							case when len(G.SalePrice1) = 0 then '''' else replace(substring(G.SalePrice1,1,(len(G.SalePrice1)-1)),''&amp;'',''&'') end SalePrice1,
							case when len(H.MainOffer) = 0 then '''' else replace(substring(H.MainOffer,1,(len(H.MainOffer)-1)),''&amp;'',''&'') end MainOffer,
							case when len(I.MerchandiseCategory) = 0 then '''' else replace(substring(I.MerchandiseCategory,1,(len(I.MerchandiseCategory)-1)),''&amp;'',''&'') end MerchandiseCategory,
							case when len(J.MPVOfferType) = 0 then '''' else replace(substring(J.MPVOfferType,1,(len(J.MPVOfferType)-1)),''&amp;'',''&'') end MPVOfferType
							into ' + @Category + 'AdBlockReports
							FROM ' + @Category + 'adblockid v1
							CROSS APPLY ( SELECT brand + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by brand
							                  FOR XML PATH('''') ) D ( brand)
							CROSS APPLY ( SELECT Manufacturer + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by Manufacturer
							                  FOR XML PATH('''') )  E ( Manufacturer)
							CROSS APPLY ( SELECT Category + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by Category
							                  FOR XML PATH('''') )  F ( Category)
							CROSS APPLY ( SELECT CAst(SalePrice1 as varchar(8000))+ ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by SalePrice1
							                  FOR XML PATH('''') )  G ( SalePrice1)
							CROSS APPLY ( SELECT MainOffer + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MainOffer
							                  FOR XML PATH('''') )  H ( MainOffer)
							CROSS APPLY ( SELECT MerchandiseCategory + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MerchandiseCategory
							                  FOR XML PATH('''') )  I ( MerchandiseCategory)
							CROSS APPLY ( SELECT MPVOfferType + ''; ''
							              FROM ' + @Category + 'DisAdBlockReports v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MPVOfferType
							                  FOR XML PATH('''') )  J ( MPVOfferType)
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'IF Exists(Select 1 From ' + @DataDBPrefix + '.INFORMATION_SCHEMA.columns where TABLE_NAME = ''' + @Category + 'AdBlockReports'' And COLUMN_NAME = ''AdBlockID'')
					ALTER TABLE ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports Alter Column [AdBlockID] Bigint Not NUll'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							If exists(select name from dbo.sysobjects where name = ''' + @Category + 'DisAdBlockReports'' and xtype = ''U'')
								Drop table ' + @Category + 'DisAdBlockReports					
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

				SET @sql =	'
							If exists(select name from dbo.sysobjects where name = ''' + @Category + 'adblockid'' and xtype = ''U'')
								Drop table ' + @Category + 'adblockid
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

		END
		Else--Partial
		BEGIN
			Set @SQL='If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]'', ''U'') IS NOT NULL
							Drop Table ['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]

						--For New+Updated records from TempACFVDetailReports table
						Select Distinct
						T.[AdBlockId]
						, T.Brand
						, T.Manufacturer
						, T.Category
						, T.SalePrice1
						, T.MainOffer
						, T.MerchandiseCategory
						, T.MPVOfferType
						INTO ['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]
						FROM ['+@DataDBPrefix+'].[dbo].['+@Category+'DetailReports] T 
						JOIN ACFVINCR..TempACFVAdBlock PDT
						ON T.AdBlockId = PDT.AdBlockId
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							If exists(select name from dbo.sysobjects where name = ''INCR' + @Category + 'adblockid'' and xtype = ''U'')
								Drop table INCR' + @Category + 'adblockid
							
							Create table INCR' + @Category + 'adblockid (adblockid bigint not null)
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'
							insert into INCR' + @Category + 'adblockid
							select adblockid from INCR'+@Category+'AdblockReports with (nolock)
							group by adblockid
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql	

			SET @sql =	'	If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]'', ''U'') IS NOT NULL
								Drop Table ['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql	

			SET @sql =	'
							SELECT v1.adblockid, 
							case when len(D.brand) = 0 then '''' else replace(substring(D.brand,1,(len(D.brand)-1)),''&amp;'',''&'') end brand, 
							case when len(E.Manufacturer) = 0 then '''' else replace(substring(E.Manufacturer,1,(len(E.Manufacturer)-1)),''&amp;'',''&'') end Manufacturer, 
							case when len(F.Category) = 0 then '''' else replace(substring(F.Category,1,(len(F.Category)-1)),''&amp;'',''&'') end Category, 
							case when len(G.SalePrice1) = 0 then '''' else replace(substring(G.SalePrice1,1,(len(G.SalePrice1)-1)),''&amp;'',''&'') end SalePrice1,
							case when len(H.MainOffer) = 0 then '''' else replace(substring(H.MainOffer,1,(len(H.MainOffer)-1)),''&amp;'',''&'') end MainOffer,
							case when len(I.MerchandiseCategory) = 0 then '''' else replace(substring(I.MerchandiseCategory,1,(len(I.MerchandiseCategory)-1)),''&amp;'',''&'') end MerchandiseCategory,
							case when len(J.MPVOfferType) = 0 then '''' else replace(substring(J.MPVOfferType,1,(len(J.MPVOfferType)-1)),''&amp;'',''&'') end MPVOfferType
							into '+@Category+'AdBlockReports_Stuff
							FROM INCR' + @Category + 'adblockid v1
							CROSS APPLY ( SELECT brand + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by brand
							                  FOR XML PATH('''') ) D ( brand)
							CROSS APPLY ( SELECT Manufacturer + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by Manufacturer
							                  FOR XML PATH('''') )  E ( Manufacturer)
							CROSS APPLY ( SELECT Category + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by Category
							                  FOR XML PATH('''') )  F ( Category)
							CROSS APPLY ( SELECT CAst(SalePrice1 as varchar(8000))+ ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by SalePrice1
							                  FOR XML PATH('''') )  G ( SalePrice1)
							CROSS APPLY ( SELECT MainOffer + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MainOffer
							                  FOR XML PATH('''') )  H ( MainOffer)
							CROSS APPLY ( SELECT MerchandiseCategory + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MerchandiseCategory
							                  FOR XML PATH('''') )  I ( MerchandiseCategory)
							CROSS APPLY ( SELECT MPVOfferType + ''; ''
							              FROM [INCR'+@Category+'AdblockReports] v2
							              WHERE v2.adblockid = v1.adblockid  
										  group by MPVOfferType
							                  FOR XML PATH('''') )  J ( MPVOfferType)
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql
				
			SET @sql =	'Delete PDT
						FROM ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports] PDT
						INNER JOIN ['+@DataDBPrefix+'].[dbo].[' + @Category + 'AdBlockReports_Stuff] T with(nolock) 
						ON T.AdBlockId = PDT.AdBlockId 

						INSERT INTO ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports] (adblockid, Brand, Manufacturer, Category, SalePrice1, MainOffer, MerchandiseCategory, MPVOfferType)
						SELECT adblockid, Brand, Manufacturer, Category, SalePrice1, MainOffer, MerchandiseCategory, MPVOfferType
						FROM ['+@DataDBPrefix+'].[dbo].[' + @Category + 'AdBlockReports_Stuff] with(nolock) 
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]'', ''U'') IS NOT NULL
								Drop Table ['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]
						'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'If exists(select name from dbo.sysobjects where name = ''INCR' + @Category + 'adblockid'' and xtype = ''U'')
								Drop table INCR' + @Category + 'adblockid'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

			SET @sql =	'If exists(select name from dbo.sysobjects where name = ''INCR'+@Category+'AdblockReports'' and xtype = ''U'')
								Drop table INCR'+@Category+'AdblockReports'
			IF(@isDebug = 0)
				EXEC(@sql)
			Else
				Print @sql

		END

		If @IsDebug=0
		Begin
	
			Insert Into CategoryCodeLog(CategoryCode,Details,SQL,QueryTime) Values(@Category,'START: AdBlock update for '+@Category+' IsFull='+Cast(@IsFull as varchar(1)),@SQL,getdate())
			Exec('Update ['+@DataDBPrefix+'].[dbo].[CategoryCodeForAdBlock] Set RunStartTime=getdate() Where Category='''+@Category+'''')
	
		End

		--Else
		--	Print (@SQL)

		IF ISNULL(@IsFull,0)=1  --OR 1=1--Full
		BEGIN
				SET @SQL = '

				IF Not Exists(Select 1 From ' + @DataDBPrefix + '.INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = ''' + @Category + 'AdBlockReports'' And CONSTRAINT_NAME = ''PK_' + @Category + 'AdblockReports'')
					ALTER TABLE ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports ADD  CONSTRAINT [PK_' + @Category + 'AdblockReports] PRIMARY KEY CLUSTERED ([AdBlockID])'

				If @IsDebug=0
				Begin
	
					
					Exec  (@SQL)
					Exec('Update ['+@DataDBPrefix+'].[dbo].[CategoryCodeForAdBlock] Set RunEndTime=getdate() Where Category='''+@Category+'''')
					Insert Into CategoryCodeLog(CategoryCode,Details,SQL,QueryTime) Values(@Category,'END: AdBlock update for '+@Category+' IsFull='+Cast(@IsFull as varchar(1)),@SQL,getdate())
	
				End

				Else
					Print (@SQL)
		End

END
GO

/****** Object:  StoredProcedure [dbo].[CreateDetailReports_acfv]    Script Date: 2/25/2019 9:16:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CreateDetailReports_acfv]
	@CatCode VARCHAR(15), 
	@Return_Val INT OUTPUT,
	@Debug BIT =0
AS
BEGIN
	SET NOCOUNT ON
	
	Print 'CreateClientTables_50 started at '  + convert(varchar(100),current_timestamp,20)	
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'PDT Start','PDT Start', GETDATE()		
	Declare	@CatPageTable VARCHAR(255)
			,@CatMPVTable VARCHAR(255)
			,@CatMerchCatTable VARCHAR(255)
			,@FullSourceCode VARCHAR(255)
			,@SrcCatCode VARCHAR(255)
			,@IsFull BIT
			,@IsPDT BIT	
			,@CBECnt INT
			,@IsFSI BIT
			,@IsMaster BIT
			,@IsOD BIT
			,@SrcPDTTable VARCHAR(255)
			,@SrcMPVTable VARCHAR(255)
			,@SrcPDTDeleteTable VARCHAR(255)
			,@Index_Type INT
			,@SQL VARCHAR(MAX)
			,@NSQL NVARCHAR(max)
			,@IncludePT BIT
			,@strNewId VARCHAR(255)
			,@CBETable VARCHAR(255)	
			,@strMCTableName VARCHAR(255)
			,@CategoryCodeTable VARCHAR(255)
			,@ServerType VARCHAR(25)
			,@strDate VARCHAR(100)
			,@Comments1NOffDesc VARCHAR(255)
			,@IsConCatUpdate BIT
			,@ConcatType INT 
			,@MasterCodeConcatType INT 
			,@MasterCode INT 
			,@intCategoryCodeId INT
			,@vchrControDbPrefix VARCHAR(100)
			,@vchrNorPrice VARCHAR(1000)
			,@bitIsNORUnit BIT
			,@bitOffer BIT
			,@CRMETable VARCHAR(255)	
			,@CRMECnt INT
			,@CRMEType INT
			,@bitBuPC BIT
			,@vchrBuPCSql VARCHAR(100)
			,@IsProductionCode BIT
			,@BrandField VARCHAR(100)
			,@CBEBrandField VARCHAR(100)
			,@TaggedCompanyField VARCHAR(100)
			,@ShowEntryBrand tinyint
			,@ShowEntryTaggedCompany tinyint
			,@ShowAdType tinyint
			,@bitRun BIT
			,@IsCatOnly BIT
			,@CatDetailTable VARCHAR(100)
			,@CatFlyerTable VARCHAR(100)
			,@FullStagingMPV VARCHAR(100)
			,@FlyerReportsPrefix as VARCHAR(100)
			,@SourceIsDetailReports tinyint
			,@crlf VARCHAR(2)
			,@vchrCrmeJoinClause VARCHAR(500)
			,@vchrCrmeWhereClause VARCHAR(500)
			,@AdDateSQL nVARCHAR(1000)
			,@intAdDate Int 
			,@IsFVCCTYPE tinyint
			,@EmailFlagSQL Varchar(1000)
			,@ACFieldNames Varchar(max)
			,@Acflagsql Varchar(max)			
			,@srcCWMTable varchar(500)
			,@SelectFields Varchar(max)
			,@InsertFields varchar(max)
			,@BitCatLevelOffer Bit
			,@CatCodeIncrDetailReports varchar (100)
			,@Clientid_TBL_Lookup INT
			,@ID_Tbl_Lookup INT
			, @stagingcolumns varchar(max)
			SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
			--	DROP SYNONYM [dbo].[CategoryCodeTable]

			--CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
			--											[MT2ASQL06].[SiteControl].[dbo].[CategoryCode]
														
			--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
			--	DROP SYNONYM [dbo].[TableNames]

			--CREATE SYNONYM [dbo].[TableNames] FOR
			--											[MT2ASQL06].[SiteControl].[dbo].[TableNames]														
														
														
		set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
					IF Exists(Select name From sysobjects where name = ''tbl_lookup_Category_ac'')
					Begin
						DROP TABLE tbl_lookup_Category_ac
						SELECT * INTO tbl_lookup_Category_ac FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
					End
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_ac]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				IF Exists(Select name From sysobjects where name = ''tbl_lookup_Client_ac'')
				Begin
						DROP TABLE tbl_lookup_Client_ac
						SELECT * INTO tbl_lookup_Client_ac FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				End
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_ac]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
																												
	
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A')
				DROP SYNONYM [dbo].[Connection_MT2A]

			CREATE SYNONYM [dbo].[Connection_MT2A] FOR [MT2aSQL06].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2A_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2A_NightlyProcessing] FOR [MT2aSQL06].[Connection].dbo.NightlyProcessing

		END
	ELSE
		BEGIN
			--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
			--	DROP SYNONYM [dbo].[CategoryCodeTable]

			--CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
			--											[MT2SQL14].[SiteControl].[dbo].[CategoryCode]

			--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
			--	DROP SYNONYM [dbo].[TableNames]

			--CREATE SYNONYM [dbo].[TableNames] FOR
			--											[MT2SQL14].[SiteControl].[dbo].[TableNames]														
														
		set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
														
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2')
				DROP SYNONYM [dbo].[Connection_MT2]

			CREATE SYNONYM [dbo].[Connection_MT2] FOR [MT2SQL14].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2_NightlyProcessing] FOR [MT2SQL14].[Connection].dbo.NightlyProcessing

		END
	--Start - Detail fields Select and Insert
	SELECT 						
						@SelectFields = COALESCE(@SelectFields ,'') + LTRIM(RTRIM(CategoryValue)) +','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'DetailSelect'
						ORDER BY ID 
					SET @SelectFields = REPLACE(@SelectFields, 'S.CAST(' , 'CAST(')
					SET @SelectFields=Left(@SelectFields,len(@SelectFields)-1)+','
					--SELECT @Acflagsql = COALESCE(@Acflagsql ,'') + 
					--							CASE 
					--								WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
					--								WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
					--								ELSE LTRIM(RTRIM(CategoryValue))
					--							END + 
					--							','
					--FROM
					--	tbl_LookUp
					--WHERE
					--	CategoryType = 'DetailSelect'
					--		ORDER BY ID 
		
		SELECT 						
						@InsertFields = COALESCE(@InsertFields ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'DetailInsert'
						ORDER BY ID 
					SET @InsertFields = REPLACE(@InsertFields, 'S.CAST(', 'CAST(')
					--SELECT @Acflagsql = COALESCE(@Acflagsql ,'') + 
					--							CASE 
					--								WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
					--								WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
					--								ELSE LTRIM(RTRIM(CategoryValue))
					--							END + 
					--							','
					--FROM
					--	tbl_LookUp
					--WHERE
					--	CategoryType = 'DetailInsert'
					--	ORDER BY ID 
	--End - Detail fields Select and Insert


	SET @Nsql = 'IF EXISTS(SELECT * FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControl 
				WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) + ')
				Set @BitCatLevelOffer=1'  
	
	EXEC SP_EXECUTESQL @Nsql,N'@BitCatLevelOffer BIT OUTPUT',@BitCatLevelOffer OUTPUT

	SET @SourceIsDetailReports = 0
	SET @crlf = char(13) + char(10)
	
	SET @vchrBuPCSql = ''
	
	EXECUTE GetServerType @@SERVERNAME,@ServerType OUTPUT
	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	
	EXEC dbo.GetTableName @CatCode, 56, @FlyerReportsPrefix output
	SET @FlyerReportsPrefix = REPLACE(@FlyerReportsPrefix, 'PageReports', '')
	
	SET @CatPageTable = @FlyerReportsPrefix + 'PageReports'
	SET @IncludePT = 0
	SET @NSQL = 'IF exists(SELECT Category FROM ' + @CategoryCodeTable + ' WHERE category = ''' + @CatCode + ''' 
			And (BUPT = 1 OR BUPTG = 1 OR BUPTSG = 1) ) SET  @IncludePT = 1 '
	
			EXECUTE sp_executesql @NSQL, N'@IncludePT BIT output', @IncludePT output

			Print @NSQL
	
	
	SET @CatDetailTable = @CatCode + 'DetailReports'
	SET @CatCodeIncrDetailReports = @CatCode + 'IncrDetailReports'
	
	
	SET @FullStagingMPV = 'FullStagingMultiplePageValues'
	

	--Fetch CategoryCodeId
	SET @intCategoryCodeId = 0
	SET @NSQL = 'SELECT @intCategoryCodeId = [ID] FROM ' + @CategoryCodeTable + ' WHERE category = ''' + @CatCode + ''''
	
			EXECUTE sp_executesql @NSQL, N'@intCategoryCodeId INT output', @intCategoryCodeId output

			Print @NSQL
		
	--Fetch CategoryCodeId
	--MerchandiseCategory 
	SELECT @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')
	SET @NSQL = 'SELECT @strMCTableName = TemplateName FROM ' + @vchrControDbPrefix + 'MerchandiseCategoryTemplates M JOIN 
			' + @vchrControDbPrefix + 'MerchandiseCategoryControl MC ON M.MCTemplateID = MC.MCTemplateID WHERE
			MC.CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	
			EXECUTE sp_executesql @NSQL, N'@strMCTableName VARCHAR(255) output', @strMCTableName output
	
			Print @NSQL
	
	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @CatMerchCatTable = 'TEMPDB..TMC' + @strNewId
	SET @SQL = 'SELECT distinct * INTO ' + @CatMerchCatTable + ' FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory  
			WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10))

	SET @nsql = 'SELECT @srcCWMTable=SourceCWM FROM CategoryCodeTable WHERE category = @CatCode'
	
			
			EXECUTE sp_executesql @NSQL, N'@srcCWMTable varchar(500) output,@CatCode varchar(15)', @srcCWMTable output,@CatCode
	
			Print @NSQL
		



	--Item 19534: history start problems in MC and CBE nishant
	SET @AdDateSQL = 'SELECT @intAdDate  = count(1) FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory   
			WHERE CategoryCodeId = @intCategoryCodeId AND (ISNULL(StartDt,'''')<> '''' or ISNULL(EndDt,'''')<> '''')'
	
  
			
			EXEC sp_executesql @AdDateSql,N'@intAdDate int output,@intCategoryCodeId int',@intAdDate  output,@intCategoryCodeId			
	
			Print @NSQL
									
	IF @intAdDate > 1		
		SET @SQL = @SQL + 'UPDATE ' + @CatMerchCatTable + '
							SET StartDt = dateadd(yy,-150,getdate())
							WHERE StartDt is null
		
							UPDATE ' + @CatMerchCatTable + '
							SET EndDt = dateadd(yy,150,getdate())
							WHERE EndDt is null'
							
	
		Print '-- SQL starts: ' + convert(varchar(100),current_timestamp,20)
	IF @Debug = 1 
		PRINT @SQL
	ELSE
		Exec(@sql)

			
	--Start : ID Update for temp MC table
			SET @nSQL = 'INSERT INTO 
			IDDB.dbo.Category (Category) 
		Select 
			DISTINCT ISNULL(Category, '''')
		From ' + @CatMerchCatTable + '  Except Select 
			DISTINCT ISNULL(Category, '''')
		From  
			IDDB.dbo.Category'
		IF @Debug = 1 
			PRINT @nSQL
		ELSE
			Exec(@nSQL)

		SET @nSQL = 'INSERT INTO 
			IDDB.dbo.MerchandiseCategory (MerchandiseCategory) 
		Select 
			DISTINCT ISNULL(MerchandiseCategory, '''')
		From ' + @CatMerchCatTable + '  Except Select 
			DISTINCT ISNULL(MerchandiseCategory, '''')
		From  
			IDDB.dbo.MerchandiseCategory'
		
		IF @Debug = 1 
			PRINT @nSQL
		ELSE
			Exec(@nSQL)

		SET @nSQL = 'INSERT INTO 
			IDDB.dbo.MerchandiseSubCat (MerchandiseSubCat) 
		Select 
			DISTINCT ISNULL(MerchandiseSubCat, '''')
		From ' + @CatMerchCatTable + '  Except Select 
			DISTINCT ISNULL(MerchandiseSubCat, '''')
		From  
			IDDB.dbo.MerchandiseSubCat'
		
		IF @Debug = 1 
			PRINT @nSQL
		ELSE
			Exec(@nSQL)

		SET @nSQL = 'Alter Table ' + @CatMerchCatTable + ' Add CategoryID Int,MerchandiseCategoryID Int,MerchandiseSubCatID Int ' 
		IF @Debug = 1 
			PRINT @nSQL
		ELSE
			Exec(@nSQL)

		SET @nSQL = 'Update MC Set CategoryID =C.CategoryID , MerchandiseCategoryID =M.MerchandiseCategoryID,MerchandiseSubCatID=MSC.MerchandiseSubCatID 
					From ' + @CatMerchCatTable + ' MC 
					Left Join IDDB..Category C on C.Category=MC.Category 
					Left Join IDDB..MerchandiseCategory M on M.MerchandiseCategory=MC.MerchandiseCategory 
					Left Join IDDB..MerchandiseSubCat MSC on MSC.MerchandiseSubCat=MC.MerchandiseSubCat '

		IF @Debug = 1 
			PRINT @nSQL
		ELSE
			Exec(@nSQL)

		--End : ID Update for temp MC table
	
	Print '-- SQL ends: ' + convert(varchar(100),current_timestamp,20)
	PRINT '--MCTemplate = ' + @strMCTableName
	PRINT '--MCTable = ' + @CatMerchCatTable
	--MerchandiseCategory 
	--ClientBrandException
	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @CBETable = ''	
	EXECUTE GetTableName 'ClientBrandException', 0, @CBETable OUTPUT  
	SET @SQL = 'SELECT * INTO TEMPDB..TCBE' + @strNewId + ' FROM ' + @CBETable + ' WHERE 
				CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + ''
	--Changed by prakash on 21/06/2013
	Print '-- SQL starts: ' + convert(varchar(100),current_timestamp,20)

		PRINT @SQL

		Exec(@sql)
	Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
	
	SET @CBETable = 'TEMPDB..TCBE' + @strNewId
	--ClientBrandException
	--ClientRetMktException
	print 'CBE Table = ' + @CBETable

	
	--Start : ID Update for temp CBE table
			SET @SQL = 'INSERT INTO 
			IDDB.dbo.Category (Category) 
		Select 
			DISTINCT ISNULL(Category, '''')
		From ' + @CBETable + '  Except Select 
			DISTINCT ISNULL(Category, '''')
		From  
			IDDB.dbo.Category'
		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)

		SET @SQL = 'INSERT INTO 
			IDDB.dbo.MerchandiseCategory (MerchandiseCategory) 
		Select 
			DISTINCT ISNULL(MerchandiseCategory, '''')
		From ' + @CBETable + '  Except Select 
			DISTINCT ISNULL(MerchandiseCategory, '''')
		From  
			IDDB.dbo.MerchandiseCategory'
		
		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)

		SET @SQL = 'INSERT INTO 
			IDDB.dbo.MerchandiseSubCat (MerchandiseSubCat) 
		Select 
			DISTINCT ISNULL(MerchandiseSubCat, '''')
		From ' + @CBETable + '  Except Select 
			DISTINCT ISNULL(MerchandiseSubCat, '''')
		From  
			IDDB.dbo.MerchandiseSubCat'
		
		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)
		
		SET @SQL = 'INSERT INTO 
			IDDB.dbo.Brand (Brand) 
		Select 
			DISTINCT ISNULL(Brand, '''')
		From ' + @CBETable + '  Except Select 
			DISTINCT ISNULL(Brand, '''')
		From  
			IDDB.dbo.Brand'
		
		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)
		SET @SQL = 'Alter Table ' + @CBETable + ' Add CategoryID Int,MerchandiseCategoryID Int,MerchandiseSubCatID Int,BrandId Int ' 
		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)

		SET @SQL = 'Update MC Set CategoryID =C.CategoryID , MerchandiseCategoryID =M.MerchandiseCategoryID,MerchandiseSubCatID=MSC.MerchandiseSubCatID ,BrandId=B.BrandId
					From ' + @CBETable + ' MC 
					Left Join IDDB..Category C on C.Category=MC.Category 
					Left Join IDDB..MerchandiseCategory M on M.MerchandiseCategory=MC.MerchandiseCategory 
					Left Join IDDB..MerchandiseSubCat MSC on MSC.MerchandiseSubCat=MC.MerchandiseSubCat
					Left Join IDDB..Brand B on B.Brand=MC.Brand'

		IF @Debug = 1 
			PRINT @SQL
		ELSE
			Exec(@sql)

		--End : ID Update for temp CBE table

	SELECT @strNewId = REPLACE(NEWID(),'-','')
	SET @CRMETable = 'TEMPDB..TCRME' + @strNewId
	SET @SQL = 'SELECT * INTO ' + @CRMETable + ' FROM ' + @vchrControDbPrefix + 'ClientRetMktException WHERE 
				CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR(10)) + '
				UPDATE ' + @CRMETable + '
				SET StartDt = ''1/1/1900''
				WHERE StartDt is null
				UPDATE ' + @CRMETable + '
				SET EndDt = ''1/1/2099''
				WHERE EndDt is null'
	--Changed by prakash on 21/06/2013
	Print '-- SQL starts: ' + convert(varchar(100),current_timestamp,20)

		PRINT @SQL

		Exec(@sql)
	Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
	SELECT @CRMECnt = 0
	SELECT @NSQL = N'SELECT @CRMECnt = COUNT(1) FROM ' + @CRMETable 
					
			EXECUTE sp_executesql @NSQL, N'@CRMECnt INT OUTPUT', @CRMECnt OUTPUT			
	
			Print @NSQL
	SELECT @CRMEType = 0
	SELECT @NSQL = N'SELECT Top 1 @CRMEType = Type FROM ' + @CRMETable 
	
			
			EXECUTE sp_executesql @NSQL, N'@CRMEType INT OUTPUT', @CRMEType OUTPUT			

			Print @NSQL
	
	IF @CRMEType = 1 --- Retailers and Market provided with SET of category 
		SET @vchrCrmeJoinClause = ' LEFT OUTER JOIN ' + @CRMETable + ' Crme ON 
						(PR.RetMktId = Crme.RetMktId And Crme.Type = 1) '
	IF @CRMEType = 2 --Category provided for subSET of retailers and market		
		SET @vchrCrmeJoinClause = ' LEFT OUTER JOIN ' + @CRMETable + ' Crme ON 
						(Pdt.Category = Crme.RealCategory And Crme.Type = 2) '
	SET @vchrCrmeWhereClause = ' ((Crme.RealCategory IS NULL OR Crme.RetMktId IS NULL) OR 
					(PR.RetMktId = Crme.RetMktId AND Crme.RealCategory = Pdt.Category '
	IF @intAdDate > 1 and @CatCode not in ('bgf50') 
		SET @vchrCrmeWhereClause = @vchrCrmeWhereClause + ' AND PR.AdDate between mc.startDt and mc.enddt'
					--AND pr.AdDate between crme.startDt and crme.enddt
	SET @vchrCrmeWhereClause = @vchrCrmeWhereClause + ')) '
	--ClientRetMktException
	Print @SERVERType
	
	IF @ServerType = 'Master'
	BEGIN		
		SELECT @NSQL = N'SELECT 
							@FullSourceCode = FullSourceCode, 
							@Index_Type = Case when IsFull = 1 Then IsNull(MasterIndex, 1) ELSE IsNull(Index_Type, 1) END, 
							@IsPDT = isPDT, 
							@IsMaster = IsMaster, 
							@IsFull = IsFull , --Temporary comented
							--@ISFULL = 1 ,
							@IsCatOnly=CatOnly,
							@SrcCatCode = case when IsFull = 0 then PartialSourceCode ELSE FullSourceCode END, --Temporary comented
							--@SrcCatCode = FullSourceCode ,
							@IsFSI = IsNull(ISFSI,0) , 
							@IsOD = IsNull(IsOD,0), 
							@bitIsNORUnit = ISNULL(IsNORUnit,0), 
							@bitOffer = ISNULL(IsOffer,0),
							@bitBuPC = ISNULL(BuPC,0),
							@ShowEntryBrand = IsNull(ShowEntryBrand,0), 
							@ShowEntryTaggedCompany = IsNull(ShowEntryTaggedCompany,0),
							@ShowAdType=IsNull(ShowAdType,0)
							
							,@IsFVCCTYPE = Isnull(fvcctype,4) 
							
						From ' + 
							@CategoryCodeTable + ' 
						WHERE 
							Category = ''' + @CatCode + ''''
		
					
					EXECUTE sp_executesql @NSQL, N'@FullSourceCode VARCHAR(255) OUTPUT,@Index_Type INT OUTPUT,@IsPDT BIT OUTPUT,@IsMaster BIT OUTPUT,@IsFull BIT OUTPUT,@IsCatOnly BIT OUTPUT,@SrcCatCode VARCHAR(255) OUTPUT, @IsFSI BIT OUTPUT, @IsOD BIT OUTPUT, @bitIsNORUnit BIT OUTPUT, @bitOffer BIT OUTPUT, @bitBuPC BIT OUTPUT, @ShowEntryBrand tinyint OUTPUT, @ShowEntryTaggedCompany tinyint OUTPUT,@ShowAdType tinyint OUTPUT, @IsFVCCTYPE tinyint OUTPUT',  @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@IsCatOnly output, @SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT, @ShowEntryBrand OUTPUT, @ShowEntryTaggedCompany OUTPUT, @ShowAdType OUTPUT, @IsFVCCTYPE OUTPUT  -- Changes done by Hine for #19777
		
					Print @NSQL
	END
	ELSE IF @ServerType = 'Client' and @@servername = 'MT2SQL00'
	BEGIN
		SELECT @NSQL = N'SELECT 
							@FullSourceCode = FullSourceCode, 
							@Index_Type = Case when IsFull = 1 Then IsNull(MasterIndex, 1) ELSE IsNull(Index_Type, 1) END, 
							@IsPDT = ClientPDT, 
							@IsMaster = IsMaster, 
							@IsFull = IsFull , 
							@IsCatOnly=CatOnly, 
							@SrcCatCode = case when IsFull = 0 then PartialSourceCode ELSE FullSourceCode END, 
							@IsFSI = IsNull(ISFSI,0), 
							@IsOD = IsNull(IsOD,0), 
							@bitIsNORUnit = ISNULL(IsNORUnit,0), 
							@bitOffer = ISNULL(IsOffer,0), 
							@bitBuPC = ISNULL(BuPC,0),
							@ShowEntryBrand = IsNull(ShowEntryBrand,0), 
							@ShowEntryTaggedCompany = IsNull(ShowEntryTaggedCompany,0),
							@ShowAdType=IsNull(ShowAdType,0)
							
							,@IsFVCCTYPE = Isnull(fvcctype,4) 
							
						From ' + 
							@CategoryCodeTable + ' 
						WHERE 
							Category = ''' + @CatCode + ''''
		
		
					
					EXECUTE sp_executesql @NSQL, N'@FullSourceCode VARCHAR(255) OUTPUT,@Index_Type INT OUTPUT,@IsPDT BIT OUTPUT,@IsMaster BIT OUTPUT,@IsFull BIT OUTPUT,@IsCatOnly BIT OUTPUT,@SrcCatCode VARCHAR(255) OUTPUT, @IsFSI BIT OUTPUT, @IsOD BIT OUTPUT, @bitIsNORUnit BIT OUTPUT, @bitOffer BIT OUTPUT, @bitBuPC BIT OUTPUT, @ShowEntryBrand tinyint OUTPUT, @ShowEntryTaggedCompany tinyint OUTPUT,@ShowAdType tinyint OUTPUT, @IsFVCCTYPE tinyint OUTPUT',  @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@IsCatOnly output,@SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT, @ShowEntryBrand OUTPUT, @ShowEntryTaggedCompany OUTPUT, @ShowAdType OUTPUT, @IsFVCCTYPE OUTPUT -- Changes done by Hine for #19777
			
					Print @NSQL
	END
	ELSE
	BEGIN
		SELECT @NSQL = N'SELECT 
							@FullSourceCode = FullSourceCode, 
							@Index_Type = IsNull(MasterIndex, 1), 
							@IsPDT = ClientPDT, 
							@IsMaster = IsMaster, 
							@IsFull = IsFull , --Temporary comented
							--@ISFULL = 1 , 
							@IsCatOnly=CatOnly, 
							@SrcCatCode = case when IsFull = 0 then PartialSourceCode ELSE FullSourceCode END, --Temporary comented
							--@SrcCatCode = FullSourceCode ,
							@IsFSI = IsNull(ISFSI,0), 
							@IsOD = IsNull(IsOD,0), 
							@bitIsNORUnit = ISNULL(IsNORUnit,0), 
							@bitOffer = ISNULL(IsOffer,0), 
							@bitBuPC = ISNULL(BuPC,0),
							@ShowEntryBrand = IsNull(ShowEntryBrand,0), 
							@ShowEntryTaggedCompany = IsNull(ShowEntryTaggedCompany,0),
							@ShowAdType=IsNull(ShowAdType,0)
							
							,@IsFVCCTYPE = Isnull(fvcctype,4)
							
						From ' + 
							@CategoryCodeTable + ' 
						WHERE 
							Category = ''' + @CatCode + ''''
		
					
					EXECUTE sp_executesql @NSQL, N'@FullSourceCode VARCHAR(255) OUTPUT,@Index_Type INT OUTPUT,@IsPDT BIT OUTPUT,@IsMaster BIT OUTPUT,@IsFull BIT OUTPUT,@IsCatOnly BIT OUTPUT,@SrcCatCode VARCHAR(255) OUTPUT, @IsFSI BIT OUTPUT, @IsOD BIT OUTPUT, @bitIsNORUnit BIT OUTPUT, @bitOffer BIT OUTPUT, @bitBuPC BIT OUTPUT, @ShowEntryBrand tinyint OUTPUT, @ShowEntryTaggedCompany tinyint OUTPUT,@ShowAdType tinyint OUTPUT, @IsFVCCTYPE tinyint OUTPUT',  @FullSourceCode OUTPUT,@Index_Type OUTPUT,@IsPDT OUTPUT,@IsMaster OUTPUT,@IsFull OUTPUT,@IsCatOnly output,@SrcCatCode OUTPUT, @IsFSI OUTPUT, @IsOD OUTPUT, @bitIsNORUnit OUTPUT, @bitOffer OUTPUT, @bitBuPC OUTPUT, @ShowEntryBrand OUTPUT, @ShowEntryTaggedCompany OUTPUT, @ShowAdType OUTPUT, @IsFVCCTYPE OUTPUT -- Changes done by Hine for #19777
		
					PRINT '-- Else - ' + @NSQL
	END
	print @nsql
	
	--NorPrice Changes
	IF @bitIsNORUnit = 0
	BEGIN
		SET @vchrNorPrice = 'NorPrice' 	 
	END
	ELSE
	BEGIN
		SET @vchrNorPrice = 'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 
	END
	--Including OfferDes on all 5.0
	SET @IsOD = 1
	IF @IsOD = 1
		SET @Comments1NOffDesc = ' Comments1, OfferDes '
	ELSE
		SET @Comments1NOffDesc = ' Comments1 '
	IF @ShowEntryBrand = 1
	BEGIN
		SET @BrandField = ' PDT.EntryBrand As Brand '
		SET @CBEBrandField = 'PDT.EntryBrand'
	END
	ELSE
	BEGIN
		SET @BrandField = ' PDT.Brand '
		SET @CBEBrandField = 'PDT.Brand'
	END
	IF @ShowEntryTaggedCompany = 1
		SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
	ELSE
		SET @TaggedCompanyField = ' PDT.TaggedCompany '
		
	IF @ShowAdType = 1
		SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

	--Adview2Control Changes.
	IF @IsPDT = 1	
	BEGIN
		--Start : Concat Updates 
		SET @IsConCatUpdate = 0
		SET @ConcatType = 0
		SET @MasterCodeConcatType = 0
		SELECT @NSQL = N'SELECT @ConcatType = ISNULL(IsConcat,0) FROM ' + @CategoryCodeTable + ' WHERE Category = ''' + @CatCode + ''''
		
	
					
					EXECUTE sp_executesql @NSQL, N'@ConcatType INT OUTPUT', @ConcatType OUTPUT
		
					PRINT @NSQL
		IF @IsFull = 1
		BEGIN
			IF @ConcatType in(1,2,3,4,5)
			BEGIN
				IF @IsMaster = 1 	
					SET @IsConCatUpdate = 1
				ELSE
				BEGIN --For Child Code
					SELECT @NSQL = N'SELECT @MasterCodeConcatType = ISNULL(IsConcat,0) FROM 
						' + @CategoryCodeTable + ' WHERE Category = ''' + @FullSourceCode + ''''
					
				
							
							EXECUTE sp_executesql @NSQL, N'@MasterCodeConcatType INT OUTPUT', @MasterCodeConcatType OUTPUT
				
							PRINT @NSQL
					IF @ConcatType <> @MasterCodeConcatType
						SET @IsConCatUpdate = 1
				END
			END
		END
		ELSE
		BEGIN -- Peform Concat Update for Partial/Incremental Load
			IF @ConcatType in(1,2,3,4,5)	
				SET @IsConCatUpdate = 1
		END
		--END : Concat Updates 
		
		SELECT @SrcPDTTable = @SrcCatCode + 'DetailReports'
		
			
		SELECT @SrcPDTDeleteTable = @SrcCatCode + 'PDTDelete'
		SET @SrcMpvTable=@CatCode + 'MPVVariety'
		
		SELECT @CBECnt = 0
		
		SELECT @NSQL = N'SELECT @CBECnt = COUNT(1) FROM ' + @CBETable 
		
		--Changed by prakash on 21/06/2013
		IF @Debug = 0						
		  EXECUTE sp_executesql @NSQL, N'@CBECnt INT OUTPUT', @CBECnt OUTPUT
		ELSE
			PRINT @NSQL
		IF @Debug = 1
		BEGIN
			IF @IsMaster = 1
				PRINT '--Master'
			ELSE
				PRINT '--Child'
			IF @IsFull = 1
				PRINT '--Full'
			ELSE
				PRINT '--Partial'
			IF @IsFSI = 1
				PRINT '--FSI'
			IF @CBECnt > 0
				PRINT '--CBE Values Exists'
			ELSE
				PRINT '--CBE Values Not Exists'
			IF @CRMECnt > 0
				PRINT '--ClientRetMktException Values Exists'
			ELSE
				PRINT '--ClientRetMktException Values Not Exists'
			PRINT '--@FlyerReportsPrefix = ' + @FlyerReportsPrefix
			PRINT '--@CatPageTable = ' + @CatFlyerTable
			PRINT '--@CatPDTTable = ' + @CatDetailTable
			PRINT '--@CatMerchCatTable = ' + @CatMerchCatTable
			PRINT '--@SrcCatCode = ' + @SrcCatCode
			PRINT '--@SrcPDTTable = ' + @SrcPDTTable
			PRINT '--@SrcPDTDeleteTable = ' + @SrcPDTDeleteTable
			PRINT '--@SrcMPVTable = ' + @SrcMPVTable
			PRINT '--@IsConCatUpdate = ' + CAST(@IsConCatUpdate AS VARCHAR(1))
			PRINT '--@ConcatType = ' + CAST(@ConcatType AS VARCHAR(10))
			PRINT '--@bitOffer = ' + cast(@bitOffer as VARCHAR)
			PRINT '--@IsMaster = ' + cast(@IsMaster as VARCHAR)
			PRINT '--@strMCTableName = ' + cast(@strMCTableName as VARCHAR)
			PRINT '--@bitBuPC = ' + cast(@bitBuPC as VARCHAR)
			
			PRINT '--@IsFVCCTYPE = ' + cast(@IsFVCCTYPE as VARCHAR)
			
			PRINT '-------------------------------------' 
		END		
		/*Drop Table*/	
		/*Drop Table PDT and MPV*/	
		
		--Changes done by Hiren for Item #19777
		Declare @SourceDB Varchar(100)=''
				,@TableName Varchar(100)
		
		IF CharIndex('.', @SrcPDTTable,1)>0 
			BEGIN
				SET @SourceDB = SUBSTRING(@SrcPDTTable,1,CharIndex('.', @SrcPDTTable, 1)-1) + '.'
				SET @TableName = SUBSTRING(@SrcPDTTable,CharIndex('.', @SrcPDTTable, 1)+ 2,LEN(@SrcPDTTable)-CharIndex('.', @SrcPDTTable, 1))
			END
		
		IF @IsFVCCTYPE=4
				BEGIN
					SELECT 						
						@ACFieldNames = COALESCE(@ACFieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithACFields'
					SET @ACFieldNames = REPLACE(@ACFieldNames, 'S.CAST(' , 'CAST(')
					SELECT @Acflagsql = COALESCE(@Acflagsql ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + ','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithACFields'


						SET @NSQL = 'IF (SELECT 
									Count(1) 
								FROM' + SPACE(1) + 
									 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + 'SYS.SYSObjects O
									ON C.ID=O.ID 
								WHERE 
									C.Name IN (' + '''' + REPLACE (left(@Acflagsql,len(@Acflagsql) -1 ),',',''',''') + '''' + ') AND 
									O.Name = ''' + @CatPageTable + ''') = 22
								SET @IsFVCCTYPE = 1
							ELSE 
								SET @IsFVCCTYPE = 0'
						EXEC SP_EXECUTESQL @Nsql,N'@IsFVCCTYPE BIT OUTPUT',@IsFVCCTYPE OUTPUT
						
						If @IsFVCCTYPE=1
							BEGIN 
								SET @Acflagsql=',CWM.'+Replace(Left(@Acflagsql,len(@Acflagsql)-1),',',',CWM.')
								SET @Acflagsql=Left(@Acflagsql,len(@Acflagsql)-1)
							
							END
						--Else
							SET @Acflagsql=Replace(Left(@Acflagsql,len(@Acflagsql)),',',',')
				--set @Acflagsql = replace(@Acflagsql ,',,', ',')
			SET @Acflagsql = Left(@Acflagsql,len(@Acflagsql) - 1)
			Print 'Divyang :: ' + @Acflagsql
			print @Acflagsql
		

			END
			Else
			SET @Acflagsql=''
		
		
		IF @IsFull = 1 OR @IsFSI = 1
		BEGIN
			IF exists(SELECT name FROM sysobjects WHERE name = @CatDetailTable)
			BEGIN
				SELECT @SQL = 'Drop Table ' + @CatDetailTable  
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Drop Fullstaging PDT table'	
				IF @Return_Val <> 0
					Return
			END
			IF exists(SELECT name FROM sysobjects WHERE name = @FullStagingMPV)
			BEGIN
				SELECT @SQL = 'Drop Table ' + @FullStagingMPV  
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Drop Fullstaging MPV table'	
				IF @Return_Val <> 0
					Return
			END
	
	
			IF exists(SELECT name FROM sysobjects WHERE name = @CatMPVTable)
			BEGIN
				SELECT @SQL = 'Drop Table ' + @CatMPVTable 
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Drop CATMPV table'	
				IF @Return_Val <> 0
					Return
			END
		END	
		/*Drop Table PDT and MPV*/			
		/*Drop Table*/
	
		/*PDT AND MPV*/
		/*Deleting records FROM PDT and MPV*/
		IF @IsFull = 0 and @IsFSI = 0
		BEGIN
			SELECT @SQL = 'Alter table ' + @CatDetailTable + '  alter Column Comments1 VARCHAR(510)'
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	,'Alter column Comments1 on detailtable'
			IF @Return_Val <> 0
				Return
			
			SELECT @SQL = 'DELETE FROM ' + @CatDetailTable + ' 
							WHERE PageDetailID in (SELECT PageDetailid FROM ' + @SrcPDTTable  + ' )'
			
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Delete Pagedetailid'	
			Print @SQL	
			IF @Return_Val <> 0
				Return
			
			/*===================================== Delete Records Based on adc_i From AC Side =====================================*/
			SELECT @SQL = 'DELETE FROM ' + @CatDetailTable + ' 
							WHERE OriginalPageDetailID in (SELECT originalPageDetailid FROM ' + @SrcPDTDeleteTable  + ' where flg = 1)'		
			Print @sql	
			--ELSE
			--	SELECT @SQL = 'DELETE FROM ' + @CatDetailTable + ' 
			--				WHERE PageDetailID in (SELECT PageDetailid FROM ' + @SrcPDTDeleteTable  + ')'
			EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output	,'Delete Pagedetailid'


			/*===================================== Delete Records Based on AdcompbrandId From AC Side =====================================*/
			SELECT @SQL = 'DELETE FROM ' + @CatDetailTable + ' 
							WHERE ACAdCompBrandId in (SELECT originalPageDetailid FROM ' + @SrcPDTDeleteTable  + ' where flg = 2)'		
			EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output	,'Delete Pagedetailid'
			
			IF @Return_Val <> 0
				Return
		END
		/*Deleting records FROM PDT and MPV*/	
		/* Is Full Run */
		set @bitOffer = 1 --- seting  offer field for all pep codes ,to populate offers with new logic - will be useing isoffer field from categorycode. 

		IF @IsFull = 1 OR @IsFSI = 1 		
		BEGIN
			/* Is CatCode of Master OR FSI */
		
			IF @IsMaster = 1 OR @IsFSI = 1
			BEGIn		
			PRINT '-- In: Full and Master (or FSI)'
			
					
				SELECT @SQL = 
							'SELECT 
								' + @SelectFields + @Acflagsql + ' 
								INTO ' + @CatDetailTable  + '
							FROM ' + 		
								@SrcPdtTable + ' PDT with(nolock) INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON 
								PR.FlyerId = Pdt.FlyerId AND PR.Page=PDt.Page INNER JOIN ' + @CatMerchCatTable + ' Mc with(nolock) ON 
								Mc.RealCategory = Pdt.Category '
				print @SQL
				print '@SelectFields : ' + @SelectFields
				print '@Acflagsql :' + @Acflagsql
				print '@SrcPdtTable : ' + @SrcPdtTable
				print '@CatPageTable : ' + @CatPageTable
				print '@CatMerchCatTable : ' + @CatMerchCatTable
				--select @SQL as sql into tempdb..sqltest
				--select * from tempdb..sqltest
				--drop table tempdb..sqltest
							
				IF @intAdDate > 1 
					SET @SQL = @SQL + ' AND PR.AdDate between mc.startDt and mc.enddt'
				
				--Changed by Hiren for CBE Load, Moved before Left Join
				IF @CBECnt > 0 
					SELECT @SQL = @SQL + ' AND Mc.Exclude = 0'
				
				IF @ShowAdType = 1 
				Begin
				SET @sql = @sql + @crlf + 
							'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailidInt'
				End
				
				--Start - Replace change for NF
				--NorPrice Changes
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice')
			
								
				IF @ShowEntryBrand = 1
				BEGIN
					SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					SET @CBEBrandField = 'PDT.EntryBrand'				
					
				END
				ELSE
				BEGIN
					--SET @BrandField = ' PDT.Brand '
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany'
				
		
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany'

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				--End - Replace change for NF

			
				IF @CBECnt = 0 
				BEGIN
					IF @CRMECnt > 0 
					BEGIN
						SELECT @SQL = @SQL + @vchrCrmeJoinClause
						SELECT @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					END
					SELECT @SQL = @SQL + ' OPTION (MAXDOP 16) '
					PRINT @SQL
					
					EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output,'With Exception @CBECnt = 0 -Insert into new fullstaging PDT table'
					Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
					IF @Return_Val <> 0
						Return
				ENd
				ELSE
				BEGIN 
					IF @CRMECnt > 0 
					BEGIN
						SELECT @SQL = @SQL + @vchrCrmeJoinClause
						SELECT @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					END
					SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'
					Print @SQL
					EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'@CBECnt > 0 -Insert into new fullstaging PDT table'
					Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
					IF @Return_Val <> 0
						Return					
					
					SET @insertFields=Replace(Replace(Replace( @InsertFields,'S.',''),'isNull(','') ,',0)','') +  Replace(Replace(replace(@Acflagsql,'S.',''),'isNull(','') ,',0)','')
					--SET @insertFields=LEFT(@insertFields,len(@insertFields) -1 )
					print @insertFields

					SELECT @SQL = 'INSERT INTO '+ @CatDetailTable + '(' +@insertFields + ')
									SELECT 
										'+ Replace(@SelectFields,'MC.','CBE.') + Replace(@Acflagsql,'MC.','CBE.') + ' 										
									FROM ' + 
										@SrcPDTTable + ' PDT with(nolock) JOIN ' + @CatPageTable + ' PR with(nolock) ON 
										PR.FlyerId=Pdt.FlyerId AND PR.Page=PDT.Page JOIN ' + @CBETable + ' Cbe with(nolock) ON ' + 
										@CBEBrandField + ' = Cbe.RealBrand AND 
										Pdt.Category = Cbe.RealCategory AND 
										Cbe.Exclude = 0'

					

					IF @ShowAdType = 1 
					Begin
					SET @sql = @sql + @crlf + 
								'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailidInt'
					End
					
					--Item 19534: Paramount - history start problems in MC and CBE nishant
					IF @intAdDate > 1 
					SET @SQL = @SQL + 'LEFT OUTER JOIN (SELECT Distinct RealCategory,Startdt,Enddt from '+@CatMerchCatTable+') TMC on Pdt.Category = TMC.RealCategory '
					
					IF @CRMECnt > 0 
					BEGIN
						SELECT @SQL = @SQL + @vchrCrmeJoinClause
						SELECT @SQL = @SQL + 
									' WHERE ' + 
										@vchrCrmeWhereClause 
					--Item 19534: Paramount - history start problems in MC and CBE nishant
						IF @intAdDate > 1
						SELECT @SQL = @SQL + ' AND pr.AdDate between tmc.startDt and tmc.enddt'
					END
					ELSE
					BEGIN
					--Item 19534: Paramount - history start problems in MC and CBE nishant
					IF @intAdDate > 1
						SELECT @SQL = @SQL + ' WHERE pr.AdDate between tmc.startDt and tmc.enddt'
					END

					SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'
				
					--Start - Replace change for NF
					--NorPrice Changes
					IF @bitIsNORUnit = 1
						SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
			
								
					IF @ShowEntryBrand = 1
					BEGIN
						--SET @SQL=Replace( @SQL,'PDT.Brand',' PDT.EntryBrand As Brand ')
						--SET @CBEBrandField = 'PDT.EntryBrand'
						SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
						SET @CBEBrandField = 'PDT.EntryBrand'	
					END
					ELSE
					BEGIN
						--SET @BrandField = ' PDT.Brand '
						SET @CBEBrandField = 'PDT.Brand'
					END
				
					IF @ShowEntryTaggedCompany = 1
						SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
		
					IF @ShowAdType = 1
						SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

					SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
					--End - Replace change for NF

					EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output	,'@CBECnt > 0-Insert records into newly created FullStagingPDT '
					print @SQL
					Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
					IF @Return_Val <> 0
						Return
					
					--CBE based uddate
					SELECT @SQL = 'UPDATE ' + 
										@CatDetailTable  + '
									SET MerchandiseCategory = Cbe.MerchandiseCategory, MerchandiseCategoryID = Cbe.MerchandiseCategoryID, 
										MerchandiseSubCat = Cbe.MerchandiseSubCat,MerchandiseSubCatID = Cbe.MerchandiseSubCatID,
										Category = Cbe.Category ,CategoryID = Cbe.CategoryID ,
										Brand = Cbe.Brand,BrandId = Cbe.BrandId
									FROM ' + 
										@CatDetailTable  + ' Pdt JOIN ' + @CBETable + ' Cbe ON 
										Pdt.Category = Cbe.RealCategory AND 
										Pdt.Brand = Cbe.RealBrand AND 
										Cbe.Exclude = 1 
									OPTION (MAXDOP 1) '
					PRINT @SQL
					EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'CBE based uddate FullStagingPDT'
					Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)	
					IF @Return_Val <> 0
						Return
				END
			END	
			ELSE
			/* Is CatCode of Child PDT Table*/
			BEGIN
				/* IF MC table is having the same cat code, build the pdt table based on MC table */
				/* ELSE build the child pdt table based on the child's cwm table and full master's pdt table*/
				--IF PARSENAME(@strMCTableName,1) = @CatCode + 'MerchandiseCategory' --NSTPREP	
				IF CHARINDEX('MerchandiseCategory',IsNull(@strMCTableName,''))>0 
				BEGIN
					
					SELECT @SQL = 'SELECT Distinct 
										' + @SelectFields + @Acflagsql + ' 
										INTO ' + @CatDetailTable  + ' 
								FROM ' + 
									@SrcPdtTable + ' PDT with(nolock) 
									INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON 
									PR.Flyerid = PDT.FlyerID  AND PR.Page=PDT.Page INNER JOIN ' + @CatMerchCatTable + ' Mc with(nolock) ON 
									MC.Category = PDT.Category'--VV12
									
									 
					IF @intAdDate > 1 
						SET @SQL = @SQL + ' AND pr.AdDate between mc.startDt and mc.enddt'									
					--AND pr.AdDate between mc.startdt and mc.enddt'
					--5.0 test - cat code switched mc.category back to mc.RealCategory
					-- and because DetailReports is the source, we flag this and we can skip some MPV processing time
					SET @SourceIsDetailReports = 1
					
				END
				ELSE
				BEGIN
						
					SELECT @SQL = 
								'
								SELECT ' + @SelectFields + @Acflagsql + ' 
									 INTO ' + @CatDetailTable  + '
									FROM ' + 
										@SrcPdtTable + ' Pdt with(nolock) INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON 
										PR.Flyerid = Pdt.FlyerID  AND PR.Page=PDT.Page 
										'--VV15
				END
				
				
				IF @ShowAdType = 1 
				Begin
				SET @sql = @sql + @crlf + 
							'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailidInt'
				End
				
				--Start - Replace change for NF
				--NorPrice Changes
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
			
								
				IF @ShowEntryBrand = 1
				BEGIN
					--SET @SQL=Replace( @SQL,'PDT.Brand',' PDT.EntryBrand As Brand ')
					SET @CBEBrandField = 'PDT.EntryBrand'
					--SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					--SET @CBEBrandField = 'PDT.EntryBrand'	
				END
				ELSE
				BEGIN
					--SET @BrandField = ' PDT.Brand '
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
		
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				--End - Replace change for NF


				print @SQL										 
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output		
				Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)
				IF @Return_Val <> 0
					Return
			END	
			
			Print '-- SQL Ends: ' + convert(varchar(100),current_timestamp,20)			
			
			
			IF @Return_Val <> 0
				return
			
			IF @bitOffer = 1 AND (@IsFull = 1 OR @IsFSI = 1) AND @BitCatLevelOffer = 1
				BEGIN
					IF @Debug = 0
					BEGIN
						EXECUTE dbo.PopulateOfferFields @CatCode,@CatDetailTable ,'MPVPageEvent',@isFull, @Debug--Pass CategoryLevel MPVPageEvent column
					END
					ELSE
						EXECUTE dbo.PopulateOfferFields @CatCode, @CatDetailTable,'MPVPageEvent',@isFull, @Debug--Pass CategoryLevel MPVPageEvent column
					Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)						
				END
				--5.0 Full staging created, run proc
				PRINT '--in 5.0 for full'

				--Start Create PK on CatCodeDetailReports
				
						INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'Create PK index on DetailReports ','Create PK index on FlyerReports', GETDATE()
	
						--Create PK index on FlyerReports
						set @SQL='
						IF NOT EXISTS(SELECT * FROM  sysindexes WHERE Name = ''PK_' + @CatDetailTable + '_PageDetailId'')
						BEGIN 	
							ALTER TABLE [' + @CatDetailTable + ']
							ADD CONSTRAINT [PK_' + @CatDetailTable + '_PageDetailId]
							PRIMARY KEY CLUSTERED
							(
							[PageDetailId] ASC
							)
						END'
						
						EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
					
						INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'Created PK index on DetailReports ','Created PK index on FlyerReports', GETDATE()
					Print '-- Index Ends: ' + convert(varchar(100),current_timestamp,20)

				
				
				--IF @Debug =0
				--	--Mod_Ver1 Start
				--	EXEC [mt_proc_Create_DetailReports_From_FV_PDTIdInt] @FlyerReportsPrefix, 'FullStaging', '', '', @CatCode, 1, @SourceIsDetailReports, @bitBuPC,0
				--ELSE
				--	EXEC [mt_proc_Create_DetailReports_From_FV_PDTIdInt] @FlyerReportsPrefix, 'FullStaging', '', '', @CatCode, 1, @SourceIsDetailReports, @bitBuPC,1
				--	----Mod_Ver1 Finish
				--	Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)
				--END 5.0
				--MPV forStaing
				
				--Fix up Offer for full
				
				
			--5.0 create MPV tables
			--no MPV is IsCatOnly=1
			IF @IsCatOnly=0
				BEGIN
			--	PRINT '--create MPV for 5.0'
			
					IF @Debug=0
						EXEC CreateMPVFieldsTables 'FullStaging', @SrcCatCode, '' , '', @CatCode, 1, @IsMaster, @bitOffer,@BitCatLevelOffer,0
					ELSE
						EXEC CreateMPVFieldsTables 'FullStaging', @SrcCatCode, '' , '', @CatCode, 1, @IsMaster, @bitOffer,@BitCatLevelOffer,1
				END
			--Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)


			----Call Concat Updates.
			IF @IsConCatUpdate = 1
			BEGIN				
				IF @Debug = 0
					EXECUTE ConcatUpdates @CatDetailTable,@SrcMpvTable,@CatMerchCatTable, @ConcatType,0
				ELSE
					EXECUTE ConcatUpdates @CatDetailTable,@SrcMpvTable,@CatMerchCatTable, @ConcatType,1
			END

		ENd	/*IF @IsFull = 1 OR @IsFSI = 1 */
		ELSE
		BEGIN
			/*PARTIAL*/
			

			print 'Before Dropping'	
			SELECT @SQL = 'IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N''[' + @catCode + 'IncrDetailReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @catCode + 'IncrDetailReports]'
			--PRINT @sql
			EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output,'drop CatCode IncrStagingDetailReports'			
			IF @Return_Val <> 0
				Return
			
			/*PARTIAL*/
			IF @CBECnt > 0 -- CWU | GAL | 
			BEGIN
									
				SELECT @SQL = 
							'
							SELECT ' + @SelectFields + @Acflagsql + ' 								
								INTO 
								'+@CatCodeIncrDetailReports+ '
							FROM ' + 
								@SrcPDTTable + ' Pdt with(nolock) INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON 
								PR.Flyerid = Pdt.FlyerId  AND PR.Page=PDT.Page INNER JOIN ' + @CatMerchCatTable + ' Mc with(nolock) ON 
								Mc.RealCategory = Pdt.Category
								AND Mc.EXCLUDE = 0'
								
						
				IF @intAdDate > 1 
					SET @SQL = @SQL + ' AND pr.AdDate between mc.startDt and mc.enddt'								
								--AND pr.AdDate between mc.startdt and mc.enddt'
				IF @ShowAdType = 1
					SET @sql = @sql + @crlf + 
								'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailidInt'
				IF @CRMECnt > 0 
				BEGIN
					SELECT @SQL = @SQL + @vchrCrmeJoinClause
					SELECT @SQL = @SQL + 
							' WHERE ' + 
								@vchrCrmeWhereClause
				END
				SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'

				--Start - Replace change for NF
				--NorPrice Changes
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
			
								
				IF @ShowEntryBrand = 1
				BEGIN
					--SET @SQL=Replace( @SQL,'PDT.Brand',' PDT.EntryBrand As Brand ')
					--SET @CBEBrandField = 'PDT.EntryBrand'
					SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					SET @CBEBrandField = 'PDT.EntryBrand'	
				END
				ELSE
				BEGIN
					--SET @BrandField = ' PDT.Brand '
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
		
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				--End - Replace change for NF


				PRINT @SQL
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Records inserted on IncrStagingDetailReports'
				IF @Return_Val <> 0
					Return
				--CBE Based Load
				
				--SET @SelectFields= Replace( @SelectFields,'MC.','CBE.') + Replace( @Acflagsql,'MC.','CBE.') 
				
							
				SELECT @SQL = 
							'
							INSERT INTO '+@CatCodeIncrDetailReports+ '
							SELECT 	' + Replace( @SelectFields,'MC.','CBE.') + Replace( @Acflagsql,'MC.','CBE.')  + ' 									
								FROM ' + 
									@SrcPDTTable + ' Pdt with(nolock) JOIN ' + @CatPageTable + ' PR with(nolock) ON 
									PR.FlyerId = Pdt.FlyerId  AND PR.Page=PDT.Page JOIN ' + @CBETable + ' Cbe with(nolock) ON ' + 
									@CBEBrandField + ' = Cbe.RealBrand AND 
									Pdt.Category = Cbe.RealCategory AND 
									Cbe.Exclude = 0 '
									
												
				--removed condition added in custom update to update last inserted records.					
				/*IF @ShowAdType = 1
					SET @sql = @sql + @crlf + 
										 'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailid'
				*/
				IF @CRMECnt > 0 
				BEGIN
					SELECT @SQL = @SQL + @vchrCrmeJoinClause
					SELECT @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
				END
				SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'
				
				--Start - Replace change for NF
				--NorPrice Changes
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
			
								
				IF @ShowEntryBrand = 1
				BEGIN
					--SET @SQL=Replace( @SQL,'PDT.Brand',' PDT.EntryBrand As Brand ')
					--SET @CBEBrandField = 'PDT.EntryBrand'
					SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					SET @CBEBrandField = 'PDT.EntryBrand'	
				END
				ELSE
				BEGIN
					--SET @BrandField = ' PDT.Brand '
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
		
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				--End - Replace change for NF
				

				print @SQL
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				IF @Return_Val <> 0
					Return
				--CBE Based Update
				SELECT @SQL = '
				UPDATE 
					'+@CatCodeIncrDetailReports+ '
				SET 
					MerchandiseCategory = Cbe.MerchandiseCategory, MerchandiseCategoryID = Cbe.MerchandiseCategoryID, 
					MerchandiseSubCat = Cbe.MerchandiseSubCat,MerchandiseSubCatID = Cbe.MerchandiseSubCatID,
					Category = CBE.Category, CategoryId = CBE.CategoryID, 
					Brand = CBE.Brand, BrandId = CBE.BrandID
				FROM 
					'+@CatCode+'IncrDetailReports Pdt JOIN ' + @CBETable + ' Cbe 
						ON Pdt.Category = Cbe.RealCategory AND 
						Pdt.Brand = Cbe.RealBrand AND 
						Cbe.Exclude = 1 
						OPTION (MAXDOP 1)'
				print @SQL
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'CBE Based Update for MerchandiseCategory,MerchandiseSubCat,Category,Brand'
				IF @Return_Val <> 0
					Return
			END
			ELSE
			BEGIN
				--Done : FSL(With Excep) | PEP 
				
			
					
				SELECT @SQL = '
				SELECT 
					' + @SelectFields + @Acflagsql + ' 					
					INTO 
					'+@CatCodeIncrDetailReports+ '
				FROM ' + @SrcPDTTable + ' Pdt with(nolock)
				INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON PR.flyerid = Pdt.FlyerID  AND PR.Page=PDT.Page 
				INNER JOIN ' + @CatMerchCatTable + ' Mc with(nolock) ON Mc.RealCategory = Pdt.Category'
				
			
				IF @intAdDate > 1 
					SET @SQL = @SQL + ' AND pr.AdDate between mc.startDt and mc.enddt'				
				--  AND pr.AdDate between mc.startdt and mc.enddt'
				--removed condition added in custom update to update last inserted records.
				/*
				IF @ShowAdType = 1
					SET @sql = @sql + @crlf + 
										 'LEFT OUTER JOIN MasterAdviewData.dbo.CanOneAdType at with (nolock) on pdt.pagedetailid = at.pagedetailid'
				*/
				IF @CRMECnt > 0 
				BEGIN
					SELECT @SQL = @SQL + @vchrCrmeJoinClause
					SELECT @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
				END
				SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'

				
				--Start - Replace change for NF
				--NorPrice Changes
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
			
								
				IF @ShowEntryBrand = 1
				BEGIN
					--SET @SQL=Replace( @SQL,'PDT.Brand',' PDT.EntryBrand As Brand ')
					--SET @CBEBrandField = 'PDT.EntryBrand'
					SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					SET @CBEBrandField = 'PDT.EntryBrand'	
				END
				ELSE
				BEGIN
					--SET @BrandField = ' PDT.Brand '
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
		
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				--End - Replace change for NF
				print @SQL
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				IF @Return_Val <> 0
					Return
			
				EXECUTE dbo.CreateDetailReports_Full @CatCode, @CatCodeIncrDetailReports, @CatPageTable, @SelectFields, @Acflagsql, @intAdDate, @CRMECnt, @vchrCrmeJoinClause, @vchrCrmeWhereClause, @bitIsNORUnit, @ShowEntryBrand, @CBEBrandField, @ShowEntryTaggedCompany, @TaggedCompanyField, @ShowAdType, @Return_Val, @Debug

			END
									
			IF @bitOffer = 1  AND @BitCatLevelOffer = 1
			BEGIN
				IF @Debug = 0
				BEGIN
					EXECUTE dbo.PopulateOfferFields @CatCode, @CatCodeIncrDetailReports, @CatMPVTable, @SrcMpvTable, @isFull, @Debug
				END
				ELSE
					EXECUTE dbo.PopulateOfferFields @CatCode, @CatCodeIncrDetailReports, @CatMPVTable, @SrcMpvTable, @isFull,  @Debug
			END
			--5.0
			--Instead of just inserting INTo catPDT, source is the IncrStagingDetailReports
			--Run 5.0 PDT procedures against this table as the source.
			
				--5.0 Full staging created, run proc
				PRINT '--in 5.0 for Incremental'
				--IF @Debug=0
				--	--Mod_Ver1 Start
				--	EXEC [mt_proc_Create_DetailReports_From_FV_PDTIdInt] @FlyerReportsPrefix, 'IncrStaging', '', '', @CatCode, 0, @SourceIsDetailReports, @bitBuPC,0--VV
				--ELSE
				--	EXEC [mt_proc_Create_DetailReports_From_FV_PDTIdInt] @FlyerReportsPrefix, 'IncrStaging', '', '', @CatCode, 0, @SourceIsDetailReports, @bitBuPC,1--VV
					--Mod_Ver1 Finish
				--END 5.0
			--END 5.0
			--SELECT @SQL = 'insert INTo ' + @CatPDTTable + ' SELECT * FROM IncrStagingDetailReports option (maxdop 1) '

			SET @bitRun = 1
			IF @bitOffer = 1 AND @isMaster = 0
				SET @bitRun = 0
			/* MPV for Partial */
			
			--SELECT @SQL = 'IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N''[IncrStagingMultiplePageValues]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			--drop table [IncrStagingMultiplePageValues]'
			--EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'drop IncrStagingMultiplePageValues if exist '
			
			----IF @bitRun = 1
			----BEGIN
			--	--SELECT @SQL = 'Insert INTo ' + IncrStagingMultiplePageValues + '
			--	SELECT @SQL = 'SELECT DISTINCT IncrStagingDetailReports.PageDetailID,
			--	FieldName,
			--	FieldValue
			--	into IncrStagingMultiplePageValues
			--	FROM ' + @SrcMPVTable + '
			--	Join IncrStagingDetailReports ON ' + @SrcMpvTable + '.PageDetailIdInt = 
			--	IncrStagingDetailReports.PageDetailID '--VV
			--	EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Create and Insert records into IncrStagingMultiplePageValues'
			--	IF @Return_Val <> 0
			--		Return
			----END
			
			PRINT '--create MPV tables for 5.0'

			if @IsCatOnly=0
			--No MPV for CatOnly
			BEGIN
			PRINT '--create MPV tables for 5.0'
			IF @DEBUG=0
				EXEC CreateMPVFieldsTables @CatCodeIncrDetailReports, @SrcCatCode, '', '', @CatCode, 0, 1, @bitOffer,0
			ELSE
				EXEC CreateMPVFieldsTables @CatCodeIncrDetailReports, @SrcCatCode, '', '', @CatCode, 0, 1, @bitOffer,1
			END
						
			Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)				
			/*PARTIAL*/
			
			--Call Concat Updates.
			IF @IsConCatUpdate = 1
			BEGIN
				--EXECUTE proc_ConCatUpdates_PDTIdInt @PDT,@MPV,@MC, @IsConcat
				IF @Debug = 0
					EXECUTE ConcatUpdates @CatCodeIncrDetailReports,@SrcMpvTable,@CatMerchCatTable, @ConcatType,0
				ELSE
					EXECUTE ConcatUpdates @CatCodeIncrDetailReports,@SrcMpvTable,@CatMerchCatTable, @ConcatType,1
			END
			
			--Start Mfr Update
			SELECT @SQL = 'update ' + @CatDetailTable + ' SET manufacturer = MFR.[Manufacturer],manufacturerID = MFR.[ManufacturerID]
					From ' + @CatDetailTable + ' PDT JOIN 
					MasterClientCoverage..TempPDTMFR MFR ON PDT.PageDetailID = MFR.PageDetailIDInt
					option (maxdop 1)'
							
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Partial-Update changed manufacturers'
			IF @Return_Val <> 0
				Return
				
			--Removed Can custom update from Pakage
			IF @srcCWMTable like '%CAN%' and (@isPDT = 1 or @IsCatOnly = 1)
			BEGIN	
			SELECT @SQL = 'update ' + @CatDetailTable + ' SET manufacturer = MFR.[Manufacturer],manufacturerID = MFR.[ManufacturerID]
					From ' + @CatDetailTable + ' PDT JOIN 
					MasterClientCoverage..TempPDTMFR_Can MFR ON PDT.PageDetailID = MFR.PageDetailIDInt
					option (maxdop 1)'
			
			
			EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output	,'Partial-Update changed manufacturers'
			IF @Return_Val <> 0
				Return
			END	
			--END Mfr Update
			IF @ShowAdType = 1
			BEGIN
			SET @SQL='	Update det
						SET det.TaggedCompany=at.AdType
						FROM '+@CatDetailTable+' det
						JOIN MasterAdviewData.dbo.CanOneAdType at
						ON det.PageDetailID=at.PagedetailIDInt AND det.TaggedCompany<>at.AdType'
				
			Print @SQL
			EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output,'update detailtable for TaggedCompany column '
			IF @Return_Val <> 0
					Return
			END

			SELECT @SQL = 'INSERT INTO ' +  @CatDetailTable  +'( ' +  @SelectFields + @Acflagsql + ' )		
						   SELECT ' + @SelectFields + @Acflagsql + '  FROM ' + @CatCodeIncrDetailReports + ' with(nolock) '
			SET @SQL=Replace (Replace(Replace(@SQL, 'PDT.',''),'PR.',''),'MC.','')
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Insert DetailData into Clients PDT from IncrDetailReports '


			--EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
			IF @Return_Val <> 0
				Return
			SELECT @SQL = 'IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N''[' + @CatCodeIncrDetailReports + ']'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @CatCodeIncrDetailReports + ']'
			--5.0 debug - not dropping for review after the fact
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output				
			IF @Return_Val < 0
				Return

		END
		/*PDT AND MPV*/
		--After Partial, common part
		/* Deleting pdt records based on category and brand for fsi */
		IF @IsFSI = 1
		BEGIN
		SELECT @SQL = 'DELETE FROM ' + @CatDetailTable + ' WHERE (Category in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked'')) OR (Brand in (''To Be Registered'', ''To Be Assigned'', ''Z - To Be Classified'', ''ZZ - Unsure'', ''ZZ - Untracked''))'
		EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Delete To Be Registered/To Be Assigned category records from CatDetailTable'
		IF @Return_Val <> 0
			Return
		END
		
		
		--canada client media detail update :19652
		IF @srcCWMTable='masterclientcoverage..EPCANChildWebMain' OR @srcCWMTable='masterclientcoverage..EPCANADChildwebmain' 
		BEGIN
		print 'canada client custom update for media detail'
		--SET @SQL='update '+@CatDetailTable+'
		--						SET Mediadetail=(case 
		--							WHEN Mediadetail=''Insert-Paper'' THEN ''Flyer'' , MediadetailID=22
		--							WHEN Mediadetail=''Insert-Digital'' THEN ''Flyer - Digital'' , MediadetailID=23
		--										END)
		--			WHERE  Mediadetail IN (''Insert-Paper'', ''Insert-Digital'')'

		SET @SQL='update '+@CatDetailTable+'
						SET Mediadetail=(case 
						 WHEN Mediadetail=''Insert-Paper'' THEN ''Flyer'' 
						 WHEN Mediadetail=''Insert-Digital'' THEN ''Flyer - Digital'' 
							END)
						 ,MediadetailID=(case 
						 WHEN Mediadetail=''Insert-Paper'' THEN 22
						 WHEN Mediadetail=''Insert-Digital'' THEN 23
							END)
						WHERE  Mediadetail IN (''Insert-Paper'', ''Insert-Digital'')'

		EXEC DebugOrExecute  @SQL, @Debug, @CatCode, @Return_Val output,'set Mediadetail column  as Flyer or Flyer-Digital'
		END
		--canada client media detail update :19652
		
		
		--Changes for PER to make the column size to 13 chars
		IF Upper(@CatCode) in ('PER','DRI', 'EML', 'bcr','bcrFTP','bfcFT','chfv','CWUa','dga','dgfv','glz','glzh','nws','prfv','prfvr','rndc','SWStest50','unl','wbg','pat','moeta','prfvb','futb50', 'dga50','mocb','pat50','HOR50T','ymkt','bcrftp50','BFCb50','DRI50','moet50','hbc','NHLC','pr50','CWU50','glzb50','rndcb50','rndcK','twine','galba','dgaD','adv10','adv10bf')  and  @IsFull = 1
		BEGIN
			SET @SQL = 'ALTER TABLE ' + @CatDetailTable + ' ALTER COLUMN OriginalPageDetailID VARCHAR(13) NOT NULL'
			
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'Alter PageDetailID column'
			
		END
		/* Deleting pdt records based on category and brand for fsi */
		
		--5.0 indexing in seperate procedure
		
		PRINT '--5.0 indexes ' + convert(varchar(100),current_timestamp,20)	
		IF @IsFull = 1
			BEGIN
				PRINT 'CategorycodeIndex ' + cast(@CatCode as varchar(50))
				IF @Debug=0
					BEGIN
						EXEC CategorycodeIndex @CatCode,0
					END
				ELSE
					BEGIN
						EXEC CategorycodeIndex @CatCode,1
					END
			
			END
		
		PRINT '--after indexes ' + convert(varchar(100),current_timestamp,20)		
		
		--Offer Changes
		
		IF @Index_Type = 1 OR @Index_Type = 2 OR @Index_Type = 3 OR @Index_Type = 4
		BEGIN
			IF @IsFull = 1
			BEGIN
			--deleted 5.0, indexes
				PRINT '--nothing for full needed here'
			END
			ELSE  -- partial
			BEGIN
				/* REINDEXING TABLES */
				SELECT @SQL = 'dbcc dbreindex ('+ @CatDetailTable +','''',90 )'
				--EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				--IF @Return_Val <> 0
				--	Return
			
			
				SELECT @SQL = 'dbcc dbreindex ('+ @CatMPVTable +','''',90 )'			
				--EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				--IF @Return_Val <> 0
				--	Return
			
				/* REINDEXING TABLES */
			END
		END -- IF @Index_Type = 1 OR @Index_Type = 2 OR @Index_Type = 3
		/*PDT Batch Update*/
		PRINT '--Batchupdate'
		EXECUTE BUUpdate @CatCode, @Debug, 1
		Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)
		IF @IsFull=0
		BEGIN
			PRINT '--Update Page/CWM Values on incremental updates for changed records'
			IF @Debug=0 
				EXEC mt_proc_Create_DetailReports_Flyer_Field_Update_pep @FlyerReportsPrefix, @CatCode,0
			ELSE
				EXEC mt_proc_Create_DetailReports_Flyer_Field_Update_pep @FlyerReportsPrefix, @CatCode,1
			Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)	
		END
		
		--PRINT '--Make sure IDs are updated after all custom updates'
		--IF @Debug=0
		--	EXEC mt_proc_Create_DetailReports_ID_Update @CatCode,0
		--ELSE 
		--	EXEC mt_proc_Create_DetailReports_ID_Update @CatCode,1
		Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)
		/*PDT Batch Update*/
		--EXECUTE dbo.procGenerateDisQueryPage @CatCode, @Debug
		PRINT '--5.0 query page'
		IF @Debug=0
			EXEC dbo.mt_proc_Create_DisplayTables @CatCode, 0, @bitOffer,0,0,0
		ELSE
			EXEC dbo.mt_proc_Create_DisplayTables @CatCode, 0, @bitOffer,0,0,1
		Print '-- SP Ends: ' + convert(varchar(100),current_timestamp,20)
		/*
		--Create DisOrigin And DisVariety Tables
		*/
		--Adview2Control Changes.	
		---- Addtional patch for dis brand ---
		IF @Debug = 0 
		
		begin
		set @sql = 'delete from  '+@catcode +'DisQueryPage where brand =  ''--- No brand assigned'''
		exec (@sql)
		end

		SELECT @strDate = CAST(getdate() AS VARCHAR(100))
		IF @ServerType = 'Master' OR (@ServerType = 'Client' and @@servername = 'MT2SQL00')
		BEGIN
			IF @IsFull = 1
			BEGIN
				SELECT @SQL = 'Update ' + @CategoryCodeTable + ' SET FullRunDate = ''' + @strDate + ''''
			END
			ELSE
			BEGIN
				SELECT @SQL = 'Update ' + @CategoryCodeTable + ' SET PartialRunDate = ''' + @strDate + ''''	
			END
			SELECT @SQL = @SQL + ' WHERE Category = ''' + @CatCode + '''' 
			IF @Debug = 0
			--5.0 blocking for testing
				EXEC(@SQL)	
			ELSE
				PRINT @SQL
		END
		ELSE
		BEGIN
			--CLIENT CHANGES
			IF @IsFull = 1
			BEGIN
				SELECT @SQL = 'Update ' + @CategoryCodeTable + ' SET ClientFullRundate = ''' + @strDate + ''''
			END
			ELSE
			BEGIN
				SELECT @SQL = 'Update ' + @CategoryCodeTable + ' SET ClientPartialRundate = ''' + @strDate + ''''	
			END
			SELECT @SQL = @SQL + ' WHERE Category = ''' + @CatCode + '''' 
			IF @Debug = 0
			--5.0 blocking for testing
				EXEC(@SQL)
			ELSE
				PRINT @SQL
		END
		--Adview2Control Changes.
		--ADIVEW2CONTROL CHANGES
		IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE XTYPE= 'U' and NAME = REPLACE(@CBETable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CBETable
			EXEC(@SQL)
			--EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output	
		END
	
		IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE XTYPE= 'U' and NAME = REPLACE(@CatMerchCatTable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CatMerchCatTable			
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output,'drop @CatMerchCatTable table'
		END
		IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE XTYPE= 'U' and NAME = REPLACE(@CRMETable,'tempdb..',''))
		BEGIN
			SET @SQL = 'DROP TABLE ' + @CRMETable
			EXEC(@SQL)
		END
		IF @Debug = 1 
		BEGIN
			PRINT  'DROP TABLE ' + @CBETable
			PRINT  'DROP TABLE ' + @CatMerchCatTable
			PRINT  'DROP TABLE ' + @CRMETable
		END
		--ADIVEW2CONTROL CHANGES
	
	END /*IF @IsPDT = 1*/
END
Print 'CreateClientTables_50 ended at '  + convert(varchar(100),current_timestamp,20)
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'End PDT','End PDT', GETDATE()		








GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_AdBlock_old]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Vipul Dholetar(vipuld@markettrack.com)
-- Create date: <11-29-2017>
-- Description:	<Creation of AdBlock tables with Full and Incremental data. Table will be used for FV query execution>
-- exec mt_proc_Create_AdBlock 'ddh',0
-- =============================================
Create PROCEDURE [dbo].[mt_proc_Create_AdBlock_old]
	@Category varchar(15)='',
	@IsDebug bit=0  --Values : "0 = Run / 1 = PRINT".
AS
BEGIN
	Declare @nSQL nvarchar(Max)=''
			,@SQL varchar(8000)=''
			,@DataDBPrefix varchar(15)=RIGHT(@@SERVERNAME,5)--'SQL02'
			,@ServerName varchar(15)=@@SERVERNAME--'MT2SQL02'
			,@IsFull Int
			,@PartialSourceCode varchar(50)
			,@FVCCType INT
			,@WhereClause varchar(max)=''

	SET NOCOUNT ON
	SET ANSI_WARNINGS ON
	/*
	Select MT2AClientServer,Count(1) 
	From CategorycodeTable 
	WHERE  ClientPDT=1 AND FVCCType=3
	Group by MT2AClientServer
	select top 11 * from categorycodelog order by 1 desc
	Drop Table CategoryCodeForAdBlock 

	Update CategoryCodeForAdBlock set adblockrun=1
	select * from categorycodetable where  ClientPDT=1 AND FVCCType=3 and clientserver=@@servername Order By ProcessOrder 
	Select * from CategoryCodeForAdBlock
	*/

	Select @IsFull = isfull From categorycodetable where category = @Category
	
	
		IF ISNULL(@IsFull,0)=1  --OR 1=1--Full
		BEGIN
			Set @SQL='
				IF OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'DetailReports]'', ''U'') IS NOT NULL
				BEGIN

				IF Not Exists(Select * From ' + @DataDBPrefix + '.dbo.sysindexes where name = ''idx_' + @Category + 'DetailReportsAdBlockId'')
				Begin
					CREATE NONCLUSTERED INDEX [idx_'+ @Category + 'DetailReportsAdBlockId] ON [' + @DataDBPrefix + '].[dbo].[' + @Category + 'DetailReports]
					(
						[AdBlockID] ASC
					) 
					INCLUDE ([PageDetailID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

					end

					/****** Object:  Index [idx_pgPepADBLOCK1]    Script Date: 11/29/2017 8:59:45 AM ******/

					IF Not Exists(Select * From ' + @DataDBPrefix + '.dbo.sysindexes where name = ''idx_' + @Category + 'ADBLOCK1'')
									Begin
					CREATE NONCLUSTERED INDEX [idx_'+ @Category + 'ADBLOCK1] ON [' + @DataDBPrefix + '].[dbo].[' + @Category + 'DetailReports]
					(	
						[ADBlockID] ASC,
						[FlyerId] ASC,
						[Page] ASC,
						[topleftx] ASC,
						[toplefty] ASC
					)
					INCLUDE ([PageDetailID],
						[OriginalPageDetailID],
						[MerchandiseCategory],
						[Category],
						[Brand],
						[Manufacturer],
						[MainOffer],
						[MPVOfferType],
						[Weight],
						[TaggedCompany],
						[Features],
						[UnitPrice],
						[SalePrice1]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

						end

					If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports]'', ''U'') IS NOT NULL
						Drop Table ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports]

					Select	Distinct adblockid
						,  Brand = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T3.Brand
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T3 with(nolock) 
							WHERE T3.adblockid = T.adblockid-- AND T3.Page = T.Page AND T3.TopLeftX = T.TopLeftX AND T3.TopLeftY = T.TopLeftY 
							FOR XML PATH(''''), ROOT(''Brand''), TYPE
							).value(''/Brand[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, Manufacturer = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T3.Manufacturer
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T3 with(nolock) 
							WHERE T3.adblockid = T.adblockid --AND T3.Page = T.Page AND T3.TopLeftX = T.TopLeftX AND T3.TopLeftY = T.TopLeftY 
							FOR XML PATH(''''), ROOT(''Manufacturer''), TYPE
							).value(''/Manufacturer[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, Category = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T2.Category
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''Category''), TYPE
							).value(''/Category[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, SalePrice1 = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + Cast(T2.SalePrice1 as Varchar)
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''SalePrice1''), TYPE
							).value(''/SalePrice1[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MainOffer = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + (Case When T2.MainOffer = '' '' Then NULL When T2.MainOffer = '''' Then NULL Else T2.MainOffer End)
							/* + T2.MainOffer */
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MainOffer''), TYPE
							).value(''/MainOffer[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MerchandiseCategory = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T2.MerchandiseCategory
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MerchandiseCategory''), TYPE
							).value(''/MerchandiseCategory[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MPVOfferType = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + (Case When T2.MPVOfferType = '''' Then NULL Else T2.MPVOfferType End)
							/*+ T2.MPVOfferType*/
							FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MPVOfferType''), TYPE
							).value(''/MPVOfferType[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
				Into ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports
				FROM [' + @DataDBPrefix + '].[dbo].' + @Category + 'DetailReports T with(nolock) 
				Option(maxdop 16)

	IF Exists(Select 1 From ' + @DataDBPrefix + '.INFORMATION_SCHEMA.columns where TABLE_NAME = ''' + @Category + 'AdBlockReports'' And COLUMN_NAME = ''AdBlockID'')
					ALTER TABLE ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports Alter Column [AdBlockID] Bigint Not NUll

				END'
		END
		Else--Partial
		BEGIN
			Set @SQL='If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]'', ''U'') IS NOT NULL
							Drop Table ['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]

						--For New+Updated records from TempACFVDetailReports table
						Select Distinct
						T.[AdBlockId]
						, T.Brand
						, T.Manufacturer
						, T.Category
						, T.SalePrice1
						, T.MainOffer
						, T.MerchandiseCategory
						, T.MPVOfferType
						INTO ['+@DataDBPrefix+'].[dbo].[INCR'+@Category+'AdblockReports]
						FROM ['+@DataDBPrefix+'].[dbo].['+@Category+'DetailReports] T 
						JOIN ACFVINCR..TempACFVAdBlock PDT
						ON T.AdBlockId = PDT.AdBlockId
						Option(maxdop 1)

						If OBJECT_ID(N''['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]'', ''U'') IS NOT NULL
							Drop Table ['+@DataDBPrefix+'].[dbo].['+@Category+'AdBlockReports_Stuff]

						Select	Distinct adblockid
						,  Brand = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T3.Brand
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T3 with(nolock) 
							WHERE T3.adblockid = T.adblockid-- AND T3.Page = T.Page AND T3.TopLeftX = T.TopLeftX AND T3.TopLeftY = T.TopLeftY 
							FOR XML PATH(''''), ROOT(''Brand''), TYPE
							).value(''/Brand[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, Manufacturer = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T3.Manufacturer
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T3 with(nolock) 
							WHERE T3.adblockid = T.adblockid --AND T3.Page = T.Page AND T3.TopLeftX = T.TopLeftX AND T3.TopLeftY = T.TopLeftY 
							FOR XML PATH(''''), ROOT(''Manufacturer''), TYPE
							).value(''/Manufacturer[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, Category = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T2.Category
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''Category''), TYPE
							).value(''/Category[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, SalePrice1 = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + Cast(T2.SalePrice1 as Varchar)
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''SalePrice1''), TYPE
							).value(''/SalePrice1[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MainOffer = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + (Case When T2.MainOffer = '' '' Then NULL When T2.MainOffer = '''' Then NULL Else T2.MainOffer End)
							/* + T2.MainOffer */
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MainOffer''), TYPE
							).value(''/MainOffer[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MerchandiseCategory = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + T2.MerchandiseCategory
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MerchandiseCategory''), TYPE
							).value(''/MerchandiseCategory[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
						, MPVOfferType = LTRIM(RTRIM(STUFF((
							SELECT DISTINCT ''; '' + (Case When T2.MPVOfferType = '''' Then NULL Else T2.MPVOfferType End)
							/* + T2.MPVOfferType */
							FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T2 with(nolock) 
							WHERE T2.adblockid = T.adblockid
									--AND T2.[Page] = T.[Page]
									--AND T2.[topleftx] = T.[topleftx]
									--AND T2.[toplefty] = T.[toplefty]
							FOR XML PATH(''''), ROOT(''MPVOfferType''), TYPE
							).value(''/MPVOfferType[1]'',''VARCHAR(MAX)'')
							, 1, 1, '''')))
				Into ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports_Stuff
				FROM [' + @DataDBPrefix + '].[dbo].[INCR'+@Category+'AdblockReports] T with(nolock) 
				Option(maxdop 16)



						
						Delete PDT
						FROM ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports] PDT
						INNER JOIN ['+@DataDBPrefix+'].[dbo].[' + @Category + 'AdBlockReports_Stuff] T with(nolock) 
						ON T.AdBlockId = PDT.AdBlockId 
						option(maxdop 1)

						INSERT INTO ['+@DataDBPrefix+'].[dbo].['+@Category+'AdblockReports] (adblockid, Brand, Manufacturer, Category, SalePrice1, MainOffer, MerchandiseCategory, MPVOfferType)
						SELECT adblockid, Brand, Manufacturer, Category, SalePrice1, MainOffer, MerchandiseCategory, MPVOfferType
						FROM ['+@DataDBPrefix+'].[dbo].[' + @Category + 'AdBlockReports_Stuff] with(nolock) 
						Option(maxdop 1)'
		END
		If @IsDebug=0
		Begin
	
			Insert Into CategoryCodeLog(CategoryCode,Details,SQL,QueryTime) Values(@Category,'START: AdBlock update for '+@Category+' IsFull='+Cast(@IsFull as varchar(1)),@SQL,getdate())
			Exec('Update ['+@DataDBPrefix+'].[dbo].[CategoryCodeForAdBlock] Set RunStartTime=getdate() Where Category='''+@Category+'''')
			Exec  (@SQL)
			
	
		End

		Else
			Print (@SQL)

		IF ISNULL(@IsFull,0)=1  --OR 1=1--Full
		BEGIN
				SET @SQL = '

				IF Not Exists(Select 1 From ' + @DataDBPrefix + '.INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = ''' + @Category + 'AdBlockReports'' And CONSTRAINT_NAME = ''PK_' + @Category + 'AdblockReports'')
					ALTER TABLE ' + @DataDBPrefix + '.dbo.' + @Category + 'AdBlockReports ADD  CONSTRAINT [PK_' + @Category + 'AdblockReports] PRIMARY KEY CLUSTERED ([AdBlockID])'

					If @IsDebug=0
		Begin
	
			
			Exec  (@SQL)
			Exec('Update ['+@DataDBPrefix+'].[dbo].[CategoryCodeForAdBlock] Set RunEndTime=getdate() Where Category='''+@Category+'''')
			Insert Into CategoryCodeLog(CategoryCode,Details,SQL,QueryTime) Values(@Category,'END: AdBlock update for '+@Category+' IsFull='+Cast(@IsFull as varchar(1)),@SQL,getdate())
	
		End

		Else
			Print (@SQL)
		End

	

END
GO

/****** Object:  StoredProcedure [dbo].[CustomstepSP_asmpep]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomstepSP_asmpep]
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin

Declare @SQL NVARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

IF @Category='asmpep' and @Flag=1
Begin


SET @SQL='if exists(select * from tempdb.sys.objects where name = '''+@category+'tempptsg'' and type=''u'')
			drop table tempdb.dbo.'+@category+'tempptsg'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

SET @SQL='select * into tempdb.dbo.'+@category+'tempptsg from '+@vchrControDbPrefix+@category+'tempptsg'
If @IsDebug = 1
		Print @SQL
	Else
		Exec (@SQL)

Set @SQL='UPDATE PDT 
	SET PDT.ProductTerritorySubGroup=CU.BrandGroup
	FROM ' + @Category + 'DetailReports PDT
	INNER JOIN tempdb.dbo.'+@category+'tempptsg CU
	ON PDT.Manufacturer=CU.Manufacturer 
	where isnull(PDT.ProductTerritorySubGroup,'''')!=CU.BrandGroup
	Option (Maxdop 1)'
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	Set @SQL='EXEC mt_proc_Create_ID_Update ''' + @Category + 'DetailReports'', ''ProductTerritorySubGroup'''
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)


SET @SQL='Exec mt_proc_Create_DisplayTables '''+@Category+''' '
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)	

	End 
End 


GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_sbaPep]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[CustomStepSP_sbaPep] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_sbaPep] 'sbaPep',1,1
Declare @SQL NVARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

If @Category in  ('sbaPep') and @Flag=1
Begin
	
Set @SQL='Update PDT Set ProductTerritoryGroup=T.CompetitiveGroup,ProductTerritory=T.CompetitiveSet
			from '+@Category+'DetailReports PDT
			join '+@vchrControDbPrefix+'ehusPEPCompetitiveSetGroup T
			on T.Manufacturer=PDT.Manufacturer and T.Category=PDT.Category
			where isnull(PDT.ProductTerritory,'''')<>T.CompetitiveSet'

	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

Set @SQL='Exec mt_proc_Create_ID_Update '''+@Category+'DetailReports'', ''ProductTerritory'''
    IF @IsDebug=1
        Print @SQL
    Else
        Exec (@SQL)

Set @SQL='Exec mt_proc_Create_ID_Update '''+@Category+'DetailReports'', ''ProductTerritoryGroup'''
    IF @IsDebug=1
        Print @SQL
    Else
        Exec (@SQL)

Set @SQL='Exec mt_proc_Create_DisplayTables '''+@Category+''''
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

End

End



GO

/****** Object:  StoredProcedure [dbo].[CustomStepSp_sePEP]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CustomStepSp_sePEP](
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_sePEP] 'sePEP',1,1
declare @alt nvarchar(max)
declare @sql nvarchar(max)
declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

if @Category='sePEP' and @flag=1
begin

	set @alt='If Exists (select top 1 name from tempdb.dbo.sysobjects where xtype=''u'' and name='''+@Category+'BUComDescAssignment'')
		Drop Table tempdb.dbo.'+@Category+'BUComDescAssignment'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @alt='select * into tempdb.dbo.'+@Category+'BUComDescAssignment from ' + @vchrControDbPrefix + ''+@Category+'BUComDescAssignment'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @alt='update a set a.ProductTerritorySubGroup=b.BU_Desc_PTSG, ProductTerritoryGroup=b.Com_Desc_PTG
	from '+@category+'detailreports a
	inner join tempdb..'+@category+'BUComDescAssignment b
	on a.Category=b.Category 
	where (Isnull(ProductTerritorySubGroup,'''')<>BU_Desc_PTSG or Isnull(ProductTerritoryGroup,'''')<>Com_Desc_PTG)'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @Alt='
	Exec mt_proc_Create_ID_Update '''+@category+'detailreports'', ''ProductTerritorySubGroup''
	Exec mt_proc_Create_ID_Update '''+@category+'detailreports'', ''ProductTerritoryGroup''
	
	exec mt_proc_Create_DisplayTables'''+@Category+''''
	If @IsDebug = 1
		Print @Alt
	Else
		Exec (@Alt)
end
end

GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DetailReports_Flyer_Field_Update_PEP]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--Exec mt_proc_Create_DetailReports_Flyer_Field_Update_pep 'walpep', 'walpep',1
--mt_proc_Create_DetailReports_Flyer_Field_Update 'morcc', 'morcc',0
-- =============================================
-- Author:		jhetler
-- Create date: Feb 2011
-- Description:	Updates the Flyers Fields in the DetailReport table
-- =============================================
CREATE PROCEDURE [dbo].[mt_proc_Create_DetailReports_Flyer_Field_Update_PEP]

 @sourceCWMCode as varchar(20),
 @destCode as varchar(20),
 @IsDebug bit=0  --Values : "0 = Run / 1 = Print".

AS
BEGIN
PRINT '-- START mt_proc_Create_DetailReports_Flyer_Field_Update SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Detailreports Flyer filed update started ','Detailreports Flyer filed update started ', GETDATE()	
	
	SET NOCOUNT ON;
	DECLARE @SQL as varchar(MAX)='',	
			@destTable as varchar(50),
			@SourceLocation as varchar(100),
			@TotalRecord Int,
			@DeletableRecord Int,
			@NSQL as NVarchar(1500),
			@emailbody Varchar(max),
			@destCWMTable Varchar(100) ,
			@PercentageValue tinyint,
			@Subject Varchar(500),
			@Ratio Decimal(10,6),
			@ISInteger Int
		
	SELECT 
		@ISInteger  = ISNULL(IsIntegerID,0) 
	FROM 
		CategoryCodeTable 
	WHERE 	
		Category=@sourceCWMCode
	
	Set @destTable = @destCode + 'DetailReports'
	SET @destCWMTable = @sourceCWMCode + 'FlyerReports'
	
	SELECT 
		@PercentageValue = CategoryValue
	FROM 
		Tbl_Lookup	
	WHERE
		CategoryType = 'PercentageDeleteRecord'
	
	--delete unreferenced flyer :Item :19279	
	SET @SQL=
		'DELETE 
			PDT 
		FROM ' + 
			@destTable + ' PDT JOIN MasterClientCoverage.dbo.AdviewMainDELETE DEL ON 
			PDT.FlyerId= DEL.FlyerID LEFT OUTER JOIN MasterClientCoverage.dbo.AdviewMainUPDATE UPDT on 
			DEL.FlyerID = UPDT.FlyerID
		WHERE 
			UPDT.FlyerID IS NULL'
	
	-- End 19279
	
	IF @IsInteger = 1 
		BEGIN
			SET @SQL = REPLACE(@SQL,'PDT.FlyerId= DEL.FlyerID LEFT OUTER JOIN','PDT.OriginalFlyerID= DEL.FlyerID LEFT OUTER JOIN')	
		END
		
	--PRINT @SQL
	--changed by prakash 25/06/2013
	If @IsDebug=0
		BEGIN
			EXECUTE(@SQL)
		END
	ELSE
		BEGIN
			PRINT(@SQL)
		END
			
	
	--#Item :19929
	SET @NSQL = 
		'SELECT 
			@TotalRecord = COUNT(1) 
		FROM ' + 
			@destTable + ' PDT'
	--PRINT @NSQL		
	
	--changed by prakash 25/06/2013
	If @IsDebug=0
		BEGIN
			EXECUTE sp_executesql @NSQL, N'@TotalRecord INT output', @TotalRecord output				
		END
	ELSE
		BEGIN
			PRINT(@NSQL)
		END
						
	SET @NSQL = 
		'SELECT 
			@DeletableRecord = COUNT(1) 
		FROM ' + 
			@destTable + ' PDT LEFT OUTER JOIN ' + @destCWMTable + ' CWM on 
			CWM.FlyerID = PDT.FlyerID
        WHERE 
			CWM.FlyerID IS NULL'
	--PRINT @NSQL		
					
	--changed by prakash 25/06/2013
	If @IsDebug=0
		BEGIN
			EXECUTE sp_executesql @NSQL, N'@DeletableRecord INT output', @DeletableRecord output				
		END
	ELSE
		BEGIN
			PRINT(@NSQL)
		END
			
	--PRINT CAST(@TotalRecord  as Varchar(10)) + ' - ' + CAST(@DeletableRecord  as Varchar(10)) + ' - ' + Cast(@PercentageValue as Varchar(2)) + '.'
	
	IF @DeletableRecord > 0
		Select @Ratio = (Cast(@DeletableRecord as Decimal(10,2))* 100)/Cast(@TotalRecord as Decimal(10,2))
	Else
		Select @Ratio = 0
	
	PRINT @Ratio
	IF @Ratio > 0 AND @Ratio <= @PercentageValue 
		BEGIN
			--#Item - 22337 Started
			Declare @OrphanedInsert varchar(max)=''
			Declare @OrphanedSelect varchar(max)=''
			Set @NSQL='
						SELECT 	@OrphanedInsert = COALESCE(@OrphanedInsert ,'''') + LTRIM(RTRIM(COLUMN_NAME)) +'',''
						FROM INFORMATION_SCHEMA.COLUMNS
						WHERE  table_name in ('''+@destTable+''','''+@destCode+'DetailReports_Orphaned'')
						Group by COLUMN_NAME,DATA_TYPE
						having Count(1)=2
						'

			EXECUTE sp_executesql @NSQL, N'@OrphanedInsert varchar(max) output', @OrphanedInsert output
			If Isnull(@OrphanedInsert,'')<>''
			Begin
			Set @OrphanedInsert=Left(@OrphanedInsert,len(@OrphanedInsert)-1)
			Set @OrphanedSelect='PDT.'+replace(@OrphanedInsert,',',',PDT.')
			Print @OrphanedInsert
			Print @OrphanedSelect
			End
			If Isnull(@OrphanedInsert,'')<>''
			SET @SQL = 
				'IF EXISTS (SELECT Top 1 * FROM ' + 'SYS.SYSOBJECTS 
							WHERE NAME = ''' + @destCode + 'DetailReports_Orphaned'' AND TYPE = ''U'' )
					BEGIN
						INSERT INTO dbo.' + @destCode + 'DetailReports_Orphaned('+@OrphanedInsert+',Orphaned_DateTime) 
						SELECT 
							'+@OrphanedSelect+', Getdate() as Orphaned_DateTime 
						FROM 
							dbo.' + 
							@destTable + ' PDT LEFT OUTER JOIN dbo.' + @destCWMTable + ' CWM on 
							CWM.FlyerID = PDT.FlyerID
						WHERE 
							CWM.FlyerID IS NULL
						
						DELETE FROM dbo.' + @destCode + 'DetailReports_Orphaned WHERE Orphaned_DateTime < Dateadd(D, -7, Getdate())
					END'
				ELSE
				SET @SQL = 'SELECT 
						PDT.*, Getdate() as Orphaned_DateTime 
					INTO dbo.' + @destCode + 'DetailReports_Orphaned 	
					FROM 
						dbo.' + @destTable + ' PDT LEFT OUTER JOIN dbo.' + @destCWMTable + ' CWM on 
						CWM.FlyerID = PDT.FlyerID
					WHERE 
						CWM.FlyerID IS NULL
				'
			--changed by prakash 25/06/2013
			If @IsDebug=0
				BEGIN
					EXECUTE(@SQL)
				END
			ELSE
				BEGIN
					PRINT(@SQL)
				END
			
			
			--#Item - 22337 End				
		
			SET @SQL=
				'DELETE 
					PDT 
				FROM ' + 
					@destTable + ' PDT LEFT OUTER JOIN ' + @destCWMTable + ' CWM on 
					CWM.FlyerID = PDT.FlyerID
				WHERE 
					CWM.FlyerID IS NULL'
			--PRINT @SQL
			--changed by prakash 25/06/2013
			If @IsDebug=0
				BEGIN
					EXECUTE(@SQL)
				END
			ELSE
				BEGIN
					PRINT(@SQL)
				END
			
			
			SET @Subject = 'Orphaned Records Deleted For ' + @destCode + ' Code on ' + @@ServerName
			SET @emailbody = @destCode + ' Code has ' + CAST(@DeletableRecord as Varchar(8)) + ' Orphaned Records. They have been deleted.'
			EXEC MASTER.dbo.mt_proc_send_cdosysmail 
				@From= 'sql@markettrack.com', 
				@to='krunals@markettrack.com,vkantawala@markettrack.com,pmakwana@markettrack.com', --,FVDataLoad@markettrack.com
				@subject=@Subject,
				@body=@emailbody,
				@bodytype='html',
				@Priority=1									
		END
	ELSE IF @Ratio > @PercentageValue
		BEGIN
		
			SET @Subject = Cast(Round(@Ratio,2) as Varchar(10)) + '% Orphaned Records For ' + @destCode + ' Code on ' + @@ServerName
			SET @emailbody = @@Servername + ' - ' + @destCode + ' Code has ' + CAST(@DeletableRecord as Varchar(8)) + ' Orphaned Records.'
			EXEC MASTER.dbo.mt_proc_send_cdosysmail 
				@From= 'sql@markettrack.com', 
				@to='krunals@markettrack.com,vkantawala@markettrack.com,pmakwana@markettrack.com,kram@markettrack.com', --,jhetler@markettrack.com,FVDataLoad@markettrack.com
				@subject= @Subject,
				@body=@emailbody,
				@bodytype='html',
				@Priority=2
		END
		
	--#Item :19929 END

	


	Set @SQL= '
				  Update A
					SET 
							A.img = B.img
							, A.advertiserid = B.advertiserid
							, A.advertiser = B.advertiser
							, A.marketid = B.marketid
							, A.market = B.market
							, A.retmktid = B.retmktid
							, A.mediaid = B.mediaid
							, A.media = B.media
							, A.publicationid = B.publicationid
							, A.publication = B.publication
							, A.tradeclassid = B.tradeclassid
							, A.tradeclass = B.tradeclass
							, A.addate = B.addate
							, A.weekof = B.weekof
							, A.salestartdate = B.salestartdate
							, A.saleenddate = B.saleenddate
							, A.pages = B.pages
							, A.publishedon = B.publishedon
							, A.districtid = B.districtid
							, A.district = B.district
							, A.countryid = B.countryid
							, A.country = B.country
							, A.weekofn = B.weekofn
							, A.weekofi = B.weekofi
							, A.admonth = B.admonth
							, A.admonthid = B.admonthid
							, A.adday = B.adday
							, A.addayid = B.addayid
							, A.vehicleid = B.vehicleid
							, A.creationmonth = B.creationmonth
							, A.imagename = B.imagename
							, A.pagename = B.pagename
							, A.fvsystempage = B.fvsystempage
							, A.fvdisplaypage = B.fvdisplaypage
							, A.frontpageind = B.frontpageind
							, A.backpageind = B.backpageind
							, A.ChannelId = B.ChannelId
							, A.Channel = B.Channel
					From ' + @destTable + ' A with(nolock)
					JOIN ACFVINCR.dbo.TempACFVAdLevelUpdates B with(nolock) ON A.pagedetailid = B.pagedetailid
					Option (maxdop 1)
		  '
	 --PRINT @SQL
	--IF @IsInteger = 1 
	--	BEGIN
	--		SET @SQL = REPLACE(@SQL,'AND PageReports.Flyerid in (','AND PageReports.OriginalFlyerID in (')	
	--	END	 
	 --changed by prakash 25/06/2013
			If @IsDebug=0
				BEGIN
					EXECUTE(@SQL)
				END
			ELSE
				BEGIN
					PRINT(@SQL)
				END
			
PRINT '-- END mt_proc_Create_DetailReports_Flyer_Field_Update SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Detailreports Flyer filed updated','Detailreports Flyer filed updated', GETDATE()	
		
END



GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports_INCRCWM]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[CreateFlyerReports_INCRCWM]
(
	@CatCode VARCHAR(20),
	@SourceCWM VARCHAR(100),
	@IsDebug bit = 1,
	@IncrLoad Bit = 0,	
	@WHEREClause VARCHAR(8000) = ' WHERE 1=1 ',
	@FetchRetMktID bit = 0


)
AS

BEGIN

	Declare @ServerType AS VARCHAR(20)
			,@strDate AS DateTime
			,@IsDAA Bit
			,@CWMFULL bit = 0
			,@ClientID integer
			,@CategoryCodeId integer
			,@CodeID integer
			,@vchrHSPClause VARCHAR(50)=''
			,@bitHSP BIT
			,@CWMTableName VARCHAR(100)
			,@SQL VARCHAR(Max) = ''
			,@mapSQL VARCHAR(max)=''
			,@FieldNames VARCHAR(max) = ''
			,@CTFieldNames VARCHAR(max) = ''
			,@CWMExpSql VARCHAR(Max) = ''			
			,@RetMktIdFlag bit =0
			,@RetIdFlag bit =0
			,@MktIdFlag bit =0
			,@TcIDFlag bit =0
			,@SqlMcc VARCHAR(MAX) = ''
			,@DeleteFilterClause VARCHAR(Max) = ''
			,@strTempRetMktTableName AS VARCHAR(100)=''
			,@Return_Val int
			,@InsertFieldNames AS VARCHAR(MAX)
			,@CTInsertFieldNames AS VARCHAR(MAX)
			,@CwmChangeCounter tinyint
			,@lTableName VARCHAR(100)
			,@lIsWeekOf bit
			,@lIsEvent bit
			,@lIsTheme bit
			,@lIsPublication bit
			,@intCategoryCodeId int
			--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT TinyInt
			--Changes End
			,@Nsql nvarchar(max)
			,@IsMaster Int
			,@DBName Varchar(20) = DB_Name()
			,@IsInteger Int
			,@BuCH Bit
			,@CWMTableSP varchar(100) = @CatCode + 'FlyerReports'
			,@ClientCWMExceptionFlag BIT=0		
			,@IncrAdRun Bit
			,@IsAdlert Bit
			,@Clientid_TBL_Lookup INT
			,@ID_Tbl_Lookup INT
			,@stagingcolumns varchar(max)
			,@vchrControDbPrefix varchar(100)
			
			SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
	PRINT '-- START CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)			
	
	-- Commented by Hiren
	SET @strTempRetMktTableName = 'TempRetMkt' + @CatCode
	
	IF @FetchRetMktID = 1  
		SET @IsDebug = 1	
		
	--IF  EXISTS (SELECT * FROM sys.sysobjects WHERE name = N'tbl_lookup' AND Type='U')
	--	Exec SP_Rename 'tbl_lookup','New_tbl_lookup';
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2ASQL06].[SiteControl].[dbo].[CategoryCode]
							
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR
														[MT2ASQL06].[SiteControl].[dbo].[TableNames]														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
														
																												
			--Temporary commented as Access is not given on MT2aSQL06 server

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A')
				DROP SYNONYM [dbo].[Connection_MT2A]

			CREATE SYNONYM [dbo].[Connection_MT2A] FOR [MT2aSQL06].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2A_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2A_NightlyProcessing] FOR [MT2aSQL06].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				dbo.Connection_MT2A
			WHERE
				ServerName = @@SERVERNAME
			
			SELECT 
				@strDate = MAX(CWMStart) + 1 
			FROM 
				Connection_MT2A_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL01'
			
		END
	ELSE
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR [MT2SQL14].[SiteControl].[dbo].[CategoryCode]

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR [MT2SQL14].[SiteControl].[dbo].[TableNames]														
														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
																												
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2')
				DROP SYNONYM [dbo].[Connection_MT2]

			CREATE SYNONYM [dbo].[Connection_MT2] FOR [MT2SQL14].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2_NightlyProcessing] FOR [MT2SQL14].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				Connection_MT2
			WHERE
				ServerName = @@SERVERNAME
				
			SELECT 
				@strDate =  MAX(CWMStart) + 1 
			FROM 
				Connection_MT2_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL00'
			
		END
		
	SELECT 
		@CWMFULL = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN 1 ELSE CWMFull END, 
		@SourceCWM = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN @SourceCWM ELSE SourceCWM END,
		@CategoryCodeId = [id],
		@ClientID = ClientId ,
		@ISDAA = ISNULL(ISDAA, 0),
		@intCategoryCodeId=ID
		--Changes done by Hiren for Item #19777
		,@IsEmail = IsNull(IsEmail, 0)
		,@IsCT = IsNull(IsCT, 0)
		--Changes End
		--Temporary Integer Based ID Changes
		,@IsMaster = IsNULL(IsMaster,0)
		,@IsInteger = IsNULL(IsIntegerID,0)
		,@BuCH = ISNULL(BuCH,0)
		,@IncrAdRun = ISNULL(IncrAdRun,0)
		,@IsAdlert = ISNULL(IsAdlert,0)
		--Changes End		
		
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @CatCode 

		
	IF @IncrLoad = 1 AND @IncrAdRun = 1 
		SET @IncrAdRun = 1
	ELSE
		SET @IncrAdRun = 0

	IF @FetchRetMktID = 0
		BEGIN
			PRINT '--@CatCode = ' + CAST(@CatCode AS VARCHAR(50))
			PRINT '--@CWMFULL = ' + CAST(@CWMFULL AS VARCHAR(50))
			PRINT '--@SourceCWM = ' + CAST(@SourceCWM AS VARCHAR(50))
			----########################## CWM LOAD  ##########################
			PRINT '-- CWM LOAD START : ' + CONVERT(VARCHAR(100),CURRENT_TIMESTAMP,20)
		END

	SET @vchrHSPClause = ''
	
	IF EXISTS(SELECT 1 FROM MasterClientCoverage..MasterClientCWMPEP WHERE CategoryCodeId =@CategoryCodeId  AND IsHSP = 1)
		BEGIN
			SET @bitHSP = 1
			SET @vchrHSPClause = ', ISNULL(IsHSP,0) IsHSP '
		END
	
		
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempPageReports')
		DROP SYNONYM [dbo].[TempPageReports]

	EXEC ('CREATE SYNONYM [dbo].[TempPageReports] FOR dbo.' + @CatCode + 'PageReports')
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempCatCodeCWM')
		DROP SYNONYM [dbo].[TempCatCodeCWM]

	EXEC ('CREATE SYNONYM [dbo].[TempCatCodeCWM] FOR dbo.' + @CatCode + 'ChildWebMain')
	
	


	--Hiren CWM Level Refresh
	Print 'Divyang need to start below things'
	Print '@CWMFULL = 0'
	Print '@IncrAdRun = 1'
	Print '@IsMaster = 0'

	--SET @CWMFULL = 0
	--SET @IncrAdRun = 1
	--SET @IsMaster = 0
	IF @CWMFULL = 1 AND ISNULL(@IncrAdRun,0) = 0
	BEGIN
		SET @CwmTableName =  @CatCode +'FullFlyerReports'
	END
	Else
	Begin
		SET @CwmTableName =  @CatCode +'INCRFlyerReports'
	End
	
	
	Print @IncrAdRun
	Print @SourceCWM

	IF @IncrAdRun = 1 
	Begin
			SET @SourceCWM = REPLACE(REPLACE(@SourceCWM, 'MasterACFV', 'ACFVINCRCWM'), 'ACFVFlyerReports', 'TempACFVFlyerReports')
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'Start to delete exisiting flyers for IncrFlyerReports','Start to delete exisiting flyers for IncrFlyerReports', GETDATE()		
			SET @SQL =	'
							-- Delete Incremental Records From FlyerReports and PageReports Table
							DELETE Main 
							FROM ' + @CatCode +'FlyerReports Main 
							INNER JOIN ' + @SourceCWM + ' INCR ON Main.FlyerID=INCR.FlyerID
					
							DELETE Main 
							FROM ' + @CatCode +'PageReports Main 
							INNER JOIN ' + @SourceCWM + ' INCR ON Main.FlyerID=INCR.FlyerID
						'

			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL 	
				
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'deleted exisiting flyers for IncrFlyerReports','deleted exisiting flyers for IncrFlyerReports', GETDATE()		
			
			IF CHARINDEX('FlyerReports',@SourceCWM,1) > 0 
				SET @SourceCWM = @SourceCWM 
			ELSE
				SET @SourceCWM = @SourceCWM + 'Incr'
			
		END
		--Would be SET blank for exceptional catcodes like "Mac"
	----------P1
	
	IF @SourceCWM <> '' 
		BEGIN
			-- Commented By Hiren
			-- AND @CatCode NOT IN('ad21','ad22','ad23','ad24','ad25') -- Not in Use
			--DROP & Create CWM TABLE
			SET @SQL = 'IF EXISTS (	SELECT 1 
									FROM 
										SYSOBJECTS 
									WHERE 
										ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
										OBJECTPROPERTY(id, N''IsUserTable'') = 1)
						DROP TABLE [dbo].[' + @CWMTableName + ']'
			--PRINT @SQL
			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL  

			SELECT 
						@FieldNames = COALESCE(@FieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'FLYERInsert' order by id 
					SET @FieldNames = REPLACE(@FieldNames, 'S.CAST(' , 'CAST(')
					

					SELECT @InsertFieldNames = COALESCE(@InsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'Flyer' order by id 
		print 'Field List'
		print @fieldnames
		print @insertfieldnames 

		--Changes done by Hiren for Item #19777
		Declare @SourceDB Varchar(100)=''
				,@TableName Varchar(100)
				
		IF CharIndex('.', @SourceCWM,1)>0 
		BEGIN
				SET @SourceDB = SUBSTRING(@SourceCWM,1,CharIndex('.', @SourceCWM, 1)-1) + '.'
				SET @TableName = SUBSTRING(@SourceCWM,CharIndex('.', @SourceCWM, 1)+ 2,LEN(@SourceCWM)-CharIndex('.', @SourceCWM, 1))
		END
		Print ''	
		print 'Source Database: ' + @SourceDB
		print 'Source TableName: ' + @TableName
			
			
			
				IF @isCT=1
				BEGIN

					SELECT 
						@CTFieldNames = COALESCE(@CTFieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'
					SET @CTFieldNames = REPLACE(@CTFieldNames, 'S.CAST(' , 'CAST(')
					SELECT @CTInsertFieldNames = COALESCE(@CTInsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'


						SET @NSQL = 'IF (SELECT 
									Count(1) 
								FROM' + SPACE(1) + 
									@SourceDB + 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + @SourceDB + 'SYS.SYSObjects O
									ON C.ID=O.ID 
								WHERE 
									C.Name IN (' + '''' + REPLACE (left(@CTInsertFieldNames,len(@CTInsertFieldNames) -1 ),',',''',''') + '''' + ') AND 
									O.Name = ''' + @TableName + ''') = 22
								SET @isCT = 1
							ELSE 
								SET @isCT = 0'
						EXEC SP_EXECUTESQL @Nsql,N'@isCT BIT OUTPUT',@isCT OUTPUT
						

				IF @isCT=1
					BEGIN

					SET @FieldNames = @FieldNames + @CTFieldNames 
					SET @InsertFieldNames = @InsertFieldNames + @CTInsertFieldNames	
					
				END
			END

		
		

		SET @FieldNames = LEFT(@FieldNames, LEN(@FieldNames)-3)
		SET @InsertFieldNames = LEFT(@InsertFieldNames, LEN(@InsertFieldNames)-1)
		
		Print ''	
		print 'Field List'
		print @fieldnames
		print @insertfieldnames 

		Print ''
		SET @SQL =	'SELECT  ' 
					 + @FieldNames + ' 
					INTO ' 
					+ @CWMTableName + ' 
					FROM ' 
					+ @SourceCWM + ' S 
					WHERE 1 = 2'
		print @SQL
			
			--Item #22441 Changes Start	
			
			--SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
			SET @SQL = REPLACE(@SQL, 'isNull(' , '')	
			SET @SQL = REPLACE(@SQL, ',0)' , '')	
			--Item #22441 Changes End	
				IF @IsDebug = 0
				BEGIN
					EXECUTE(@SQL)					
				END
			ELSE
				PRINT @SQL

		ENd

	SET @FieldNames = REPLACE(@FieldNames, 'S.isNull(' , 'isNull(S.')
		-----------------P1
	
	--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempFlyerReports')
	--	DROP SYNONYM [dbo].[TempFlyerReports]
		
	--EXEC ('CREATE SYNONYM [dbo].[TempFlyerReports] FOR dbo.' + @CWMTableName)
	
	
	
	IF @SourceCWM <> '' AND @WhereClause = 'ExceptionalCode'  
	BEGIN
			-- New Changes For Incremental CWM PEP Process
			IF(@IncrAdRun = 1)
			Begin
					SET @SQL = 'INSERT INTO ' + @CwmTableName + ' (' + @InsertFieldNames + ') 
					SELECT DISTINCT ' + @FieldNames + ' 	
					FROM ' + @SourceCWM + ' S '
					
					print ''
					Print @SQL	
					
					print ''
					print 'Field List'
					print @insertfieldnames
					print @fieldnames 
			End
			Else
			Begin
					SET @SQL = 'INSERT INTO ' + @CwmTableName + ' (' + @InsertFieldNames + ') 
								SELECT DISTINCT ' + @FieldNames + ' 	
								FROM ' + @SourceCWM + ' S '

					Print @SQL	
					print 'Field List'
					print @insertfieldnames
					print @fieldnames 
					EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
		
					IF @Return_Val <> 0
						Return
			End
	END			
	--START : FULL AUTO LOAD
	ELSE IF @SourceCWM <> '' And @WHEREClause <> 'ExceptionalCode'
		BEGIN
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE
			SET @CWMExpSql = ''
			IF EXISTS(SELECT 1 FROM MasterClientCoverage..ClientCWMException WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						FieldID NOT IN(153, 154, 155))
				BEGIN
					-- This is not being used.
					IF @IsInteger=1 and @IsMaster=0
						SET @ClientCWMExceptionFlag = 1
					
					IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'SiteControlMasterFields')
						DROP SYNONYM [dbo].[SiteControlMasterFields]
						
					IF @@SERVERNAME LIKE 'MT2A%'
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2aSQL06].SiteControl.dbo.MasterFields
					ELSE
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2SQL14].SiteControl.dbo.MasterFields
					
					SELECT @CWMExpSql = COALESCE(@CWMExpSql ,'') + SQLWHERE 
					FROM
					(
					SELECT 
						'(S.' + FieldName + 
						CASE WHEN CHARINDEX('%',FieldValue)>0 THEN ' LIKE ' ELSE ' = ' END +
						'''' + REPLACE(FieldValue,'%','') + '''' + 
						CASE 
							WHEN ISNULL(StartDate,'') <> '' THEN 
								CASE
									WHEN ISNULL(ENDDate,'') = '' THEN 
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),@strDate,101)+ ''') OR '
									ELSE					
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),ENDDate,101) + ''') OR '
								END
							ELSE
								') OR '
						END AS SQLWHERE
					FROM
						MasterClientCoverage..ClientCWMException CCE INNER JOIN SiteControlMasterFields MF ON
						CCE.FieldID=MF.FieldID
					WHERE 
						CategoryCodeID = @CategoryCodeID AND 
						CCE.FieldID NOT IN(153, 154, 155)
					) tbl
					
					IF LEN(@CWMExpSql) > 0 
					BEGIN
						SET @CWMExpSql = '(' + LEFT(@CWMExpSql, LEN(@CWMExpSql) - 3) + ')'	
					END
				END
		END
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE

	IF EXISTS	(SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetMktId IS NOT NULL
					)
			BEGIN
				SET @RetMktIdFlag = 1
				SET @SqlMcc = '	
							SELECT 
								RETMKTID,MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' +  CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '
							FROM 
								MasterClientCoverage..MasterClientCWMPEP 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ''
			END
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetId IS NOT NULL
					)
					
			BEGIN
				SET @RetIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + ' 
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.RetId = RM.RetId  and mcc.retmktid is null 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						MktID IS NOT NULL AND 
						TcID IS NULL)
			BEGIN
				SET @MktIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '  
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.MktId = RM.MktId and mcc.retmktid is null
							WHERE CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL)
			BEGIN
				SET @TcIDFlag = 1
				IF EXISTS(
					SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL AND 
						MKTID IS NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
									SELECT  
										RM.RetMktId,RM.MediaID,
										ISNULL(StartDate,''01/01/1990'') StartDate,
										ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '  
									FROM 
										MasterClientCoverage..RETMKTPEP RM, 
										MasterClientCoverage..MasterClientCWMPEP MCC  '
				
						SET @SqlMcc = @SqlMcc + ' 
									WHERE 
										RM.TcId = MCC.TCId AND 
										MCC.MktId IS NULL AND mcc.retmktid is null and 
										MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				IF EXISTS(
						SELECT 1 
						FROM 
							MasterClientCoverage..MasterClientCWMPEP 
						WHERE 
							CategoryCodeID = @CategoryCodeId AND 
							TCID IS NOT NULL AND 
							MKTID IS NOT NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
										SELECT  
											RM.RetMktId,RM.MediaID,
											ISNULL(StartDate,''01/01/1990'') StartDate,
											ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '   
										FROM 
											MasterClientCoverage..RetMktPEP RM, 
											MasterClientCoverage..MasterClientCWMPEP MCC '
						SET @SqlMcc = @SqlMcc + ' 
										WHERE 
											RM.TcId = MCC.TCId AND 
											RM.MktId = MCC.MktId AND 
											MCC.TCID IS NOT NULL AND 
											MCC.MKTID IS NOT NULL AND mcc.retmktid is null and 
											MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				END

	--Check IF CWM Load is on the basis of ClientException TABLE values.
	IF @RetMktIdFlag = 0 AND @RetIdFlag = 0 AND @MktIdFlag = 0 AND @TcIDFlag = 0
					BEGIN
						
						IF @CWMExpSql <> ''
							SET @CWMExpSql = ' WHERE ' + @CWMExpSql
						
						SET @SQL = '
									INSERT  INTO 
										' + @CwmTableName + ' 
									SELECT ' + 
										@FieldNames + ' 
									FROM ' + @SourceCWM + ' S '
					
										
						IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
							SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '											
														
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--Item 22441 End	
						
					

						SET @SQL = @SQL + @CWMExpSql + ' OPTION (MAXDOP 1) '
						--New Approach Partial Load
				
					--	EXEC DebugOrExecute  @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --New Approach Partial Load'
						
						IF @Return_Val <> 0
							RETURN
					END
			--Check IF CWM Load is on the basis of ClientException TABLE values.		
				ELSE
					BEGIN
						Print ''
						Print 'Need to change in above scripts'
						Print ''

						IF @FetchRetMktID = 1 
							SET @IsDebug = 0
						SET @SQL = 'IF EXISTS (SELECT 1 
												FROM 
													[TEMPDB]..SYSOBJECTS 
												WHERE 
													Name = ''' + @strTempRetMktTableName + ''' AND 
													XTYPE=''U''
												)'
						SET @SQL = @SQL + ' DROP TABLE [TEMPDB]..' + @strTempRetMktTableName + ' '

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL 
							
						IF @bitHSP = 1
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate, 
												IsHSP  INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID,
												IsHSP'
						ELSE
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate  
											INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID '

						IF @IsDebug = 0
							EXECUTE(@SqlMcc)
						ELSE
							PRINT @SqlMcc
							
						SET @SQL = 'CREATE CLUSTERED INDEX IDX_CLSRetMktStDt ON 
									tempdb..' + @strTempRetMktTableName + '(RETMKTID,MEDIAID,STARTDATE,ENDDATE)'

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL
							
						IF @FetchRetMktID = 1 
						BEGIN
							SET @IsDebug = 1
							RETURN 
						END 
					
						--Commented for Centralize FlyerID End
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
						--				+ @InsertFieldNames 
						--				+ ') 
						--				SELECT ' 
						--				+ @FieldNames 
						--				+ ' FROM ' + @SourceCWM + ' S '
						--Else
							SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
										+ @InsertFieldNames 
										+ ') 
										SELECT ' 
										+ @FieldNames 
										+ ' FROM ' + @SourceCWM + ' S '
						
						print ''
						print 'Field List'
						print @insertfieldnames
						print @fieldnames
						print ''
						
						-- Commented For Incremental CWM for PEP
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL = @SQL + SPACE(1) + 'JOIN ' + @PartialSourceCode + 'flyerreports I ON S.FlyerID = I.Flyerid '
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND MCC.MediaID IS NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
						Else
							Print @SQL						
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END

						---------------------- Media Base changes --------------------------
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
						--				+ @InsertFieldNames 
						--				+ ') 
						--				SELECT ' 
						--				+ @FieldNames 
						--				+ ' FROM ' + @SourceCWM + 'FlyerReports S '
						--Else
							SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
										+ @InsertFieldNames 
										+ ') 
										SELECT ' 
										+ @FieldNames 
										+ ' FROM ' + @SourceCWM + ' S '
						
						print ''
						print 'Field List'
						print @insertfieldnames
						print @fieldnames
						print ''
						
							
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '																		
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND S.MediaID=MCC.MediaID AND MCC.MediaID IS NOT NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) --and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
						Else
							Print @SQL		
							
						IF @IncrAdRun = 1 
						Begin
								SET @sql = 'Update ' + @CwmTableName + ' SET media = ''FSI'', mediaId = 1 where advertiser = ''FSI'''
								IF(@IsDebug = 0)
									EXEC(@sql)
								Else
									Print @sql
						End				
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END
---------------------- Media Base changes --------------------------
					END
	----------P2
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--153, 154, 155
	IF EXISTS(SELECT * FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
					BEGIN
						SET @SQL = ''
						SET @DeleteFilterClause = ''
						
						;WITH ClientCWMException (FieldName,RID,StartDate, ENDDate,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								StartDate,
								ENDDate,
								FieldID 
							FROM 
								(SELECT 
									Distinct
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									StartDate,  
									ENDDate,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						SELECT 
								RID,
								--Commented for Centralize FlyerID End
								'INSERT INTO ' + @CwmTableName + ' (' 
								+ @InsertFieldNames 
								+ ') SELECT ' 
								+ @FieldNames + SPACE(1) 
								+ 'FROM '
								+ CASE
									WHEN @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1 THEN + @SourceCWM  + ' S' + SPACE(1) 
									ELSE @sourcecwm+' S' + SPACE(1) 
									END
								+										
									--Item 22441 Start
									CASE 
										WHEN @BuCH = 1 THEN
											CASE 
												WHEN EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId ) THEN
													CASE 
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
															NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														WHEN NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														ELSE
															' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass'
													END
												ELSE
													SPACE(1)
													--' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													--	S.TradeClass=MCA.TradeClass'
											END
										ELSE
											SPACE(1)
										END
										--Item 22441 End								
								
										+ SPACE(1) + ' WHERE ' +  
											FieldName + ' IN (SELECT 
																	FieldValue 
																FROM 
																	MasterClientCoverage..ClientCWMException 
																WHERE
																	CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																	FieldID = ' + Cast(FieldID AS VARCHAR(10))+ ' AND 
																	IsNull(StartDate,'''') = ''' + CAST(IsNull(StartDate,'') as VARCHAR(20)) + ''' AND
																	IsNull(EndDate,'''') = ''' + CAST(IsNull(EndDate,'') as VARCHAR(20)) + '''
																) AND 
											AdDate BETWEEN ''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(StartDate,'') = '' THEN '01/01/1990' ELSE StartDate END,101) + ''' AND 
															''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(ENDDate,'') = '' THEN @strDate ELSE ENDDate END ,101) + '''' 
							As Query
						INTO #Temp_ClientCWMException	
						FROM 
							ClientCWMException
						ORDER BY
							RID
						--SELECT * FROM 	#Temp_ClientCWMException							
						SET @CwmChangeCounter = @@ROWCOUNT
						
						--IF @BuCH = 0 
						--	BEGIN
						--		UPDATE #Temp_ClientCWMException 
						--			SET Query = REPLACE(Query,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--	END
						
						 IF @BuCH = 1 AND EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )
								UPDATE #Temp_ClientCWMException SET Query = REPLACE(Query,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

						IF @IncrAdRun = 1 
							BEGIN
								UPDATE #Temp_ClientCWMException 
									SET Query = REPLACE(Query,'Masteracfv..ACFVFlyerReports','ACFVINCRCWM..TempACFVFlyerReports')
									--Commented for Centralize FlyerID Start
									--,
									--	MAPQuery = REPLACE(MAPQuery,'MasterAdviewData.dbo.AdViewMain','MasterClientCoverage.dbo.AdviewMainUpdate')
									--Commented for Centralize FlyerID End
							END
					
						WHILE @CwmChangeCounter > 0 
							BEGIN
								SELECT 
									@SQL = 
										CASE 
											WHEN @IncrAdRun = 1 
											THEN Query +
												' AND Flyerid NOT IN(SELECT FLYERID FROM ' + @CwmTableName + '' + ')' --+
											ELSE
												Query
											END
								FROM 
									#Temp_ClientCWMException 
								WHERE 
									RID = @CwmChangeCounter
								ORDER BY
									RID DESC									
									
								IF @IsDebug = 0
									BEGIN	
										PRINT @SQL
										EXEC(@SQL)
									END
								ELSE
									BEGIN
										PRINT @SQL 
										PRINT @mapSQL
									END
								
								SET @CwmChangeCounter = @CwmChangeCounter - 1
							END	
						DROP TABLE #Temp_ClientCWMException
						
						--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							
						;WITH ClientCWMException (Query,ID,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								FieldID 
							FROM 
								(SELECT 
									Distinct 
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						,GetExecutableQuery (FId, Query) AS
						(
							SELECT 
								1, CAST('' AS VARCHAR(MAX)) 
							UNION ALL
							SELECT 
								B.FId + 1, B.Query +  CAST(A.Query AS VARCHAR(MAX)) + ' IN (SELECT 
																								FieldValue 
																							FROM 
																								MasterClientCoverage..ClientCWMException 
																							WHERE
																								CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																								FieldID = ' + Cast(FieldID AS VARCHAR(10))+ '
																							) OR (' 
							FROM 
								ClientCWMException A INNER JOIN GetExecutableQuery B ON A.ID = B.FId 
						)
						SELECT 
							TOP 1 @DeleteFilterClause = LEFT(Query, LEN(Query)-5) 
						FROM 
							GetExecutableQuery 
						ORDER BY 
							FId DESC
						--Print 'cursor ends -2'									
						--PRINT @DeleteFilterClause	
						--EXEC DebugOrExecute @DeleteFilterClause, @IsDebug, @CatCode, @Return_Val OUTPUT
						--Print 'cursor ends'	
					END
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--Start : Check for "PRDHSP"
					--Commented By Hiren
					--IF @CatCode IN('PRDHSP','mfdHisp','mfdTtl') Or @CatCode = 'ADV13GR'
	IF @CatCode IN('PRDHSP','mfdHisp50','mfdTtl50','ADV13GR')
						BEGIN

							SET @SQL = 'INSERT INTO ' + @CWMTableName + '(' + @InsertFieldNames + ') 
									SELECT ' + 
										@FieldNames + 
									' FROM 
										MasterClientCoverage..EPHSPFlyerReports S '
										
							--Item 22441 Start
							IF @BuCH = 1
								BEGIN
									IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
										BEGIN 
											IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
												NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
											ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass'
												SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

										END
									--ELSE
										--SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
										--			S.TradeClass=MCA.TradeClass'
								END
							--ELSE
							--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
							--Item 22441 End	
										
							IF @IncrAdRun = 1
							BEGIN
								SET @SQL = @SQL + ' WHERE Flyerid NOT IN(SELECT FLYERID FROM ' + @CwmTableName + ')' --Temp Incremental TABLE
								SET @SQL = REPLACE(@SQL, 'MasterClientCoverage..EPHSPFlyerReports', 'MasterClientCoverage..EphspFlyerReportsIncr')								
								--SET @SQL = @SQL + ' AND Flyerid NOT IN(SELECT FLYERID FROM TempCatCodeCWM)' --Actual CWM TABLE.
							END
							Print @SQL
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							IF @Return_Val <> 0
								Return				
						END
					--END : Check for "PRDHSP"
			END
	--END : FULL AUTO LOAD	

	-------------P3
				IF @CWMFULL = 1 And ISNULL(@IncrAdRun,0) = 0
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)	
						IF @ServerType = 'Master' OR (@ServerType = 'Client' AND @@servername = 'MT2SQL00')
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMFullRundate = ''' + Cast(@strDate as Varchar(20))+ ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMFullRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				IF @IncrAdRun = 1
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)
						IF @ServerType = 'Master'	
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMPartialRundate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMPartialRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				----########################## CWM LOAD  ##########################
				--########################## CWM CHANGES  ##########################
				--PRINT '-- CWMCHANGES START : ' + convert(VARCHAR(100),current_timestamp,20)
				--chnaged by prakash on 7/12/2013
				--INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMCHANGES START ','CWMCHANGES START', GETDATE()
	
				--SET @CwmChangeCounter = 1
				
				--Commented By Hiren
				--SET @CwmChangesWHEREClause = ''
	--IF @CWMChanges = 1 
	--IF EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId)
	--BEGIN
	--------------------------------------------------kishan----------------------------------------
--	declare @select varchar(max)
----declare @sql varchar(max)
----insert into cargPepFlyerReports

--SELECT --T.CATEGORYCODEID, 
--       @select= STUFF((SELECT ' OR ' + x.EXISTINGVALUE 
--                FROM MasterClientCoverage..CLIENTCWMCHANGES x
--               WHERE x.CATEGORYCODEID = t.CATEGORYCODEID AND CODEID = 84
--						--AND  X.CODEID = T.CODEID
--            GROUP BY x.EXISTINGVALUE
--             FOR XML PATH ('')), 1, 3,'') --AS ABC

--  FROM MasterClientCoverage..CLIENTCWMCHANGES t WHERE CATEGORYCODEID = @CategoryCodeId AND CODEID = 84
----GROUP BY t.CATEGORYCODEID
----print @abc
--set @sql = ' insert into ' + @CWMTableName + '('+@insertfieldnames+') select '+@insertfieldnames+' from ' + 
--							@SourceCWM + ' where addate >= ''01/01/2015'' and ('+ @select+')'
--print( @sql)
--exec (@sql)


--		;WITH ClientCWMChanges (FieldName,ID,RID, ExistingValue, NewValue, ExecutionOrder, CodeID_Main) AS 
--		(
--			SELECT  
--				FieldName, 
--				Row_Number() OVER (Partition BY CodeID,ExecutionOrder ORDER BY ExecutionOrder, CodeID) AS ID,
--				Row_Number() OVER (ORDER BY ExecutionOrder, CodeID) AS RID,
--				ExistingValue,
--				NewValue,
--				ExecutionOrder,
--				CodeID
--			FROM 
--				(SELECT 
--					DISTINCT 
--					CASE 
--						WHEN CodeID = 12 THEN 'Market' 
--						WHEN CodeID = 13 THEN 'Advertiser' 
--						WHEN CodeID = 14 THEN 'TradeClass' 
--						WHEN CodeID = 15 THEN 'Media' 
--						--when codeid= 84 then ''
--					END AS FieldName,
--					ExistingValue,
--					NewValue,
--					CASE 
--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) = 0 THEN 1

--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) > 0 THEN 2

--						WHEN CodeID <> 14 THEN 3
--					END AS ExecutionOrder,
--					CodeID
--				FROM 
--					MasterClientCoverage.dbo.ClientCwmChanges
--				WHERE
--					--ClientID = @ClientID AND
--					CategoryCodeID = @CategoryCodeId
--				)DT
--		)
--		,GetExecutableQuery (RowNum, Query, CodeID, Field_Name) AS
--		(
--			SELECT 
--				1, 
--				CAST('' AS VARCHAR(MAX)) ,0,CAST('' AS VARCHAR(100))
--			UNION ALL
--			SELECT 
--				1 + B.RowNum, 
--				CASE 
--					WHEN A.CodeID_Main = 11 THEN 
--						CASE 
--						WHEN ID = 1 THEN 
--							'Delete  FROM ' + @CWMTableName + ' WHERE ' 
--						ELSE 
--							B.Query 
--						END +  ExistingValue + ' OR '
--					ELSE
--						CASE 
--						WHEN ID = 1 THEN 
--							'UPDATE ' + @CWMTableName + ' SET ' + FieldName + ' = CASE ' 
--						ELSE 
--							B.Query 
--						END +  'WHEN ' + ExistingValue + ' THEN ' + NewValue + SPACE(1)
--					END,
--				 CASE WHEN B.CodeID <> A.CodeID_Main THEN A.CodeID_Main ELSE B.CodeID  END,
--				 CAST(FieldName AS VARCHAR(100))
--			FROM 
--				ClientCWMChanges A INNER JOIN GetExecutableQuery B ON 
--				A.RID=B.RowNum
--		)
--		SELECT 
--			CASE CodeID
--				WHEN 11 THEN LEFT(Query ,LEN(Query)-3)
--			ELSE
--				Query + 'ELSE ' + Field_Name + ' END'	
--			END AS Query,
--			ROW_NUMBER() OVER (Order BY CodeID)	AS RID
--			INTO #Temp
--		FROM 
--			GetExecutableQuery T2 INNER JOIN
--			(
--			SELECT MAX(RID)+1 AS RID FROM ClientCWMChanges GROUP BY FieldName,ExecutionOrder
--			) T1 ON T1.RID=T2.RowNum
--		OPTION (MAXRECURSION 0)
--		--Select * from #temp
--		SET @CwmChangeCounter = @@ROWCOUNT
		
--		WHILE @CwmChangeCounter > 0 
--			BEGIN
--				SELECT @SQL = Query FROM #Temp WHERE RID = @CwmChangeCounter
--				IF @IsDebug = 0
--					BEGIN	
--						EXEC(@SQL)
--					END
--				ELSE
--					PRINT @SQL 
				
--				SET @CwmChangeCounter = @CwmChangeCounter - 1
--			END	
--		DROP TABLE #Temp
--	--Added for Renamed Adv\Mkt\Mkt\TC
--	;With CTE 
--	As
--	(
--	SELECT Distinct CodeID,CASE WHEN CodeID = 12 THEN 'Market' WHEN CodeID = 13 THEN 'Advertiser'WHEN CodeID = 14 THEN 'TradeClass'WHEN CodeID = 15 THEN 'Media' END as Field
--	FROM MasterClientCoverage.dbo.ClientCwmChanges  WHERE  CodeID <> 11 AND ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId 
--	)
--	Select Row_Number () Over( Order By CodeID) RID,'INSERT INTO 
--				IDDB.dbo.'+ Field +' ('+ Field +') 
--			Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From ' + @CWMTableName + '  Except Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From  
--				IDDB.dbo.'+ Field +'' as IQuery,
--			'Update F Set '+ Field +'ID =I.'+ Field +'ID
--					From ' + @CWMTableName + ' F 
--					Left Join IDDB..'+ Field +' I on I.'+ Field +'=F.'+ Field +'' as UQuery
--	Into #IDDBRenamingUpdate
--	From CTE

--	SET @CwmChangeCounter = @@ROWCOUNT
		
--	WHILE @CwmChangeCounter > 0 
--		BEGIN
--			SELECT @SQL = IQuery,@nSQL=UQuery FROM #IDDBRenamingUpdate WHERE RID = @CwmChangeCounter
--			IF @IsDebug = 0
--				BEGIN	
--					EXEC(@SQL)
--					EXEC(@nSQL)
--				END
--			ELSE
--				BEGIN
--					PRINT @SQL 
--					PRINT @nSQL
--				END
--			SET @CwmChangeCounter = @CwmChangeCounter - 1
--		END	
--	DROP TABLE #IDDBRenamingUpdate
--	ENd
	--------------------------------------------kishan---------------------------------------------------	
	
	--Item#23659 Changes for Updating Retid, MktID and RetMKTID
	SET @SQL= 
			'UPDATE F 
			SET 
				F.MktId=R.MKTID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.MktID <> R.MKTID AND F.Market = R.Market;

			UPDATE F 
			SET 
				F.RetId=R.RetID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.RetId <> R.RetID AND F.Advertiser = R.Advertiser;
					
			UPDATE F 
			SET 
				F.RetMktId=R.RetMktID
			FROM 
				MasterClientCoverage..RETMKTPEP R  JOIN ' + @CWMTableName + ' F 
					ON R.Advertiser=F.Advertiser and R.Market=F.Market 
			WHERE R.RetMktID<>F.RetMktId'
			
	IF 	@IsDebug=0
		BEGIN
			EXEC(@SQL)
		END	
	ELSE	
		BEGIN
			Print @SQL
		END			
	----P4
	--########################## CWM CHANGES  ##########################
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	IF @IncrAdRun = 1
		BEGIN
			
			PRINT '5.0 incr'
			-- change by praksh on 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,0
				END	
			ELSE	
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,1
				END
				
			--Delete On Basis of SourceCWM TABLE	
			Print @SourceCWM			
			SET @SQL = 'DELETE 
						FROM 
							' + @CwmTableName + ' 
						WHERE 
							FlyerId NOT IN(	SELECT 
												FlyerId 
											FROM ' + 
												@SourceCWM + ') AND 
							FlyerId NOT LIKE ''FT%'''

			IF @bitHSP = 1
				SET @SQL = @SQL + Space(1) + 'AND 
							FlyerId NOT IN (SELECT 
												FlyerId 
											FROM 
												MasterClientCoverage..EphspFlyerReports)'
			--Start : Check Whether Pull is done from AdviewMain for the CategoryCode
			--153, 154, 155
			IF EXISTS(SELECT 1 FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
				BEGIN
					IF LEN(@DeleteFilterClause) > 0
						SET @DeleteFilterClause = LEFT(@DeleteFilterClause,LEN(@DeleteFilterClause) - 3)
					SET @SQL = @SQL + ' AND NOT(' + @DeleteFilterClause + '))'	
					--SET @SQL = @SQL + ' AND FlyerId NOT IN (SELECT FlyerId FROM ' + @CwmTableName + ')'
				END
				
			--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output

			IF @Return_Val <> 0
				Return		
			
		END
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	ELSE
		BEGIN
		--Full
			PRINT '5.0 full'
			--change by prakash 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,0
				END	
			ELSE
				BEGIN
				  EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,1			  
				END
		END
		PRINT 'after  5.0'
		
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMUPDATE START ','CWMUPDATE START', GETDATE()	
	PRINT '-- CWMUPDATE START : ' + convert(varchar(100),current_timestamp,20)
	
	--APPLY CWMUPDATE - updated for 50
	EXECUTE CWMUPDATE_50 @CatCode ,@IsDebug
	
	--Update the CWM Media if not DAA for certain 360 Flyers
	If @IsDAA=0 AND @IsAdlert = 0
	BEGIN
		SET @SQL = 'Update CWM set Media = ''Insert-Paper'', MediaId=15
		from ' + @CatCode + 'FlyerReports CWM
		inner join MasterClientCoverage.dbo.FlyersToChangeToPrint360 F360 on F360.FlyerId = CWM.FlyerID '

		IF @IsDebug = 0
			EXECUTE(@SQL)
		ELSE
			PRINT @SQL
	END

	--Item 22441 Start
	IF @BuCH = 1
		BEGIN 
			IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
				BEGIN 
					IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
						NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
					ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass'
				END
			--ELSE
			--	SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
			--		S.TradeClass=MCA.TradeClass'
			IF @IsDebug = 0
				 BEGIN
			 		EXECUTE(@SQL)
				 END
			ELSE
				BEGIN
					PRINT @SQL
				END
					
			EXEC mt_proc_Create_ID_Update @CWMTableSP, 'Channel',@IsDebug		
		END

	--Item 22441 End		

	--Item:19751

	Declare @intAdDate int
			--,@vchrControDbPrefix varchar(100)=dbo.mtfunc_GetDatabasePrefix('Control')
	
	SET @Nsql = 'SELECT @intAdDate  = count(1) FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory   
			WHERE CategoryCodeId = @intCategoryCodeId AND (ISNULL(StartDt,'''')<> '''' or ISNULL(EndDt,'''')<> '''')'
	exec sp_executesql @Nsql,N'@intAdDate int output,@intCategoryCodeId int',@intAdDate  output,@intCategoryCodeId		
	IF @intAdDate > 0
	BEGIN
	SET @sql='IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].['+ @CatCode + 'FlyerReports]'') AND name = N''idx_'+ @CatCode + 'FlyerReportsAdDate'')
				DROP INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] WITH ( ONLINE = OFF )
			CREATE NONCLUSTERED INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] 
			(
			[AdDate] ASC
			)
			INCLUDE ( [FlyerID])'
	IF @IsDebug = 0
	EXECUTE(@SQL)
	ELSE
	PRINT @SQL
	END
	--########################## CREATE DEPENDENT TABLES. ##########################
	--Adview2Control Changes
	PRINT '-- CREATE DEPENDENT TABLES START : ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CREATE DEPENDENT TABLES START  ','CREATE DEPENDENT TABLES START ', GETDATE()	
	
	Select 
		@lIsEvent = ISNULL(IsEvent,0), 
		@lIsTheme = ISNULL(IsTheme,0), 
		@lIsPublication = ISNULL(IsPublication,0) 
	From 
		CategoryCodeTable 
	Where 
		Category = @CatCode 
	
	
	--Publication
	SET @lTableName = @CatCode + 'Publication'
	IF EXISTS (select * from sysobjects where id = object_id(@lTableName) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			SET @SQL = 'DROP TABLE ' + @lTableName
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'drop Publication table'
		END
	IF @lIsPublication = 1
		BEGIN
			SET @SQL = 'SELECT DISTINCT Publication INTO ' + @lTableName + ' From ' + @CatCode + 'FlyerReports'
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'create and insert disitinct publication in new table'
		END
		


	IF @IsDebug=0
		BEGIN
			--Change by prakash on 14/06/2013
			PRINT ' EXECUTE mt_proc_Create_ID_Update SP for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',0
			--Changes end		
		END
	ELSE
		BEGIN
		   --Change by prakash on 14/06/2013
			PRINT ' Print  mt_proc_Create_ID_Update SPs all statements for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',1
		 END



--Changes by praksh on 14/06/2013
	IF @IncrAdRun = 1
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports_INCRCWM] @SourceCWM, '', '', '', @CatCode, 0,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports_INCRCWM] @SourceCWM, '', '', '', @CatCode, 0,1
				END			
		END	
	ELSE
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports_INCRCWM] @SourceCWM, '', '', '', @CatCode, 1,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports_INCRCWM] @SourceCWM, '', '', '', @CatCode, 1,1
				END
		END
				
	IF @IsDebug=0
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,0
		END
	ELSE
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,1
		END
--Start: drop temp fullCWM and incrCWM tables after code is processed 
SET @SQL = 'IF EXISTS (	SELECT 1 
		FROM 
			SYSOBJECTS 
		WHERE 
			ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
			OBJECTPROPERTY(id, N''IsUserTable'') = 1)
DROP TABLE [dbo].[' + @CWMTableName + ']'

--IF @IsDebug = 0
--EXECUTE(@SQL)
--ELSE
--PRINT @SQL  
--End: drop temp fullCWM and incrCWM tables after code is processed 
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'END CreateClientCWMTable_50 SP ','END CreateClientCWMTable_50 SP', GETDATE()
	
PRINT '-- END CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)














GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports_INCRCWM]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[PopulatePageReports_INCRCWM]
	@sourceCWMCode as varchar(100),
	@sourcePDTCode as varchar(20),
	@sourceServer as varchar(50),
	@sourceDB as varchar(50),
	@destCode as varchar(20),
	@replaceTable as tinyint,
	@IsDebug as bit = 0--Values : "0 = Run / 1 = Print".
AS
BEGIN
	SET NOCOUNT ON;
	Print 'replacetable = ' + cast(@replaceTable as varchar(2))
	Declare	@SQL as varchar(Max)	
			,@SQLindex as varchar(Max)	
			,@SQLdrop as varchar(1000)
			,@destTable as varchar(50)
			,@destINCRFlyer as varchar(50)
			,@CTInsertFields as varchar(max)
			,@InsertFieldsMCAPVP Varchar(max)
			,@InsertFieldsPageReports varchar(max)
	--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT tinyint
			,@Nsql nvarchar(max)
			,@IsInteger Int
			,@IsSSD Bit
			,@FVCCType int

			
	SELECT 
		@FVCCType  = IsNULL(FVCCType,0)
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @destCode 


	--Temporary Integer Based ID Changes
	SET @sourceCWMCode=Replace(@sourceCWMCode,'Flyer','Page')
	Print @SourceCWMCode
	
	Set @destTable = @destCode + 'PageReports'
	
	Print '-- Start mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start to create Pagereports ','Start to create Pagereports', GETDATE()
		
	Set @SQL = ''
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = @destTable))
		BEGIN
			--If it exists, check it we want to drop, if so do it, if not print error
		--CHANGES BY PRAKASH ON 14/06/2013
		  IF @replaceTable=1
				BEGIN
					SET @SQLdrop = 'drop table ' + @destTable
				END
			ELSE
				BEGIN
					PRINT 'Table [' + @destTable + '] already exists.'
					--return -1
				END
			--Change by prakash 13/06/2013
			IF @IsDebug=0
			   BEGIN			   
					EXECUTE(@SQLdrop)
					print @destTable + ' table droped'
			   END
			ELSE
			   BEGIN
				Print @SQLdrop
			   END
			 			
		END

		SELECT 
			@InsertFieldsPageReports = 
			CASE WHEN CategoryType= 'Flyer' THEN COALESCE(@InsertFieldsPageReports ,'') + 'Flyer.' + LTRIM(RTRIM(CategoryValue)) +','
			ELSE COALESCE(@InsertFieldsPageReports ,'') + 'Page.' + LTRIM(RTRIM(CategoryValue)) +','
			END
		FROM
			tbl_LookUp
		WHERE
			CategoryType in ('Flyer','Page')
		ORDER BY 
			ID   

		SET @InsertFieldsPageReports = LEFT(@InsertFieldsPageReports, LEN(@InsertFieldsPageReports)-1)
		
		
		SET @InsertFieldsMCAPVP = LEFT(@InsertFieldsMCAPVP, LEN(@InsertFieldsMCAPVP)-1)
	    SET @InsertFieldsMCAPVP=REPLACE(@InsertFieldsMCAPVP,'CAST(0 AS INT) AS FeaturesID','F.FeaturesId')
		
		IF @replaceTable = 1 
			BEGIN
				SET @SQL = @SQL + 'SELECT ' + replace(replace(@InsertFieldsPageReports,'page.',''),'flyer.','') + 
							' INTO ' + @destTable + SPACE(1)
			END
					 
		IF @replaceTable=0
			Begin
				SET @SQL= @SQL + Space(1) + 'INSERT INTO ' + @destTable + Space(1) + 'SELECT ' + replace(replace(@InsertFieldsPageReports,'page.',''),'flyer.','') + SPACE(1)
			END
		
		
		SET @SQL =	@SQL 
					+' FROM (SELECT ' 
					+ REPLACE(@InsertFieldsPageReports,'OriginalFlyerID,FlyerID','Flyer.OriginalFlyerID,Flyer.FlyerID') + SPACE(1) 
					+' FROM '
					+ SPACE(1)  
					--+ @destCode + 'FlyerReports Flyer' + SPACE(1) 
		
		IF @ReplaceTable = 0
		BEGIN 
				SET @SQL = @SQL + @destCode + 'IncrFlyerReports Flyer' + SPACE(1) 		
		END
		Else
		BEGIN
				SET @SQL = @SQL + @destCode + 'FlyerReports Flyer' + SPACE(1) 
		END
								
		IF @FVCCType = 4 AND EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE  CategoryCodeID in (select id from categorycodetable where category= @destCode) and codeid = 84)
			SET @SQL= @SQL + 'join '+@sourcecwmcode+' Page on Flyer.FlyerId=Page.FlyerId ) VV '  
		else
			SET @SQL= @SQL + 'join '+@sourcecwmcode+'  Page on Flyer.FlyerId=Page.FlyerId ) VV ' 
		
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQL)
			END
		ELSE
			BEGIN
				PRINT @SQL
			END


		PRINT '-- Insert Starts - ' + convert(varchar(100),current_timestamp,20)
		
		IF @replaceTable = 1 
			BEGIN
								 
				SET @SQLindex='
				ALTER TABLE [' + @destTable + ']
				ADD CONSTRAINT [PK_' + @destCode + 'PageReportsFlyerIdPage]
				PRIMARY KEY CLUSTERED
				(
				[FlyerId] ASC,
				[Page] ASC
				)'
				
		 			--Changes by prakash on 14/06/2013
					IF @IsDebug =0
					 BEGIN
						EXECUTE(@SQLIndex)
					 END
					ELSE
					 BEGIN
						PRINT @SQLIndex
					 END
				
				Print '--Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)
			END
			
		SET @SQLIndex =	'
							IF NOT EXISTS(SELECT * FROM .sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[' + @destTable + ']'') AND name = ''IDX' + @destCode + 'FlyerIdPage'')
							BEGIN 	
								CREATE NONCLUSTERED INDEX [IDX' + @destCode + 'FlyerIdPage] ON [dbo].[' + @destTable + '] 
								(
								[FlyerID],[Page])
								INCLUDE ([img],[PageType],[OrderValue],[Height],[Width],[PageSpace],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[Size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[themeid],[theme],[PublicationId],[Publication],[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[Pages],[CouponInd],[PublishedOn],[RegionId],[Region],[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[WeekOfn],[WeekOfi],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[VehicleId],[CreationMonth],[ImageName],[PageName],[FVSystemPage],[FVDisplayPage],[FrontPageInd],[BackPageInd])
								WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
							END
						'
		-- Changes on 10.02.2017 as More Indexes Required as Master
		SET @SQLindex = @SQLindex + 
						'	
							-- Changes on 10.02.2017 as More Indexes Required as Master

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMINDEX1PgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMINDEX1PgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, RetMktID, Page, Pages, PageName, ImageName, FlyerId) WITH  FILLFACTOR = 90 ON [PRIMARY]
							End


							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMRetMktPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMRetMktPgRpt] ON [dbo].[' + @destTable + ']
									(AdvertiserId, Advertiser, MarketId, Market, AdDate, RetMktID, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMConsolidatedPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMConsolidatedPgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, WeekOf, AdMonthId, AdvertiserId, Advertiser, MarketId, Market, RetMktID, MediaId, Media, PublicationId, Publication, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMLargePgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMLargePgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, Advertiser, Market, Media, RetMktID, TradeClassId, TradeClass, RegionId, Region, DistrictId, District, Page, Pages, FlyerId) ON [PRIMARY]
							End
						'

		--Changes by prakash on 14/06/2013
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQLIndex)
			END
		ELSE
			BEGIN
				PRINT @SQLIndex
			END
				 
		Print '--Non-Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)

	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'created Pagereports ','created Pagereports', GETDATE()		
	Print '-- END mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
END













GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_cccac]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomStepSP_cccac] 
(
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_cccac] 'BUI',1,1
Declare @SQL NVARCHAR(max)
Declare @Alt NVARCHAR(max)
Declare @vchrControDbPrefix varchar(50)
Set @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')

--=======================================GTCA Update=======================================================
If @Category in  ('cccac','BUI','sarPep','dtzPep','kcPeP','mcncpep') and @Flag=1
Begin
	--KACE : 57881

	Set @SQL='UPDATE  ' + @Category + 'DetailReports set  Manufacturer = ''Private Label'' , ManufacturerID = 751
	where (manufacturer like ''%Private Brand'') or (manufacturer like ''%Private Label Foods of Rochester'')
	Option (Maxdop 1)'
	IF @IsDebug=1
		Print @SQL
	Else
		Exec (@SQL)

	Set @Alt='if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Category + 'DisQueryPage]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Category + 'DisQueryPage]'
	IF @IsDebug=1
		Print @Alt
	Else
		Exec (@Alt)

	--DisQueryPage
	Set @Alt='SELECT 
				DISTINCT [BrandId], Isnull([Brand],'''') Brand, 
				[ManufacturerId], Isnull([Manufacturer],'''') Manufacturer, 
				[MerchandiseCategoryId], Isnull([MerchandiseCategory],'''') MerchandiseCategory, 
				[MerchandiseSubCatId], Isnull([MerchandiseSubCat],'''') MerchandiseSubCat, 
				[CategoryId], Isnull([Category],'''') Category,
				ProductTerritoryID,
				Isnull(ProductTerritory,'''') ProductTerritory,
				ProductTerritoryGroupID,
				Isnull(ProductTerritoryGroup,'''') ProductTerritoryGroup,
				ProductTerritorySubGroupID,
				Isnull(ProductTerritorySubGroup,'''') ProductTerritorySubGroup,
				LTRIM(RTRIM(SKUDescription1)) AS SKUDescription1,
				SKUDescription1ID,
				LTRIM(RTRIM(SKUDescription2)) AS SKUDescription2,
				SKUDescription2ID,
				LTRIM(RTRIM(SKUDescription3)) AS SKUDescription3,
				SKUDescription3ID,
				LTRIM(RTRIM(SKUType)) AS SKUType,
				SKUTypeID,ACBrandFamily , ACBrandFamilyId
				'
			

			IF EXISTS(Select 1 From CategoryCodeTable Where Category = @Category and IsNull(BuPC,0)=1)
				SET @Alt = @Alt + 	
					',Isnull(ParentCompany,'''') ParentCompany,
					ParentCompanyID' + SPACE(1)
			IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category = @Category AND FVcctype=6 ) 
		begin
				set @Alt = @Alt+',ACSegment,ACCategoryId'
		end
		
		
			SET @Alt = @Alt + SPACE(1) + 'INTO [dbo].[' + @Category + 'DisQueryPage]
			FROM 
				[dbo].[' + @Category + 'DetailReports] with(nolock)
				  '
	IF @IsDebug=1
		Print @Alt
	Else
		Exec (@Alt)		  

	Set @Alt='IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Category + 'DisQPBrand'' AND ID = OBJECT_ID(N''[dbo].[' + @Category + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @Category + 'DisQueryPage''  and Type=''u'')
			CREATE  CLUSTERED  INDEX [idx_' + @Category + 'DisQPBrand] ON [dbo].[' + @Category + 'DisQueryPage]([BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Category + 'DisQPCategory'' AND ID = OBJECT_ID(N''[dbo].[' + @Category + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @Category + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @Category + 'DisQPCategory] ON [dbo].[' + @Category + 'DisQueryPage]([CategoryID], [Category], [BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Category + 'DisQPCatBraMfrMSC'' AND ID = OBJECT_ID(N''[dbo].[' + @Category + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @Category + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @Category + 'DisQPCatBraMfrMSC] ON [dbo].[' + @Category + 'DisQueryPage]([CategoryID], [Category], [ManufacturerID], [Manufacturer], [BrandID], [Brand], [MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Category + 'DisQPBraMfrParent'' AND ID = OBJECT_ID(N''[dbo].[' + @Category + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @Category + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @Category + 'DisQPBraMfrParent] ON [dbo].[' + @Category + 'DisQueryPage]([MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory], [ManufacturerID], [Manufacturer], [BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Category + 'DisQPConsolidated'' AND ID = OBJECT_ID(N''[dbo].[' + @Category + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @Category + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @Category + 'DisQPConsolidated] ON [dbo].[' + @Category + 'DisQueryPage]([BrandID], [Brand], [ManufacturerID], [Manufacturer], [CategoryID], [Category], [MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory], [ProductTerritoryID], [ProductTerritory], [SKUTypeID], [SKUType]) ON [PRIMARY]'
	IF @IsDebug=1
		Print @Alt
	Else
		Exec (@Alt)	


End
----------------------------------------------------------------------------------------------------------------------------------------------------------
End



GO

/****** Object:  StoredProcedure [dbo].[mt_proc_DataLoad_DetailReports_MPV_Update]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Author:		jhetler
-- Create date: Feb 2011
-- Description:	Creates the FlyerReports table for a Code from a FV Code
-- =============================================
--exec mt_proc_DataLoad_DetailReports_MPV_Update   'dgfv50', 'variety',1
CREATE  PROCEDURE [dbo].[mt_proc_DataLoad_DetailReports_MPV_Update]

 @destCode as varchar(20),
 @FieldName as varchar(50),
 @IsDebug as bit=0 --Values : "0 = Run / 1 = Print".

AS
BEGIN
	SET NOCOUNT ON;
	declare @SQL as nvarchar(4000), @isfull int
PRINT '-- START mt_proc_DataLoad_DetailReports_MPV_Update SP : ' + convert(varchar(100),current_timestamp,20)
--set @sql='

--DECLARE mpv_cursor CURSOR
--FOR
--SELECT  PageDetailId from ' + @destCode + 'DetailReports
-- where PageDetailId in (select PageDetailId from ' + @destCode + 'MPV' + @FieldName + ')
-- and isnull(MPV' + @FieldName + ', '''') = ''''
--OPEN mpv_cursor
--	DECLARE @pdtid varchar(20)
--	Declare @elem varchar(500)
--	Declare @elemIDs varchar(500)
--	FETCH NEXT FROM mpv_cursor INTO @pdtid
--	WHILE (@@FETCH_STATUS <> -1)
--	BEGIN
--		IF (@@FETCH_STATUS <> -2)
--		BEGIN	
		
--			set @elem=null
--			set @elemIDs=null
--		Select @elem = ISNULL(@elem + ''; '', '''') + ' + @FieldName + ',
--		@elemIDs= ISNULL(@elemIDs + '', '', '''') + ''"'' + cast(' + @FieldName + 'Id as varchar) + ''"''
--		  FROM ' + @destCode + 'MPV' + @FieldName + '
--		  where PageDetailId = @pdtid
--		  order by ' + @FieldName + '
		  
		
--		Update ' + @destCode + 'DetailReports set MPV' + @FieldName + '= @elem, MPV' + @FieldName + 'Id=@elemIDs where PageDetailId = @pdtid

--		END
--		FETCH NEXT FROM mpv_cursor INTO @pdtid
--	END
--CLOSE mpv_cursor
--DEALLOCATE mpv_cursor'
		  
--print @sql		  
--exec sp_executesql @sql
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start Detailreports MPV update  ','Start Detailreports MPV update ', GETDATE()
--	SET @SQL='
--			UPDATE ' + 
--				@destCode + 'DetailReports 
--				SET MPV' + @FieldName + '= T2.Field
--			FROM ' +
--				@destCode + 'DetailReports T1 INNER JOIN
--				(SELECT 
--					Pagedetailid,
--					Field = STUFF((SELECT ''; '' + LTRIM(RTRIM(x.' + @FieldName + ')) FROM ' + @destCode + 'MPV' + @FieldName + ' x 
--								WHERE  x.Pagedetailid  = t.Pagedetailid
--								GROUP BY LTRIM(RTRIM(x.' + @FieldName + '))' + SPACE(1) +
--								'ORDER BY ''; '' + LTRIM(RTRIM(x.' + @FieldName + ')) FOR XML PATH(''''),TYPE).value(''.'',''VARCHAR(8000)''), 1, 2, '''')
--				FROM 
--					' + @destCode + 'MPV' + @FieldName + ' t
--				GROUP BY 
--					Pagedetailid) T2 ON T1.PageDetailID = T2.PageDetailID 
--				WHERE 
--					ISNULL(MPV' + @FieldName + ', '''') = '''''
--IF @IsDebug=0
--			   BEGIN			   
--					EXEC SP_EXECUTESQL @SQL	
--			   END
--			ELSE
--			   BEGIN
--					PRINT @SQL
--			   END	
set @sql = '
	if exists (select * from sysobjects where name = ''' + @destCode + 'MPV' + @FieldName + ''' and xtype = ''u'')
	begin
		delete b from ACFVINCR..TempACFVMPV' + @FieldName + ' a
		join ' + @destCode + 'MPV' + @FieldName + ' b
		on a.PageDetailId = b.PageDetailId
	end'
IF @IsDebug=0
	BEGIN			   
		EXEC SP_EXECUTESQL @SQL	
	END
ELSE
   BEGIN
		PRINT @SQL
   END	

set @sql = '
	if exists (select * from sysobjects where name = ''' + @destCode + 'MPV' + @FieldName + ''' and xtype = ''u'')
	begin
		delete a from ' + @destCode + 'MPV' + @FieldName + ' a 
		left join '+ @destCode + 'DetailReports b
		on a.pagedetailid = b.pagedetailid
		where b.pagedetailid is null
	end'
IF @IsDebug=0
	BEGIN			   
		EXEC SP_EXECUTESQL @SQL	
	END
ELSE
   BEGIN
		PRINT @SQL
   END	

select @isfull = isfull from categorycodetable where category = @destcode

if(@isfull = 1)
begin
set @sql = 'insert into ' + @destCode + 'MPV' + @FieldName + '
	select distinct a.PageDetailId,a.' + @FieldName + 'Id,a.' + @FieldName + '  FROM ' +'masteracfv..ACFVMPV' + @FieldName + ' a 
	join 
	'+ @destCode + 'DetailReports  b
	on 
	a.pagedetailid = b.pagedetailid
	left join ' + @destCode + 'MPV' + @FieldName + ' c
	on b.pagedetailid = c.pagedetailid
	where c.pagedetailid is null
	'
end
else
begin
set @sql = 'insert into ' + @destCode + 'MPV' + @FieldName + '
	select distinct a.PageDetailId,a.' + @FieldName + 'Id,a.' + @FieldName + '  FROM ' +'masteracfv..ACFVMPV' + @FieldName + ' a 
	join 
	'+ @destCode + 'IncrDetailReports  b
	on 
	a.pagedetailid = b.pagedetailid
	left join ' + @destCode + 'MPV' + @FieldName + ' c
	on b.pagedetailid = c.pagedetailid
	where c.pagedetailid is null
	'
End
IF @IsDebug=0
	BEGIN			   
		EXEC SP_EXECUTESQL @SQL	
	END
ELSE
   BEGIN
		PRINT @SQL
   END

--set @sql = 'insert into ' + @destCode + 'MPV' + @FieldName + '
--	select distinct a.PageDetailId,a.' + @FieldName + 'Id,a.' + @FieldName + '  FROM ' +'masteracfv..ACFVMPV' + @FieldName + ' a 
--	join 
--	'+ @destCode + 'DetailReports  b
--	on 
--	a.pagedetailid = b.pagedetailid'
		
	--Change by prakash 21/06/2013
			--IF @IsDebug=0
			--   BEGIN			   
			--		EXEC SP_EXECUTESQL @SQL	
			--   END
			--ELSE
			--   BEGIN
			--		PRINT @SQL
			--   END	
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'End Detailreports MPV update  ','End Detailreports MPV update ', GETDATE()	
PRINT '-- END mt_proc_DataLoad_DetailReports_MPV_Update SP : ' + convert(varchar(100),current_timestamp,20)
END




GO

/****** Object:  StoredProcedure [dbo].[CreateMPVTables]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[CreateMPVTables]

 @sourcePDTCode as varchar(100),
 @sourceMPVCode as varchar(100),
 @sourceServer as varchar(100),
 @sourceDB as varchar(100),
 @destCode as varchar(20),
 @fieldName as varchar(100),
 @replaceTable as tinyint,
 @IsDebug as bit =0--Values : "0 = Run / 1 = Print".

AS
BEGIN
	SET NOCOUNT ON;
PRINT '-- START mt_proc_DataLoad_Create_MPV_Tables SP : ' + convert(varchar(100),current_timestamp,20)	

INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'START mt_proc_DataLoad_Create_MPV_Tables SP ','START mt_proc_DataLoad_Create_MPV_Tables SP', GETDATE()
	
	DECLARE @SQLcreate AS VARCHAR(MAX) =''
			,@SQLinsert AS VARCHAR(MAX)	
			,@SQLindex AS VARCHAR(MAX)	
			,@SQLdrop aS VARCHAR(1000)
			,@destTable AS VARCHAR(50) =  @destCode + 'MPV' + @fieldName
			,@SourceLocation AS VARCHAR(100) = ''
			,@SQLDelete Varchar(1000)



			,@DBName Varchar(20) = DB_Name()
			,@IsInteger Int		
			
			
 print @sourcePDTCode 
 print @sourceMPVCode 
 print @sourceServer 
 print @sourceDB 
 print @destCode 
 print @fieldName 

 
 	

	IF @sourceDB<> ''
	BEGIN
		SET @SourceLocation = @sourceDB + '.dbo.'
		IF @sourceServer <> ''	
			SET @SourceLocation = @sourceServer + '.' + @SourceLocation
	END
		
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = @destTable))
	BEGIN
		--IF it exists, check it we want to drop, IF so do it, IF not print error
		IF @replaceTable=1 
		BEGIN
			
			IF @IsDebug=0
			   BEGIN			   
					SET @SQLdrop = 'drop table ' + @destTable
					EXECUTE(@SQLDrop)
			   END
			ELSE
			   BEGIN
				SET @SQLdrop = 'drop table ' + @destTable
				Print @SQLDrop
			   END
		END
		ELSE
		BEGIN
			print 'Table [' + @destTable + '] already exists.'
			--return -1
		END
	END
	
			IF @replaceTable=0
				BEGIN
					SET @SQLDelete  = 'DELETE 
											FMPV 
										FROM ' + 
											@destTable + ' FMPV
											INNER JOIN ' + @SourceLocation + @sourceMPVCode + 'MPV'+@fieldName+' MPV ON 
											FMPV.PageDetailId = MPV.PageDetailId'
										
				  print @SQLDelete
						  
							IF @IsDebug=0
							   BEGIN			   
									EXECUTE(@SQLDelete)
							   END
							ELSE
							   BEGIN
								Print @SQLDelete
							   END
				END
			IF @replaceTable=1
				BEGIN
					SET @SQLInsert = 
									'SELECT DISTINCT MPV.PageDetailId, MPV.' + @fieldName + 'Id, MPV.' + @fieldName + ' 
									INTO ' + @destTable  + SPACE(1) + '
									FROM ' + @DestCode + 'DetailReports PDT 
									Join '+ @sourceMPVCode +'MPV'+@fieldName+' MPV ON MPV.PageDetailId = PDT.PageDetailId'		
				END
			ELSE
				BEGIN
					SET @SQLInsert = 
									'INSERT INTO  ' + @destTable + '
									SELECT DISTINCT MPV.PageDetailId, MPV.' + @fieldName + 'Id, MPV.' + @fieldName + '  
									FROM ' + SPACE(1) + 
										@SourceLocation + @sourcePDTCode + ' PDT 
										INNER JOIN ' + @SourceLocation + @sourceMPVCode + 'MPV'+@fieldName+' MPV ON 
										MPV.PageDetailId = PDT.PageDetailId'		
				END		


			
	
							IF @IsDebug=0
							   BEGIN			   
									EXECUTE(@SQLinsert)
							   END
							ELSE
							   BEGIN
								Print @SQLinsert
							   END
 
	PRINT @@ROWCOUNT	

      
	If @replaceTable=1
		BEGIN
			 SET @SQLindex = '
			 CREATE CLUSTERED INDEX idx_' + @destTable + '
			 ON ' + @destTable + ' (PageDetailId)'
			
				
							IF @IsDebug=0
							   BEGIN			   
									EXECUTE(@SQLindex)
							   END
							ELSE
							   BEGIN
								Print @SQLindex
							   END
			 
			 SET @SQLindex = '
			 CREATE INDEX idxPDT' +@destTable+ @fieldName + '
			 ON ' + @destTable + ' (PageDetailId,' + @fieldName + 'ID) INCLUDE(' + @fieldName + ')'
				
							IF @IsDebug=0
							   BEGIN			   
									EXECUTE(@SQLindex)
							   END
							ELSE
							   BEGIN
								Print @SQLindex
							   END
			 
			 SET @SQLindex = '
			 CREATE INDEX idxPDT' + @destTable + 'PageDetailID' + @fieldName + 
			 ' ON ' + @destTable + ' (PageDetailId) INCLUDE(' + @fieldName + ')'

							IF @IsDebug=0
							   BEGIN			   
									EXECUTE(@SQLindex)
							   END
							ELSE
							   BEGIN
								Print @SQLindex
							   END
		END 			

PRINT '-- End mt_proc_DataLoad_Create_MPV_Tables SP : ' + convert(varchar(100),current_timestamp,20)	

INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'End mt_proc_DataLoad_Create_MPV_Tables SP ','END mt_proc_DataLoad_Create_MPV_Tables SP', GETDATE()
END







GO

/****** Object:  StoredProcedure [dbo].[CreateDetailReports_Full]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateDetailReports_Full]
	@CatCode VARCHAR(15), -- CategoryCode
	@CatCodeIncrDetailReports VARCHAR(30), -- Incr Category table 
	@CatPageTable VARCHAR(30), -- Category Page Table
	@SelectFields VARCHAR(MAX), -- Select into Fields
	@Acflagsql VARCHAR(MAX), -- ACFV Fields
	@intAdDate INT, -- Integerar Date
	@CRMECnt INT, 
	@vchrCrmeJoinClause VARCHAR(500),
	@vchrCrmeWhereClause VARCHAR(500),
	@bitIsNORUnit BIT,
	@ShowEntryBrand tinyint,
	@CBEBrandField VARCHAR(100),
	@ShowEntryTaggedCompany tinyint,
	@TaggedCompanyField VARCHAR(100),
	@ShowAdType tinyint,
	@Return_Val INT OUTPUT,
	@Debug BIT =0
AS
BEGIN
	SET NOCOUNT ON
		DECLARE @SQL VARCHAR(MAX)
		,@vchrControDbPrefix VARCHAR(100)
		SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
			
			SET @SQL = 'IF EXISTS (SELECT * FROM sys.objects WHERE name = ''' + @CatCode + 'AdditionalCategoriesPull'' AND type=''u'') 
			DROP TABLE ' + @CatCode + 'AdditionalCategoriesPull '
			EXEC (@SQL)

			SET @SQL='SELECT DISTINCT * INTO ' + @CatCode + 'AdditionalCategoriesPull FROM ' + @vchrControDbPrefix + 'PEP_AdditionalCategoriesPull
			WHERE CategoryCodeId IN (SELECT ID FROM ' + @vchrControDbPrefix + 'CategoryCode WHERE Category=''' + @CatCode + ''' ) '
			EXEC (@SQL)

			SET @SQL='INSERT INTO ' + @CatCode + 'AdditionalCategoriesPull
			Select Distinct C.CategoryCodeID,L.MerchandiseCategory, L.MerchandiseSubCat, 
			L.Category, L.RealCategory 
			from ' + REPLACE(@vchrControDbPrefix,'.SiteControl.','.SiteControlLog.') + 'MerchandiseCategoryTemplatesDetailLog L
			join ' + @vchrControDbPrefix + 'MerchandiseCategoryControl C
			on L.MCTemplateID=C.MCTemplateID 
			Join ' + @vchrControDbPrefix + 'vw_catinfo V
			On V.CategoryCodeID=C.CategoryCodeID  
			Where Cast(LogTimeStamp as Date)>=Cast(Getdate()-1 as Date) And LogDMLOperation=''I'' 
			And C.CategoryCodeID in (Select ID from ' + @vchrControDbPrefix + 'CategoryCode WHERE Category=''' + @CatCode + ''' ) '
			EXEC (@SQL)

			SET @SQL = 'INSERT INTO 
				IDDB.dbo.Category (Category) 
			Select 
				DISTINCT ISNULL(Category, '''')
			From ' + @CatCode + 'AdditionalCategoriesPull  Except Select 
				DISTINCT ISNULL(Category, '''')
			From  
				IDDB.dbo.Category'
			EXEC (@SQL)

			SET @SQL = 'INSERT INTO 
				IDDB.dbo.MerchandiseCategory (MerchandiseCategory) 
			Select 
				DISTINCT ISNULL(MerchandiseCategory, '''')
			From ' + @CatCode + 'AdditionalCategoriesPull  Except Select 
				DISTINCT ISNULL(MerchandiseCategory, '''')
			From  
				IDDB.dbo.MerchandiseCategory'
			EXEC (@SQL)

			SET @SQL = 'INSERT INTO 
				IDDB.dbo.MerchandiseSubCat (MerchandiseSubCat) 
			Select 
				DISTINCT ISNULL(MerchandiseSubCat, '''')
			From ' + @CatCode + 'AdditionalCategoriesPull  Except Select 
				DISTINCT ISNULL(MerchandiseSubCat, '''')
			From  
				IDDB.dbo.MerchandiseSubCat'
			EXEC (@SQL)

			SET @SQL = 'Alter Table ' + @CatCode + 'AdditionalCategoriesPull Add CategoryID Int,MerchandiseCategoryID Int,MerchandiseSubCatID Int ' 
			EXEC (@SQL)

			SET @SQL = 'Update MC Set CategoryID =C.CategoryID , MerchandiseCategoryID =M.MerchandiseCategoryID,MerchandiseSubCatID=MSC.MerchandiseSubCatID 
					From ' + @CatCode + 'AdditionalCategoriesPull MC 
					Left Join IDDB..Category C on C.Category=MC.Category 
					Left Join IDDB..MerchandiseCategory M on M.MerchandiseCategory=MC.MerchandiseCategory 
					Left Join IDDB..MerchandiseSubCat MSC on MSC.MerchandiseSubCat=MC.MerchandiseSubCat '
			EXEC (@SQL)

				SELECT @SQL = '
				INSERT INTO 
					'+@CatCodeIncrDetailReports+ '
				SELECT 
					' + @SelectFields + @Acflagsql + ' 					
				FROM MasterACFV.dbo.ACFVDetailReports Pdt with(nolock)
				INNER JOIN ' + @CatPageTable + ' PR with(nolock) ON PR.flyerid = Pdt.FlyerID  AND PR.Page=PDT.Page 
				INNER JOIN ' + @CatCode + 'AdditionalCategoriesPull Mc with(nolock) ON Mc.RealCategory = Pdt.Category'
				
			
				IF @intAdDate > 1 
					SET @SQL = @SQL + ' AND pr.AdDate between mc.startDt and mc.enddt'				

				IF @CRMECnt > 0 
				BEGIN
					SELECT @SQL = @SQL + @vchrCrmeJoinClause
					SELECT @SQL = @SQL + ' WHERE ' + @vchrCrmeWhereClause
					SELECT @SQL = @SQL + ' AND PageDetailID NOT IN (SELECT PageDetailID FROM '+@CatCodeIncrDetailReports+ ' )'
				END
				ELSE
				BEGIN
					SELECT @SQL = @SQL + ' WHERE PageDetailID NOT IN (SELECT PageDetailID FROM '+@CatCodeIncrDetailReports+ ' )'
				END
				
				SELECT @SQL = @SQL + ' OPTION (MAXDOP 1)'
								
				IF @bitIsNORUnit = 1
					SET @SQL=Replace( @SQL,'PDT.NorPrice' ,'CASE WHEN ISNULL(RequiredQuantity,0) > 1 THEN CAST(NorPrice/RequiredQuantity AS NUMERIC(9,2)) ELSE NorPrice END AS NorPrice' 	 )
											
				IF @ShowEntryBrand = 1
				BEGIN
					SET @SQL=Replace(Replace( @SQL,'PDT.Brand,',' PDT.EntryBrand As Brand,'),'PDT.BrandID,',' PDT.EntryBrandID As BrandID,')
					SET @CBEBrandField = 'PDT.EntryBrand'	
				END
				ELSE
				BEGIN
					SET @CBEBrandField = 'PDT.Brand'
				END
				
				IF @ShowEntryTaggedCompany = 1
					SET @TaggedCompanyField = ' PDT.EntryTaggedCompany As TaggedCompany '
				
				IF @ShowAdType = 1
					SET @TaggedCompanyField = ' IsNull(AT.AdType,PDT.TaggedCompany) as TaggedCompany '

				SET @SQL=Replace( @SQL,'PDT.TaggedCompany',@TaggedCompanyField)
				
				Print @SQL
				EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				IF @Return_Val <> 0
					Return

			SET @SQL = 'DELETE FROM ' + @CatCode + 'DetailReports WHERE PageDetailID IN (SELECT PageDetailID FROM '+@CatCodeIncrDetailReports+ ') '
			EXEC DebugOrExecute @SQL, @Debug, @CatCode, @Return_Val output
				IF @Return_Val <> 0
					Return

			SET @SQL = 'IF EXISTS (SELECT * FROM sys.objects WHERE name = ''' + @CatCode + 'AdditionalCategoriesPull'' AND type=''u'') 
			DROP TABLE ' + @CatCode + 'AdditionalCategoriesPull '
			EXEC (@SQL)
END
GO

/****** Object:  StoredProcedure [dbo].[CustomStepSp_buac]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CustomStepSp_buac](
@Category varchar(50),
@Flag int,
@IsDebug int = 0
)
AS
Begin
--exec [CustomStepSP_buac] 'buac',2,1
declare @alt nvarchar(max)
declare @sql nvarchar(max)
declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('Control')

if @Category='buac' and @flag=2
begin

	set @alt='If Exists (select top 1 name from tempdb.dbo.sysobjects where xtype=''u'' and name='''+@Category+'tradeclass'')
		Drop Table tempdb.dbo.'+@Category+'tradeclass'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @alt='select * into tempdb.dbo.'+@Category+'tradeclass from ' + @vchrControDbPrefix + ''+@Category+'tradeclass'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @alt='update a set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from '+@category+'flyerreports a
	inner join tempdb..'+@category+'tradeclass b
	on a.advertiser=b.advertiser and a.market=b.market'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @alt='update a set a.tradeclass=b.tradeclass, tradeclassid=b.tradeclassid
	from '+@category+'pagereports a
	inner join tempdb..'+@category+'tradeclass b
	on a.advertiser=b.advertiser and a.market=b.market'
	if @IsDebug=1
		Print @alt
	else
		Exec (@alt)

	set @Alt='exec mt_proc_Create_DisplayTables'''+@Category+''',1'
	If @IsDebug = 1
		Print @Alt
	Else
		Exec (@Alt)
end
end

GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports_Divyang]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateFlyerReports_Divyang]
(
	@CatCode VARCHAR(20),
	@SourceCWM VARCHAR(100),
	@IsDebug bit = 1,
	@IncrLoad Bit = 0,	
	@WHEREClause VARCHAR(8000) = ' WHERE 1=1 ',
	@FetchRetMktID bit = 0


)
AS

BEGIN

	Declare @ServerType AS VARCHAR(20)
			,@strDate AS DateTime
			,@IsDAA Bit
			,@CWMFULL bit = 0
			,@ClientID integer
			,@CategoryCodeId integer
			,@CodeID integer
			,@vchrHSPClause VARCHAR(50)=''
			,@bitHSP BIT
			,@CWMTableName VARCHAR(100)
			,@SQL VARCHAR(Max) = ''
			,@mapSQL VARCHAR(max)=''
			,@FieldNames VARCHAR(max) = ''
			,@CTFieldNames VARCHAR(max) = ''
			,@CWMExpSql VARCHAR(Max) = ''			
			,@RetMktIdFlag bit =0
			,@RetIdFlag bit =0
			,@MktIdFlag bit =0
			,@TcIDFlag bit =0
			,@SqlMcc VARCHAR(MAX) = ''
			,@DeleteFilterClause VARCHAR(Max) = ''
			,@strTempRetMktTableName AS VARCHAR(100)=''
			,@Return_Val int
			,@InsertFieldNames AS VARCHAR(MAX)
			,@CTInsertFieldNames AS VARCHAR(MAX)
			,@CwmChangeCounter tinyint
			,@lTableName VARCHAR(100)
			,@lIsWeekOf bit
			,@lIsEvent bit
			,@lIsTheme bit
			,@lIsPublication bit
			,@intCategoryCodeId int
			--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT TinyInt
			--Changes End
			,@Nsql nvarchar(max)
			,@IsMaster Int
			,@DBName Varchar(20) = DB_Name()
			,@IsInteger Int
			,@BuCH Bit
			,@CWMTableSP varchar(100) = @CatCode + 'FlyerReports'
			,@ClientCWMExceptionFlag BIT=0		
			,@IncrAdRun Bit
			,@IsAdlert Bit
			,@Clientid_TBL_Lookup INT
			,@ID_Tbl_Lookup INT
			,@stagingcolumns varchar(max)
			,@vchrControDbPrefix varchar(100)
			
			SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
	PRINT '-- START CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)			
	
	-- Commented by Hiren
	SET @strTempRetMktTableName = 'TempRetMkt' + @CatCode
	
	IF @FetchRetMktID = 1  
		SET @IsDebug = 1	
		
	--IF  EXISTS (SELECT * FROM sys.sysobjects WHERE name = N'tbl_lookup' AND Type='U')
	--	Exec SP_Rename 'tbl_lookup','New_tbl_lookup';
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2ASQL06].[SiteControl].[dbo].[CategoryCode]
							
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR
														[MT2ASQL06].[SiteControl].[dbo].[TableNames]														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
														
																												
			--Temporary commented as Access is not given on MT2aSQL06 server

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A')
				DROP SYNONYM [dbo].[Connection_MT2A]

			CREATE SYNONYM [dbo].[Connection_MT2A] FOR [MT2aSQL06].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2A_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2A_NightlyProcessing] FOR [MT2aSQL06].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				dbo.Connection_MT2A
			WHERE
				ServerName = @@SERVERNAME
			
			SELECT 
				@strDate = MAX(CWMStart) + 1 
			FROM 
				Connection_MT2A_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL01'
			
		END
	ELSE
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR [MT2SQL14].[SiteControl].[dbo].[CategoryCode]

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR [MT2SQL14].[SiteControl].[dbo].[TableNames]														
														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
																												
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2')
				DROP SYNONYM [dbo].[Connection_MT2]

			CREATE SYNONYM [dbo].[Connection_MT2] FOR [MT2SQL14].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2_NightlyProcessing] FOR [MT2SQL14].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				Connection_MT2
			WHERE
				ServerName = @@SERVERNAME
				
			SELECT 
				@strDate =  MAX(CWMStart) + 1 
			FROM 
				Connection_MT2_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL00'
			
		END
		
	SELECT 
		@CWMFULL = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN 1 ELSE CWMFull END, 
		@SourceCWM = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN @SourceCWM ELSE SourceCWM END,
		@CategoryCodeId = [id],
		@ClientID = ClientId ,
		@ISDAA = ISNULL(ISDAA, 0),
		@intCategoryCodeId=ID
		--Changes done by Hiren for Item #19777
		,@IsEmail = IsNull(IsEmail, 0)
		,@IsCT = IsNull(IsCT, 0)
		--Changes End
		--Temporary Integer Based ID Changes
		,@IsMaster = IsNULL(IsMaster,0)
		,@IsInteger = IsNULL(IsIntegerID,0)
		,@BuCH = ISNULL(BuCH,0)
		,@IncrAdRun = ISNULL(IncrAdRun,0)
		,@IsAdlert = ISNULL(IsAdlert,0)
		--Changes End		
		
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @CatCode 

		
	IF @IncrLoad = 1 AND @IncrAdRun = 1 
		SET @IncrAdRun = 1
	ELSE
		SET @IncrAdRun = 0

	IF @FetchRetMktID = 0
		BEGIN
			PRINT '--@CatCode = ' + CAST(@CatCode AS VARCHAR(50))
			PRINT '--@CWMFULL = ' + CAST(@CWMFULL AS VARCHAR(50))
			PRINT '--@SourceCWM = ' + CAST(@SourceCWM AS VARCHAR(50))
			----########################## CWM LOAD  ##########################
			PRINT '-- CWM LOAD START : ' + CONVERT(VARCHAR(100),CURRENT_TIMESTAMP,20)
		END

	SET @vchrHSPClause = ''
	
	IF EXISTS(SELECT 1 FROM MasterClientCoverage..MasterClientCWMPEP WHERE CategoryCodeId =@CategoryCodeId  AND IsHSP = 1)
		BEGIN
			SET @bitHSP = 1
			SET @vchrHSPClause = ', ISNULL(IsHSP,0) IsHSP '
		END
	
		
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempPageReports')
		DROP SYNONYM [dbo].[TempPageReports]

	EXEC ('CREATE SYNONYM [dbo].[TempPageReports] FOR dbo.' + @CatCode + 'PageReports')
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempCatCodeCWM')
		DROP SYNONYM [dbo].[TempCatCodeCWM]

	EXEC ('CREATE SYNONYM [dbo].[TempCatCodeCWM] FOR dbo.' + @CatCode + 'ChildWebMain')
	
	


	--Hiren CWM Level Refresh
	Print 'Divyang need to start below things'
	Print '@CWMFULL = 0'
	Print '@IncrAdRun = 1'
	Print '@IsMaster = 0'

	--SET @CWMFULL = 0
	--SET @IncrAdRun = 1
	--SET @IsMaster = 0
	IF @CWMFULL = 1 AND ISNULL(@IncrAdRun,0) = 0
	BEGIN
		SET @CwmTableName =  @CatCode +'FullFlyerReports'
	END
	Else
	Begin
		SET @CwmTableName =  @CatCode +'INCRFlyerReports'
	End
	
	
	Print @IncrAdRun
	Print @SourceCWM

	IF @IncrAdRun = 1 
	Begin
			SET @SourceCWM = REPLACE(REPLACE(@SourceCWM, 'MasterACFV', 'ACFVINCRCWM'), 'ACFVFlyerReports', 'TempACFVFlyerReports')
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'Start to delete exisiting flyers for IncrFlyerReports','Start to delete exisiting flyers for IncrFlyerReports', GETDATE()		
			SET @SQL =	'
							-- Delete Incremental Records From FlyerReports and PageReports Table
							DELETE Main 
							FROM ' + @CatCode +'FlyerReports Main 
							INNER JOIN ' + @SourceCWM + ' INCR ON Main.FlyerID=INCR.FlyerID
					
							DELETE Main 
							FROM ' + @CatCode +'PageReports Main 
							INNER JOIN ' + @SourceCWM + ' INCR ON Main.FlyerID=INCR.FlyerID
						'

			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL 	
				
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'deleted exisiting flyers for IncrFlyerReports','deleted exisiting flyers for IncrFlyerReports', GETDATE()		
			
			IF CHARINDEX('FlyerReports',@SourceCWM,1) > 0 
				SET @SourceCWM = @SourceCWM 
			ELSE
				SET @SourceCWM = @SourceCWM + 'Incr'
			
		END
		--Would be SET blank for exceptional catcodes like "Mac"
	----------P1
	
	IF @SourceCWM <> '' 
		BEGIN
			-- Commented By Hiren
			-- AND @CatCode NOT IN('ad21','ad22','ad23','ad24','ad25') -- Not in Use
			--DROP & Create CWM TABLE
			SET @SQL = 'IF EXISTS (	SELECT 1 
									FROM 
										SYSOBJECTS 
									WHERE 
										ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
										OBJECTPROPERTY(id, N''IsUserTable'') = 1)
						DROP TABLE [dbo].[' + @CWMTableName + ']'
			--PRINT @SQL
			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL  

			SELECT 
						@FieldNames = COALESCE(@FieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'FLYERInsert' order by id 
					SET @FieldNames = REPLACE(@FieldNames, 'S.CAST(' , 'CAST(')
					

					SELECT @InsertFieldNames = COALESCE(@InsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'Flyer' order by id 
		print 'Field List'
		print @fieldnames
		print @insertfieldnames 

		--Changes done by Hiren for Item #19777
		Declare @SourceDB Varchar(100)=''
				,@TableName Varchar(100)
				
		IF CharIndex('.', @SourceCWM,1)>0 
		BEGIN
				SET @SourceDB = SUBSTRING(@SourceCWM,1,CharIndex('.', @SourceCWM, 1)-1) + '.'
				SET @TableName = SUBSTRING(@SourceCWM,CharIndex('.', @SourceCWM, 1)+ 2,LEN(@SourceCWM)-CharIndex('.', @SourceCWM, 1))
		END
		Print ''	
		print 'Source Database: ' + @SourceDB
		print 'Source TableName: ' + @TableName
			
			
			
				IF @isCT=1
				BEGIN

					SELECT 
						@CTFieldNames = COALESCE(@CTFieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'
					SET @CTFieldNames = REPLACE(@CTFieldNames, 'S.CAST(' , 'CAST(')
					SELECT @CTInsertFieldNames = COALESCE(@CTInsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'


						SET @NSQL = 'IF (SELECT 
									Count(1) 
								FROM' + SPACE(1) + 
									@SourceDB + 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + @SourceDB + 'SYS.SYSObjects O
									ON C.ID=O.ID 
								WHERE 
									C.Name IN (' + '''' + REPLACE (left(@CTInsertFieldNames,len(@CTInsertFieldNames) -1 ),',',''',''') + '''' + ') AND 
									O.Name = ''' + @TableName + ''') = 22
								SET @isCT = 1
							ELSE 
								SET @isCT = 0'
						EXEC SP_EXECUTESQL @Nsql,N'@isCT BIT OUTPUT',@isCT OUTPUT
						

				IF @isCT=1
					BEGIN

					SET @FieldNames = @FieldNames + @CTFieldNames 
					SET @InsertFieldNames = @InsertFieldNames + @CTInsertFieldNames	
					
				END
			END

		
		

		SET @FieldNames = LEFT(@FieldNames, LEN(@FieldNames)-3)
		SET @InsertFieldNames = LEFT(@InsertFieldNames, LEN(@InsertFieldNames)-1)
		
		Print ''	
		print 'Field List'
		print @fieldnames
		print @insertfieldnames 

		Print ''
		SET @SQL =	'SELECT  ' 
					 + @FieldNames + ' 
					INTO ' 
					+ @CWMTableName + ' 
					FROM ' 
					+ @SourceCWM + ' S 
					WHERE 1 = 2'
		print @SQL
			
			--Item #22441 Changes Start	
			
			--SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
			SET @SQL = REPLACE(@SQL, 'isNull(' , '')	
			SET @SQL = REPLACE(@SQL, ',0)' , '')	
			--Item #22441 Changes End	
				IF @IsDebug = 0
				BEGIN
					EXECUTE(@SQL)					
				END
			ELSE
				PRINT @SQL

		ENd

	SET @FieldNames = REPLACE(@FieldNames, 'S.isNull(' , 'isNull(S.')
		-----------------P1
	
	--IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempFlyerReports')
	--	DROP SYNONYM [dbo].[TempFlyerReports]
		
	--EXEC ('CREATE SYNONYM [dbo].[TempFlyerReports] FOR dbo.' + @CWMTableName)
	
	
	
	IF @SourceCWM <> '' AND @WhereClause = 'ExceptionalCode'  
	BEGIN
			-- New Changes For Incremental CWM PEP Process
			IF(@IncrAdRun = 1)
			Begin
					SET @SQL = 'INSERT INTO ' + @CwmTableName + ' (' + @InsertFieldNames + ') 
					SELECT DISTINCT ' + @FieldNames + ' 	
					FROM ' + @SourceCWM + ' S '
					
					print ''
					Print @SQL	
					
					print ''
					print 'Field List'
					print @insertfieldnames
					print @fieldnames 
			End
			Else
			Begin
					SET @SQL = 'INSERT INTO ' + @CwmTableName + ' (' + @InsertFieldNames + ') 
								SELECT DISTINCT ' + @FieldNames + ' 	
								FROM ' + @SourceCWM + ' S '

					Print @SQL	
					print 'Field List'
					print @insertfieldnames
					print @fieldnames 
					EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
		
					IF @Return_Val <> 0
						Return
			End
	END			
	--START : FULL AUTO LOAD
	ELSE IF @SourceCWM <> '' And @WHEREClause <> 'ExceptionalCode'
		BEGIN
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE
			SET @CWMExpSql = ''
			IF EXISTS(SELECT 1 FROM MasterClientCoverage..ClientCWMException WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						FieldID NOT IN(153, 154, 155))
				BEGIN
					-- This is not being used.
					IF @IsInteger=1 and @IsMaster=0
						SET @ClientCWMExceptionFlag = 1
					
					IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'SiteControlMasterFields')
						DROP SYNONYM [dbo].[SiteControlMasterFields]
						
					IF @@SERVERNAME LIKE 'MT2A%'
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2aSQL06].SiteControl.dbo.MasterFields
					ELSE
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2SQL14].SiteControl.dbo.MasterFields
					
					SELECT @CWMExpSql = COALESCE(@CWMExpSql ,'') + SQLWHERE 
					FROM
					(
					SELECT 
						'(S.' + FieldName + 
						CASE WHEN CHARINDEX('%',FieldValue)>0 THEN ' LIKE ' ELSE ' = ' END +
						'''' + REPLACE(FieldValue,'%','') + '''' + 
						CASE 
							WHEN ISNULL(StartDate,'') <> '' THEN 
								CASE
									WHEN ISNULL(ENDDate,'') = '' THEN 
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),@strDate,101)+ ''') OR '
									ELSE					
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),ENDDate,101) + ''') OR '
								END
							ELSE
								') OR '
						END AS SQLWHERE
					FROM
						MasterClientCoverage..ClientCWMException CCE INNER JOIN SiteControlMasterFields MF ON
						CCE.FieldID=MF.FieldID
					WHERE 
						CategoryCodeID = @CategoryCodeID AND 
						CCE.FieldID NOT IN(153, 154, 155)
					) tbl
					
					IF LEN(@CWMExpSql) > 0 
					BEGIN
						SET @CWMExpSql = '(' + LEFT(@CWMExpSql, LEN(@CWMExpSql) - 3) + ')'	
					END
				END
		END
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE

	IF EXISTS	(SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetMktId IS NOT NULL
					)
			BEGIN
				SET @RetMktIdFlag = 1
				SET @SqlMcc = '	
							SELECT 
								RETMKTID,MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' +  CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '
							FROM 
								MasterClientCoverage..MasterClientCWMPEP 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ''
			END
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetId IS NOT NULL
					)
					
			BEGIN
				SET @RetIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + ' 
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.RetId = RM.RetId  and mcc.retmktid is null 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						MktID IS NOT NULL AND 
						TcID IS NULL)
			BEGIN
				SET @MktIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '  
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.MktId = RM.MktId and mcc.retmktid is null
							WHERE CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
	IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL)
			BEGIN
				SET @TcIDFlag = 1
				IF EXISTS(
					SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL AND 
						MKTID IS NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
									SELECT  
										RM.RetMktId,RM.MediaID,
										ISNULL(StartDate,''01/01/1990'') StartDate,
										ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '  
									FROM 
										MasterClientCoverage..RETMKTPEP RM, 
										MasterClientCoverage..MasterClientCWMPEP MCC  '
				
						SET @SqlMcc = @SqlMcc + ' 
									WHERE 
										RM.TcId = MCC.TCId AND 
										MCC.MktId IS NULL AND mcc.retmktid is null and 
										MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				IF EXISTS(
						SELECT 1 
						FROM 
							MasterClientCoverage..MasterClientCWMPEP 
						WHERE 
							CategoryCodeID = @CategoryCodeId AND 
							TCID IS NOT NULL AND 
							MKTID IS NOT NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
										SELECT  
											RM.RetMktId,RM.MediaID,
											ISNULL(StartDate,''01/01/1990'') StartDate,
											ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '   
										FROM 
											MasterClientCoverage..RetMktPEP RM, 
											MasterClientCoverage..MasterClientCWMPEP MCC '
						SET @SqlMcc = @SqlMcc + ' 
										WHERE 
											RM.TcId = MCC.TCId AND 
											RM.MktId = MCC.MktId AND 
											MCC.TCID IS NOT NULL AND 
											MCC.MKTID IS NOT NULL AND mcc.retmktid is null and 
											MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				END

	--Check IF CWM Load is on the basis of ClientException TABLE values.
	IF @RetMktIdFlag = 0 AND @RetIdFlag = 0 AND @MktIdFlag = 0 AND @TcIDFlag = 0
					BEGIN
						
						IF @CWMExpSql <> ''
							SET @CWMExpSql = ' WHERE ' + @CWMExpSql
						
						SET @SQL = '
									INSERT  INTO 
										' + @CwmTableName + ' 
									SELECT ' + 
										@FieldNames + ' 
									FROM ' + @SourceCWM + ' S '
					
										
						IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
							SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '											
														
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--Item 22441 End	
						
					

						SET @SQL = @SQL + @CWMExpSql + ' OPTION (MAXDOP 1) '
						--New Approach Partial Load
				
					--	EXEC DebugOrExecute  @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --New Approach Partial Load'
						
						IF @Return_Val <> 0
							RETURN
					END
			--Check IF CWM Load is on the basis of ClientException TABLE values.		
				ELSE
					BEGIN
						Print ''
						Print 'Need to change in above scripts'
						Print ''

						IF @FetchRetMktID = 1 
							SET @IsDebug = 0
						SET @SQL = 'IF EXISTS (SELECT 1 
												FROM 
													[TEMPDB]..SYSOBJECTS 
												WHERE 
													Name = ''' + @strTempRetMktTableName + ''' AND 
													XTYPE=''U''
												)'
						SET @SQL = @SQL + ' DROP TABLE [TEMPDB]..' + @strTempRetMktTableName + ' '

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL 
							
						IF @bitHSP = 1
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate, 
												IsHSP  INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID,
												IsHSP'
						ELSE
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate  
											INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID '

						IF @IsDebug = 0
							EXECUTE(@SqlMcc)
						ELSE
							PRINT @SqlMcc
							
						SET @SQL = 'CREATE CLUSTERED INDEX IDX_CLSRetMktStDt ON 
									tempdb..' + @strTempRetMktTableName + '(RETMKTID,MEDIAID,STARTDATE,ENDDATE)'

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL
							
						IF @FetchRetMktID = 1 
						BEGIN
							SET @IsDebug = 1
							RETURN 
						END 
					
						--Commented for Centralize FlyerID End
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
						--				+ @InsertFieldNames 
						--				+ ') 
						--				SELECT ' 
						--				+ @FieldNames 
						--				+ ' FROM ' + @SourceCWM + ' S '
						--Else
							SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
										+ @InsertFieldNames 
										+ ') 
										SELECT ' 
										+ @FieldNames 
										+ ' FROM ' + @SourceCWM + ' S '
						
						print ''
						print 'Field List'
						print @insertfieldnames
						print @fieldnames
						print ''
						
						-- Commented For Incremental CWM for PEP
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL = @SQL + SPACE(1) + 'JOIN ' + @PartialSourceCode + 'flyerreports I ON S.FlyerID = I.Flyerid '
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND MCC.MediaID IS NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
						Else
							Print @SQL						
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END

						---------------------- Media Base changes --------------------------
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
						--				+ @InsertFieldNames 
						--				+ ') 
						--				SELECT ' 
						--				+ @FieldNames 
						--				+ ' FROM ' + @SourceCWM + 'FlyerReports S '
						--Else
							SET @SQL =	'INSERT INTO ' + @CwmTableName + ' (' 
										+ @InsertFieldNames 
										+ ') 
										SELECT ' 
										+ @FieldNames 
										+ ' FROM ' + @SourceCWM + ' S '
						
						print ''
						print 'Field List'
						print @insertfieldnames
						print @fieldnames
						print ''
						
							
						--IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
						--	SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '																		
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND S.MediaID=MCC.MediaID AND MCC.MediaID IS NOT NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) --and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into TempFlyerReports'
						Else
							Print @SQL		
							
						IF @IncrAdRun = 1 
						Begin
								SET @sql = 'Update ' + @CwmTableName + ' SET media = ''FSI'', mediaId = 1 where advertiser = ''FSI'''
								IF(@IsDebug = 0)
									EXEC(@sql)
								Else
									Print @sql
						End				
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END
---------------------- Media Base changes --------------------------
					END
	----------P2
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--153, 154, 155
	IF EXISTS(SELECT * FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
					BEGIN
						SET @SQL = ''
						SET @DeleteFilterClause = ''
						
						;WITH ClientCWMException (FieldName,RID,StartDate, ENDDate,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								StartDate,
								ENDDate,
								FieldID 
							FROM 
								(SELECT 
									Distinct
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									StartDate,  
									ENDDate,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						SELECT 
								RID,
								--Commented for Centralize FlyerID End
								'INSERT INTO ' + @CwmTableName + ' (' 
								+ @InsertFieldNames 
								+ ') SELECT ' 
								+ @FieldNames + SPACE(1) 
								+ 'FROM '
								+ CASE
									WHEN @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1 THEN + @SourceCWM  + ' S' + SPACE(1) 
									ELSE @sourcecwm+' S' + SPACE(1) 
									END
								+										
									--Item 22441 Start
									CASE 
										WHEN @BuCH = 1 THEN
											CASE 
												WHEN EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId ) THEN
													CASE 
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
															NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														WHEN NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														ELSE
															' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass'
													END
												ELSE
													SPACE(1)
													--' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													--	S.TradeClass=MCA.TradeClass'
											END
										ELSE
											SPACE(1)
										END
										--Item 22441 End								
								
										+ SPACE(1) + ' WHERE ' +  
											FieldName + ' IN (SELECT 
																	FieldValue 
																FROM 
																	MasterClientCoverage..ClientCWMException 
																WHERE
																	CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																	FieldID = ' + Cast(FieldID AS VARCHAR(10))+ ' AND 
																	IsNull(StartDate,'''') = ''' + CAST(IsNull(StartDate,'') as VARCHAR(20)) + ''' AND
																	IsNull(EndDate,'''') = ''' + CAST(IsNull(EndDate,'') as VARCHAR(20)) + '''
																) AND 
											AdDate BETWEEN ''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(StartDate,'') = '' THEN '01/01/1990' ELSE StartDate END,101) + ''' AND 
															''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(ENDDate,'') = '' THEN @strDate ELSE ENDDate END ,101) + '''' 
							As Query
						INTO #Temp_ClientCWMException	
						FROM 
							ClientCWMException
						ORDER BY
							RID
						--SELECT * FROM 	#Temp_ClientCWMException							
						SET @CwmChangeCounter = @@ROWCOUNT
						
						--IF @BuCH = 0 
						--	BEGIN
						--		UPDATE #Temp_ClientCWMException 
						--			SET Query = REPLACE(Query,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--	END
						
						 IF @BuCH = 1 AND EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )
								UPDATE #Temp_ClientCWMException SET Query = REPLACE(Query,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

						IF @IncrAdRun = 1 
							BEGIN
								UPDATE #Temp_ClientCWMException 
									SET Query = REPLACE(Query,'Masteracfv..ACFVFlyerReports','ACFVINCRCWM..TempACFVFlyerReports')
									--Commented for Centralize FlyerID Start
									--,
									--	MAPQuery = REPLACE(MAPQuery,'MasterAdviewData.dbo.AdViewMain','MasterClientCoverage.dbo.AdviewMainUpdate')
									--Commented for Centralize FlyerID End
							END
					
						WHILE @CwmChangeCounter > 0 
							BEGIN
								SELECT 
									@SQL = 
										CASE 
											WHEN @IncrAdRun = 1 
											THEN Query +
												' AND Flyerid NOT IN(SELECT FLYERID FROM ' + @CwmTableName + '' + ')' --+
											ELSE
												Query
											END
								FROM 
									#Temp_ClientCWMException 
								WHERE 
									RID = @CwmChangeCounter
								ORDER BY
									RID DESC									
									
								IF @IsDebug = 0
									BEGIN	
										PRINT @SQL
										EXEC(@SQL)
									END
								ELSE
									BEGIN
										PRINT @SQL 
										PRINT @mapSQL
									END
								
								SET @CwmChangeCounter = @CwmChangeCounter - 1
							END	
						DROP TABLE #Temp_ClientCWMException
						
						--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							
						;WITH ClientCWMException (Query,ID,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								FieldID 
							FROM 
								(SELECT 
									Distinct 
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						,GetExecutableQuery (FId, Query) AS
						(
							SELECT 
								1, CAST('' AS VARCHAR(MAX)) 
							UNION ALL
							SELECT 
								B.FId + 1, B.Query +  CAST(A.Query AS VARCHAR(MAX)) + ' IN (SELECT 
																								FieldValue 
																							FROM 
																								MasterClientCoverage..ClientCWMException 
																							WHERE
																								CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																								FieldID = ' + Cast(FieldID AS VARCHAR(10))+ '
																							) OR (' 
							FROM 
								ClientCWMException A INNER JOIN GetExecutableQuery B ON A.ID = B.FId 
						)
						SELECT 
							TOP 1 @DeleteFilterClause = LEFT(Query, LEN(Query)-5) 
						FROM 
							GetExecutableQuery 
						ORDER BY 
							FId DESC
						--Print 'cursor ends -2'									
						--PRINT @DeleteFilterClause	
						--EXEC DebugOrExecute @DeleteFilterClause, @IsDebug, @CatCode, @Return_Val OUTPUT
						--Print 'cursor ends'	
					END
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--Start : Check for "PRDHSP"
					--Commented By Hiren
					--IF @CatCode IN('PRDHSP','mfdHisp','mfdTtl') Or @CatCode = 'ADV13GR'
	IF @CatCode IN('PRDHSP','mfdHisp50','mfdTtl50','ADV13GR')
						BEGIN

							SET @SQL = 'INSERT INTO ' + @CWMTableName + '(' + @InsertFieldNames + ') 
									SELECT ' + 
										@FieldNames + 
									' FROM 
										MasterClientCoverage..EPHSPFlyerReports S '
										
							--Item 22441 Start
							IF @BuCH = 1
								BEGIN
									IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
										BEGIN 
											IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
												NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
											ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass'
												SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

										END
									--ELSE
										--SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
										--			S.TradeClass=MCA.TradeClass'
								END
							--ELSE
							--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
							--Item 22441 End	
										
							IF @IncrAdRun = 1
							BEGIN
								SET @SQL = @SQL + ' WHERE Flyerid NOT IN(SELECT FLYERID FROM ' + @CwmTableName + ')' --Temp Incremental TABLE
								SET @SQL = REPLACE(@SQL, 'MasterClientCoverage..EPHSPFlyerReports', 'MasterClientCoverage..EphspFlyerReportsIncr')								
								--SET @SQL = @SQL + ' AND Flyerid NOT IN(SELECT FLYERID FROM TempCatCodeCWM)' --Actual CWM TABLE.
							END
							Print @SQL
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							IF @Return_Val <> 0
								Return				
						END
					--END : Check for "PRDHSP"
			END
	--END : FULL AUTO LOAD	

	-------------P3
				IF @CWMFULL = 1 And ISNULL(@IncrAdRun,0) = 0
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)	
						IF @ServerType = 'Master' OR (@ServerType = 'Client' AND @@servername = 'MT2SQL00')
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMFullRundate = ''' + Cast(@strDate as Varchar(20))+ ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMFullRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				IF @IncrAdRun = 1
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)
						IF @ServerType = 'Master'	
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMPartialRundate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMPartialRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				----########################## CWM LOAD  ##########################
				--########################## CWM CHANGES  ##########################
				--PRINT '-- CWMCHANGES START : ' + convert(VARCHAR(100),current_timestamp,20)
				--chnaged by prakash on 7/12/2013
				--INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMCHANGES START ','CWMCHANGES START', GETDATE()
	
				--SET @CwmChangeCounter = 1
				
				--Commented By Hiren
				--SET @CwmChangesWHEREClause = ''
	--IF @CWMChanges = 1 
	--IF EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId)
	--BEGIN
	--------------------------------------------------kishan----------------------------------------
--	declare @select varchar(max)
----declare @sql varchar(max)
----insert into cargPepFlyerReports

--SELECT --T.CATEGORYCODEID, 
--       @select= STUFF((SELECT ' OR ' + x.EXISTINGVALUE 
--                FROM MasterClientCoverage..CLIENTCWMCHANGES x
--               WHERE x.CATEGORYCODEID = t.CATEGORYCODEID AND CODEID = 84
--						--AND  X.CODEID = T.CODEID
--            GROUP BY x.EXISTINGVALUE
--             FOR XML PATH ('')), 1, 3,'') --AS ABC

--  FROM MasterClientCoverage..CLIENTCWMCHANGES t WHERE CATEGORYCODEID = @CategoryCodeId AND CODEID = 84
----GROUP BY t.CATEGORYCODEID
----print @abc
--set @sql = ' insert into ' + @CWMTableName + '('+@insertfieldnames+') select '+@insertfieldnames+' from ' + 
--							@SourceCWM + ' where addate >= ''01/01/2015'' and ('+ @select+')'
--print( @sql)
--exec (@sql)


--		;WITH ClientCWMChanges (FieldName,ID,RID, ExistingValue, NewValue, ExecutionOrder, CodeID_Main) AS 
--		(
--			SELECT  
--				FieldName, 
--				Row_Number() OVER (Partition BY CodeID,ExecutionOrder ORDER BY ExecutionOrder, CodeID) AS ID,
--				Row_Number() OVER (ORDER BY ExecutionOrder, CodeID) AS RID,
--				ExistingValue,
--				NewValue,
--				ExecutionOrder,
--				CodeID
--			FROM 
--				(SELECT 
--					DISTINCT 
--					CASE 
--						WHEN CodeID = 12 THEN 'Market' 
--						WHEN CodeID = 13 THEN 'Advertiser' 
--						WHEN CodeID = 14 THEN 'TradeClass' 
--						WHEN CodeID = 15 THEN 'Media' 
--						--when codeid= 84 then ''
--					END AS FieldName,
--					ExistingValue,
--					NewValue,
--					CASE 
--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) = 0 THEN 1

--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) > 0 THEN 2

--						WHEN CodeID <> 14 THEN 3
--					END AS ExecutionOrder,
--					CodeID
--				FROM 
--					MasterClientCoverage.dbo.ClientCwmChanges
--				WHERE
--					--ClientID = @ClientID AND
--					CategoryCodeID = @CategoryCodeId
--				)DT
--		)
--		,GetExecutableQuery (RowNum, Query, CodeID, Field_Name) AS
--		(
--			SELECT 
--				1, 
--				CAST('' AS VARCHAR(MAX)) ,0,CAST('' AS VARCHAR(100))
--			UNION ALL
--			SELECT 
--				1 + B.RowNum, 
--				CASE 
--					WHEN A.CodeID_Main = 11 THEN 
--						CASE 
--						WHEN ID = 1 THEN 
--							'Delete  FROM ' + @CWMTableName + ' WHERE ' 
--						ELSE 
--							B.Query 
--						END +  ExistingValue + ' OR '
--					ELSE
--						CASE 
--						WHEN ID = 1 THEN 
--							'UPDATE ' + @CWMTableName + ' SET ' + FieldName + ' = CASE ' 
--						ELSE 
--							B.Query 
--						END +  'WHEN ' + ExistingValue + ' THEN ' + NewValue + SPACE(1)
--					END,
--				 CASE WHEN B.CodeID <> A.CodeID_Main THEN A.CodeID_Main ELSE B.CodeID  END,
--				 CAST(FieldName AS VARCHAR(100))
--			FROM 
--				ClientCWMChanges A INNER JOIN GetExecutableQuery B ON 
--				A.RID=B.RowNum
--		)
--		SELECT 
--			CASE CodeID
--				WHEN 11 THEN LEFT(Query ,LEN(Query)-3)
--			ELSE
--				Query + 'ELSE ' + Field_Name + ' END'	
--			END AS Query,
--			ROW_NUMBER() OVER (Order BY CodeID)	AS RID
--			INTO #Temp
--		FROM 
--			GetExecutableQuery T2 INNER JOIN
--			(
--			SELECT MAX(RID)+1 AS RID FROM ClientCWMChanges GROUP BY FieldName,ExecutionOrder
--			) T1 ON T1.RID=T2.RowNum
--		OPTION (MAXRECURSION 0)
--		--Select * from #temp
--		SET @CwmChangeCounter = @@ROWCOUNT
		
--		WHILE @CwmChangeCounter > 0 
--			BEGIN
--				SELECT @SQL = Query FROM #Temp WHERE RID = @CwmChangeCounter
--				IF @IsDebug = 0
--					BEGIN	
--						EXEC(@SQL)
--					END
--				ELSE
--					PRINT @SQL 
				
--				SET @CwmChangeCounter = @CwmChangeCounter - 1
--			END	
--		DROP TABLE #Temp
--	--Added for Renamed Adv\Mkt\Mkt\TC
--	;With CTE 
--	As
--	(
--	SELECT Distinct CodeID,CASE WHEN CodeID = 12 THEN 'Market' WHEN CodeID = 13 THEN 'Advertiser'WHEN CodeID = 14 THEN 'TradeClass'WHEN CodeID = 15 THEN 'Media' END as Field
--	FROM MasterClientCoverage.dbo.ClientCwmChanges  WHERE  CodeID <> 11 AND ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId 
--	)
--	Select Row_Number () Over( Order By CodeID) RID,'INSERT INTO 
--				IDDB.dbo.'+ Field +' ('+ Field +') 
--			Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From ' + @CWMTableName + '  Except Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From  
--				IDDB.dbo.'+ Field +'' as IQuery,
--			'Update F Set '+ Field +'ID =I.'+ Field +'ID
--					From ' + @CWMTableName + ' F 
--					Left Join IDDB..'+ Field +' I on I.'+ Field +'=F.'+ Field +'' as UQuery
--	Into #IDDBRenamingUpdate
--	From CTE

--	SET @CwmChangeCounter = @@ROWCOUNT
		
--	WHILE @CwmChangeCounter > 0 
--		BEGIN
--			SELECT @SQL = IQuery,@nSQL=UQuery FROM #IDDBRenamingUpdate WHERE RID = @CwmChangeCounter
--			IF @IsDebug = 0
--				BEGIN	
--					EXEC(@SQL)
--					EXEC(@nSQL)
--				END
--			ELSE
--				BEGIN
--					PRINT @SQL 
--					PRINT @nSQL
--				END
--			SET @CwmChangeCounter = @CwmChangeCounter - 1
--		END	
--	DROP TABLE #IDDBRenamingUpdate
--	ENd
	--------------------------------------------kishan---------------------------------------------------	
	
	--Item#23659 Changes for Updating Retid, MktID and RetMKTID
	SET @SQL= 
			'UPDATE F 
			SET 
				F.MktId=R.MKTID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.MktID <> R.MKTID AND F.Market = R.Market;

			UPDATE F 
			SET 
				F.RetId=R.RetID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.RetId <> R.RetID AND F.Advertiser = R.Advertiser;
					
			UPDATE F 
			SET 
				F.RetMktId=R.RetMktID
			FROM 
				MasterClientCoverage..RETMKTPEP R  JOIN ' + @CWMTableName + ' F 
					ON R.Advertiser=F.Advertiser and R.Market=F.Market 
			WHERE R.RetMktID<>F.RetMktId'
			
	IF 	@IsDebug=0
		BEGIN
			EXEC(@SQL)
		END	
	ELSE	
		BEGIN
			Print @SQL
		END			
	----P4
	--########################## CWM CHANGES  ##########################
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	IF @IncrAdRun = 1
		BEGIN
			
			PRINT '5.0 incr'
			-- change by praksh on 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,0
				END	
			ELSE	
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,1
				END
				
			--Delete On Basis of SourceCWM TABLE	
			Print @SourceCWM			
			SET @SQL = 'DELETE 
						FROM 
							' + @CwmTableName + ' 
						WHERE 
							FlyerId NOT IN(	SELECT 
												FlyerId 
											FROM ' + 
												@SourceCWM + ') AND 
							FlyerId NOT LIKE ''FT%'''

			IF @bitHSP = 1
				SET @SQL = @SQL + Space(1) + 'AND 
							FlyerId NOT IN (SELECT 
												FlyerId 
											FROM 
												MasterClientCoverage..EphspFlyerReports)'
			--Start : Check Whether Pull is done from AdviewMain for the CategoryCode
			--153, 154, 155
			IF EXISTS(SELECT 1 FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
				BEGIN
					IF LEN(@DeleteFilterClause) > 0
						SET @DeleteFilterClause = LEFT(@DeleteFilterClause,LEN(@DeleteFilterClause) - 3)
					SET @SQL = @SQL + ' AND NOT(' + @DeleteFilterClause + '))'	
					--SET @SQL = @SQL + ' AND FlyerId NOT IN (SELECT FlyerId FROM ' + @CwmTableName + ')'
				END
				
			--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output

			IF @Return_Val <> 0
				Return		
			
		END
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	ELSE
		BEGIN
		--Full
			PRINT '5.0 full'
			--change by prakash 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,0
				END	
			ELSE
				BEGIN
				  EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,1			  
				END
		END
		PRINT 'after  5.0'
		
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMUPDATE START ','CWMUPDATE START', GETDATE()	
	PRINT '-- CWMUPDATE START : ' + convert(varchar(100),current_timestamp,20)
	
	--APPLY CWMUPDATE - updated for 50
	EXECUTE CWMUPDATE_50 @CatCode ,@IsDebug
	
	--Update the CWM Media if not DAA for certain 360 Flyers
	If @IsDAA=0 AND @IsAdlert = 0
	BEGIN
		SET @SQL = 'Update CWM set Media = ''Insert-Paper'', MediaId=15
		from ' + @CatCode + 'FlyerReports CWM
		inner join MasterClientCoverage.dbo.FlyersToChangeToPrint360 F360 on F360.FlyerId = CWM.FlyerID '

		IF @IsDebug = 0
			EXECUTE(@SQL)
		ELSE
			PRINT @SQL
	END

	--Item 22441 Start
	IF @BuCH = 1
		BEGIN 
			IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
				BEGIN 
					IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
						NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
					ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass'
				END
			--ELSE
			--	SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
			--		S.TradeClass=MCA.TradeClass'
			IF @IsDebug = 0
				 BEGIN
			 		EXECUTE(@SQL)
				 END
			ELSE
				BEGIN
					PRINT @SQL
				END
					
			EXEC mt_proc_Create_ID_Update @CWMTableSP, 'Channel',@IsDebug		
		END

	--Item 22441 End		

	--Item:19751

	Declare @intAdDate int
			--,@vchrControDbPrefix varchar(100)=dbo.mtfunc_GetDatabasePrefix('Control')
	
	SET @Nsql = 'SELECT @intAdDate  = count(1) FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory   
			WHERE CategoryCodeId = @intCategoryCodeId AND (ISNULL(StartDt,'''')<> '''' or ISNULL(EndDt,'''')<> '''')'
	exec sp_executesql @Nsql,N'@intAdDate int output,@intCategoryCodeId int',@intAdDate  output,@intCategoryCodeId		
	IF @intAdDate > 0
	BEGIN
	SET @sql='IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].['+ @CatCode + 'FlyerReports]'') AND name = N''idx_'+ @CatCode + 'FlyerReportsAdDate'')
				DROP INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] WITH ( ONLINE = OFF )
			CREATE NONCLUSTERED INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] 
			(
			[AdDate] ASC
			)
			INCLUDE ( [FlyerID])'
	IF @IsDebug = 0
	EXECUTE(@SQL)
	ELSE
	PRINT @SQL
	END
	--########################## CREATE DEPENDENT TABLES. ##########################
	--Adview2Control Changes
	PRINT '-- CREATE DEPENDENT TABLES START : ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CREATE DEPENDENT TABLES START  ','CREATE DEPENDENT TABLES START ', GETDATE()	
	
	Select 
		@lIsEvent = ISNULL(IsEvent,0), 
		@lIsTheme = ISNULL(IsTheme,0), 
		@lIsPublication = ISNULL(IsPublication,0) 
	From 
		CategoryCodeTable 
	Where 
		Category = @CatCode 
	
	
	--Publication
	SET @lTableName = @CatCode + 'Publication'
	IF EXISTS (select * from sysobjects where id = object_id(@lTableName) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			SET @SQL = 'DROP TABLE ' + @lTableName
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'drop Publication table'
		END
	IF @lIsPublication = 1
		BEGIN
			SET @SQL = 'SELECT DISTINCT Publication INTO ' + @lTableName + ' From ' + @CatCode + 'FlyerReports'
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'create and insert disitinct publication in new table'
		END
		


	IF @IsDebug=0
		BEGIN
			--Change by prakash on 14/06/2013
			PRINT ' EXECUTE mt_proc_Create_ID_Update SP for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',0
			--Changes end		
		END
	ELSE
		BEGIN
		   --Change by prakash on 14/06/2013
			PRINT ' Print  mt_proc_Create_ID_Update SPs all statements for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',1
		 END



--Changes by praksh on 14/06/2013
	IF @IncrAdRun = 1
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports_Divyang] @SourceCWM, '', '', '', @CatCode, 0,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports_Divyang] @SourceCWM, '', '', '', @CatCode, 0,1
				END			
		END	
	ELSE
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports_Divyang] @SourceCWM, '', '', '', @CatCode, 1,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports_Divyang] @SourceCWM, '', '', '', @CatCode, 1,1
				END
		END
				
	IF @IsDebug=0
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,0
		END
	ELSE
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,1
		END
--Start: drop temp fullCWM and incrCWM tables after code is processed 
SET @SQL = 'IF EXISTS (	SELECT 1 
		FROM 
			SYSOBJECTS 
		WHERE 
			ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
			OBJECTPROPERTY(id, N''IsUserTable'') = 1)
DROP TABLE [dbo].[' + @CWMTableName + ']'

--IF @IsDebug = 0
--EXECUTE(@SQL)
--ELSE
--PRINT @SQL  
--End: drop temp fullCWM and incrCWM tables after code is processed 
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'END CreateClientCWMTable_50 SP ','END CreateClientCWMTable_50 SP', GETDATE()
	
PRINT '-- END CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)














GO

/****** Object:  StoredProcedure [dbo].[PopulateFlyerReports]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PopulateFlyerReports]

 @sourceCWMCode as varchar(20),
 @sourceServer as varchar(50),
 @sourceDB as varchar(50),
 @destCode as varchar(20),
 @replaceTable as tinyint,
 @IsDebug as bit = 0--Values : "0 = Run / 1 = Print".

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFIRST 7 -- Confirming Sunday is first
	
	Declare	@SQL as VARCHAR(MAX)	
			,@NSQL NVarchar(max)
			,@SQLindex as VARCHAR(MAX)	
			,@SQLindexFullFlyerReports as VARCHAR(MAX)
			,@SQLdrop as VARCHAR(1000)
			,@destTable as VARCHAR(50)
			,@SourceLocation as VARCHAR(100)
			,@SQLInsert as Varchar(Max)
			,@ColumnName as Varchar(50)
			,@RowCount as tinyint
			,@FieldNames As Varchar(MAX)
			,@InsertFields as Varchar(Max)
			,@CTInsertFields as Varchar(Max)
			,@IsEmail Bit
			,@IsCT tinyint
			,@DBName Varchar(20) = DB_Name()
			,@IsMaster Int
			,@IsInteger Int
			,@SourceCWM Varchar(50)
PRINT '-- START mt_proc_Create_FlyerReports_From_FV SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start to Create FlyerReports ','Start to Create FlyerReports ', GETDATE()
SET 	@sourceCWMCode = @destcode +  @sourceCWMCode
	--Temporary Integer Based ID Changes
	
	SELECT 
		@IsMaster = IsNULL(IsMaster,0),
		@IsInteger = ISNULL(IsIntegerID,0),
		@IsCT = ISNULL(IsCT,0),
		@SourceCWM = SourceCWM
		--,@IsDAA = ISNULL(IsDAA,0)
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @destCode 			
	--Changes End		
	
	SET @SourceLocation=''

	IF @sourceDB<> ''
		BEGIN
			SET @SourceLocation = @sourceDB + '.dbo.'
			IF @sourceServer <> ''	
				SET @SourceLocation = @sourceServer + '.' + @SourceLocation
		END



	SET @destTable = @destCode + 'FlyerReports'
	SET @SQL = ''
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = @destTable))
		BEGIN
			--IF it exists, check it we want to drop, IF so do it, IF not PRINT error
			IF @replaceTable=1
				BEGIN
					SET @SQLdrop = 'drop table ' + @destTable
					print @destTable + ' table droped'
						
					IF  EXISTS(SELECT *
						  FROM   sysindexes
						  WHERE  name = 'CI_' + @destCode +'FlyerReportsFlyerID')
					--	  print 'hiren'
					BEGIN 
						
						
					
						/****** Object:  Index [ClusteredIndex-20140625-094715]    Script Date: 6/25/2014 9:50:57 AM ******/
						SET @SQL='CREATE CLUSTERED INDEX [CI_' + @destCode +'FlyerReportsFlyerID] ON [dbo].[' + @destCode +'FullFlyerReports]
						(
							[FlyerID] ASC
						)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'

						If @IsDebug=0
							Begin
								EXEC (@SQL)
							End
						Else 
							Begin
							  PRINT (@SQL)
							End

						Print 'Clustered Index has been created at '  + convert(varchar(100),current_timestamp,20)	
					END					
					
				END
			ELSE
				BEGIN
					PRINT 'Table [' + @destTable + '] already exists.'
					--return -1
				END
			--Change by prakash 13/06/2013
						IF @IsDebug=0
						   BEGIN			   
								EXECUTE(@SQLdrop)								
						   END
						ELSE
						   BEGIN
							Print @SQLdrop
						   END
			 			
		END
		
		
	IF @replaceTable=0
		SET @SQL = 'INSERT INTO ' + @destTable + SPACE(1)

	SELECT 
		@InsertFields = COALESCE(@InsertFields ,'') + LTRIM(RTRIM(CategoryValue)) +','
	FROM
		tbl_LookUp
	WHERE
		CategoryType = 'Flyer'
	ORDER BY 
		ID

	SET @InsertFields = LEFT(@InsertFields, LEN(@InsertFields)-1)
	
	IF @IsCT=1
	Begin

		
		SELECT 
			@CTInsertFields = COALESCE(@CTInsertFields ,'') + LTRIM(RTRIM(CategoryValue)) +','
		FROM
			tbl_LookUp
		WHERE
			CategoryType = 'WithCTFields'
		ORDER BY 
			ID

		SET @NSQL = 'IF (SELECT 
									Count(1) 
								FROM' + SPACE(1) + 
									@SourceDB + 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + @SourceDB + 'SYS.SYSObjects O
									ON C.ID=O.ID 
								WHERE 
									C.Name IN (' + '''' + REPLACE (left(@CTInsertFields,len(@CTInsertFields) -1 ),',',''',''') + '''' + ') AND 
									O.Name = ''' + @sourceCWMCode + 'FlyerReports'') = 22
								SET @isCT = 1
							ELSE 
								SET @isCT = 0'
						EXEC SP_EXECUTESQL @Nsql,N'@isCT BIT OUTPUT',@isCT OUTPUT
						
		IF @IsCT=1
		Begin
		SET @CTInsertFields = LEFT(@CTInsertFields, LEN(@CTInsertFields)-1)
		SET @InsertFields= @InsertFields+','+ @CTInsertFields
		End
	End
	
	--Changes done by Hiren for Item #19777
	
		
	--Changes End
	--Item 23261 changes by prakash on 852013	
	IF @destCode in ('AD50','adPRDt50','adACT50') 
		BEGIN			
			SET @InsertFields= @InsertFields +',coupon,Priority,DateTimeRecordEntered,recordenteredby'			
		END	
	--changes End
	
	SET @SQL= @SQL+ 'SELECT ' + @InsertFields --Changes done by Hiren for Item #19777 v1.2

	IF @replaceTable=1
		SET @SQL=@SQL + ' INTO ' + @destCode + 'FlyerReports '
	
	SET @SQL=@SQL + '
		FROM ' + 
			@SourceLocation + @sourceCWMCode + 'FlyerReports FlyerReports '
	--PRINT @SQL
	
	
	--Change by praksh 13/06/2013				
			If @IsDebug=0
				Begin
					EXEC (@SQL)
				End
			Else 
			   Begin
				  PRINT (@SQL)
				End
	
	--Commented By Hiren
	----	SET @SQL= + ' Update FlyerReports SET VehicleId=VP.VehicleId, CreationMonth=VP.CreationMonth
	----	from ' + @destCode + 'FlyerReports FlyerReports
	----inner join MasterAdviewData.dbo.MCAPVehiclePages  VP on FlyerReports.FlyerId = VP.FlyerId '
	
	----exec sp_executesql @SQL
	--chnaged by prakash on 7/11/2013
	IF @replaceTable = 1 
		BEGIN
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start to Create PK index on FlyerReports ','Start to Create PK index on FlyerReports ', GETDATE()
			PRINT '--Create PK index on FlyerReports'
			--Create PK index on FlyerReports
			SET @SQLindex='
				ALTER TABLE 
					[' + @destCode + 'FlyerReports]
					ADD CONSTRAINT [PK_' + @destCode + 'FlyerReports_FlyerId]
				PRIMARY KEY CLUSTERED
				(
					[FlyerId] ASC
				)'
			
			--Change by praksh 13/06/2013				
			If @IsDebug=0
				Begin
					IF @replaceTable=1
						EXECUTE(@SQLindex)
			
					SET @SQLindex='
						IF NOT EXISTS(SELECT * FROM  sysindexes WHERE Name = ''IDX_' + @destCode + 'FlyerReports_Pages'')
						BEGIN 	
							CREATE NONCLUSTERED INDEX IDX_' + @destCode + 'FlyerReports_Pages
							ON [dbo].[' + @destCode + 'FlyerReports]	(
																			[pages]
																		)
							INCLUDE (
										[FlyerID],
										[AdvertiserId],
										[Advertiser],
										[marketid],
										[market],
										[AdDate],
										[RetMktID],
										[WeekOf],
										[AdMonth],
										[AdMonthId]
									)
						END'
				
					EXECUTE(@SQLindex)		
						
					-- Changes on 10.02.2017 as More Indexes Required as Master

					SET @SQLindex =	'
										IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMINDEX1'')
										Begin
												CREATE  INDEX [' + @destCode + 'CWMINDEX1] ON [dbo].[' + @destCode + 'FlyerReports]
												(AdDate, RetMktID, FlyerId) WITH  FILLFACTOR = 90 ON [PRIMARY]
										End

										IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMRetMkt'')
										Begin
												CREATE  INDEX [' + @destCode + 'CWMRetMkt] ON [dbo].[' + @destCode + 'FlyerReports]
												(AdvertiserId, Advertiser, MarketId, Market, AdDate, RetMktID, FlyerId) ON [PRIMARY]
										End

										IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMConsolidated'')
										Begin
												CREATE  INDEX [' + @destCode + 'CWMConsolidated] ON [dbo].[' + @destCode + 'FlyerReports]
												(AdDate, WeekOf, AdMonthId, AdvertiserId, Advertiser, MarketId, Market, RetMktID, MediaId, Media, PublicationId, Publication, FlyerId) ON [PRIMARY]
										End


										IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMLarge'')
										Begin
												CREATE  INDEX [' + @destCode + 'CWMLarge] ON [dbo].[' + @destCode + 'FlyerReports]
												(AdDate, Advertiser, Market, Media, RetMktID, TradeClassId, TradeClass, RegionId, Region, DistrictId, District, ThemeId, Theme, EventId, Event, FlyerId) ON [PRIMARY]
										End

										IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @destCode + 'FlyerReports_FieldSet1'')
										Begin
												CREATE NONCLUSTERED INDEX idx_' + @destCode + 'FlyerReports_FieldSet1 ON dbo.' + @destCode + 'FlyerReports 
												([RetMktId], [mediaId], [AdDate]) 
												INCLUDE ([FlyerID], [AdvertiserId], [Advertiser], [marketid], [market], [media], [eventId], [themeid], [PublicationId], [TradeClassId], [pages], [ChannelID])
										End

										IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @destCode + 'FlyerReports_FieldSet2'')
										Begin
												CREATE NONCLUSTERED INDEX idx_' + @destCode + 'FlyerReports_FieldSet2 ON dbo.' + @destCode + 'FlyerReports 
												([ACRepflag],[AdvertiserId], [marketid], [RetMktId], [mediaId], [AdDate]) 
												INCLUDE ([FlyerID], [Advertiser], [market], [media], [Admonthid], [WeekOf])
										End

									'
						EXECUTE(@SQLindex)	
						
		
						 
				End
			Else 
				Begin
						PRINT(@SQLindex)
			
						SET @SQLindex =	'
											IF NOT EXISTS(SELECT * FROM  sysindexes WHERE Name = ''IDX_' + @destCode + 'FlyerReports_Pages'')
											BEGIN 	
												CREATE NONCLUSTERED INDEX IDX_' + @destCode + 'FlyerReports_Pages
												ON [dbo].[' + @destCode + 'FlyerReports]	(
																								[pages]
																							)
												INCLUDE (
															[FlyerID],
															[AdvertiserId],
															[Advertiser],
															[marketid],
															[market],
															[AdDate],
															[RetMktID],
															[WeekOf],
															[AdMonth],
															[AdMonthId]
														)
											END
										'
				
						PRINT(@SQLindex)


						-- Changes on 10.02.2017 as More Indexes Required as Master

						SET @SQLindex =	'
											IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMINDEX1'')
											Begin
													CREATE  INDEX [' + @destCode + 'CWMINDEX1] ON [dbo].[' + @destCode + 'FlyerReports]
													(AdDate, RetMktID, FlyerId) WITH  FILLFACTOR = 90 ON [PRIMARY]
											End

											IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMRetMkt'')
											Begin
													CREATE  INDEX [' + @destCode + 'CWMRetMkt] ON [dbo].[' + @destCode + 'FlyerReports]
													(AdvertiserId, Advertiser, MarketId, Market, AdDate, RetMktID, FlyerId) ON [PRIMARY]
											End

											IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMConsolidated'')
											Begin
													CREATE  INDEX [' + @destCode + 'CWMConsolidated] ON [dbo].[' + @destCode + 'FlyerReports]
													(AdDate, WeekOf, AdMonthId, AdvertiserId, Advertiser, MarketId, Market, RetMktID, MediaId, Media, PublicationId, Publication, FlyerId) ON [PRIMARY]
											End


											IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMLarge'')
											Begin
													CREATE  INDEX [' + @destCode + 'CWMLarge] ON [dbo].[' + @destCode + 'FlyerReports]
													(AdDate, Advertiser, Market, Media, RetMktID, TradeClassId, TradeClass, RegionId, Region, DistrictId, District, ThemeId, Theme, EventId, Event, FlyerId) ON [PRIMARY]
											End

										'
						PRINT(@SQLindex)



				 End
				--chnaged by prakash on 7/11/2013
				INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Created PK index on FlyerReports ','Created PK index on FlyerReports ', GETDATE()
		END	
	--Chnaged by prakash on 09042013
	

PRINT '-- END mt_proc_Create_FlyerReports_From_FV SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Created FlyerReports','Created FlyerReports ', GETDATE()
	
END























GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports_Divyang]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PopulatePageReports_Divyang]
	@sourceCWMCode as varchar(100),
	@sourcePDTCode as varchar(20),
	@sourceServer as varchar(50),
	@sourceDB as varchar(50),
	@destCode as varchar(20),
	@replaceTable as tinyint,
	@IsDebug as bit = 0--Values : "0 = Run / 1 = Print".
AS
BEGIN
	SET NOCOUNT ON;
	Print 'replacetable = ' + cast(@replaceTable as varchar(2))
	Declare	@SQL as varchar(Max)	
			,@SQLindex as varchar(Max)	
			,@SQLdrop as varchar(1000)
			,@destTable as varchar(50)
			,@destINCRFlyer as varchar(50)
			,@CTInsertFields as varchar(max)
			,@InsertFieldsMCAPVP Varchar(max)
			,@InsertFieldsPageReports varchar(max)
	--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT tinyint
			,@Nsql nvarchar(max)
			,@IsInteger Int
			,@IsSSD Bit
			,@FVCCType int

			
	SELECT 
		@FVCCType  = IsNULL(FVCCType,0)
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @destCode 


	--Temporary Integer Based ID Changes
	SET @sourceCWMCode=Replace(@sourceCWMCode,'Flyer','Page')
	Print @SourceCWMCode
	
	Set @destTable = @destCode + 'PageReports'
	
	Print '-- Start mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start to create Pagereports ','Start to create Pagereports', GETDATE()
		
	Set @SQL = ''
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = @destTable))
		BEGIN
			--If it exists, check it we want to drop, if so do it, if not print error
		--CHANGES BY PRAKASH ON 14/06/2013
		  IF @replaceTable=1
				BEGIN
					SET @SQLdrop = 'drop table ' + @destTable
				END
			ELSE
				BEGIN
					PRINT 'Table [' + @destTable + '] already exists.'
					--return -1
				END
			--Change by prakash 13/06/2013
			IF @IsDebug=0
			   BEGIN			   
					EXECUTE(@SQLdrop)
					print @destTable + ' table droped'
			   END
			ELSE
			   BEGIN
				Print @SQLdrop
			   END
			 			
		END

		SELECT 
			@InsertFieldsPageReports = 
			CASE WHEN CategoryType= 'Flyer' THEN COALESCE(@InsertFieldsPageReports ,'') + 'Flyer.' + LTRIM(RTRIM(CategoryValue)) +','
			ELSE COALESCE(@InsertFieldsPageReports ,'') + 'Page.' + LTRIM(RTRIM(CategoryValue)) +','
			END
		FROM
			tbl_LookUp
		WHERE
			CategoryType in ('Flyer','Page')
		ORDER BY 
			ID   

		SET @InsertFieldsPageReports = LEFT(@InsertFieldsPageReports, LEN(@InsertFieldsPageReports)-1)
		
		
		SET @InsertFieldsMCAPVP = LEFT(@InsertFieldsMCAPVP, LEN(@InsertFieldsMCAPVP)-1)
	    SET @InsertFieldsMCAPVP=REPLACE(@InsertFieldsMCAPVP,'CAST(0 AS INT) AS FeaturesID','F.FeaturesId')
		
		IF @replaceTable = 1 
			BEGIN
				SET @SQL = @SQL + 'SELECT ' + replace(replace(@InsertFieldsPageReports,'page.',''),'flyer.','') + 
							' INTO ' + @destTable + SPACE(1)
			END
					 
		IF @replaceTable=0
			Begin
				SET @SQL= @SQL + Space(1) + 'INSERT INTO ' + @destTable + Space(1) + 'SELECT ' + replace(replace(@InsertFieldsPageReports,'page.',''),'flyer.','') + SPACE(1)
			END
		
		
		SET @SQL =	@SQL 
					+' FROM (SELECT ' 
					+ REPLACE(@InsertFieldsPageReports,'OriginalFlyerID,FlyerID','Flyer.OriginalFlyerID,Flyer.FlyerID') + SPACE(1) 
					+' FROM '
					+ SPACE(1)  
					--+ @destCode + 'FlyerReports Flyer' + SPACE(1) 
		
		IF @ReplaceTable = 0
		BEGIN 
				SET @SQL = @SQL + @destCode + 'IncrFlyerReports Flyer' + SPACE(1) 		
		END
		Else
		BEGIN
				SET @SQL = @SQL + @destCode + 'FlyerReports Flyer' + SPACE(1) 
		END
								
		IF @FVCCType = 4 AND EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE  CategoryCodeID in (select id from categorycodetable where category= @destCode) and codeid = 84)
			SET @SQL= @SQL + 'join '+@sourcecwmcode+' Page on Flyer.FlyerId=Page.FlyerId ) VV '  
		else
			SET @SQL= @SQL + 'join '+@sourcecwmcode+'  Page on Flyer.FlyerId=Page.FlyerId ) VV ' 
		
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQL)
			END
		ELSE
			BEGIN
				PRINT @SQL
			END


		PRINT '-- Insert Starts - ' + convert(varchar(100),current_timestamp,20)
		
		IF @replaceTable = 1 
			BEGIN
								 
				SET @SQLindex='
				ALTER TABLE [' + @destTable + ']
				ADD CONSTRAINT [PK_' + @destCode + 'PageReportsFlyerIdPage]
				PRIMARY KEY CLUSTERED
				(
				[FlyerId] ASC,
				[Page] ASC
				)'
				
		 			--Changes by prakash on 14/06/2013
					IF @IsDebug =0
					 BEGIN
						EXECUTE(@SQLIndex)
					 END
					ELSE
					 BEGIN
						PRINT @SQLIndex
					 END
				
				Print '--Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)
			END
			
		SET @SQLIndex =	'
							IF NOT EXISTS(SELECT * FROM .sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[' + @destTable + ']'') AND name = ''IDX' + @destCode + 'FlyerIdPage'')
							BEGIN 	
								CREATE NONCLUSTERED INDEX [IDX' + @destCode + 'FlyerIdPage] ON [dbo].[' + @destTable + '] 
								(
								[FlyerID],[Page])
								INCLUDE ([img],[PageType],[OrderValue],[Height],[Width],[PageSpace],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[Size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[themeid],[theme],[PublicationId],[Publication],[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[Pages],[CouponInd],[PublishedOn],[RegionId],[Region],[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[WeekOfn],[WeekOfi],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[VehicleId],[CreationMonth],[ImageName],[PageName],[FVSystemPage],[FVDisplayPage],[FrontPageInd],[BackPageInd])
								WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
							END
						'
		-- Changes on 10.02.2017 as More Indexes Required as Master
		SET @SQLindex = @SQLindex + 
						'	
							-- Changes on 10.02.2017 as More Indexes Required as Master

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMINDEX1PgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMINDEX1PgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, RetMktID, Page, Pages, PageName, ImageName, FlyerId) WITH  FILLFACTOR = 90 ON [PRIMARY]
							End


							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMRetMktPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMRetMktPgRpt] ON [dbo].[' + @destTable + ']
									(AdvertiserId, Advertiser, MarketId, Market, AdDate, RetMktID, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMConsolidatedPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMConsolidatedPgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, WeekOf, AdMonthId, AdvertiserId, Advertiser, MarketId, Market, RetMktID, MediaId, Media, PublicationId, Publication, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMLargePgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMLargePgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, Advertiser, Market, Media, RetMktID, TradeClassId, TradeClass, RegionId, Region, DistrictId, District, Page, Pages, FlyerId) ON [PRIMARY]
							End
						'

		--Changes by prakash on 14/06/2013
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQLIndex)
			END
		ELSE
			BEGIN
				PRINT @SQLIndex
			END
				 
		Print '--Non-Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)

	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'created Pagereports ','created Pagereports', GETDATE()		
	Print '-- END mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
END













GO

/****** Object:  StoredProcedure [dbo].[PopulatePageReports]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PopulatePageReports]
	@sourceCWMCode as varchar(100),
	@sourcePDTCode as varchar(20),
	@sourceServer as varchar(50),
	@sourceDB as varchar(50),
	@destCode as varchar(20),
	@replaceTable as tinyint,
	@IsDebug as bit = 0--Values : "0 = Run / 1 = Print".
AS
BEGIN
	SET NOCOUNT ON;
	Print 'replacetable = ' + cast(@replaceTable as varchar(2))
	Declare	@SQL as varchar(Max)	
			,@SQLindex as varchar(Max)	
			,@SQLdrop as varchar(1000)
			,@destTable as varchar(50)
			,@CTInsertFields as varchar(max)
			,@InsertFieldsMCAPVP Varchar(max)
			,@InsertFieldsPageReports varchar(max)
	--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT tinyint
			,@Nsql nvarchar(max)
			,@IsInteger Int
			,@IsSSD Bit
			,@FVCCType int

			
	SELECT 
		@FVCCType  = IsNULL(FVCCType,0)
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @destCode 


	--Temporary Integer Based ID Changes
	SET @sourceCWMCode=Replace(@sourceCWMCode,'Flyer','Page')
	Print @SourceCWMCode
	Set @destTable = @destCode + 'PageReports'
	Print '-- Start mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'Start to create Pagereports ','Start to create Pagereports', GETDATE()
		
	Set @SQL = ''
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = @destTable))
		BEGIN
			--If it exists, check it we want to drop, if so do it, if not print error
		--CHANGES BY PRAKASH ON 14/06/2013
		  IF @replaceTable=1
				BEGIN
					SET @SQLdrop = 'drop table ' + @destTable
				END
			ELSE
				BEGIN
					PRINT 'Table [' + @destTable + '] already exists.'
					--return -1
				END
			--Change by prakash 13/06/2013
			IF @IsDebug=0
			   BEGIN			   
					EXECUTE(@SQLdrop)
					print @destTable + ' table droped'
			   END
			ELSE
			   BEGIN
				Print @SQLdrop
			   END
			 			
		END

		SELECT 
			@InsertFieldsPageReports = 
			CASE WHEN CategoryType= 'Flyer' THEN COALESCE(@InsertFieldsPageReports ,'') + 'Flyer.' + LTRIM(RTRIM(CategoryValue)) +','
			ELSE COALESCE(@InsertFieldsPageReports ,'') + 'Page.' + LTRIM(RTRIM(CategoryValue)) +','
			END
		FROM
			tbl_LookUp
		WHERE
			CategoryType in ('Flyer','Page')
		ORDER BY 
			ID   

		SET @InsertFieldsPageReports = LEFT(@InsertFieldsPageReports, LEN(@InsertFieldsPageReports)-1)
		
		
		SET @InsertFieldsMCAPVP = LEFT(@InsertFieldsMCAPVP, LEN(@InsertFieldsMCAPVP)-1)
	    SET @InsertFieldsMCAPVP=REPLACE(@InsertFieldsMCAPVP,'CAST(0 AS INT) AS FeaturesID','F.FeaturesId')
		
		IF @replaceTable = 1 
			BEGIN
				SET @SQL = @SQL + 'SELECT ' + replace(replace(@InsertFieldsPageReports,'page.',''),'flyer.','') + 
							' INTO ' + @destTable + SPACE(1)
			END
					 
		IF @replaceTable=0
			Begin
				SET @SQL= @SQL + Space(1) + 'INSERT INTO ' + @destTable + Space(1) + 'SELECT ' + @InsertFieldsPageReports + SPACE(1)
			END
		
		
		SET @SQL= @SQL + 
					'FROM 
						( 
						SELECT ' +
						REplace(@InsertFieldsPageReports,'OriginalFlyerID,FlyerID','Flyer.OriginalFlyerID,Flyer.FlyerID') + SPACE(1) +
						'FROM 
							' + @destCode + 'FlyerReports Flyer' + SPACE(1) 
		
		IF @ReplaceTable = 0
			BEGIN 
				SET @SQL= @SQL +					
						'join (Select FlyerID From IncrFlyerReports) Incr ON Flyer.FlyerID=Incr.FlyerID'  + SPACE(1)
			END
		Print @sourcecwmcode							
		IF @FVCCType = 4
		and 
		EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE  CategoryCodeID in (select id from categorycodetable where category= @destCode) and codeid = 84)
	
		SET @SQL= @SQL + 'join '+@sourcecwmcode+' Page on Flyer.FlyerId=Page.FlyerId ) VV '  
		else
			SET @SQL= @SQL + 'join '+@sourcecwmcode+'  Page on Flyer.FlyerId=Page.FlyerId ) VV ' 
		
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQL)
			END
		ELSE
			BEGIN
				PRINT @SQL
			END


		PRINT '-- Insert Starts - ' + convert(varchar(100),current_timestamp,20)
		
		IF @replaceTable = 1 
			BEGIN
								 
				SET @SQLindex='
				ALTER TABLE [' + @destTable + ']
				ADD CONSTRAINT [PK_' + @destCode + 'PageReportsFlyerIdPage]
				PRIMARY KEY CLUSTERED
				(
				[FlyerId] ASC,
				[Page] ASC
				)'
				
		 			--Changes by prakash on 14/06/2013
					IF @IsDebug =0
					 BEGIN
						EXECUTE(@SQLIndex)
					 END
					ELSE
					 BEGIN
						PRINT @SQLIndex
					 END
				
				Print '--Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)
			END
			
		SET @SQLIndex =	'
							IF NOT EXISTS(SELECT * FROM .sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[' + @destTable + ']'') AND name = ''IDX' + @destCode + 'FlyerIdPage'')
							BEGIN 	
								CREATE NONCLUSTERED INDEX [IDX' + @destCode + 'FlyerIdPage] ON [dbo].[' + @destTable + '] 
								(
								[FlyerID],[Page])
								INCLUDE ([img],[PageType],[OrderValue],[Height],[Width],[PageSpace],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[Size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[themeid],[theme],[PublicationId],[Publication],[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[Pages],[CouponInd],[PublishedOn],[RegionId],[Region],[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[WeekOfn],[WeekOfi],[AdMonth],[AdMonthId],[AdDay],[AdDayId],[subject],[persona],[receivedDt],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[VehicleId],[CreationMonth],[ImageName],[PageName],[FVSystemPage],[FVDisplayPage],[FrontPageInd],[BackPageInd])
								WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
							END
						'
		-- Changes on 10.02.2017 as More Indexes Required as Master
		SET @SQLindex = @SQLindex + 
						'	
							-- Changes on 10.02.2017 as More Indexes Required as Master

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMINDEX1PgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMINDEX1PgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, RetMktID, Page, Pages, PageName, ImageName, FlyerId) WITH  FILLFACTOR = 90 ON [PRIMARY]
							End


							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMRetMktPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMRetMktPgRpt] ON [dbo].[' + @destTable + ']
									(AdvertiserId, Advertiser, MarketId, Market, AdDate, RetMktID, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMConsolidatedPgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMConsolidatedPgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, WeekOf, AdMonthId, AdvertiserId, Advertiser, MarketId, Market, RetMktID, MediaId, Media, PublicationId, Publication, Page, Pages, FlyerId) ON [PRIMARY]
							End

							IF NOT EXISTS(Select * From sysindexes where name = ''' + @destCode + 'CWMLargePgRpt'')
							Begin
									CREATE  INDEX [' + @destCode + 'CWMLargePgRpt] ON [dbo].[' + @destTable + ']
									(AdDate, Advertiser, Market, Media, RetMktID, TradeClassId, TradeClass, RegionId, Region, DistrictId, District, Page, Pages, FlyerId) ON [PRIMARY]
							End
						'

		--Changes by prakash on 14/06/2013
		IF @IsDebug =0
			BEGIN
				EXECUTE(@SQLIndex)
			END
		ELSE
			BEGIN
				PRINT @SQLIndex
			END
				 
		Print '--Non-Clustured Index Created at ' + convert(varchar(100),current_timestamp,20)

	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'created Pagereports ','created Pagereports', GETDATE()		
	Print '-- END mt_proc_Create_PageReports_From_FV SPs ' + convert(varchar(100),current_timestamp,20)	
END













GO

/****** Object:  StoredProcedure [dbo].[ClientSwitchLiveBackup]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[ClientSwitchLiveBackup]
(
  @ServerName varchar(15)
 ,@ToLiveOrBackup varchar(max)='Live'
 ,@IsDebug Bit=0
)
As
Begin
--Exec [ClientSwitchLiveBackup] 'MT2SQL13','Backup',1
Declare  @Datadb varchar(10)
		,@RestoreServer varchar(20)
		,@EmailAddress varchar(max)
		,@Subject varchar(max)
		,@Body varchar(max)
		,@DBParameterId SmallInt
		,@SQL nvarchar(max)
		,@SQL2 nvarchar(max)
		,@ConnectionDB varchar(100)=''
		,@ControlDB varchar(100)=''
		,@DbExist SmallInt
		,@TableExist SmallInt

Select @ConnectionDB = dbo.mtfunc_GetDatabasePrefix ('Connection')
Select @ControlDB = dbo.mtfunc_GetDatabasePrefix ('Control')

If IsNULL(@ServerName,'')=''
	Set @ServerName=@@Servername

If IsNULL(@ToLiveOrBackup,'')=''
	Set @ToLiveOrBackup='Live'

Set @Datadb=Right(@Servername,5)

Set @SQL='Select @RestoreServer=RestoreServer
	From '+@ConnectionDB+'vwDBRestoreLocation 
	Where backupdatabase='''+@Datadb+''''
EXECUTE sp_executesql @SQL, N'@RestoreServer varchar(20) output',@RestoreServer output

--Set @SQL='SELECT @DBParameterId=DatabaseParameterId
--	From '+@ConnectionDB+'vwDBParameters
--	Where SQL1='''+@Servername+'.'+@Datadb+''' and SQL2='''+@RestoreServer+'.'+@Datadb+''''

Set @SQL='SELECT Distinct @DBParameterId=V.DatabaseParameterId
	From '+@ConnectionDB+'vwDBParameters V 
	Join '+@ConnectionDB+'DBParameters D ON  V.DatabaseParameterID=D.DatabaseParameterID 
	Join '+@ConnectionDB+'SQLParameters S ON S.SQLID=D.SQLID1 OR S.SQLID=D.SQLID2
	Where V.SQL1='''+@Servername+'.'+@Datadb+''' and V.SQL2='''+@RestoreServer+'.'+@Datadb+''' AND SQLUserName=''sa'''

EXECUTE sp_executesql @SQL, N'@DBParameterId SmallInt output',@DBParameterId output

Set @SQL='Select @EmailAddress = COALESCE(@EmailAddress ,'''') + LTRIM(RTRIM(EmailAddress)) +'';''
	From '+@ControlDB+'EmailList
	Where ServerSwitch=1'
EXECUTE sp_executesql @SQL, N'@EmailAddress varchar(max) output',@EmailAddress output

Set @Subject=CASE When @ToLiveOrBackup='Live' Then @RestoreServer Else @Servername End+'..'+@Datadb+' not switched to '+CASE When @ToLiveOrBackup='Live' Then @Servername Else @RestoreServer End+'..'+@Datadb

Set @Body='Database '+@Datadb+' not available on '+CASE When @ToLiveOrBackup='Live' Then @Servername Else @RestoreServer End+', FV Client site pointing to '+CASE When @ToLiveOrBackup='Live' Then @RestoreServer Else @Servername End+'..'+@Datadb

Set @SQL2='Update '+@ConnectionDB+'DBParameters Set ActiveID = 1 where DatabaseParameterID ='+cast(@DBParameterId as varchar) +' and not (ActiveID = 1)'

If @ToLiveOrBackup='Backup'
	Set @SQL2=replace(@SQL2,'ActiveID = 1','ActiveID = 2')

If @IsDebug=0
	Begin
		Set @SQL='SELECT @DBExist=count(1) FROM '+CASE When @ToLiveOrBackup='Live' Then @Servername Else @RestoreServer End+'.master.sys.databases Where Name='''+ @Datadb +''' and state_desc=''ONLINE'''
		EXECUTE sp_executesql @SQL, N'@DBExist SmallInt output',@DBExist output

		If Isnull(@DBExist,0)=0 
				Exec Master.dbo.[mt_proc_send_cdosysmail] 
				@To=@EmailAddress,
				@Subject =@Subject,
				@Body =@Body,
				@BodyType = 'HTML'
		Else 
			Begin
				Set @SQL='SELECT @TableExist=count(so.name) FROM '+CASE When @ToLiveOrBackup='Live' Then @Servername Else @RestoreServer End+'.'+ @Datadb +'.dbo.sysobjects so 
						 Join CategorycodeTable cc on so.name=cc.category+''DetailReports''
						 Where (ClientPDT=1 OR IsAdlert=1 ) 
						 and ISNULL(FVCCType,0) =4 -- NOT IN (Select FVCCTypesId From MT2SQL14.SiteControl.dbo.MasterFVCCTypes Where ISNULL(Processing,0)=0)
						 and ClientServer='''+@Servername+''''
				EXECUTE sp_executesql @SQL, N'@TableExist SmallInt output',@TableExist output

				-- As We have Less Than 10 Clients are on AC To FV 
				--If Isnull(@TableExist,0)<10

				If Isnull(@TableExist,0)<1
					Begin
						Set @Body='Check for few client data tables failed on '+CASE When @ToLiveOrBackup='Live' Then @Servername Else @RestoreServer End+'..' +@Datadb+ ', FV Client site pointing to '+CASE When @ToLiveOrBackup='Live' Then @RestoreServer Else @Servername End+'..'+@Datadb

						Exec Master.dbo.[mt_proc_send_cdosysmail] 
						@To=@EmailAddress,
						@Subject =@Subject,
						@Body =@Body,
						@BodyType = 'HTML'
					End
				
				Else
					Begin
						Exec (@SQL2)
						If @@ROWCOUNT=0
							Print 'Clients already pointing to '+@ToLiveOrBackup
					End
			End
	End
Else
	Begin
		Print '--ClientServer -'+@Servername
		Print '--DataDb -'+@DataDb
		Print '--RestoreServer -'+@RestoreServer
		Print '--DatabaseParameterId -'+cast(@DBParameterId as varchar)
		Print '--Update Query to Point Clients to '+@ToLiveOrBackup +'--'+@SQL2
	End
End
GO

/****** Object:  StoredProcedure [dbo].[CategorycodeIndex]    Script Date: 2/25/2019 9:16:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Nishant(njoshi@markettrack.com)
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Modified : Sagar-12/02/2014
--			  -> Conditional logic for No of Key Index Columns > 16 for a catcode
-- exec CategorycodeIndex 'walpep',1
-- =============================================
CREATE PROCEDURE [dbo].[CategorycodeIndex]
	@Categorycode varchar(100),
	@IsDebug bit=0  --Values : "0 = Run / 1 = PRINT".
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets FROM
	-- interfering with SELECT statements.
PRINT '-- START CategorycodeIndex SP : ' + convert(varchar(100),current_timestamp,20)	
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Categorycode,'CategorycodeIndex start to create ','CategorycodeIndex start to create', GETDATE()
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN	
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'vw_qvfcfields')
				DROP SYNONYM [dbo].[vw_qvfcfields]

			CREATE SYNONYM [dbo].[vw_qvfcfields] FOR
				[MT2ASQL06].[SiteControl].[dbo].[vw_qvfcfields]														
				
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'ClientExceptionalCatCode')
				DROP SYNONYM [dbo].[ClientExceptionalCatCode]

			CREATE SYNONYM [dbo].[ClientExceptionalCatCode] FOR
				[MT2ASQL06].[Subscription].[dbo].[ClientExceptionalCatCode]
		END
	ELSE 	IF @@SERVERNAME LIKE 'MT2%'
		BEGIN	
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'vw_qvfcfields')
				DROP SYNONYM [dbo].[vw_qvfcfields]

			CREATE SYNONYM [dbo].[vw_qvfcfields] FOR
				[MT2SQL14].[SiteControl].[dbo].[vw_qvfcfields]														
				
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'ClientExceptionalCatCode')
				DROP SYNONYM [dbo].[ClientExceptionalCatCode]

			CREATE SYNONYM [dbo].[ClientExceptionalCatCode] FOR
				[MT2SQL14].[Subscription].[dbo].[ClientExceptionalCatCode]				
		END
		
	-- Changed by Sagar 12/02/2014 ------------
	DECLARE @IndexExtraColumn TABLE (TEXT NVARCHAR(200))
	Insert into @IndexExtraColumn Values ('SKUDescription3')
	Insert into @IndexExtraColumn Values ('SKUDescription2')
	Insert into @IndexExtraColumn Values ('ParentCompany')
	Insert into @IndexExtraColumn Values ('SKUDescription1')
	Insert into @IndexExtraColumn Values ('region')
	Insert into @IndexExtraColumn Values ('Channel')
	Insert into @IndexExtraColumn Values ('SalesTerritoryGroup')
	Insert into @IndexExtraColumn Values ('SalesTerritorySubGroup')
	Insert into @IndexExtraColumn Values ('salesterritory')													
	Insert into @IndexExtraColumn Values ('optional1')
	--------------------------------------------											
	
	SET NOCOUNT ON;
	Declare @SQL varchar(max)=''
	Declare @selectgrp int
	
	Declare @Categorycodeid int=(SELECT ID FROM categorycodeTable WHERE category=@Categorycode)
	
	;with t1 as
	(
	SELECT  COUNT(FieldName) total,groupid
	FROM  vw_qvfcfields
	WHERE displayseq is not null and groupid is not null and tableid is not null and groupid>1 and categorycodeid=@Categorycodeid
	group by groupid
	),t2
	as
	(
	SELECT total,groupid FROM t1 WHERE groupid=2
	UNION ALL
	SELECT (new.total+ori.total) as total,ori.groupid+1 FROM t2 new
	join (SELECT total,groupid FROM t1) ori
	on new.total+ori.total<16 and new.groupid+1 = ori.groupid
	)
	SELECT TOP(1) @selectgrp=groupid FROM t2
	order by groupid desc
	

	if exists (select * FROM dbo.sysobjects WHERE id = object_id(N'vwqvfcfields') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		Drop Table vwqvfcfields	
	SET @SQL = 'Select 
			V.* INTO vwqvfcfields 
			FROM 
				vw_qvfcfields V Inner Join (Select Name FROM SysColumns WHERE Object_Name(ID)= ''' + @Categorycode + 'DetailReports'') S ON
				V.FieldName=S.Name 
			WHERE categorycodeid= ' + Cast(@Categorycodeid as Varchar(20)) + '  and v.fieldtype <> 3 and v.fieldname not in (''ACBrandFamily'') ' --Changed by Sagar 22-04-2014 ; to exclude MPV type columns from index

			PRINT @SQL
			exec(@SQL)
			SET @SQL=''

	;with allgrp
	as
	( 
	---------------------------------------------group - 1 ---------------------------------------------
	SELECT distinct
	case WHEN FieldName = 'DynamicDateRange' THEN 'AdDate' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=1 and categorycodeid=@Categorycodeid and displayseq is not null and groupid<=@selectgrp

	UNION
	---------------------------------------------group - 2 ---------------------------------------------
	SELECT distinct
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=2 and categorycodeid=@Categorycodeid and displayseq is not null
	 and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=2 
																		and categorycodeid=@Categorycodeid
																		 and ParentFieldID is not null)
																		 and groupid<=@selectgrp


	UNION
	---------------------------------------------group - 3 ---------------------------------------------
	SELECT DISTINCT
	case  WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=3 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=3 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	UNION
	---------------------------------------------group - 4 ---------------------------------------------
	SELECT DISTINCT
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=4 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=4 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	UNION
	---------------------------------------------group - 5 ---------------------------------------------
	SELECT DISTINCT
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=5 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=5 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	---------------------------------------------group - 6 ---------------------------------------------
	UNION
	SELECT DISTINCT
	case  WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=6 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=6 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	)
	SELECT * INTO #tempallgrp FROM allgrp
	SELECT COUNT(1) as CountForColumnsForIX FROM #tempallgrp where groupID  <> 1

	--------------------------------- Logic for Indexes if No of COlumns > 16 OR < 16---------------------------------------------
	-- Added by Sagar 12/02/2014

	--IF((SELECT COUNT(1) FROM #tempallgrp where groupID  <> 1) > 15) 
	--BEGIN
	--	PRINT ('Entered > 16 Condition');
	---- Logic if the Columns for Indexes > 16
	--	;WITH IndexFilter(Fieldlist) as
	--	( 
	--	  select FielDName from #tempallgrp where groupID<>1
	--	  except 
	--	  select text from @IndexExtraColumn
	--	)
	--	,IndexIncludeFilter(Fieldlist) as
	--	( 
	--	  select FielDName from #tempallgrp where groupID<>1
	--	  Intersect
	--	  select text from @IndexExtraColumn
	--	)	
	--	,grp23(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.Fieldlist + ','
	--			FROM IndexFilter  AS i
	--			FOR XML PATH('')) as varchar
		
	--	)
	--	,grp24(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.Fieldlist + ','
	--			FROM IndexIncludeFilter  AS i
	--			FOR XML PATH('')) as varchar		
	--	)
	--	,indexcolumn
	--	as
	--	(
	--		SELECT FieldName+','+(SELECT FieldList FROM grp23) as sqltext FROM #tempallgrp
	--		WHERE groupID=1
	--	)
	--	,IndexIncludeColumn as
	--	(
	--		SELECT ','+(SELECT FieldList FROM grp24) as sqlIncludetext 
	--	)
	--	--select * from indexcolumn,IndexIncludeColumn
	--	SELECT  @SQL=@SQL+
	--			'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+SUBSTRING(REPLACE(sqltext,',',''),0,100)+' on dbo.'+@Categorycode+'DetailReports
	--			('
	--			+SUBSTRING(sqltext,0,LEN(sqltext))+
	--			')
	--			INCLUDE(PageDetailId,FlyerID,Page,Advertiser,Market,Media'+(case WHEN charindex('AdDate',sqltext,0)=0 THEN ',AdDate' ELSE '' END)+''+ISNULL(SUBSTRING(sqlIncludetext,0,LEN(sqlIncludetext)),'')+')'+ +''+CHAR(13)
	--			  FROM indexcolumn,IndexIncludeColumn
	--	 PRINT 'Exiting > 16 Condition | Query generated with > 16 Condition'	
	--END
	--ELSE 
	--BEGIN
	--	PRINT('Entering < 16 Condition');
	---- Logic for Columns for Indexes < 16
	--	;WITH grp23(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.FielDName + ','
	--			FROM #tempallgrp  AS i
	--			WHERE groupID<>1
	--			FOR XML PATH('')) as varchar
	--	),indexcolumn
	--	as
	--	(
	--		SELECT FieldName+','+(SELECT FieldList FROM grp23) as sqltext FROM #tempallgrp
	--		WHERE groupID=1
	--	)
	--	SELECT  @SQL=@SQL+
	--			'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+SUBSTRING(REPLACE(sqltext,',',''),0,100)+' on dbo.'+@Categorycode+'DetailReports
	--			('
	--			+SUBSTRING(sqltext,0,LEN(sqltext))+
	--			')
	--			INCLUDE(PageDetailId,FlyerID,Page,Advertiser,Market,Media'+(case WHEN charindex('AdDate',sqltext,0)=0 THEN ',AdDate' ELSE '' END)+')'+CHAR(13)
	--			  FROM indexcolumn
	--	PRINT 'Exiting < 16 Condition | Query generated with < 16 Condition'
	--END
	--DROP TABLE #tempallgrp
	---------------------------------------------------End Of Logic----------------------------------------------------------

	--Commented By Hiren on 12/18/2013
	
	--;With DateField
	--as
	--(
	--SELECT Distinct FieldName 
	--FROM vwqvfcfields
	--WHERE categorycodeid=@Categorycodeid and columnformatID =8 and charindex(FieldName,@SQL,0)=0
	--),ctesqltext
	--as
	--(
	--SELECT 'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+FieldName+' on dbo.'+@Categorycode+'DetailReports
	--(PageDetailID)
	--INCLUDE('+FieldName+')'+CHAR(13) as sqltext
	--FROM DateField
	--)
	--SELECT @SQL=@SQL+sqltext FROM ctesqltext
	
	--;With MasterCategoryFields
	--as
	--(
	--SELECT DISTINCT FieldName
	--FROM vwqvfcfields
	--WHERE categorycodeid=@Categorycodeid and displayseq is not null and groupid=3 and charindex(FieldName,@SQL,0)=0
	--)
	--SELECT @SQL=@SQL+'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+FieldName+' on dbo.'+@Categorycode+'DetailReports
	--('+FieldName+')'+CHAR(13)
	--FROM MasterCategoryFields
	
	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END

	------------------------------------Manual Indexes-----------------------------------

	--Set @SQL='IF EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N''[dbo].[' + @Categorycode + 'DetailReports]'') AND name = N''idx_' + @Categorycode + 'AllDates'')
	--	BEGIN
	--		DROp INDEX [idx_'+@Categorycode+'AllDates ] ON [dbo].['+ @Categorycode + 'DetailReports];' + SPACE(1)
	
	--Changes on 10.02.2017 For ACToFV
	SET @SQL = 'Create Index idx_'+@Categorycode+'AllDates on '+@Categorycode+'DetailReports
				(
					[ACBrandEquityFlag] ASC,
					[AdDate] ASC,
					[RetMktId] ASC,
					[CategoryId] ASC
				) 
				INCLUDE ([PageDetailID],
					[OriginalPageDetailID],
					[FlyerId],
					[Page],
					[AdMonthId],
					[WeekOf],
					[WeekOfn],
					[salestartdate],
					[saleenddate],
					[Advertiser],
					[market],
					[media],
					[MediaID])' + SPACE(1)  
	--'END '
		
	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END			
	
	--Set @SQL='IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[' + @Categorycode + 'DetailReports]'') AND name = N''idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID'')
	--	BEGIN
	--		DROP INDEX [idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID] ON [dbo].['+ @Categorycode + 'DetailReports];' + SPACE(1)

	--Created By Hiren on 12/18/2013

	-- Changed On 10.02.2017 For ACTOFV
	-- Changed on 21.08.2017 as per request in Email from Kishan
	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID] ON [dbo].['+ @Categorycode + 'DetailReports] 
			(
				--[marketid] ASC, [mediaId] ASC, [MerchandiseCategoryId] ASC, [MerchandiseSubCatId] ASC, RetMktID ASC, CategoryID ASC, [AdDate] ASC
				[ACBrandEquityFlag] ASC,
				[mediaId] ASC,
				[ACRepFlag],
				[RetMktId] ASC,
				[marketid] ASC,
				[AdDate] ASC,
				[CategoryId] ASC
			)
			INCLUDE ( 
						-- [PageDetailID], [FlyerId], [Page], [Advertiser], [market], [media] --	, [AdDate], --	[CategoryId]
					[PageDetailID],
					[OriginalPageDetailID],
					[FlyerId],
					[Page],
					[MerchandiseCategoryId] ,
					[MerchandiseSubCatId] ,
					[Advertiser],
					[market],
					[media]
			) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			' + SPACE(1)  
	--'END '

	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
		
	--Item# : 30678	
	IF EXISTS(Select 1 from categorycodeTable where Category = @Categorycode and ISNULL(ISCT,0) = 0 and ISNULL(IsCLD,0) = 0)
	BEGIN

	--Changed on 10.02.2017 For ACTo FV
	SET @SQL = ''
	SET @SQL = 'CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'ADBLOCK1] ON [dbo].['+ @Categorycode + 'DetailReports] 
				( 
					[FlyerId] ASC,
					[Page] ASC,
					[topleftx] ASC,
					[toplefty] ASC
				) 
				INCLUDE (
						[PageDetailID],
						[OriginalPageDetailID],
						[MerchandiseCategory],
						[Category],
						[Brand],
						[Manufacturer],
						[MainOffer],
						[MPVOfferType],
						[Weight],
						[TaggedCompany],
						[Features],
						[UnitPrice],
						[SalePrice1]
						) 
					  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 

--				-------------FOR ADBlock codes ----------------	  
--					  CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'DetailReportsAdBlockId] ON [dbo].['+@Categorycode+'DetailReports]
--(
--	[AdBlockID] ASC
--) 
--INCLUDE ([PageDetailID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


--CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'ADBLOCK1] ON [dbo].['+@Categorycode+'DetailReports]
--(	
--	[ADBlockID] ASC,
--	[FlyerId] ASC,
--	[Page] ASC,
--	[topleftx] ASC,
--	[toplefty] ASC
--)
--INCLUDE ([PageDetailID],
--	[OriginalPageDetailID],
--	[MerchandiseCategory],
--	[Category],
--	[Brand],
--	[Manufacturer],
--	[MainOffer],
--	[MPVOfferType],
--	[Weight],
--	[TaggedCompany],
--	[Features],
--	[UnitPrice],
--	[SalePrice1]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
------------------------------------------------
					  				  
					  '



	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
		

	END		
	--Item# : 30678					
------------------------------------------------------Index for Segmentation----------------------------------
IF EXISTS (SELECT  CE.CategoryCodeId FROM ClientExceptionalCatCode CE
			INNER JOIN CategoryCodetable CC
            ON CE.CategoryCodeId = CC.ID  AND ISNULL(CE.AllowDefineCustUpdt, 0) = 1 AND ISNULL(CC.IsIntegerID, 0) = 1
             Where CE.CategoryCodeId=@Categorycodeid)
      BEGIN
		SET @SQL='CREATE NONCLUSTERED INDEX idx_' + @Categorycode + 'DetailReportsOriginalPageDetailId ON [' + @Categorycode + 'DetailReports](
	[OriginalPageDetailID] ASC
) 
INCLUDE ([PageDetailID]) '
		
		IF @IsDebug=0
			BEGIN
				EXEC(@SQL)
			END
		ELSE
			BEGIN
				PRINT @SQL
			END	   
		
      END
      


------------------------------------------------------ New Index For Client Build SP (JIRA Ticket MTDB-113)  ----------------------------------

--Declare @IsIntegerId int = (Select ISNULL(IsintegerId,0) as IsIntegerId from CategoryCodetable where category = @Categorycode)

--IF(@IsIntegerId = 1)
--	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'NonDates] ON [dbo].['+ @Categorycode + 'DetailReports] 
--				([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
--				INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate]) 
--				WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]' + SPACE(1)
--Else
--	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'NonDates] ON [dbo].['+ @Categorycode + 'DetailReports] 
--				([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
--				INCLUDE ([PageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate]) 
--				WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]' + SPACE(1)

	
--	--'END '

--	IF @IsDebug=0
--		BEGIN
--			EXEC(@SQL)
--		END
--	ELSE
--		BEGIN
--			PRINT @SQL
--		END	


------------------------------------------------------ New Index For Client Build SP (ACToFV)  ----------------------------------
	SET @SQL =	'
					-- New Changes On 10.02.2017 For ACToFV
					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdDateAdvertiserIDMarketIDRetMktID'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdDateAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
							(
								[ACBrandEquityFlag] ASC,
								[AdDate] ASC,
								[AdvertiserId] ASC,
								[marketid] ASC,
								[RetMktId] ASC,
								[CategoryId] ASC
							)
							INCLUDE ( 	[PageDetailID],
										[OriginalPageDetailID],
										[FlyerId],
										[Page],
										[AdMonthId],
										[WeekOf],
										[WeekOfn],
										[MediaID],
										[Advertiser],
										[market],
										[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsQueryFieldsSet1'')
					Begin
					CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsQueryFieldsSet1] ON [dbo].[' + @Categorycode + 'DetailReports]
							(
								[ACBrandEquityFlag] ASC,
								[AdvertiserId] ASC,
								[CategoryId] ASC,
								[BrandId] ASC
							)
							INCLUDE ( 	[PageDetailID],
								[OriginalPageDetailID],
								[FlyerId],
								[Page],
								[ACShowMathFlag],
								[ACRepFlag],
								[ACAdGrade],
								[AdMonthId],
								[AdDate],
								[WeekOf],
								[WeekOfn],
								[RetMktID],
								[ChannelID],
								[TradeClassId],
								[MarketID],
								[MediaID],
								[ManufacturerId],
								[TaggedCompany],
								[Advertiser],
								[market],
								[media],
								[MerchandiseCategoryId],
								[MerchandiseSubCatId],
								[FeaturesId]
								) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
						end
				IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsQueryFieldsSet2]'')
					Begin
						CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsQueryFieldsSet2]
						ON [dbo].[' + @Categorycode + 'DetailReports] ([BrandId],[ACShowMathFlag],[ACBrandEquityFlag],[AdvertiserId],[marketid],[mediaId],[CategoryId],[FeaturesId],[TaggedCompany])
						INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[market],[media],[AdDate],[ChannelID],[TradeClassId],[ManufacturerId])
					end

				IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet2'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet2] ON [dbo].[' + @Categorycode + 'DetailReports]
							(	[ACBrandEquityFlag] ASC,
								[AdvertiserId] ASC,
								[CategoryId] ASC,
								[BrandId] ASC)
							INCLUDE ([PageDetailID],
									[OriginalPageDetailID],
									[FlyerId],
									[Page],
									[ACShowMathFlag],
									[ACAdGrade],
									[AdMonthId],
									[AdDate],
									[WeekOf],
									[WeekOfn],
									[RetMktID],
									[ChannelID],
									[TradeClassId],
									[MarketID],
									[MediaID],
									[ManufacturerId],
									[TaggedCompany],
									[Advertiser],
									[market],
									[media],
									[MerchandiseCategoryId],
									[MerchandiseSubCatId],
									[FeaturesId])
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdPageLevel'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdPageLevel] ON [dbo].[' + @Categorycode + 'DetailReports]
							([Flyerid])
							INCLUDE ([Page])
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsOtherQueryColumns'')
					Begin
						CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsOtherQueryColumns] ON [dbo].[' + @Categorycode + 'DetailReports]
						([ACBrandEquityFlag] ASC,
	[ACAdGrade] ASC,
	[AdvertiserId] ASC,
	[CategoryId] ASC,
	[comments3] ASC,
	[FeaturesId] ASC,
	[MainOffer] ASC,
	[BrandId] ASC,
	[ManufacturerId] ASC,
	[marketid] ASC,
	[mediaId] ASC,
	[ProductTerritorySubGroupID] ASC,
	[RetMktId] ASC,
	[TaggedCompany] ASC,
	[UnitType] ASC
						)
						INCLUDE ( 	[PageDetailID],	[FlyerId],	[Page],	[ChannelID] ,	[TradeClassId] ,	[Advertiser],
	[market],
	[media],
	[AdDate],
	[AdMonthId],
	[WeekOf],
	[WeekOfn]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
						ENd
				
					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdMonthIDAdvertiserIDMarketIDRetMktID'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdMonthIDAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			--[AdMonthId] ASC, [AdvertiserId] ASC, [marketid] ASC, RetMktID ASC, CategoryID ASC, [AdDate] ASC
					--			[admonthid] ASC,
					--			[advertiserid] ASC,
					--			[categoryid] ASC,
					--			[TradeClassId] ASC,
					--			[marketid] ASC,
					--			[ChannelId] ASC
					--		)
					--		INCLUDE ( 		--[PageDetailID], [FlyerId], [Page], [Advertiser], [market], [media]
					--						[pagedetailid],
					--						[originalpagedetailid],
					--						[flyerid],
					--						[page],
					--						[advertiser],
					--						[market],
					--						[mediaid],
					--						[media],
					--						[addate],
					--						[retmktid]
					--				) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsWeekOfAdvertiserIDMarketIDRetMktID'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsWeekOfAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			[WeekOf] ASC,
					--			[WeekoFn] ASC,
					--			[AdvertiserId] ASC,
					--			[marketid] ASC,
					--			RetMktID ASC,
					--			CategoryID ASC,
					--			[AdDate] ASC
					--		)
					--		INCLUDE ( 	[PageDetailID],
					--			[FlyerId],
					--			[Page],
					--			[Advertiser],
					--			[market],
					--			[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFields'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFields] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			[MerchandiseCategoryId] ASC,
					--			[MerchandiseSubCatId] ASC,
					--			[CategoryId] ASC,
					--			[ManufacturerId] ASC,
					--			[BrandId] ASC,
					--			[AdvertiserId] ASC,
					--			[marketid] ASC,
					--			RetMktID ASC,
					--			[AdDate] ASC
					--		)
					--		INCLUDE ( 	[PageDetailID],
					--			[FlyerId],
					--			[Page],
					--			[Advertiser],
					--			[market],
					--			[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet1'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet1] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		([advertiserid], [marketid], [categoryid], [manufacturerid], [brandid])
					--		INCLUDE ([pagedetailid],[originalpagedetailid],[flyerid],[page], [addate])
					--End


					

					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet3'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet3] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		--([retmktid],[merchandisecategoryid],[merchandisesubcat],[advertiserid],[addate])
					--		([retmktid] ASC,    [merchandisecategoryid] ASC, [merchandisesubcatId] ASC, [advertiserid] ASC, [addate] ASC)
					--		--INCLUDE ([pagedetailid],[originalpagedetailid],[flyerid],[page],[advertiser],[market],[media],[categoryid])
					--		INCLUDE ([pagedetailid], [originalpagedetailid], [flyerid], [page], [advertiser], [market], [media], [MediaId], [categoryid], [brandId])
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
					--		INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate])
					--End


					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsADDetailLevel'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsADDetailLevel]	ON [dbo].[' + @Categorycode + 'DetailReports] 
							([retmktid],[mediaid],[ACBrandEquityFlag],[ACPrivateBrand],[ACProductsFlag],[admonthid])
							INCLUDE ([pagedetailid],[flyerid],[page],[advertiser],[market],[media],[addate],[categoryid],[OriginalPagedetailid])
					End
				'

	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
    
	PRINT '-- END CategorycodeIndex SP : ' + convert(varchar(100),current_timestamp,20)	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Categorycode,'CategorycodeIndex created ','CategorycodeIndex Created', GETDATE()	

	IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'vwqvfcfields') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		Drop Table vwqvfcfields	

END





GO

/****** Object:  StoredProcedure [dbo].[CategorycodeIndex_old]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Nishant(njoshi@markettrack.com)
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Modified : Sagar-12/02/2014
--			  -> Conditional logic for No of Key Index Columns > 16 for a catcode
-- exec CategorycodeIndex 'walpep',1
-- =============================================
Create PROCEDURE [dbo].[CategorycodeIndex_old]
	@Categorycode varchar(100),
	@IsDebug bit=0  --Values : "0 = Run / 1 = PRINT".
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets FROM
	-- interfering with SELECT statements.
PRINT '-- START CategorycodeIndex SP : ' + convert(varchar(100),current_timestamp,20)	
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Categorycode,'CategorycodeIndex start to create ','CategorycodeIndex start to create', GETDATE()
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN	
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'vw_qvfcfields')
				DROP SYNONYM [dbo].[vw_qvfcfields]

			CREATE SYNONYM [dbo].[vw_qvfcfields] FOR
				[MT2ASQL06].[SiteControl].[dbo].[vw_qvfcfields]														
				
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'ClientExceptionalCatCode')
				DROP SYNONYM [dbo].[ClientExceptionalCatCode]

			CREATE SYNONYM [dbo].[ClientExceptionalCatCode] FOR
				[MT2ASQL06].[Subscription].[dbo].[ClientExceptionalCatCode]
		END
	ELSE 	IF @@SERVERNAME LIKE 'MT2%'
		BEGIN	
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'vw_qvfcfields')
				DROP SYNONYM [dbo].[vw_qvfcfields]

			CREATE SYNONYM [dbo].[vw_qvfcfields] FOR
				[MT2SQL14].[SiteControl].[dbo].[vw_qvfcfields]														
				
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'ClientExceptionalCatCode')
				DROP SYNONYM [dbo].[ClientExceptionalCatCode]

			CREATE SYNONYM [dbo].[ClientExceptionalCatCode] FOR
				[MT2SQL14].[Subscription].[dbo].[ClientExceptionalCatCode]				
		END
		
	-- Changed by Sagar 12/02/2014 ------------
	DECLARE @IndexExtraColumn TABLE (TEXT NVARCHAR(200))
	Insert into @IndexExtraColumn Values ('SKUDescription3')
	Insert into @IndexExtraColumn Values ('SKUDescription2')
	Insert into @IndexExtraColumn Values ('ParentCompany')
	Insert into @IndexExtraColumn Values ('SKUDescription1')
	Insert into @IndexExtraColumn Values ('region')
	Insert into @IndexExtraColumn Values ('Channel')
	Insert into @IndexExtraColumn Values ('SalesTerritoryGroup')
	Insert into @IndexExtraColumn Values ('SalesTerritorySubGroup')
	Insert into @IndexExtraColumn Values ('salesterritory')													
	Insert into @IndexExtraColumn Values ('optional1')
	--------------------------------------------											
	
	SET NOCOUNT ON;
	Declare @SQL varchar(max)=''
	Declare @selectgrp int
	
	Declare @Categorycodeid int=(SELECT ID FROM categorycodeTable WHERE category=@Categorycode)
	
	;with t1 as
	(
	SELECT  COUNT(FieldName) total,groupid
	FROM  vw_qvfcfields
	WHERE displayseq is not null and groupid is not null and tableid is not null and groupid>1 and categorycodeid=@Categorycodeid
	group by groupid
	),t2
	as
	(
	SELECT total,groupid FROM t1 WHERE groupid=2
	UNION ALL
	SELECT (new.total+ori.total) as total,ori.groupid+1 FROM t2 new
	join (SELECT total,groupid FROM t1) ori
	on new.total+ori.total<16 and new.groupid+1 = ori.groupid
	)
	SELECT TOP(1) @selectgrp=groupid FROM t2
	order by groupid desc
	

	if exists (select * FROM dbo.sysobjects WHERE id = object_id(N'vwqvfcfields') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		Drop Table vwqvfcfields	
	SET @SQL = 'Select 
			V.* INTO vwqvfcfields 
			FROM 
				vw_qvfcfields V Inner Join (Select Name FROM SysColumns WHERE Object_Name(ID)= ''' + @Categorycode + 'DetailReports'') S ON
				V.FieldName=S.Name 
			WHERE categorycodeid= ' + Cast(@Categorycodeid as Varchar(20)) + '  and v.fieldtype <> 3 and v.fieldname not in (''ACBrandFamily'') ' --Changed by Sagar 22-04-2014 ; to exclude MPV type columns from index

			PRINT @SQL
			exec(@SQL)
			SET @SQL=''

	;with allgrp
	as
	( 
	---------------------------------------------group - 1 ---------------------------------------------
	SELECT distinct
	case WHEN FieldName = 'DynamicDateRange' THEN 'AdDate' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=1 and categorycodeid=@Categorycodeid and displayseq is not null and groupid<=@selectgrp

	UNION
	---------------------------------------------group - 2 ---------------------------------------------
	SELECT distinct
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=2 and categorycodeid=@Categorycodeid and displayseq is not null
	 and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=2 
																		and categorycodeid=@Categorycodeid
																		 and ParentFieldID is not null)
																		 and groupid<=@selectgrp


	UNION
	---------------------------------------------group - 3 ---------------------------------------------
	SELECT DISTINCT
	case  WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=3 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=3 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	UNION
	---------------------------------------------group - 4 ---------------------------------------------
	SELECT DISTINCT
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=4 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=4 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	UNION
	---------------------------------------------group - 5 ---------------------------------------------
	SELECT DISTINCT
	case WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=5 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=5 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	---------------------------------------------group - 6 ---------------------------------------------
	UNION
	SELECT DISTINCT
	case  WHEN FieldType=3 THEN 'MPV'+FielDName+'ID' WHEN FieldAttributeID=1 THEN FieldName+'ID' ELSE FieldName END as FielDName,GroupId,categorycodeid
	FROM vwqvfcfields
	WHERE groupID=6 and categorycodeid=@Categorycodeid and displayseq is not null 
	and FieldID not in(SELECT ParentFieldID FROM vwqvfcfields
																	WHERE groupID=6 
																	and categorycodeid=@Categorycodeid
																	 and ParentFieldID is not null)
																	 and groupid<=@selectgrp
	)
	SELECT * INTO #tempallgrp FROM allgrp
	SELECT COUNT(1) as CountForColumnsForIX FROM #tempallgrp where groupID  <> 1

	--------------------------------- Logic for Indexes if No of COlumns > 16 OR < 16---------------------------------------------
	-- Added by Sagar 12/02/2014

	--IF((SELECT COUNT(1) FROM #tempallgrp where groupID  <> 1) > 15) 
	--BEGIN
	--	PRINT ('Entered > 16 Condition');
	---- Logic if the Columns for Indexes > 16
	--	;WITH IndexFilter(Fieldlist) as
	--	( 
	--	  select FielDName from #tempallgrp where groupID<>1
	--	  except 
	--	  select text from @IndexExtraColumn
	--	)
	--	,IndexIncludeFilter(Fieldlist) as
	--	( 
	--	  select FielDName from #tempallgrp where groupID<>1
	--	  Intersect
	--	  select text from @IndexExtraColumn
	--	)	
	--	,grp23(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.Fieldlist + ','
	--			FROM IndexFilter  AS i
	--			FOR XML PATH('')) as varchar
		
	--	)
	--	,grp24(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.Fieldlist + ','
	--			FROM IndexIncludeFilter  AS i
	--			FOR XML PATH('')) as varchar		
	--	)
	--	,indexcolumn
	--	as
	--	(
	--		SELECT FieldName+','+(SELECT FieldList FROM grp23) as sqltext FROM #tempallgrp
	--		WHERE groupID=1
	--	)
	--	,IndexIncludeColumn as
	--	(
	--		SELECT ','+(SELECT FieldList FROM grp24) as sqlIncludetext 
	--	)
	--	--select * from indexcolumn,IndexIncludeColumn
	--	SELECT  @SQL=@SQL+
	--			'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+SUBSTRING(REPLACE(sqltext,',',''),0,100)+' on dbo.'+@Categorycode+'DetailReports
	--			('
	--			+SUBSTRING(sqltext,0,LEN(sqltext))+
	--			')
	--			INCLUDE(PageDetailId,FlyerID,Page,Advertiser,Market,Media'+(case WHEN charindex('AdDate',sqltext,0)=0 THEN ',AdDate' ELSE '' END)+''+ISNULL(SUBSTRING(sqlIncludetext,0,LEN(sqlIncludetext)),'')+')'+ +''+CHAR(13)
	--			  FROM indexcolumn,IndexIncludeColumn
	--	 PRINT 'Exiting > 16 Condition | Query generated with > 16 Condition'	
	--END
	--ELSE 
	--BEGIN
	--	PRINT('Entering < 16 Condition');
	---- Logic for Columns for Indexes < 16
	--	;WITH grp23(FieldList)
	--	as
	--	(
	--		SELECT (SELECT i.FielDName + ','
	--			FROM #tempallgrp  AS i
	--			WHERE groupID<>1
	--			FOR XML PATH('')) as varchar
	--	),indexcolumn
	--	as
	--	(
	--		SELECT FieldName+','+(SELECT FieldList FROM grp23) as sqltext FROM #tempallgrp
	--		WHERE groupID=1
	--	)
	--	SELECT  @SQL=@SQL+
	--			'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+SUBSTRING(REPLACE(sqltext,',',''),0,100)+' on dbo.'+@Categorycode+'DetailReports
	--			('
	--			+SUBSTRING(sqltext,0,LEN(sqltext))+
	--			')
	--			INCLUDE(PageDetailId,FlyerID,Page,Advertiser,Market,Media'+(case WHEN charindex('AdDate',sqltext,0)=0 THEN ',AdDate' ELSE '' END)+')'+CHAR(13)
	--			  FROM indexcolumn
	--	PRINT 'Exiting < 16 Condition | Query generated with < 16 Condition'
	--END
	--DROP TABLE #tempallgrp
	---------------------------------------------------End Of Logic----------------------------------------------------------

	--Commented By Hiren on 12/18/2013
	
	--;With DateField
	--as
	--(
	--SELECT Distinct FieldName 
	--FROM vwqvfcfields
	--WHERE categorycodeid=@Categorycodeid and columnformatID =8 and charindex(FieldName,@SQL,0)=0
	--),ctesqltext
	--as
	--(
	--SELECT 'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+FieldName+' on dbo.'+@Categorycode+'DetailReports
	--(PageDetailID)
	--INCLUDE('+FieldName+')'+CHAR(13) as sqltext
	--FROM DateField
	--)
	--SELECT @SQL=@SQL+sqltext FROM ctesqltext
	
	--;With MasterCategoryFields
	--as
	--(
	--SELECT DISTINCT FieldName
	--FROM vwqvfcfields
	--WHERE categorycodeid=@Categorycodeid and displayseq is not null and groupid=3 and charindex(FieldName,@SQL,0)=0
	--)
	--SELECT @SQL=@SQL+'CREATE NONCLUSTERED INDEX idx_'+@Categorycode+'DetailReports'+FieldName+' on dbo.'+@Categorycode+'DetailReports
	--('+FieldName+')'+CHAR(13)
	--FROM MasterCategoryFields
	
	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END

	------------------------------------Manual Indexes-----------------------------------

	--Set @SQL='IF EXISTS (SELECT * FROM sys.indexes WHERE OBJECT_ID = OBJECT_ID(N''[dbo].[' + @Categorycode + 'DetailReports]'') AND name = N''idx_' + @Categorycode + 'AllDates'')
	--	BEGIN
	--		DROp INDEX [idx_'+@Categorycode+'AllDates ] ON [dbo].['+ @Categorycode + 'DetailReports];' + SPACE(1)
	
	--Changes on 10.02.2017 For ACToFV
	SET @SQL = 'Create Index idx_'+@Categorycode+'AllDates on '+@Categorycode+'DetailReports
				(
					[ACBrandEquityFlag] ASC,
					[AdDate] ASC,
					[RetMktId] ASC,
					[CategoryId] ASC
				) 
				INCLUDE ([PageDetailID],
					[OriginalPageDetailID],
					[FlyerId],
					[Page],
					[AdMonthId],
					[WeekOf],
					[WeekOfn],
					[salestartdate],
					[saleenddate],
					[Advertiser],
					[market],
					[media],
					[MediaID])' + SPACE(1)  
	--'END '
		
	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END			
	
	--Set @SQL='IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[' + @Categorycode + 'DetailReports]'') AND name = N''idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID'')
	--	BEGIN
	--		DROP INDEX [idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID] ON [dbo].['+ @Categorycode + 'DetailReports];' + SPACE(1)

	--Created By Hiren on 12/18/2013

	-- Changed On 10.02.2017 For ACTOFV
	-- Changed on 21.08.2017 as per request in Email from Kishan
	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'MarketIDMediaIDMerchandiseCategoryIdMerchandiseSubCatID] ON [dbo].['+ @Categorycode + 'DetailReports] 
			(
				--[marketid] ASC, [mediaId] ASC, [MerchandiseCategoryId] ASC, [MerchandiseSubCatId] ASC, RetMktID ASC, CategoryID ASC, [AdDate] ASC
				[ACBrandEquityFlag] ASC,
				[mediaId] ASC,
				[ACRepFlag],
				[RetMktId] ASC,
				[marketid] ASC,
				[AdDate] ASC,
				[CategoryId] ASC
			)
			INCLUDE ( 
						-- [PageDetailID], [FlyerId], [Page], [Advertiser], [market], [media] --	, [AdDate], --	[CategoryId]
					[PageDetailID],
					[OriginalPageDetailID],
					[FlyerId],
					[Page],
					[MerchandiseCategoryId] ,
					[MerchandiseSubCatId] ,
					[Advertiser],
					[market],
					[media]
			) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			' + SPACE(1)  
	--'END '

	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
		
	--Item# : 30678	
	IF EXISTS(Select 1 from categorycodeTable where Category = @Categorycode and ISNULL(ISCT,0) = 0 and ISNULL(IsCLD,0) = 0)
	BEGIN

	--Changed on 10.02.2017 For ACTo FV
	SET @SQL = ''
	SET @SQL = 'CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'ADBLOCK1] ON [dbo].['+ @Categorycode + 'DetailReports] 
				( 
					[FlyerId] ASC,
					[Page] ASC,
					[topleftx] ASC,
					[toplefty] ASC
				) 
				INCLUDE (
						[PageDetailID],
						[OriginalPageDetailID],
						[MerchandiseCategory],
						[Category],
						[Brand],
						[Manufacturer],
						[MainOffer],
						[MPVOfferType],
						[Weight],
						[TaggedCompany],
						[Features],
						[UnitPrice],
						[SalePrice1]
						) 
					  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 

--				-------------FOR ADBlock codes ----------------	  
--					  CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'DetailReportsAdBlockId] ON [dbo].['+@Categorycode+'DetailReports]
--(
--	[AdBlockID] ASC
--) 
--INCLUDE ([PageDetailID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


--CREATE NONCLUSTERED INDEX [idx_'+@Categorycode+'ADBLOCK1] ON [dbo].['+@Categorycode+'DetailReports]
--(	
--	[ADBlockID] ASC,
--	[FlyerId] ASC,
--	[Page] ASC,
--	[topleftx] ASC,
--	[toplefty] ASC
--)
--INCLUDE ([PageDetailID],
--	[OriginalPageDetailID],
--	[MerchandiseCategory],
--	[Category],
--	[Brand],
--	[Manufacturer],
--	[MainOffer],
--	[MPVOfferType],
--	[Weight],
--	[TaggedCompany],
--	[Features],
--	[UnitPrice],
--	[SalePrice1]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
------------------------------------------------
					  				  
					  '



	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
		

	END		
	--Item# : 30678					
------------------------------------------------------Index for Segmentation----------------------------------
IF EXISTS (SELECT  CE.CategoryCodeId FROM ClientExceptionalCatCode CE
			INNER JOIN CategoryCodetable CC
            ON CE.CategoryCodeId = CC.ID  AND ISNULL(CE.AllowDefineCustUpdt, 0) = 1 AND ISNULL(CC.IsIntegerID, 0) = 1
             Where CE.CategoryCodeId=@Categorycodeid)
      BEGIN
		SET @SQL='CREATE NONCLUSTERED INDEX idx_' + @Categorycode + 'DetailReportsOriginalPageDetailId ON [' + @Categorycode + 'DetailReports](
	[OriginalPageDetailID] ASC
) 
INCLUDE ([PageDetailID]) '
		
		IF @IsDebug=0
			BEGIN
				EXEC(@SQL)
			END
		ELSE
			BEGIN
				PRINT @SQL
			END	   
		
      END
      


------------------------------------------------------ New Index For Client Build SP (JIRA Ticket MTDB-113)  ----------------------------------

--Declare @IsIntegerId int = (Select ISNULL(IsintegerId,0) as IsIntegerId from CategoryCodetable where category = @Categorycode)

--IF(@IsIntegerId = 1)
--	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'NonDates] ON [dbo].['+ @Categorycode + 'DetailReports] 
--				([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
--				INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate]) 
--				WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]' + SPACE(1)
--Else
--	SET @SQL= 'CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'NonDates] ON [dbo].['+ @Categorycode + 'DetailReports] 
--				([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
--				INCLUDE ([PageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate]) 
--				WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]' + SPACE(1)

	
--	--'END '

--	IF @IsDebug=0
--		BEGIN
--			EXEC(@SQL)
--		END
--	ELSE
--		BEGIN
--			PRINT @SQL
--		END	


------------------------------------------------------ New Index For Client Build SP (ACToFV)  ----------------------------------
	SET @SQL =	'
					-- New Changes On 10.02.2017 For ACToFV
					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdDateAdvertiserIDMarketIDRetMktID'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdDateAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
							(
								[ACBrandEquityFlag] ASC,
								[AdDate] ASC,
								[AdvertiserId] ASC,
								[marketid] ASC,
								[RetMktId] ASC,
								[CategoryId] ASC
							)
							INCLUDE ( 	[PageDetailID],
										[OriginalPageDetailID],
										[FlyerId],
										[Page],
										[AdMonthId],
										[WeekOf],
										[WeekOfn],
										[MediaID],
										[Advertiser],
										[market],
										[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsQueryFieldsSet1'')
					Begin
					CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsQueryFieldsSet1] ON [dbo].[' + @Categorycode + 'DetailReports]
							(
								[ACBrandEquityFlag] ASC,
								[AdvertiserId] ASC,
								[CategoryId] ASC,
								[BrandId] ASC
							)
							INCLUDE ( 	[PageDetailID],
								[OriginalPageDetailID],
								[FlyerId],
								[Page],
								[ACShowMathFlag],
								[ACRepFlag],
								[ACAdGrade],
								[AdMonthId],
								[AdDate],
								[WeekOf],
								[WeekOfn],
								[RetMktID],
								[ChannelID],
								[TradeClassId],
								[MarketID],
								[MediaID],
								[ManufacturerId],
								[TaggedCompany],
								[Advertiser],
								[market],
								[media],
								[MerchandiseCategoryId],
								[MerchandiseSubCatId],
								[FeaturesId]
								) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
						end
				IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsQueryFieldsSet2]'')
					Begin
						CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsQueryFieldsSet2]
						ON [dbo].[' + @Categorycode + 'DetailReports] ([BrandId],[ACShowMathFlag],[ACBrandEquityFlag],[AdvertiserId],[marketid],[mediaId],[CategoryId],[FeaturesId],[TaggedCompany])
						INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[market],[media],[AdDate],[ChannelID],[TradeClassId],[ManufacturerId])
					end

				IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet2'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet2] ON [dbo].[' + @Categorycode + 'DetailReports]
							(	[ACBrandEquityFlag] ASC,
								[AdvertiserId] ASC,
								[CategoryId] ASC,
								[BrandId] ASC)
							INCLUDE ([PageDetailID],
									[OriginalPageDetailID],
									[FlyerId],
									[Page],
									[ACShowMathFlag],
									[ACAdGrade],
									[AdMonthId],
									[AdDate],
									[WeekOf],
									[WeekOfn],
									[RetMktID],
									[ChannelID],
									[TradeClassId],
									[MarketID],
									[MediaID],
									[ManufacturerId],
									[TaggedCompany],
									[Advertiser],
									[market],
									[media],
									[MerchandiseCategoryId],
									[MerchandiseSubCatId],
									[FeaturesId])
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdPageLevel'')
					Begin
							CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdPageLevel] ON [dbo].[' + @Categorycode + 'DetailReports]
							([Flyerid])
							INCLUDE ([Page])
					End

					IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsOtherQueryColumns'')
					Begin
						CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsOtherQueryColumns] ON [dbo].[' + @Categorycode + 'DetailReports]
						([ACBrandEquityFlag] ASC,
	[ACAdGrade] ASC,
	[AdvertiserId] ASC,
	[CategoryId] ASC,
	[comments3] ASC,
	[FeaturesId] ASC,
	[MainOffer] ASC,
	[BrandId] ASC,
	[ManufacturerId] ASC,
	[marketid] ASC,
	[mediaId] ASC,
	[ProductTerritorySubGroupID] ASC,
	[RetMktId] ASC,
	[TaggedCompany] ASC,
	[UnitType] ASC
						)
						INCLUDE ( 	[PageDetailID],	[FlyerId],	[Page],	[ChannelID] ,	[TradeClassId] ,	[Advertiser],
	[market],
	[media],
	[AdDate],
	[AdMonthId],
	[WeekOf],
	[WeekOfn]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
						ENd
				
					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsAdMonthIDAdvertiserIDMarketIDRetMktID'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsAdMonthIDAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			--[AdMonthId] ASC, [AdvertiserId] ASC, [marketid] ASC, RetMktID ASC, CategoryID ASC, [AdDate] ASC
					--			[admonthid] ASC,
					--			[advertiserid] ASC,
					--			[categoryid] ASC,
					--			[TradeClassId] ASC,
					--			[marketid] ASC,
					--			[ChannelId] ASC
					--		)
					--		INCLUDE ( 		--[PageDetailID], [FlyerId], [Page], [Advertiser], [market], [media]
					--						[pagedetailid],
					--						[originalpagedetailid],
					--						[flyerid],
					--						[page],
					--						[advertiser],
					--						[market],
					--						[mediaid],
					--						[media],
					--						[addate],
					--						[retmktid]
					--				) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsWeekOfAdvertiserIDMarketIDRetMktID'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsWeekOfAdvertiserIDMarketIDRetMktID] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			[WeekOf] ASC,
					--			[WeekoFn] ASC,
					--			[AdvertiserId] ASC,
					--			[marketid] ASC,
					--			RetMktID ASC,
					--			CategoryID ASC,
					--			[AdDate] ASC
					--		)
					--		INCLUDE ( 	[PageDetailID],
					--			[FlyerId],
					--			[Page],
					--			[Advertiser],
					--			[market],
					--			[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFields'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFields] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		(
					--			[MerchandiseCategoryId] ASC,
					--			[MerchandiseSubCatId] ASC,
					--			[CategoryId] ASC,
					--			[ManufacturerId] ASC,
					--			[BrandId] ASC,
					--			[AdvertiserId] ASC,
					--			[marketid] ASC,
					--			RetMktID ASC,
					--			[AdDate] ASC
					--		)
					--		INCLUDE ( 	[PageDetailID],
					--			[FlyerId],
					--			[Page],
					--			[Advertiser],
					--			[market],
					--			[media]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet1'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet1] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		([advertiserid], [marketid], [categoryid], [manufacturerid], [brandid])
					--		INCLUDE ([pagedetailid],[originalpagedetailid],[flyerid],[page], [addate])
					--End


					

					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet3'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet3] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		--([retmktid],[merchandisecategoryid],[merchandisesubcat],[advertiserid],[addate])
					--		([retmktid] ASC,    [merchandisecategoryid] ASC, [merchandisesubcatId] ASC, [advertiserid] ASC, [addate] ASC)
					--		--INCLUDE ([pagedetailid],[originalpagedetailid],[flyerid],[page],[advertiser],[market],[media],[categoryid])
					--		INCLUDE ([pagedetailid], [originalpagedetailid], [flyerid], [page], [advertiser], [market], [media], [MediaId], [categoryid], [brandId])
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
					--		INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate])
					--End


					--IF NOT EXISTS(Select * From sysindexes where name = ''idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4'')
					--Begin
					--		CREATE NONCLUSTERED INDEX [idx_' + @Categorycode + 'DetailReportsPDTFieldsSet4] ON [dbo].[' + @Categorycode + 'DetailReports]
					--		([AdvertiserId],[MarketID],[CategoryId],[ManufacturerID],[BrandID])
					--		INCLUDE ([PageDetailID],[OriginalPageDetailID],[FlyerId],[Page],[Advertiser],[Market],[Media],[AdDate])
					--End
				'

	IF @IsDebug=0
		BEGIN
			EXEC(@SQL)
		END
	ELSE
		BEGIN
			PRINT @SQL
		END	
    
	PRINT '-- END CategorycodeIndex SP : ' + convert(varchar(100),current_timestamp,20)	
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Categorycode,'CategorycodeIndex created ','CategorycodeIndex Created', GETDATE()	

	IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'vwqvfcfields') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		Drop Table vwqvfcfields	

END





GO

/****** Object:  StoredProcedure [dbo].[CustomStepSP_nwrPeP]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomStepSP_nwrPeP] 
(
@Category Varchar(50),
@Flag Int,
@IsDebug Int = 0
)
AS
Begin
--exec [CustomStepSP_nwrPeP] 'nwrPeP',1,1
Declare @SQL NVARCHAR(max)
---------------------------------------------------------------------------------------------------------------------------------------------
If @Category = 'nwrPeP' and @Flag=1
Begin
    Set @SQL='Delete From ' + @Category + 'DetailReports Where Category =''Durable Food Storage'' and Brand = ''Reynolds'''
    If @IsDebug=1
        Print @SQL
    Else
        Exec (@SQL)

    Set @SQL='EXECUTE mt_proc_Create_DisplayTables ''' + @Category + ''''
    If @IsDebug = 1
        Print @SQL
    Else
        Exec (@SQL)
End
---------------------------------------------------------------------------------------------------------------------------------------------
End
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientDataDBBackups]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



cREATE       Procedure [dbo].[sp_ClientDataDBBackups]
As
BEGIN

	Declare @SQL varchar(2000)
			,@DBName varchar(2000)
			,@backupLoc varchar(2000)
			,@DeviceName varchar(2000)
			,@lnvchrBUDeviceDelete NVARCHAR(2000)
			,@dttm DateTime
			,@tempvalue int
			,@strSubjectLine varchar(255)
	
	--SET @DBName = 'SQL03' -- Commented by Hiren on 08/23/2011
	SET @DBName =Replace(@@ServerName,'MT2','')  -- Updated by Hiren on 08/23/2011
	
	Select @backuploc=Case when ActiveLocation = 1 Then BackupLocation Else AlternateBackupLocation End
		 from [MT2SQL14].[connection].dbo.AdViewBackupLOcation where BackupType = 'MT2' + @DBName

	If NOT @DBName = ''
		BEGIN
			SET @dttm = getdate()
			If NOT EXISTS(Select * from [MT2SQL14].[connection].dbo.AdViewBackupHistory 
					Where DateAdd(d, 0, DateDiff(d, 0, StartTime)) = DATEADD(d,DATEDIFF(d,0,GETDATE()),0) )
			BEGIN
				Insert Into [MT2SQL14].[connection].dbo.AdViewBackupHistory 
				   (Location, StartTime, EndTime) 
					 Select @backuploc, getdate(), NULL 
			END
			
			SET @devicename = @dbname 
			UPDATE [MT2SQL14].[connection].dbo.nightlyprocessing SET BackupStart = @dttm, BackupLocation = @backuploc 
			WHERE SQLServer =  @DBName And DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE()-1),0) 
			SET @lnvchrBUDeviceDelete = N'DEL ' + @backuploc + @devicename + '.bak'
		--	Exec master..xp_cmdshell @lnvchrBUDeviceDelete
		
			-- Added by Hiren on 08/23/2011
			--IF CHARINDEX('2008 R2',@@VERSION)> 0 
				SET @SQL = 'USE Master
					BACKUP DATABASE ' + @DBName + ' To Disk = ''' + @backuploc + @devicename + '.bak''  
					WITH  INIT , COMPRESSION, NOUNLOAD ,  SKIP ,  STATS = 10,  FORMAT '
			--ELSE
			--	SET @SQL = 'USE Master
			--		BACKUP DATABASE ' + @DBName + ' To Disk = ''' + @backuploc + @devicename + '.bak''  
			--		WITH  INIT ,  NOUNLOAD ,  SKIP ,  STATS = 10,  FORMAT '
		
			Exec(@sql)
			SET @dttm = getdate()
			
			UPDATE 
				[MT2SQL14].[connection].dbo.nightlyprocessing 
			SET 
				BackupEnd = @dttm 
			WHERE 
				SQLServer = @DBName And 
				DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE()-1),0) 
		END
	
END















GO

/****** Object:  StoredProcedure [dbo].[CustomUPC_Call_Test_Database]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[CustomUPC_Call_Test_Database]
	-- Add the parameters for the stored procedure here
	--exec [CustomUPC_Call_Test_Database] 'cwgpep', 'ACFVINCR', 'cns', 0
	(
			@category varchar(50)
			, @dbName varchar(100) 
			, @UPCType varchar(100) = ''
			,@IsDebug int = 0
	)
AS
BEGIN

		Declare @sql varchar(max)

		Set @sql = '
						If not exists(select * from syscolumns where name = ''MPVACUPCCode'' and OBJECT_NAME(id) = '''+@category+'DetailReports'')
						Begin
								Alter Table '+@category+'DetailReports Add MPVACUPCCode Varchar(8000) 
						End
						Else
						Begin
								Alter Table '+@category+'DetailReports Drop Column MPVACUPCCode 
								Alter Table '+@category+'DetailReports Add MPVACUPCCode Varchar(8000) 
						End
					'

		If @IsDebug = 0
			EXEC(@SQL)
		Else
			Print @SQL

		--Set @sql = '
		--				Update '+@category+'DetailReports SET MPVACUPCCode = NULL
		--			'

		--If @IsDebug = 0
		--	EXEC(@SQL)
		--Else
		--	Print @SQL


		SET @sql =	'
						IF Exists(Select name From sysobjects where name = ''' + @category + 'UPCMasterCSV'')
						Begin
						Drop Table ' + @category + 'UPCMasterCSV
						END
						
						Select pagedetailid, ACParentAdcId,advertiserid 
						into ' + @category + 'UPCMasterCSV 
						From ' + @category + 'DetailReports with(nolock)
						Option(maxdop 1)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL


		IF(@UPCType = 'CNS')
		Begin
				SET @sql =	'
							IF Exists(Select name From sysobjects where name = ''' + @category + 'DisUPCMaster'')
							Begin
							Drop Table ' + @category + 'DisUPCMaster
							ENd

							select Distinct adc_i,upc 
							Into ' + @category + 'DisUPCMaster
							From	(	select adc_i, right(UPC,10) as UPC  from ' + @dbName + '.dbo.cnsmatchup
										union 
										select  adc_i, right(UPC,10) as UPC from ' + @dbName + '.dbo.Matchup
									) A
						'
				If @IsDebug = 0
					Exec (@SQL)
				Else
					Print @SQL
		End
		Else
		Begin
				SET @sql =	'
								IF Exists(Select name From sysobjects where name = ''' + @category + 'DisUPCMaster'')
								Begin
								Drop Table ' + @category + 'DisUPCMaster
								END

								Select Distinct B.adc_i, right(b.UPC,10) as upc
								Into ' + @category + 'DisUPCMaster
								From ' + @dbName + '.dbo.ACFVUPCMaster b with(nolock)
								JOIN ' + @category + 'UPCMasterCSV c with(nolock) ON b.adc_i= c.ACParentAdcId 
								Option(maxdop 1)
							'
				If @IsDebug = 0
					Exec (@SQL)
				Else
					Print @SQL
		End


		SET @sql =	'
						Delete A
						From ' + @category + 'DisUPCMaster A
						JOIN ' + @dbName + '.dbo.Ahold_UPC B with(nolock) ON A.UPC = right(B.UPC,10)
						JOIN ' + @category + 'UPCMasterCSV c with(nolock) ON a.adc_i= c.ACParentAdcId 
						Where Advertiserid  In (10876754,10876745,10693932,92) 
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL

		IF(@category = 'CWGPEP')
		Begin
				SET @sql =	'
								IF Exists(Select name From sysobjects where name = ''' + @category + 'DisACUPCCode'')		
								begin
								drop table ' + @category + 'DisACUPCCode
								end
					
								select distinct  UPC as ACUPCCode into ' + @category + 'DisACUPCCode from ' + @category + 'DisUPCMaster

								IF Exists(Select name From sysobjects where name =  ''' + @category + 'MPVACUPCCode'')	
								begin
								drop table ' + @category + 'MPVACUPCCode	
								end

								select a.PageDetailID, 0 as ACUPCCodeID,b.UPC as ACUPCCode  
								into ' + @category + 'MPVACUPCCode   
								from ' + @category + 'UPCMasterCSV a with(nolock)
								join ' + @category + 'DisUPCMaster b with(nolock) on a.ACParentAdcId = b.adc_i
								Option(maxdop 16)
							'
				If @IsDebug = 0
					Exec (@SQL)
				Else
					Print @SQL

				SET @sql =	'
								Create Clustered Index PK_' + @category + 'DisACUPCCode on ' + @category + 'DisACUPCCode(ACUPCCode) 
							'
				If @IsDebug = 0
					Exec (@SQL)
				Else
					Print @SQL
		End

		SET @sql =	'
						CREATE NONCLUSTERED INDEX [IDX_' + @category + 'UPCMasterADC] ON [dbo].[' + @category + 'DisUPCMaster]
						(
							[adc_i] ASC
						)
						INCLUDE ( 	[UPC]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL


		SET @sql =	'
						IF Exists(Select name From sysobjects where name = ''' + @category + 'DisUPCMaster_Stuff'')
						Begin
						Drop Table ' + @category + 'DisUPCMaster_Stuff
						ENd

						SELECT  adc_i,
								Field = STUFF((SELECT top  500 ''; '' + LTRIM(RTRIM(x.upc)) FROM ' + @category + 'DisUPCMaster x
														WHERE  x.adc_i  = t.adc_i
														GROUP BY LTRIM(RTRIM(x.upc))
														ORDER BY ''; '' + LTRIM(RTRIM(x.upc)) FOR XML PATH(''''),TYPE).value(''.'',''VARCHAR(8000)''), 1, 2, '''')
						Into ' + @category + 'DisUPCMaster_Stuff
						FROM ' + @category + 'DisUPCMaster t with(nolock)
						GROUP BY adc_i
						Option(maxdop 1)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL

		SET @sql =	'
						If not exists(select * from syscolumns where name = ''MPVACUPCCode'' and OBJECT_NAME(id) = '''+@category+'UPCMasterCSV'')
							Alter Table ' + @category + 'UPCMasterCSV add MPVACUPCCode varchar(8000)

						CREATE CLUSTERED INDEX [IDX_' + @category + 'DisUPCMaster_Stuff_ADC_I] ON [' + @category + 'DisUPCMaster_Stuff]([adc_i] ASC)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL

		SET @sql =	'
						Update A 
						Set A.MPVACUPCCode = B.Field
						From ' + @category + 'UPCMasterCSV A with(nolock)
						Join ' + @category + 'DisUPCMaster_Stuff B with(nolock) on A.ACParentAdcId = B.adc_i
						OPTION(MAXDOP 1)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL

		SET @sql =	'
						IF Exists(Select name From sysobjects where name = ''' + @category + 'UPCMasterCSV_NOT_NULL'')
								Drop Table ' + @category + 'UPCMasterCSV_NOT_NULL

						Select *
						Into ' + @category + 'UPCMasterCSV_NOT_NULL
						From ' + @category + 'UPCMasterCSV with(nolock)
						Where MPVACUPCCode IS NOT NULL
						Option(Maxdop 16)
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL


		SET @sql =	'
						UPDATE T1
							SET T1.MPVACUPCCode = T2.MPVACUPCCode
						FROM '+@category+'DetailReports T1
						JOIN ' + @category + 'UPCMasterCSV_NOT_NULL T2 with(nolock) ON T1.PageDetailID = T2.PageDetailID 
						Option(maxdop 1)
							
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL


		SET @sql =	'
						IF Exists(Select name From sysobjects where name = ''' + @category + 'DisUPCMaster_Stuff'')
							Drop Table ' + @category + 'DisUPCMaster_Stuff

						IF Exists(Select name From sysobjects where name = ''' + @category + 'DisUPCMaster'')
							Drop Table ' + @category + 'DisUPCMaster

						IF Exists(Select name From sysobjects where name = ''' + @category + 'UPCMasterCSV'')
							Drop Table ' + @category + 'UPCMasterCSV
					'
		If @IsDebug = 0
			Exec (@SQL)
		Else
			Print @SQL

END

GO

/****** Object:  StoredProcedure [dbo].[MasterSegmentation]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create Procedure [dbo].[MasterSegmentation]
(
 @Category varchar(15)
,@IsDebug Bit
)
As
Begin
--Exec MasterSegmentation 'lo',1
Declare  @clientid varchar(100)
		,@id varchar(100)
		,@customdataupdategroupid varchar(100)
		,@clientserver varchar(100)
		,@servername varchar(20)
		,@SiteControl varchar(100)
		,@Subscription varchar(100)
		,@DataDB varchar(100)
		,@lIsFull BIT
		,@IsIntegerId BIT
		,@lCategoryCodeId INT
		,@lPDTTableName VARCHAR(50)
		,@lFlyerIdColumnName VARCHAR(15)
		,@lSQL NVARCHAR(max)
		,@SQL NVARCHAR(max)
		,@lCWMTableName VARCHAR(50)
		,@ROWCount INT =0
		,@i INT=1

SELECT @servername=@@SERVERNAME
Set @Subscription = dbo.mtfunc_GetDatabasePrefix ('Sub')
Set @SiteControl = dbo.mtfunc_GetDatabasePrefix ('Control')
Set @DataDB='['+@SERVERNAME+'].['+ right(@servername,5)+'].[dbo].'

IF @@SERVERNAME LIKE 'MT2A%'
	BEGIN
		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'MasterSegmentationTable')
		DROP SYNONYM [MasterSegmentationTable]

		CREATE SYNONYM [MasterSegmentationTable] FOR [MT2ASQL06].[SiteControl].[dbo].[vw_MasterSegmentation]

		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'EmailList')
		DROP SYNONYM [EmailList]

		CREATE SYNONYM [EmailList] FOR [MT2ASQL06].[SiteControl].[dbo].[EmailList]

	END
ELSE
	BEGIN
		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'MasterSegmentationTable')
		DROP SYNONYM [dbo].[MasterSegmentationTable]

		CREATE SYNONYM [MasterSegmentationTable] FOR [MT2SQL14].[SiteControl].[dbo].[vw_MasterSegmentation]

		IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'EmailList')
		DROP SYNONYM [EmailList]

		CREATE SYNONYM [EmailList] FOR [MT2SQL14].[SiteControl].[dbo].[EmailList]

	END

	if object_id('tempdb..#myTable') is not null
	Drop Table #myTable

	Create TABLE  #myTable (SegCount INT IDENTITY(1,1),ClientID Int,ID Int,CustomDataUpdateGroupID Int,IsIntegerID Int,DisplaySeq Int)

	Set @SQL='INSERT INTO #myTable(ClientID,ID,CustomDataUpdateGroupID,IsIntegerID,DisplaySeq) 
			  SELECT DISTINCT ClientID,ID,CustomDataUpdateGroupID,IsIntegerID,DisplaySeq
			  FROM MasterSegmentationTable 
			  Where Category= '''+@Category+''' Order BY DisplaySeq ASC'

	Exec (@SQL)
	
	SELECT @ROWCount = COUNT(Distinct SegCount) FROM #myTable 
	
WHILE (@i <= @ROWCount) 
	BEGIN 
	
	Select @ClientID=ClientID,@Id=ID,@CustomDataUpdateGroupID=CustomDataUpdateGroupID,@IsIntegerID=IsIntegerID from #myTable where SegCount=@i 
	
	SET @lIsFull = 1

	SET @lSQL = 'IF EXISTS(SELECT * FROM ' + @SiteControl + 'Categorycode WHERE Id = @CategoryCodeId AND (ISNULL(isAdlert, 0) = 1 OR ISNULL(isFSI, 0) = 1 OR ISNULL(isCT, 0) = 1 OR ISNULL(isDAA, 0) = 1))
		SET @IsFull = 1
	ELSE IF EXISTS(SELECT * FROM ' + @SiteControl + 'Categorycode WHERE Id = @CategoryCodeId AND ISNULL(isFull, 0) = 1)
		SET @IsFull = 1
	ELSE IF EXISTS(SELECT * FROM ' + @Subscription + 'SavedCustomDataUpdates WHERE CategoryCodeId = @CategoryCodeId AND CreateDt > CONVERT(VARCHAR, GETDATE()-1, 101))
		SET @IsFull = 1
	ELSE
	BEGIN
		SET @IsFull = 0
		IF EXISTS(SELECT * FROM ' + @SiteControl + 'Categorycode WHERE Id = @CategoryCodeId AND partialsourcecode = ''acfvincr..tempacfv'')
			SET @PDTTableName = ''acfvincr.dbo.tempacfvdetailreports''

		IF EXISTS(SELECT * FROM ' + @SiteControl + 'Categorycode WHERE Id = @CategoryCodeId AND (ISNULL(isIntegerID, 0) = 0 OR FVCCType =4) )
			SET @FlyerIdColumnName = ''FlyerID''
		ELSE
			SET @FlyerIdColumnName = ''OriginalFlyerID''
	
		SELECT @CWMTableName = ClientTableName FROM ' + @SiteControl + 'tablenames WHERE CategoryCodeId = @CategoryCodeId AND tableid = 3
	END'

	EXECUTE SP_EXECUTESQL @lSQL
						, N'@CategoryCodeId INT, @IsFull BIT OUTPUT, @PDTTableName VARCHAR(50) OUTPUT, @FlyerIdColumnName VARCHAR(15) OUTPUT, @CWMTableName VARCHAR(50) OUTPUT'
						, @CategoryCodeId = @id, @IsFull = @lIsFull OUTPUT, @PDTTableName = @lPDTTableName OUTPUT, @FlyerIdColumnName = @lFlyerIdColumnName OUTPUT, @CWMTableName = @lCWMTableName OUTPUT
		

		print @lFlyerIdColumnName
		print @id
		print @lPDTTableName
		print @lCWMTableName
		print @SiteControl

	IF @lIsFull = 0
		SET @SQL = '
		IF EXISTS(SELECT * FROM tempdb.dbo.sysobjects WHERE xtype = ''u'' AND name=''pdtids_' + CAST(@id AS VARCHAR) + ''') --
		DROP TABLE tempdb.dbo.pdtids_' + CAST(@id AS VARCHAR) +CHAR(13)+ '--
		SELECT pdt.PageDetailID --
		INTO tempdb.dbo.pdtids_' + CAST(@id AS VARCHAR) + '--
		FROM ' + @lPDTTableName + ' Pdt --
		INNER JOIN ' + @lCWMTableName + ' Cwm ON Cwm.' + @lFlyerIdColumnName + ' = Pdt.FlyerID --
		INNER JOIN (SELECT * FROM ' + @SiteControl + 'vw_MerchandiseCategory WHERE CategoryCodeId = ' + CAST(@id AS VARCHAR) + ') Mc ON Mc.RealCategory = Pdt.Category --
		OPTION (MAXDOP 1) --'+CHAR(13)+CHAR(13)
		
		print @SQL
	
	If @IsIntegerId=1
		SET @lSQL = 'EXEC DataSP50Int.dbo.fv_ApplyCustomDataUpdateWhereClause '''+@SiteControl+''', '''+@Subscription+''', '''+@DataDB+''', '+Cast(@clientId as varchar)+', '+Cast(@id as varchar)+', '+Cast(@customdataupdategroupid as varchar)+', 0, '+Cast(@lIsFull as varchar)
	Else
		SET @lSQL = 'EXEC DataSP50.dbo.fv_ApplyCustomDataUpdateWhereClause '''+@SiteControl+''','''+@Subscription+''','''+@DataDB+''', '+Cast(@clientId as varchar)+','+Cast(@id as varchar)+','+Cast(@customdataupdategroupid as varchar)+', 0, '+Cast(@lIsFull as varchar)
	
	IF @lIsFull = 0 AND @i=1
		Set @lSQL=@SQL + @lSQL

	If @IsDebug=1
			PRINT(@lSQL)
		Else
			Begin
				INSERT INTO CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) 
				SELECT @category,'Segmentation begins - IsFull - ' + CAST(@lIsFull AS VARCHAR), 'Segmentation begins - IsFull - ' + CAST(@lIsFull AS VARCHAR), GETDATE()
				
				Begin Try
				EXEC(@lSQL)
				End Try

				BEGIN CATCH
					
					Declare @Subject varchar(max),@Query varchar(max),@Body varchar(max),@EmailAddress  varchar(max)
					Set @Subject=' Segmentation Update Failed For '+@Category+' On '+@@SERVERNAME
					Set @Query='select * from '+Right(@@Servername,5)+'.dbo.MasterSegmentationTable Where  Category='''+@Category+''''
					Set @Body='<b>Below Segmentation Script Failed:</b><br> <i>'
								+replace(@lSQL,'--','<br>')
								+'</i><br><b>With Error:</b> '+(select '<font color="red">'  + ERROR_MESSAGE() as ErrorDescription)+'</font>'
								+'<br><b>For Below Record:</b>'
					
					SELECT 	@EmailAddress = COALESCE(@EmailAddress ,'') + LTRIM(RTRIM(EmailAddress)) +';'
					FROM EmailList
					Where Segmentation=1

					exec master.dbo.mt_proc_send_cdosysmail
						@to=@EmailAddress,
						@subject=@Subject,
						@bodytype='html',
						@body=@Body,
						@Query=@Query

				END CATCH

				INSERT INTO CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) 
				SELECT @category,'Segmentation ends - IsFull - ' + CAST(@lIsFull AS VARCHAR), 'Segmentation ends - IsFull - ' + CAST(@lIsFull AS VARCHAR), GETDATE()
			End
	SELECT @i = @i + 1
	End
	SET @lSQL = CHAR(13)+'
	IF EXISTS(SELECT * FROM tempdb.dbo.sysobjects WHERE xtype = ''u'' AND name = ''pdtids_' +  CAST(@id AS VARCHAR) + ''') 
	DROP TABLE tempdb.dbo.pdtids_' +  CAST(@id AS VARCHAR)
	If @IsDebug=1
		PRINT(@lSQL)
	Else
		EXEC(@lSQL)
End


GO

/****** Object:  StoredProcedure [dbo].[MasterCustomUpdate]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[MasterCustomUpdate]
(
	@Category VARCHAR(20),
	@Flag smallint,
	@IsDebug Bit=0
)
AS

Begin
	--Exec MasterCustomUpdate 'mfd50',1,0
	Declare	@SQL varchar(max)
			,@i INT =1
			,@ROWCount INT =0
			,@FieldType varchar(10)

	If @Flag=2
		Set @FieldType='2'
	Else If @Flag=1
		Set @FieldType='1,3'
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'MasterCustomStepTable')
			DROP SYNONYM [MasterCustomStepTable]

			CREATE SYNONYM [MasterCustomStepTable] FOR [MT2ASQL06].[SiteControl].[dbo].[vw_MasterCustomStep]

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'EmailList')
			DROP SYNONYM [EmailList]

			CREATE SYNONYM [EmailList] FOR [MT2ASQL06].[SiteControl].[dbo].[EmailList]

		END
	ELSE
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'MasterCustomStepTable')
			DROP SYNONYM [dbo].[MasterCustomStepTable]

			CREATE SYNONYM [MasterCustomStepTable] FOR [MT2SQL14].[SiteControl].[dbo].[vw_MasterCustomStep]

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = 'EmailList')
			DROP SYNONYM [EmailList]

			CREATE SYNONYM [EmailList] FOR [MT2SQL14].[SiteControl].[dbo].[EmailList]

		END
	
	if object_id('tempdb..#myTable') is not null
	Drop Table #myTable

	Create TABLE  #myTable (SPIDCount INT IDENTITY(1,1),SPID Int,SPName VARCHAR(50),FieldType Int,ProcessOrder Int)

	Set @SQL='INSERT INTO #myTable(SPID,SPName,FieldType,ProcessOrder) SELECT DISTINCT SPID,SPName,'+cast(@Flag as varchar(10))+',ProcessOrder FROM MasterCustomStepTable 
				Where FieldType In ('+@FieldType+') and Category='''+@Category+''' Order BY ProcessOrder ASC'
	Exec (@SQL)

	SELECT @ROWCount = COUNT(Distinct SPID) FROM #myTable 

	WHILE (@i <= @ROWCount) 
	BEGIN 
		Select @SQL='Exec '+SPName+' '''+@Category+''','+cast(@Flag as varchar(10))+'' from #myTable where SPIDCount=@i 
		If @IsDebug=1
			Print (@SQL)
		Else
			Begin
				INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Category,'Start: Custom Update SP for '+@Category,@SQL, GETDATE()		
				Begin Try
					Exec(@SQL)
				END TRY
				BEGIN CATCH
					
					Declare @Subject varchar(max),@Query varchar(max),@Body varchar(max),@EmailAddress  varchar(max)
					Set @Subject=CASE When @Flag=1 Then 'PDT' When @Flag=2 Then 'CWM' Else '' End+ ' Custom Update Failed For '+@Category+' On '+@@SERVERNAME
					Set @Query='select distinct  M.ClientID,M.ClientName,M.Category,M.ClientServer,M.MT2aClientServer,M.FieldID,M.FieldName,M.FieldType,M.ProcessingStage,M.SQLTaskId,M.Descrip,M.SPName,M.ProcessOrder  
						from '+Right(@@Servername,5)+'.dbo.MasterCustomStepTable M Join #myTable T on M.SPName=T.SPName
						Where  M.FieldType In ('+@FieldType+') and M.Category='''+@Category+''' and T.SPIDCount='+cast(@i as varchar(10))+'
						Order BY M.ProcessOrder ASC'
					Set @Body='<b>Below CustomUpdate SP Call Failed:</b><br> <i>'+@SQL+char(13)+char(10)+'</i><br><b> With Error :</b>'+(select '<font color="red">'  + ERROR_MESSAGE() as ErrorDescription)+'</font>'
								+'<br><b>For Below Record:</b>'

					SELECT 	@EmailAddress = COALESCE(@EmailAddress ,'') + LTRIM(RTRIM(EmailAddress)) +';'
					FROM EmailList
					Where CustomUpdate=1

					exec master.dbo.mt_proc_send_cdosysmail
						@to=@EmailAddress,
						@subject=@Subject,
						@bodytype='html',
						@body=@Body,
						@Query=@Query

				END CATCH
				INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Category,'End: Custom Update SP for '+@Category,@SQL, GETDATE()		
			End
		SELECT @i = @i + 1
	END

End



GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Html_Call]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Divyang Patel
-- Create date: 09.01.2017
-- Description:	HTML Call
-- Execution Call : EXECUTE SQl06.dbo.mt_proc_Html_Call 'kcpep'
-- =============================================
create PROCEDURE [dbo].[mt_proc_Html_Call] 
	-- Add the parameters for the stored procedure here
	@catcode varchar(100)
AS
BEGIN

	SET NOCOUNT ON;
	
	---HTML Query Page Update start
	Declare @CategoryCodeTable varchar(255)
	Declare @HTMLQueryPageChange varchar(255)
	Declare @SQL varchar(max)

	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	Set @HTMLQueryPageChange = dbo.mtfunc_GetDatabasePrefix('Sub') + 'HTMLQueryPageChange'


	Set @SQL='insert into '+@HTMLQueryPageChange+' 
		select category from '+@CategoryCodeTable+' 
		where category not in (select category from '+@HTMLQueryPageChange+') 
		and FVver>=5
		and ClientServer='''+@@SERVERNAME+''''
    
	--Print (@SQL)
	Exec (@SQL)

	------------------------------------------------------
	--Filling HomePageDataSP for all FV6+ codes(Added as per request from Ritesh) 
	Declare  @FillHomePageData Table (FillHomePageID INT IDENTITY(1,1),ClientId Int,CategoryCodeId Int,IsIntegerId Bit)
	Declare @RowCount Int=0
	  ,@i INT =1
	  ,@IsIntegerId Bit
	  ,@SiteControl varchar(max)
	  ,@Subscription varchar(max)
	  ,@DataDb varchar(max)
	  ,@CategoryCodeId Int

	Set @Subscription = dbo.mtfunc_GetDatabasePrefix ('Sub')
	Set @SiteControl = dbo.mtfunc_GetDatabasePrefix ('Control')
	--Set @DataDb = @@ServerName+'.'+Right(@@ServerName,5)+'.dbo.'
	Set @DataDb = @@ServerName+'.'+CASE WHEN @@SERVERName='MT2SQL00A' Then 'ClientHist' Else Right(@@ServerName,5) End+'.dbo.'

	INSERT INTO @FillHomePageData(ClientId,CategoryCodeId,IsIntegerId) 
	SELECT ClientId,Id,Isnull(IsIntegerId,0) as IsIntegerId
	From CategorycodeTable 
	where ClientServer=@@ServerName 
	and (ClientPDT=1 OR CWMFULL=1 OR Category Like '%Hist%')
	and FVVer>=6  and fvcctype in(2,4)
	And category = @catcode
	And  dbcreatedon =  (case when cast(dbcreatedon as date)= cast(getdate() as date) and  DATEPART(HOUR, dbcreatedon) < 12 then '' else dbcreatedon end)   
	--and Category Not in ('chac')
	--and Category in ('kcpep')
	--and (Isnull(ISCT,0)=0 OR Category='AVCD')
	--and Isnull(IsAdlert,0)=0 and Isnull(IsDAA,0)=0 and Isnull(IsCLD,0)=0
	Order by ClientId

	SELECT @ROWCount = COUNT(1) FROM @FillHomePageData 

	WHILE (@i <= @ROWCount) 
	BEGIN 
	 Select @SQL='EXEC DataSP50Int.dbo.fv_FillHomePageTableData  '+cast(ClientId as varchar)+','+cast(CategoryCodeId as varchar)+','''+@SiteControl+''','''+@Subscription+'''' +','''+@DataDb+''''
	 from @FillHomePageData where FillHomePageID=@i 

	 Select @IsIntegerId=IsIntegerId,@CategoryCodeId=CategoryCodeId from @FillHomePageData where FillHomePageID=@i

	 If @IsIntegerId=0
	 Set @SQL=replace(@SQL,'DataSP50Int','DataSP50')

	 If @CategoryCodeId=3206
	 Set @SQL=replace(@SQL,'.SQL12','.MasterAVData')

	 --Print (@SQL)
	 Exec(@SQL)

	 SELECT @i = @i + 1
	END
	------------------------------------------------------

	---HTML Query Page Update end


    

END

GO

/****** Object:  StoredProcedure [dbo].[BUUpdate]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[BUUpdate]
	@pCategoryCode varchar(50), --
	@pDebugRun bit,  --Values : "0 = Run / 1 = Print".
	@pCWMPDT bit --Value : : "0 = CWM / 1 = PDT".
AS 
SET NOCOUNT ON
BEGIN
	Declare @crlf char(2)
	set @crlf = char(13)+char(10)
	Declare @fullclause varchar(8000)
	Declare @lErrorDes varchar(5000)	
	Declare @lSql varchar(8000)
	Declare @lUpdateSql1 varchar(500)
	Declare @lUpdateSql2 varchar(500)
	Declare @lUpdateSql3 varchar(500)
	Declare @lcParam1 varchar(100) --User for storing cursor values.
	Declare @lcParam2 varchar(100) --User for storing cursor values.
	Declare @lcParam3 varchar(100) --User for storing cursor values.
	Declare @lcCounter int --User as counter in Cursor.
	Declare @lBatchCount int
	Declare @lSelectCaseSql1 varchar(8000)
	Declare @lSelectCaseSql2 varchar(8000)
	Declare @lSelectCaseSql3 varchar(8000)
	Declare @lSelectCaseSql4 varchar(8000)
	Declare @lSelectCaseSql5 varchar(8000)
	Declare @lAlternateSelectCaseSql1 varchar(8000)
	Declare @lAlternateSelectCaseSql2 varchar(8000)
	Declare @lAlternateSelectCaseSql3 varchar(8000)
	Declare @lAlternateSelectCaseSql4 varchar(8000)
	Declare @lAlternateSelectCaseSql5 varchar(8000)
	Declare @lTableNames varchar(255) --Name of the "TableNames" table.
	Declare @lPdtTable varchar(255) --Name of PDT table corresponding to categorycode.
	Declare @lManufacturerTable varchar(255) --Name of Manufacturer table corresponding to categorycode.
	Declare @lProductTerritoryTable varchar(255) --Name of ProductTerritory table corresponding to categorycode.
	Declare @lProductTerritoryGroupsTable varchar(255) --Name of ProductTerritoryGroup table corresponding to categorycode.
	Declare @lUpdateManufacturer bit--Value : 1/0
	Declare @lUpdateProductTerritory bit --Value : 1/0
	Declare @lUpdateProductTerritoryGroup bit --Value : 1/0
	Declare @lUpdateProductTerritorySubGroup bit --Value : 1/0
	Declare @lCwmTable varchar(255) --Name of CWM table corresponding to categorycode.
	Declare @lMarketSalesRegionsTable varchar(255) --Name of MarketSalesRegions table corresponding to categorycode.
	Declare @lAdvertiserSalesTerritoryTable varchar(255) --Name of AdvertiserSalesTerritory table corresponding to categorycode.
	Declare @lSalesTerritoryGroupsTable varchar(255) --Name of SalesTerritoryGroups table corresponding to categorycode.
	Declare @lUpdateDistrict bit --Value : 1/0
	Declare @lUpdateRegion bit --Value : 1/0
	Declare @lUpdateSalesTerritory bit --Value : 1/0
	Declare @lUpdateSalesTerritoryGroup bit --Value : 1/0
	Declare @lUpdateSalesTerritorySubGroup bit --Value : 1/0
	Declare @lPDTFull bit -- Value : 1 - Full / 0 - New
	Declare @lCWMFull bit -- Value : 1 - Full / 0 - New
	Declare @lUpdateParentCompany bit
	Declare @lParentCompanyTable varchar(255)
	Declare @lParentCompanyTableExists varchar(100)
	Declare @lParentCompanyColumnExists varchar(100)
	--Adview2Control Changes
	Declare @strNewId varchar(255)
	Declare @NSQL Nvarchar(1000)
	Declare @CategoryCodeTable varchar(255)
	--Adview2Control Changes
	Declare @lManufacturerTableExists varchar(100)
	Declare @lProductTerritoryTableExists varchar(100)
	Declare @lProductTerritoryGroupsTableExists varchar(100)
	Declare @lMarketSalesRegionsTableExists varchar(100)
	Declare @lAdvertiserSalesTerritoryTableExists varchar(100)
	Declare @lSalesTerritoryGroupsTableExists varchar(100)
	Declare @lTableNamesExists varchar(100)
	--Initialize the variables.
	SET @lSql = ''
	SET @lUpdateSql1 = ''
	SET @lUpdateSql2 = ''
	SET @lUpdateSql3 = ''
	SET @lcParam1 = ''
	SET @lcParam2 = ''
	SET @lcParam3 = ''
	SET @lSelectCaseSql1 = ''
	SET @lSelectCaseSql2 = ''
	SET @lSelectCaseSql3 = ''
	SET @lSelectCaseSql4 = ''
	SET @lSelectCaseSql5 = ''
	SET @lAlternateSelectCaseSql1 = ''
	SET @lAlternateSelectCaseSql2 = ''
	SET @lAlternateSelectCaseSql3 = ''
	SET @lAlternateSelectCaseSql4 = ''
	SET @lAlternateSelectCaseSql5 = ''
	SET @lTableNames = 'TableNames'
	SET @lPdtTable = ''
	SET @lcCounter = 0
	SET @lBatchCount = 90
	SET @lManufacturerTable = ''
	SET @lProductTerritoryTable = ''
	SET @lProductTerritoryGroupsTable = ''
	SET @lCwmTable = ''
	SET @lMarketSalesRegionsTable = ''
	SET @lAdvertiserSalesTerritoryTable = ''
	SET @lSalesTerritoryGroupsTable = ''
	set @lParentCompanyColumnExists = ''
	SET @fullclause = ''
	--Adview2Control Changes
PRINT '-- START BatchUpdate SP : ' + convert(varchar(100),current_timestamp,20)
	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	--Adview2Control Changes
	--If CWM Process is to be done.
	IF @pCWMPDT = 0
	BEGIN
		--Adview2Control Changes		
		select @NSQL = N'SELECT @lUpdateDistrict = ISNULL(BUDt,0), @lUpdateRegion = ISNULL(BURn,0),@lUpdateSalesTerritory = ISNULL(BUST,0), @lUpdateSalesTerritoryGroup = ISNULL(BUSTG,0),@lUpdateSalesTerritorySubGroup = ISNULL(BUSTSG,0), @lCWMFull = CASE WHEN ISAdlert = 1 THEN 1 ELSE CWMFull END  FROM ' + @CategoryCodeTable + ' Where Category = ''' + @pCategoryCode + ''''
		Print @Nsql
		execute sp_executesql @NSQL, N'@lUpdateDistrict bit OUTPUT,@lUpdateRegion bit OUTPUT,@lUpdateSalesTerritory bit OUTPUT,@lUpdateSalesTerritoryGroup bit OUTPUT,@lUpdateSalesTerritorySubGroup bit OUTPUT,@lCWMFull bit OUTPUT', @lUpdateDistrict  OUTPUT,@lUpdateRegion  OUTPUT,@lUpdateSalesTerritory  OUTPUT,@lUpdateSalesTerritoryGroup  OUTPUT,@lUpdateSalesTerritorySubGroup  OUTPUT,@lCWMFull  OUTPUT
		--Adview2Control Changes
		IF @lCWMFull IS NULL
		BEGIN
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ERROR CWMFull',GETDATE(),'CWMFull Column of CategoryCode table is containing NULL.')
			ELSE
				PRINT '--Error : CWMFull Column of CategoryCode table is containing NULL.'
	
			RETURN
		END			
	END
	--If PDT Process is to be done.
	ELSE
	BEGIN
		--Adview2Control Changes
		select @NSQL = N'SELECT @lUpdateManufacturer = ISNULL(BUMfr,0), @lUpdateProductTerritory = ISNULL(BUPT,0),@lUpdateProductTerritoryGroup = ISNULL(BUPTG,0), @lUpdateProductTerritorySubGroup = ISNULL(BUPTSG,0), @lUpdateParentCompany = ISNULL(BuPC,0), @lPDTFull = isfull FROM ' + @CategoryCodeTable + ' Where Category = ''' + @pCategoryCode + ''''
		execute sp_executesql @NSQL, N'@lUpdateManufacturer bit OUTPUT,@lUpdateProductTerritory bit OUTPUT,@lUpdateProductTerritoryGroup bit OUTPUT,@lUpdateProductTerritorySubGroup bit OUTPUT, @lUpdateParentCompany bit OUTPUT, @lPDTFull bit OUTPUT', @lUpdateManufacturer  OUTPUT,@lUpdateProductTerritory  OUTPUT,@lUpdateProductTerritoryGroup  OUTPUT,@lUpdateProductTerritorySubGroup OUTPUT, @lUpdateParentCompany OUTPUT, @lPDTFull  OUTPUT
		--Adview2Control Changes
		IF @lPDTFull IS NULL
		BEGIN
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ERROR ISFull',GETDATE(),'ISFull Column of CategoryCode table is containing NULL.')
			ELSE
				PRINT '--Error : ISFull Column of CategoryCode table is containing NULL.'
				
			RETURN
		END
	END
	--Initialize the variables.
	--Print All The Details.
	IF @pCWMPDT = 0
		PRINT '--CWM UPDATE ::'	
	ELSE
		PRINT '--PDT UPDATE ::'	
	PRINT '--CategoryCode = ' + @pCategoryCode
	IF @pDebugRun = 1
		PRINT '--Mode = Print[Debug]' 
	ELSE
		PRINT '--Mode = Run[Execute]'
	--PRINT '--DebugRun = ' + CAST(@pDebugRun AS VARCHAR(1))
	--PRINT '--CWMPDT = ' + CAST(@pCWMPDT AS VARCHAR(1))
	
	IF @pCWMPDT = 0
	BEGIN
		
		IF @lCWMFull = 1
			PRINT '--CWMFull = All Records'
		ELSE
			PRINT '--CWMFull = New Records'
		
		IF @lUpdateDistrict = 1
			PRINT '--BUDt = ' + CAST(@lUpdateDistrict AS VARCHAR(1))
		IF @lUpdateRegion = 1
			PRINT '--BURn = ' + CAST(@lUpdateRegion AS VARCHAR(1))
		IF @lUpdateSalesTerritory = 1
			PRINT '--BUST = ' + CAST(@lUpdateSalesTerritory AS VARCHAR(1))
		
		IF @lUpdateSalesTerritoryGroup = 1
			PRINT '--BUSTG = ' + CAST(@lUpdateSalesTerritoryGroup AS VARCHAR(1))
		IF @lUpdateSalesTerritorySubGroup = 1
			PRINT '--BUSTSG = ' + CAST(@lUpdateSalesTerritorySubGroup AS VARCHAR(1))
		EXECUTE GetTableName @pCategoryCode, 3, @lCwmTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 14, @lMarketSalesRegionsTable OUTPUT
		EXECUTE GetTableName @pCategoryCode, 2, @lAdvertiserSalesTerritoryTable OUTPUT
		EXECUTE GetTableName @pCategoryCode, 28, @lSalesTerritoryGroupsTable OUTPUT
		PRINT '--CwmTable = ' + @lCwmTable		
		IF (@lUpdateDistrict = 1 OR @lUpdateRegion = 1)
			PRINT '--MarketSalesRegionsTable = ' + @lMarketSalesRegionsTable
		IF (@lUpdateSalesTerritory = 1 OR @lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1)
			PRINT '--AdvertiserSalesTerritoryTable = ' + @lAdvertiserSalesTerritoryTable
		IF (@lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1)
			PRINT '--SalesTerritoryGroupsTable = ' + @lSalesTerritoryGroupsTable
		--SET @lCwmTable = 'TEMP' + @lCwmTable
	END
	ELSE
	BEGIN
		IF @lPDTFull = 1
			PRINT '--isfull = All Records'
		ELSE
			PRINT '--isfull = New Records'
		IF @lUpdateManufacturer = 1
			PRINT '--BUMfr = ' + CAST(@lUpdateManufacturer AS VARCHAR(1))
		IF @lUpdateProductTerritory = 1
			PRINT '--BUPT = ' + CAST(@lUpdateProductTerritory AS VARCHAR(1))
		IF @lUpdateProductTerritoryGroup = 1
			PRINT '--BUPTG = ' + CAST(@lUpdateProductTerritoryGroup AS VARCHAR(1))
		IF @lUpdateProductTerritorySubGroup = 1
			PRINT '--BUPTSG = ' + CAST(@lUpdateProductTerritorySubGroup AS VARCHAR(1))
		IF @lUpdateParentCompany = 1
			PRINT '--BuPC = ' + CAST(@lUpdateParentCompany AS VARCHAR(1))
		EXECUTE GetTableName @pCategoryCode, 22, @lPdtTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 12, @lManufacturerTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 24, @lProductTerritoryTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 25, @lProductTerritoryGroupsTable OUTPUT
		--SELECT @lParentCompanyTable = dbo.mtfunc_GetDatabasePrefix('Control') + 'AnhdPCGroupAssign'
		EXECUTE GetTableName @pCategoryCode, 52, @lParentCompanyTable OUTPUT
		PRINT '--PdtTable = ' + @lPdtTable
		--Manufacturer
		IF @lUpdateManufacturer = 1
		BEGIN
			PRINT '--MfrTable = ' + @lManufacturerTable
			IF PARSENAME(@lManufacturerTable,1) = ''
			BEGIN
				SET @lErrorDes = 'Manufacturer not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lManufacturerTable = ''
				SET @lUpdateManufacturer = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lManufacturerTable,1))
				SELECT @NSQL = N'SELECT @lManufacturerTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lManufacturerTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lManufacturerTableExists varchar(50) OUTPUT, @lManufacturerTable varchar(255)', @lManufacturerTableExists OUTPUT, @lManufacturerTable
				SELECT @lManufacturerTableExists = ISNULL(@lManufacturerTableExists,'')
				IF @lManufacturerTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lManufacturerTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lManufacturerTable = ''
					SET @lUpdateManufacturer = 0
				END	
				ELSE
				BEGIN
					--Create Temp Manufacturer table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TManu' + @strNewId + ' FROM ' + @lManufacturerTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lManufacturerTable = 'TEMPDB..TManu' + @strNewId
					--Create Temp Manufacturer table
				END
			END
		END
		--Parent Company
		
		print @lUpdateParentCompany
		IF @lUpdateParentCompany = 1
		BEGIN
			PRINT '--ParentCompany = ' + @lParentCompanyTable
			IF PARSENAME(@lParentCompanyTable,1) = ''
			BEGIN
				SET @lErrorDes = 'ParentCompany not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lParentCompanyTable = ''
				
				SELECT @NSQL = N'SELECT @lParentCompanyColumnExists = Name FROM Syscolumns 
						WHERE [Id] IN(SELECT [Id] FROM SysObjects WHERE XType = ''U'' AND Name = ''' + PARSENAME(@lPdtTable,1) + ''') AND Name = ''ParentCompany'''
				EXECUTE sp_executesql @NSQL, N'@lParentCompanyColumnExists varchar(50) OUTPUT', @lParentCompanyColumnExists OUTPUT
						
				IF isNull(@lParentCompanyColumnExists,'') = ''
				BEGIN
					SET @lSql = 'ALTER TABLE ' + @lPdtTable + ' ADD ParentCompany VARCHAR(100),ParentCompanyID Int NOT NULL DEFAULT(0)  '
					IF @pDebugRun = 0
						EXEC(@lSql)
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END						
				END

				SET @lUpdateParentCompany = 0
			END
			ELSE
			BEGIN
				SELECT @NSQL = N'SELECT @lParentCompanyTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lParentCompanyTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lParentCompanyTableExists varchar(50) OUTPUT, @lParentCompanyTable varchar(255)', @lParentCompanyTableExists OUTPUT, @lParentCompanyTable
				SELECT @lParentCompanyTableExists = ISNULL(@lParentCompanyTableExists,'')
				IF @lParentCompanyTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lParentCompanyTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lParentCompanyTable = ''
					SELECT @NSQL = N'SELECT @lParentCompanyColumnExists = Name FROM Syscolumns 
							WHERE [Id] IN(SELECT [Id] FROM SysObjects WHERE XType = ''U'' AND Name = ''' + PARSENAME(@lPdtTable,1) + ''') AND Name = ''ParentCompany'''
					EXECUTE sp_executesql @NSQL, N'@lParentCompanyColumnExists varchar(50) OUTPUT', @lParentCompanyColumnExists OUTPUT
						
					IF isNull(@lParentCompanyColumnExists,'') = ''
					BEGIN
						SET @lSql = 'ALTER TABLE ' + @lPdtTable + ' ADD ParentCompany VARCHAR(100),ParentCompanyID Int NOT NULL DEFAULT(0) '
						IF @pDebugRun = 0
							EXEC(@lSql)
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END						
					END

					SET @lUpdateParentCompany = 0
				END	
				ELSE
				BEGIN
					--Create Temp ParentCompany table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TParentCompany' + @strNewId + ' FROM ' + @lParentCompanyTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lParentCompanyTable = 'TEMPDB..TParentCompany' + @strNewId
					--Create Temp ParentCompany table
				END
			END
		END
		--PT, PTGROUP, PTSUBGROUP
		IF (@lUpdateProductTerritory = 1 OR @lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1)
		BEGIN
			PRINT '--PTTable = ' + @lProductTerritoryTable
			IF PARSENAME(@lProductTerritoryTable,1) = ''
			BEGIN
				SET @lErrorDes = 'ProductTerritory not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lProductTerritoryTable = ''
				SET @lUpdateProductTerritory = 0
				SET @lUpdateProductTerritoryGroup = 0
				SET @lUpdateProductTerritorySubGroup = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lProductTerritoryTable,1))
				SELECT @NSQL = N'SELECT @lProductTerritoryTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lProductTerritoryTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lProductTerritoryTableExists varchar(50) OUTPUT, @lProductTerritoryTable varchar(255)', @lProductTerritoryTableExists OUTPUT, @lProductTerritoryTable
				SELECT @lProductTerritoryTableExists = ISNULL(@lProductTerritoryTableExists,'')
				IF @lProductTerritoryTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lProductTerritoryTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
	
					SET @lProductTerritoryTable = ''
					SET @lUpdateProductTerritory = 0
					SET @lUpdateProductTerritoryGroup = 0
					SET @lUpdateProductTerritorySubGroup = 0
				END	
				ELSE
				BEGIN
					--Create Temp ProductTerritory table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TPT' + @strNewId + ' FROM ' + @lProductTerritoryTable
					EXEC(@lSql)		
					IF @pDebugRun <> 0		
						PRINT @lSql	
		
					SET @lProductTerritoryTable = 'TEMPDB..TPT' + @strNewId
					--Create Temp ProductTerritory table
				END
			END
		END
		--PTGROUP, PTSUBGROUP
		IF (@lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1)
		BEGIN
			PRINT '--PTGTable = ' + @lProductTerritoryGroupsTable
			IF PARSENAME(@lProductTerritoryGroupsTable,1) = ''
			BEGIN				
				SET @lErrorDes = 'ProductTerritoryGroups not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END	
				
				SET @lProductTerritoryGroupsTable = ''
				SET @lUpdateProductTerritoryGroup = 0
				SET @lUpdateProductTerritorySubGroup = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lProductTerritoryGroupsTable,1))
				SELECT @NSQL = N'SELECT @lProductTerritoryGroupsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lProductTerritoryGroupsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lProductTerritoryGroupsTableExists varchar(50) OUTPUT, @lProductTerritoryGroupsTable varchar(255)', @lProductTerritoryGroupsTableExists OUTPUT, @lProductTerritoryGroupsTable
				SELECT @lProductTerritoryGroupsTableExists = ISNULL(@lProductTerritoryGroupsTableExists,'')
				IF @lProductTerritoryGroupsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lProductTerritoryGroupsTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
	
					SET @lProductTerritoryGroupsTable = ''
					SET @lUpdateProductTerritoryGroup = 0
					SET @lUpdateProductTerritorySubGroup = 0
				END	
				ELSE
				BEGIN
					--Create Temp ProductTerritoryGroups table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TPTG' + @strNewId + ' FROM ' + @lProductTerritoryGroupsTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lProductTerritoryGroupsTable = 'TEMPDB..TPTG' + @strNewId
					--Create Temp ProductTerritoryGroups table
				END
			END
		END
		--SET @lPdtTable = 'TEMP' + @lPdtTable
	END
	SELECT @NSQL = N'SELECT @lTableNamesExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lTableNames,1)'
	EXECUTE sp_executesql @NSQL, N'@lTableNamesExists varchar(100) OUTPUT, @lTableNames varchar(255)', @lTableNamesExists OUTPUT, @lTableNames
	SELECT @lTableNamesExists = ISNULL(@lTableNamesExists,'')
	IF @lTableNamesExists = ''
	BEGIN
		SET @lErrorDes = 'Invalid object name ' + @lTableNames
		IF @pDebugRun = 0 
		BEGIN
			--BEGIN TRANSACTION
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
			--COMMIT
		END
		ELSE
		BEGIN
			PRINT '--Error : ' + @lErrorDes	
			PRINT CHAR(13)
		END
		RETURN
	END
	--START : Update CWM Fields.
	---************************************** CWM UPDATE ****************************************************************************
	IF @pCWMPDT = 0
	BEGIN
		IF @pDebugRun = 0
		BEGIN
			--BEGIN TRANSACTION		
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'CWM Start Time',GETDATE(),'')
			----COMMIT
		END
		--################ CWM TABLE EXISTANCE ####################################
		IF @lCwmTable = ''
		BEGIN
			SET @lErrorDes = 'ChildWebMain not present in TableNames.'
			IF @pDebugRun = 0
			BEGIN
				--BEGIN TRANSACTION
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				--COMMIT
			END	
			ELSE
			BEGIN
				PRINT '--Error : ' + @lErrorDes
				PRINT ''
			END
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT Name FROM SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lCwmTable,1))
			BEGIN
				SET @lErrorDes = 'Invalid object name ' + @lCwmTable
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lCwmTable = ''
			END
		END
		--################  CWM TABLE EXISTANCE ####################################
		IF @pDebugRun = 1
		BEGIN
			PRINT ''
			PRINT '-----Batch Update-------------' 
		END
	
		--START : Update District,Region.
		--##############################################################################################################################
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Start CWM Update for District Region ','Start CWM Update for District Region', GETDATE()
	
		IF (@lUpdateDistrict = 1 OR @lUpdateRegion = 1) AND @lCwmTable <> ''
		BEGIN
			IF @lMarketSalesRegionsTable = ''
			BEGIN
				SET @lErrorDes = 'MarketSalesRegions not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lMarketSalesRegionsTable,1))
				SELECT @NSQL = N'SELECT @lMarketSalesRegionsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lMarketSalesRegionsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lMarketSalesRegionsTableExists varchar(50) OUTPUT, @lMarketSalesRegionsTable varchar(255)', @lMarketSalesRegionsTableExists OUTPUT, @lMarketSalesRegionsTable
				SELECT @lMarketSalesRegionsTableExists = ISNULL(@lMarketSalesRegionsTableExists,'')
				IF @lMarketSalesRegionsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lMarketSalesRegionsTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lMarketSalesRegionsTable = ''
				END
			END
	
			IF @lUpdateDistrict = 1 AND @lMarketSalesRegionsTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lMarketSalesRegionsTable + ' Add DistrictID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
				
					SET @lSql = 'INSERT INTO 
					IDDB.dbo.District (District) 
					Select 
						DISTINCT ISNULL(District, '''')
					From ' + @lMarketSalesRegionsTable + '  Except Select 
						DISTINCT ISNULL(District, '''')
					From  
						IDDB.dbo.District'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
						
					SET @lSql = 'Update  CT SET DistrictID=I.DistrictID FROM 
									' + @lMarketSalesRegionsTable + ' CT Join IDDB..District I ON CT.District=I.District ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET District = Msr.District, DistrictID = Msr.DistrictID, '
				SET @lSql = @lSql + 'DistUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lMarketSalesRegionsTable + ' Msr '
				SET @lSql = @lSql + ' ON Cwm.Market = Msr.Market'
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.DistUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'District Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'District Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
	
			IF @lUpdateRegion = 1 AND @lMarketSalesRegionsTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lMarketSalesRegionsTable + ' Add RegionID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
				
					SET @lSql = 'INSERT INTO 
						IDDB.dbo.Region (Region) 
					Select 
						DISTINCT ISNULL(Region, '''')
					From ' + @lMarketSalesRegionsTable + '  Except Select 
						DISTINCT ISNULL(Region, '''')
					From  
						IDDB.dbo.Region'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET RegionID=I.RegionID FROM 
									' + @lMarketSalesRegionsTable + ' CT Join IDDB..Region I ON CT.Region=I.Region ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
							
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET Region = IsNULL(Msr.Region,''''), RegionID=Msr.RegionID,'
				SET @lSql = @lSql + 'RegionUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lMarketSalesRegionsTable + ' Msr '
				SET @lSql = @lSql + ' ON Cwm.Market = Msr.Market '
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.RegionUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Region Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Region Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END	
		END
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Updated  District Region ','Updated  District Region', GETDATE()
		--END : Update District.
		--##############################################################################################################################
	
		--START : Update SalesTerritory, SalesTerritoryGroup,SalesTerritorySubGroup
		--##############################################################################################################################
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Start CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup ','Start CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup', GETDATE()
		IF (@lUpdateSalesTerritory = 1 OR @lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1) AND @lCwmTable <> ''
		BEGIN
			IF @lAdvertiserSalesTerritoryTable = ''
			BEGIN
				SET @lErrorDes = 'AdvertiserSalesTerritory not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lAdvertiserSalesTerritoryTable,1))
				SELECT @NSQL = N'SELECT @lAdvertiserSalesTerritoryTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lAdvertiserSalesTerritoryTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lAdvertiserSalesTerritoryTableExists varchar(50) OUTPUT, @lAdvertiserSalesTerritoryTable varchar(255)', @lAdvertiserSalesTerritoryTableExists OUTPUT, @lAdvertiserSalesTerritoryTable
				SELECT @lAdvertiserSalesTerritoryTableExists = ISNULL(@lAdvertiserSalesTerritoryTableExists,'')
				IF @lAdvertiserSalesTerritoryTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lAdvertiserSalesTerritoryTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lAdvertiserSalesTerritoryTable = ''
				END
			END
	
			IF @lUpdateSalesTerritory = 1 AND @lAdvertiserSalesTerritoryTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lAdvertiserSalesTerritoryTable + ' Add SalesTerritoryID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
					
					
					SET @lSql = 'INSERT INTO 
						IDDB.dbo.SalesTerritory (SalesTerritory) 
					Select 
						DISTINCT ISNULL(SalesTerritory, '''')
					From ' + @lAdvertiserSalesTerritoryTable + '  Except Select 
						DISTINCT ISNULL(SalesTerritory, '''')
					From  
						IDDB.dbo.SalesTerritory'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET SalesTerritoryID=I.SalesTerritoryID FROM 
									' + @lAdvertiserSalesTerritoryTable + ' CT Join IDDB..SalesTerritory I ON CT.SalesTerritory=I.SalesTerritory ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritory = Ast.SalesTerritory, SalesTerritoryID = Ast.SalesTerritoryID, '
				SET @lSql = @lSql + 'StUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.Advertiser = Ast.Advertiser AND Cwm.Market = Ast.Market '
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritory Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritory Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			IF @lSalesTerritoryGroupsTable = ''
			BEGIN
				SET @lErrorDes = 'SalesTerritoryGroups not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END			
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lSalesTerritoryGroupsTable,1))
				SELECT @NSQL = N'SELECT @lSalesTerritoryGroupsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lSalesTerritoryGroupsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lSalesTerritoryGroupsTableExists varchar(50) OUTPUT, @lSalesTerritoryGroupsTable varchar(255)', @lSalesTerritoryGroupsTableExists OUTPUT, @lSalesTerritoryGroupsTable
				SELECT @lSalesTerritoryGroupsTableExists = ISNULL(@lSalesTerritoryGroupsTableExists,'')
				IF @lSalesTerritoryGroupsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lSalesTerritoryGroupsTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lSalesTerritoryGroupsTable = ''
				END
			END
			IF @lUpdateSalesTerritoryGroup = 1 AND @lAdvertiserSalesTerritoryTable <> '' AND @lSalesTerritoryGroupsTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lSalesTerritoryGroupsTable + ' Add SalesTerritoryGroupID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)


					SET @lSql = 'INSERT INTO 
						IDDB.dbo.SalesTerritoryGroup (SalesTerritoryGroup) 
					Select 
						DISTINCT ISNULL(SalesTerritoryGroup, '''')
					From ' + @lSalesTerritoryGroupsTable + '  Except Select 
						DISTINCT ISNULL(SalesTerritoryGroup, '''')
					From  
						IDDB.dbo.SalesTerritoryGroup'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET SalesTerritoryGroupID=I.SalesTerritoryGroupID FROM 
									' + @lSalesTerritoryGroupsTable + ' CT Join IDDB..SalesTerritoryGroup I ON CT.SalesTerritoryGroup=I.SalesTerritoryGroup ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritoryGroup = Stg.SalesTerritoryGroup, SalesTerritoryGroupID = Stg.SalesTerritoryGroupID,'
				SET @lSql = @lSql + 'StgUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.advertiser = Ast.advertiser AND Cwm.Market = Ast.Market '
				SET @lSql = @lSql + 'INNER JOIN ' + @lSalesTerritoryGroupsTable + ' Stg '
				SET @lSql = @lSql + 'ON Ast.SalesTerritory = Stg.SalesTerritory '
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StgUpdatedOn IS NULL'
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritoryGroup Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritoryGroup Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			IF @lUpdateSalesTerritorySubGroup = 1 AND @lAdvertiserSalesTerritoryTable <> '' AND @lSalesTerritoryGroupsTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lSalesTerritoryGroupsTable + ' Add SalesTerritorySubGroupID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
					
					SET @lSql = 'INSERT INTO 
						IDDB.dbo.SalesTerritorySubGroup (SalesTerritorySubGroup) 
					Select 
						DISTINCT ISNULL(SalesTerritorySubGroup, '''')
					From ' + @lSalesTerritoryGroupsTable + '  Except Select 
						DISTINCT ISNULL(SalesTerritorySubGroup, '''')
					From  
						IDDB.dbo.SalesTerritorySubGroup'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET SalesTerritorySubGroupID=I.SalesTerritorySubGroupID FROM 
									' + @lSalesTerritoryGroupsTable + ' CT Join IDDB..SalesTerritorySubGroup I ON CT.SalesTerritorySubGroup=I.SalesTerritorySubGroup ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritorySubGroup = Stg.SalesTerritorySubGroup, SalesTerritorySubGroupID = Stg.SalesTerritorySubGroupID,'
				SET @lSql = @lSql + 'StsgUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.advertiser = Ast.advertiser AND Cwm.Market = Ast.Market '
				SET @lSql = @lSql + 'INNER JOIN ' + @lSalesTerritoryGroupsTable + ' Stg '
				SET @lSql = @lSql + 'ON Ast.SalesTerritory = Stg.SalesTerritory '
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StsgUpdatedOn IS NULL'
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritorySubGroup Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritorySubGroup Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
		END
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup ','End CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup', GETDATE()
		--END : Update SalesTerritory, SalesTerritoryGroup,SalesTerritorySubGroup
		--##############################################################################################################################
		IF @pDebugRun = 0
		BEGIN
			--BEGIN TRANSACTION
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'CWM Complete Time',GETDATE(),'')
			--COMMIT
		END
	END
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End CWm Update ','End CWM Update', GETDATE()
	---**************************************CWM UPDATE****************************************************************************
	--END : Update CWM Fields.
	
	--START : Update PDT Fields.
	---************************************** PDT UPDATE ****************************************************************************
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Batch Update ','Batch Update', GETDATE()
	IF @pCWMPDT = 1
	BEGIN
		IF @pDebugRun = 1
			PRINT ''
		
		IF @pDebugRun = 0 
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'PDT Start Time',GETDATE(),'')
		IF @lPdtTable = ''
		BEGIN
			SET @lErrorDes = 'PageDetailTable not present in TableNames.'
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
			ELSE
			BEGIN
				PRINT '--Error : ' + @lErrorDes
				PRINT ''
			END
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT Name FROM SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lPdtTable,1))
			BEGIN
				SET @lErrorDes = 'Invalid object name ' + @lPdtTable
				IF @pDebugRun = 0 
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lPdtTable = ''
			END
		END
		--START : Update Manufacturer.
		--##############################################################################################################################
		IF @lUpdateManufacturer = 1 AND @lPdtTable <> ''
		BEGIN	
			IF @lManufacturerTable <> ''
			BEGIN
					SET @lSql = 'Alter Table ' + @lManufacturerTable + ' Add ManufacturerID Int ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
					

					--SET @lSql = 'CREATE INDEX IDX_Manufacturer ON ' + @lManufacturerTable + '(Manufacturer) INCLUDE (ManufacturerID)'
					--IF @pDebugRun=0
					--  BEGIN
					--	exec @lSql
					--  END
					--ELSE
					-- BEGIN
					--	Print @lSql
					--  END

					SET @lSql = 'INSERT INTO 
						IDDB.dbo.Manufacturer (Manufacturer) 
					Select 
						DISTINCT ISNULL(Manufacturer, '''')
					From ' + @lManufacturerTable + '  Except Select 
						DISTINCT ISNULL(Manufacturer, '''')
					From  
						IDDB.dbo.Manufacturer'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET ManufacturerID=I.ManufacturerID FROM 
									' + @lManufacturerTable + ' CT Join IDDB..Manufacturer I ON CT.Manufacturer=I.Manufacturer ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				SET @lSql = 'UPDATE ' + @lPdtTable + ' SET Manufacturer = Mfr.Manufacturer, ManufacturerID = Mfr.ManufacturerID,'
				SET @lSql = @lSql + 'MfrUpdatedOn = GETDATE() FROM ' + @lManufacturerTable + ' Mfr '
				SET @lSql = @lSql + 'INNER JOIN ' + @lPdtTable + ' Pdt '
				SET @lSql = @lSql + ' ON Mfr.Category = Pdt.Category AND Mfr.Brand = Pdt.Brand'
	
				--IF @lPDTFull = 0 --Only New Records
				--	SET @lSql = @lSql + ' WHERE Pdt.MfrUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Manufacturer Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Manufacturer Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
		END		
		--END : Update Manufacturer.
		--START : Update ParentCompany.
		--##############################################################################################################################
		
		print @lUpdateParentCompany
		print @lPdtTable
		IF @lUpdateParentCompany = 1 AND @lPdtTable <> ''
		BEGIN 		
			--PRINT GETDATE()	
				
			IF @lParentCompanyTable <> ''
			BEGIN
				--Add ParentCompany Column To PDT Table.
				
				

				--Create Index.
				SET @lSql = 'CREATE CLUSTERED INDEX Tmp_' + PARSENAME(@lParentCompanyTable,1) + ' ON ' + @lParentCompanyTable + '(Category,Brand)'	
				IF @pDebugRun = 0
				BEGIN
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Create Index Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Create Index',GETDATE(),@lSql)
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END


				--Update 
					SET @lSql = 'Alter Table ' + @lParentCompanyTable + ' Add ParentCompanyID Int NOT NULL DEFAULT(0)' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)
					
					SET @lSql = 'INSERT INTO 
						IDDB.dbo.ParentCompany (ParentCompany) 
					Select 
						DISTINCT ISNULL(ParentCompany, '''')
					From ' + @lParentCompanyTable + '  Except Select 
						DISTINCT ISNULL(ParentCompany, '''')
					From  
						IDDB.dbo.ParentCompany'
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

					SET @lSql = 'Update  CT SET ParentCompanyID=I.ParentCompanyID FROM 
									' + @lParentCompanyTable + ' CT Join IDDB..ParentCompany I ON CT.ParentCompany=I.ParentCompany ' 
					IF @pDebugRun = 1 
						PRINT @lSql
					ELSE
						Exec(@lSql)

				SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ParentCompany = T.ParentCompany,ParentCompanyID = T.ParentCompanyID
						FROM ' + @lPdtTable + ' P JOIN ' + @lParentCompanyTable + ' T 
						ON P.Category = T.Category AND P.Brand = T.Brand OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			--PRINT GETDATE()
		END
		--END : Update ParentCompany.
		--##############################################################################################################################
		--START : Update ProductTerritory, ProductTerritoryGroup, ProductTerritorySubGroup.
		--##############################################################################################################################
		Print '@lUpdateProductTerritory = '+ Cast(@lUpdateProductTerritory as Varchar(2))
		Print '@lUpdateProductTerritoryGroup = '+ Cast(@lUpdateProductTerritoryGroup as Varchar(2))
		Print '@lUpdateProductTerritorySubGroup = '+ Cast(@lUpdateProductTerritorySubGroup as Varchar(2))
		Print '@lPdtTable = '+ @lPdtTable
		Print '@lProductTerritoryTable = '+ @lProductTerritoryTable
		-- Changes is done for #24966	
		--IF EXISTS (SELECT * FROM MT2SQL14.SiteControl.dbo.TableNames WHERE TableID=24 and ClientTableName LIKE '%VarietyProductTerritory%' AND CategoryCodeID IN
		--			(SELECT ID FROM CategoryCodeTable Where Category= @pCategoryCode)) 
		--IF EXISTS (SELECT TOP 1 * FROM tempdb.information_schema.columns where table_name =@lProductTerritoryTable  and column_name = 'Variety')
		IF EXISTS (select top 1 * from tempdb.information_schema.columns where table_name = replace(@lProductTerritoryTable,'TEMPDB..','') and column_name = 'Variety')
			BEGIN 
				--select * from MT2SQL14.SiteControl.dbo.albProductTerritory
				--Select * from MT2SQL14.SiteControl.dbo.TableNames where CategoryCodeID=2967 and TableID=24
				IF @lUpdateProductTerritory = 1 
					BEGIN
						SET @lSql = 'Alter Table ' + @lProductTerritoryTable + ' Add ProductTerritoryID Int ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						
						SET @lSql = 'INSERT INTO 
							IDDB.dbo.ProductTerritory (ProductTerritory) 
						Select 
							DISTINCT ISNULL(ProductTerritory, '''')
						From ' + @lProductTerritoryTable + '  Except Select 
							DISTINCT ISNULL(ProductTerritory, '''')
						From  
							IDDB.dbo.ProductTerritory'
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)


						SET @lSql = 'Update  CT SET ProductTerritoryID=I.ProductTerritoryID FROM 
										' + @lProductTerritoryTable + ' CT Join IDDB..ProductTerritory I ON CT.ProductTerritory=I.ProductTerritory ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritory = PT.Productterritory, PDT.ProductTerritoryID = PT.ProductterritoryID, 
							PtUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety 
						WHERE 
							F.RID = 1
						OPTION (MAXDOP 1)'
			
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
				
				IF @lUpdateProductTerritoryGroup = 1 
					BEGIN
						SET @lSql = 'Alter Table ' + @lProductTerritoryTable + ' Add ProductTerritoryGroupID Int ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)
						
						SET @lSql = 'INSERT INTO 
							IDDB.dbo.ProductTerritoryGroup (ProductTerritoryGroup) 
						Select 
							DISTINCT ISNULL(ProductTerritoryGroup, '''')
						From ' + @lProductTerritoryTable + '  Except Select 
							DISTINCT ISNULL(ProductTerritoryGroup, '''')
						From  
							IDDB.dbo.ProductTerritoryGroup'
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)
						
						SET @lSql = 'Update  CT SET ProductTerritoryGroupID=I.ProductTerritoryGroupID FROM 
										' + @lProductTerritoryTable + ' CT Join IDDB..ProductTerritoryGroup I ON CT.ProductTerritoryGroup=I.ProductTerritoryGroup ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritoryGroup = PT.ProductTerritoryGroup, PDT.ProductTerritoryGroupID = PT.ProductTerritoryGroupID, 
							PtgUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety
						WHERE 
							F.RID = 1							 
						OPTION (MAXDOP 1)'
						
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
				
					END
				
				IF @lUpdateProductTerritorySubGroup = 1 
					BEGIN
						SET @lSql = 'Alter Table ' + @lProductTerritoryTable + ' Add ProductTerritorySubGroupID Int ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'INSERT INTO 
							IDDB.dbo.ProductTerritorySubGroup (ProductTerritorySubGroup) 
						Select 
							DISTINCT ISNULL(ProductTerritorySubGroup, '''')
						From ' + @lProductTerritoryTable + '  Except Select 
							DISTINCT ISNULL(ProductTerritorySubGroup, '''')
						From  
							IDDB.dbo.ProductTerritorySubGroup'
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'Update  CT SET ProductTerritorySubGroupID=I.ProductTerritorySubGroupID FROM 
										' + @lProductTerritoryTable + ' CT Join IDDB..ProductTerritorySubGroup I ON CT.ProductTerritorySubGroup=I.ProductTerritorySubGroup ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritorySubGroup = PT.ProductTerritorySubGroup, PDT.ProductTerritorySubGroupID = PT.ProductTerritorySubGroupID, 
							PtsgUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety 
						WHERE 
							F.RID = 1							
						OPTION (MAXDOP 1)'
						
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END					
					END			
			END
		ELSE
			BEGIN
				IF (@lUpdateProductTerritory = 1 OR @lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1) AND @lPdtTable <> ''
				BEGIN
					IF @lPDTFull = 0 --Only New Records
						SET @fullclause = 'Pdt.PtUpdatedOn IS NULL'
					ELSE
						SET @fullclause = ''
					--START : Update "ProductTerritory"				
					IF @lUpdateProductTerritory = 1 AND @lProductTerritoryTable <> ''
					BEGIN
						IF EXISTS (select top 1 * from tempdb.information_schema.columns where table_name = replace(@lProductTerritoryTable,'TEMPDB..','') and column_name = 'ExactMatch')
						BEGIN
							print '--Doing BrandGroup update'
							set @lsql = 'if object_id(''tempdb.dbo.#pdtupdates'') is not null'+@crlf+
									   '	drop table #pdtupdates'+@crlf+
									   'create table #pdtupdates ('+@crlf+
									   '	pagedetailid varchar(50),'+@crlf+
									   '	brand varchar(255),'+@crlf+
									   '	category varchar(255),'+@crlf+
									   '	productterritory varchar(255),'+@crlf+
									   '	brandExactMatch tinyint default(0),'+@crlf+
									   '	brandMatch tinyint default(0),'+@crlf+
									   '	storeBrand tinyint default(0)'+@crlf+
									   ')'+@crlf+
									   '-- update brands that match exactly'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, brandExactMatch)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgcb.productterritory,1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgcb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgcb.category = pdt.category and bgcb.brand = pdt.brand'+@crlf+
									   'where bgcb.ExactMatch = 1'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update brands that match wildcard'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, brandMatch)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgcb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgcb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgcb.category = pdt.category and pdt.brand like bgcb.brand+''%'''+@crlf+
									   'where bgcb.ExactMatch = 0'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update store brands that match exactly'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, storeBrand)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgsb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgsb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgsb.brand = pdt.brand'+@crlf+
									   'where bgsb.category is null'+@crlf+
									   'and bgsb.ExactMatch = 1'+@crlf+
										 'and not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update store brands that match wildcard'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, storeBrand)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgsb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgsb'+@crlf+
									   'join '+@lPdtTable+' pdt on pdt.brand like bgsb.brand+''%'''+@crlf+
									   'where bgsb.category is null'+@crlf+
									   'and bgsb.ExactMatch = 0'+@crlf+
										 'and not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update Others'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, ''Other'''+@crlf+
									   'from '+@lPdtTable+' pdt'+@crlf+
									   'where not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   'if exists (select pagedetailid, count(distinct productterritory) from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1)'+@crlf+
									   'begin'+@crlf+
									   '	if object_id(''tempdb.dbo.##multiplematches'') is not null'+@crlf+
									   '		drop table ##multiplematches'+@crlf+
									   '	select pu.pagedetailid, pu.brand, pu.category, pu.productterritory, pu.brandExactMatch, pu.brandMatch, pu.storeBrand'+@crlf+
									   '	into ##multiplematches'+@crlf+
									   '	from #pdtupdates pu'+@crlf+
									   '	join (select pagedetailid, count(distinct productterritory) as bgcount from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1) d on pu.pagedetailid = d.pagedetailid'+@crlf+
									   '	if object_id(''tempdb.dbo.#keepers'') is not null'+@crlf+
									   '		drop table #keepers'+@crlf+
									   '	select pagedetailid, min(productterritory) as productterritory'+@crlf+
									   '	into #keepers'+@crlf+
									   '	from ##multiplematches'+@crlf+
									   '	group by pagedetailid'+@crlf+
									   '	delete pu'+@crlf+
									   '	from #pdtupdates pu'+@crlf+
									   '	join (select pagedetailid, count(distinct productterritory) as bgcount from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1) d on pu.pagedetailid = d.pagedetailid'+@crlf+
									   '	where not exists (select top 1 * from #keepers k where pu.pagedetailid = k.pagedetailid and pu.productterritory = k.productterritory)'+@crlf
									   if @pCategoryCode in ('prdcan','prdcnen','prdcan50','prdcnen50')
									   begin
											set @lSQL = @lSQL + '	exec master.dbo.mt_proc_send_cdosysmail @from=''sql@markettrack.com'','+@crlf+
									   '		@to=''halapati@markettrack.com;eabando@markettrack.com;bsingh@markettrack.com;ztarapore@markettrack.com'','+@crlf+
									   '		@cc='''','+@crlf+
									   '		@subject=''Dupe Brand Group found in '+@pCategoryCode+''','+@crlf+
									   '		@query=''select distinct brand, category, productterritory, brandExactMatch, brandMatch, storeBrand'+@crlf+
									   'from ##multiplematches'+@crlf+
									   'order by brand'','+@crlf+
									   '		@queryoutput=''attachment'','+@crlf+
									   '		@queryattachmentname='''+@pCategoryCode+' Dupe Brand Group.xls'''+@crlf
									   end
									   set @lSQL = @lSQL + 'end'+@crlf+
									   '-- do the update'+@crlf+
									   'update pdt'+@crlf+
									   'set pdt.ProductTerritory = bg.productterritory, pdt.PtUpdatedOn = GETDATE()'+@crlf+
									   'from '+@lPdtTable+' pdt'+@crlf+
									   'join #pdtupdates bg on pdt.pagedetailid = bg.pagedetailid' + @crlf + 
									   case when @fullclause <> '' then 'where ' + @fullclause + @crlf else '' end + 
									   'option (maxdop 1)'
							IF @pDebugRun = 0
							BEGIN
								--BEGIN TRANSACTION
								EXEC(@lSql)
								IF @@ERROR <> 0
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
								ELSE
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
								--COMMIT
							END
							ELSE
							BEGIN
								PRINT @lSql			
								PRINT 'Go'
								PRINT CHAR(13)
							END
						END
						ELSE
						BEGIN
							SET @lSql = 'Alter Table ' + @lProductTerritoryTable + ' Add ProductTerritoryID Int ' 
							IF @pDebugRun = 1 
								PRINT @lSql
							ELSE
								Exec(@lSql)


							
							SET @lSql = 'INSERT INTO 
								IDDB.dbo.ProductTerritory (ProductTerritory) 
							Select 
								DISTINCT ISNULL(ProductTerritory, '''')
							From ' + @lProductTerritoryTable + '  Except Select 
								DISTINCT ISNULL(ProductTerritory, '''')
							From  
								IDDB.dbo.ProductTerritory'
							IF @pDebugRun = 1 
								PRINT @lSql
							ELSE
								Exec(@lSql)

							SET @lSql = 'Update  CT SET ProductTerritoryID=I.ProductTerritoryID FROM 
											' + @lProductTerritoryTable + ' CT Join IDDB..ProductTerritory I ON CT.ProductTerritory=I.ProductTerritory ' 
							IF @pDebugRun = 1 
								PRINT @lSql
							ELSE
								Exec(@lSql)

							print 'doing simple product territory update'
							SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritory = Pt.ProductTerritory, ProductTerritoryID = Pt.ProductTerritoryID, '
							SET @lSql = @lSql + 'PtUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
							SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
							SET @lSql = @lSql + ' ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand'
							IF @lPDTFull = 0 --Only New Records
								SET @lSql = @lSql + ' WHERE Pdt.PtUpdatedOn IS NULL'
							SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				
							IF @pDebugRun = 0
							BEGIN
								--BEGIN TRANSACTION
								EXEC(@lSql)
								IF @@ERROR <> 0
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
								ELSE
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
								--COMMIT
							END
							ELSE
							BEGIN
								PRINT @lSql			
								PRINT 'Go'
								PRINT CHAR(13)
							END
						END
					END
					--END : Update "ProductTerritory"
					--START : Update "ProductTerritoryGroup"				
					IF @lUpdateProductTerritoryGroup = 1 AND @lProductTerritoryTable <> '' AND @lProductTerritoryGroupsTable <> ''
					BEGIN
						SET @lSql = 'Alter Table ' + @lProductTerritoryGroupsTable + ' Add ProductTerritoryGroupID Int ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)


						SET @lSql = 'INSERT INTO 
							IDDB.dbo.ProductTerritoryGroup (ProductTerritoryGroup) 
						Select 
							DISTINCT ISNULL(ProductTerritoryGroup, '''')
						From ' + @lProductTerritoryGroupsTable + '  Except Select 
							DISTINCT ISNULL(ProductTerritoryGroup, '''')
						From  
							IDDB.dbo.ProductTerritoryGroup'
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'Update  CT SET ProductTerritoryGroupID=I.ProductTerritoryGroupID FROM 
										' + @lProductTerritoryGroupsTable + ' CT Join IDDB..ProductTerritoryGroup I ON CT.ProductTerritoryGroup=I.ProductTerritoryGroup ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritoryGroup = Ptg.ProductTerritoryGroup, ProductTerritoryGroupID = Ptg.ProductTerritoryGroupID, '
						SET @lSql = @lSql + 'PtgUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
						SET @lSql = @lSql + 'ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryGroupsTable + ' Ptg '
						SET @lSql = @lSql + 'ON Pt.ProductTerritory = Ptg.ProductTerritory '
						IF @lPDTFull = 0 --Only New Records
							SET @lSql = @lSql + ' WHERE Pdt.PtgUpdatedOn IS NULL'
						SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
					--END : Update "ProductTerritoryGroup"
				
					--START : Update "ProductTerritorySubGroup"				
					IF @lUpdateProductTerritorySubGroup = 1 AND @lProductTerritoryTable <> '' AND @lProductTerritoryGroupsTable <> ''
					BEGIN
						SET @lSql = 'Alter Table ' + @lProductTerritoryGroupsTable + ' Add ProductTerritorySubGroupID Int ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)
							
						SET @lSql = 'INSERT INTO 
							IDDB.dbo.ProductTerritorySubGroup (ProductTerritorySubGroup) 
						Select 
							DISTINCT ISNULL(ProductTerritorySubGroup, '''')
						From ' + @lProductTerritoryGroupsTable + '  Except Select 
							DISTINCT ISNULL(ProductTerritorySubGroup, '''')
						From  
							IDDB.dbo.ProductTerritorySubGroup'
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'Update  CT SET ProductTerritorySubGroupID=I.ProductTerritorySubGroupID FROM 
										' + @lProductTerritoryGroupsTable + ' CT Join IDDB..ProductTerritorySubGroup I ON CT.ProductTerritorySubGroup=I.ProductTerritorySubGroup ' 
						IF @pDebugRun = 1 
							PRINT @lSql
						ELSE
							Exec(@lSql)

						SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritorySubGroup = Ptg.ProductTerritorySubGroup, ProductTerritorySubGroupID = Ptg.ProductTerritorySubGroupID, '
						SET @lSql = @lSql + 'PtsgUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
						SET @lSql = @lSql + 'ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryGroupsTable + ' Ptg '
						SET @lSql = @lSql + 'ON Pt.ProductTerritory = Ptg.ProductTerritory '
						IF @lPDTFull = 0 --Only New Records
							SET @lSql = @lSql + ' WHERE Pdt.PtsgUpdatedOn IS NULL'
						SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
					--END : Update "ProductTerritorySubGroup"			
				END
			END				
		--END : Update ProductTerritory.
		--##############################################################################################################################
		IF @pDebugRun = 0
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'PDT Complete Time',GETDATE(),'')
		--ADIVEW2CONTROL CHANGES
		IF @lManufacturerTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lManufacturerTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lManufacturerTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lParentCompanyTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lParentCompanyTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lParentCompanyTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lProductTerritoryTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lProductTerritoryTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lProductTerritoryTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lProductTerritoryGroupsTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lProductTerritoryGroupsTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lProductTerritoryGroupsTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		--ADIVEW2CONTROL CHANGES
	END
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End Batch Update ','End Batch Update', GETDATE()
	---************************************** PDT UPDATE ****************************************************************************
	--START : Update PDT Fields.
	
	IF @pDebugRun = 0
		INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Complete Time',GETDATE(),'')
		
	PRINT '-- END BatchUpdate SP : ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Batch Update Completed ','Batch Update Completed', GETDATE()
END




GO

/****** Object:  StoredProcedure [dbo].[ConcatUpdates]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create  Procedure [dbo].[ConcatUpdates]

@PDT varchar(100),
@MPV varchar(100),
@MC varchar(100),
@IsConcat Integer,
@IsDebug as bit=0 --Values : "0 = Run / 1 = Print".
As

--Run from data database
--Set @PDT = 'scjPageDetailTable'
--Set @mpv = 'scjMultiplePageValues'
--Set @mc = 'scjMerchandiseCategory'
--Set @IsConcat = 1

Begin

	declare @MPVTempTableName varchar(255)
	declare @SQL varchar(8000)
	declare @FSQL varchar(8000)
	declare @NSQL NVarchar(2000)
	declare @tempmaxsql as varchar(8000)
	declare @tempcasesql as varchar(8000)
	declare @maxmpvcount as integer
	declare @counter as integer
	declare @type varchar(50)
	declare @WhereClause varchar(8000)
	set @type = ''

	if @IsConcat = 1
		set @type = ' and type in(1,3,5) '
	else if @IsConcat = 3
		set @type = ' and type in(3,5) '
	else if @IsConcat = 4
		set @type = ' and type in(4,5) '
	else if @IsConcat = 5 or @IsConcat = 2
		set @type = ' and type = 5 '

	Set @MPVTempTableName = 'tempmpv'

	declare @mpvtemp1 varchar(100)

	set @mpvtemp1 = 'mpv1temp'

	if exists (select * from tempdb..sysobjects where id = object_id('[tempdb]..['+ @MPVTempTableName +']'))
		exec('drop table [tempdb].[dbo].['+ @MPVTempTableName +']')
	
	--Set @Sql = 'Select PageDetailId, MultipleValues, Variety Into tempdb..[' + @MPVTempTableName + '] 
	--	From ' + @PDT + ' WHERE Category IN(select distinct mc.category from ' + @MC + ' mc, ConcatItemDescription cid where mc.realcategory=cid.category ' + @type + ') 
	--	AND (IsNull(origin, '''') <> '''' or IsNull(Variety, '''') <> '''' '

	Set @WhereClause='IsNull(MPVOrigin, '''') <> '''' or IsNull(MPVVariety, '''') <> '''''

	Set @Sql = ';With Tbl
		AS
		(
		Select Row_Number() over (Partition By PDT.PageDetailId Order By MPV.PageDetailId) as RowNo,PDT.PageDetailID,MPV.Variety
		From '+ @PDT +' PDT Join '+ @MPV +' MPV on PDT.PageDetailId=MPV.PageDetailId
		WHERE Category IN(select distinct mc.category from ' + @MC + ' mc, ConcatItemDescription cid where mc.realcategory=cid.category  ' + @type + ') 
		AND ('+@WhereClause+' )
		)
		Select PageDetailId,Variety
		Into tempdb.dbo.[' + @MPVTempTableName + '] 
		from Tbl
		Where RoWNo=1'

	if @IsConcat = 1 or @IsConcat = 3
		Set @WhereClause = @WhereClause + ' or IsNull(MPVUnitType, '''') <> '''''
	if @IsConcat = 1
		Set @WhereClause = @WhereClause + ' or PkgSize is not null '	
	
	
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
		exec(' alter table [tempdb].[dbo].['+ @MPVTempTableName +']  alter column Variety varchar(7000)')
	  END
	ELSE
	  BEGIN
		PRINT @SQL
		Print(' alter table [tempdb].[dbo].['+ @MPVTempTableName +']  alter column Variety varchar(7000)')
	  END
	 
    IF Cursor_Status('variable', 'MPVFieldValuesUpdate') >= 0
		begin
			Close MPVFieldValuesUpdate
            Deallocate MPVFieldValuesUpdate
        End

	set @SQL = 'Create table tempdb..[' + @MPVTemp1 + '](PageDetailID BigInt, FieldValue varchar(7000), pos integer identity)'--VV1
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END
	
	--set @SQL = 'Insert Into Tempdb..[' + @MPVTemp1 + '] (pagedetailid, fieldvalue)
	--	select MPV.PageDetailIDInt, IsNull(MPV.FieldValue, '''') as FieldValue from '+ @MPV +' mpv, [tempdb].[dbo].['+ @MPVTempTableName +'] pdt where
	--	pdt.pagedetailid = mpv.pagedetailidInt and mpv.FieldName = ''Variety'' ORDER BY mpv.pagedetailidInt, mpv.FieldValue'

	Set @Sql = 'Insert Into Tempdb..[mpv1temp] (pagedetailid, fieldvalue)
		select MPV.PageDetailID, MPV.Variety
		From '+ @MPV +' MPV 
		Join tempdb.dbo.[tempmpv] PDT on PDT.PageDetailId=MPV.PageDetailId AND MPV.Variety<>PDT.Variety'

	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END

	set @SQL = 'Create clustered index idx_tmpMPVMerge on tempdb..[' + @MPVTemp1 + '] (PageDetailID)'

	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END
	--set @sql = 'select top 1 count(pagedetailid) from tempdb..[' + @MPVTemp1 + '] group by pagedetailid order by count(pagedetailid) desc'
        --exec sp_exec_sql_return_numeric @sql, @maxmpvcount output
	
	set @NSQL = 'select top 1 @maxmpvcount = count(pagedetailid) from tempdb..[' + @MPVTemp1 + '] group by pagedetailid order by count(pagedetailid) desc'
	
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @NSQL
		execute sp_executesql @NSQL, N'@maxmpvcount integer OUTPUT', @maxmpvcount OUTPUT
	  END
	ELSE
	  BEGIN
		PRINT @NSQL
	  END

	declare @FieldValue varchar(1000)	

	if @maxmpvcount < -1
	begin
		set @SQL = ''
		set @FieldValue = ''
		Exec('Declare MPVFieldValuesUpdate Cursor for Select distinct FieldValue from tempdb..[' + @MPVTemp1 + '] order by FieldValue')
		open MPVFieldValuesUpdate 
		fetch next from MPVFieldValuesUpdate into @FieldValue 
		while @@fetch_status = 0
		begin
			set @SQL = @SQL + ' Max(Case when MPV.FieldValue = ''' + @FieldValue + ''' then '', ' + @FieldValue + ''' else '''' end) +'
			fetch next from MPVFieldValuesUpdate into @FieldValue 
		end
		Close MPVFieldValuesUpdate
		Deallocate MPVFieldValuesUpdate
	end
	else
	begin
		set @counter = 1
		--set @maxmpvcount = 11
		set @tempmaxsql = ''
		set @tempcasesql = ''
		set @sql = ''
		if @maxmpvcount > 0 
		begin
			while @counter <= @maxmpvcount
			begin
				set @tempmaxsql = @tempmaxsql + 'Max(Case when isnull(col' + cast(@counter as varchar) + ','''') = '''' then '''' else '', '' + col'  + cast(@counter as varchar) +' end) +' + char(13)
				set @tempcasesql = @tempcasesql + ' Case when pos-bpos = ' + cast(@counter-1 as varchar) + ' then fieldvalue else '''' end as Col' + cast(@counter as varchar) + ',' + char(13)
				set @counter = @counter + 1
			end 
			set @tempmaxsql = left(@tempmaxsql,len(@tempmaxsql)-2)
			set @tempcasesql = left(@tempcasesql,len(@tempcasesql)-2)		
			set @sql = 'select PageDetailID,'
			set @sql = @sql + @tempmaxsql
			
			set @sql = @sql + ' as FieldValue from '
			set @sql = @sql + '('
			set @sql = @sql + ' Select PageDetailID,  '
			set @sql = @sql + @tempcasesql
			
			set @sql = @sql + '  from'
			set @sql = @sql + ' ( '
			set @sql = @sql + '	select a.pagedetailid, a.fieldvalue, a.pos, b.pos as BPos from tempdb..[' + @mpvtemp1 + ']  a, '
			set @sql = @sql + '	   ( '
			set @sql = @sql + '		select pagedetailid, min(pos) as pos from tempdb..[' + @mpvtemp1 + '] group by pagedetailid'
			set @sql = @sql + '	   ) b'
			set @sql = @sql + '	where a.pagedetailid = b.pagedetailid '
			set @sql = @sql + ' ) x' 
			set @sql = @sql + ') y '
			set @sql = @sql + ' group by pagedetailid '
		end
	end

	if len(@SQL) > 0
	begin 
		if @maxmpvcount < -1
		begin
			set @SQL = left(@SQL, len(@SQL) - 1)
			set @SQL = 'Select PageDetailID, ' + @SQL + ' As FieldValue From tempdb..[' + @MPVTemp1 + '] MPV group by PageDetailID '
		end
		set @FSQL = '
		update [tempdb].[dbo].['+ @MPVTempTableName +'] set Variety = 
		case when len(isNull(Tmp.FieldValue, '''')) > 2 then right(Tmp.FieldValue, len(Tmp.FieldValue) - 2) else '''' end from [tempdb].[dbo].['+ @MPVTempTableName +'] PDT1 join 
		('+ @SQL +'  )
		Tmp on pdt1.pagedetailid = tmp.pagedetailid '	
		
		--Changes by prakash on 21/06/2013
		IF @IsDebug=0
		  BEGIN
			Print @FSQL--Changed for Print
			Exec (@FSQL)
		  END
		ELSE
		  BEGIN
			PRINT @FSQL
		  END
	end
	--else
	--begin
		--set @FSQL = 'update [tempdb].[dbo].['+ @MPVTempTableName +'] set Variety = 
		--case when len(isNull(Tmp.FieldValue, '''')) > 2 then right(Tmp.FieldValue, len(Tmp.FieldValue) - 2) else '''' end from [tempdb].[dbo].['+ @MPVTempTableName +'] Tmp '
	--end
	set @SQL = 'Drop table tempdb..[' + @MPVTemp1 + ']'
	--Changes by prakash on 21/06/2013
		IF @IsDebug=0
		  BEGIN
			Exec (@SQL)
			PRINT @FSQL
		  END
		ELSE
		  BEGIN
			PRINT @SQL
		  END	

--------------- UnitType Changes --------------

	Declare @MPVUnitTypeTempTableName Varchar(20)= 'tempmpvUnitType'
			,@mpvtemp1UnitType varchar(100) = 'mpv1tempUnitType'

	if exists (select * from tempdb..sysobjects where id = object_id('[tempdb]..['+ @MPVUnitTypeTempTableName +']'))
		exec('drop table [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +']')
	
	--Set @Sql = 'Select PageDetailId, MultipleValues, UnitType Into tempdb..[' + @MPVUnitTypeTempTableName + '] 
	--	From ' + @PDT + ' WHERE Category IN(select distinct mc.category from ' + @MC + ' mc, 
	--			ConcatItemDescription cid where mc.realcategory=cid.category ' + @type + ') 
	--	AND IsNull(UnitType, '''') <> '''' option (maxdop 1)'	
	
	Set @Sql = ';With Tbl
		AS
		(
		Select Row_Number() over (Partition By PDT.PageDetailId Order By MPV.PageDetailId) as RowNo,PDT.PageDetailID,MPV.UnitType
		From ' + @PDT + ' PDT Join ' + replace(@MPV,'Variety','UnitType') + ' MPV on PDT.PageDetailId=MPV.PageDetailId
		WHERE Category IN(select distinct mc.category from ' + @MC + ' mc, ConcatItemDescription cid where mc.realcategory=cid.category  ' + @type + ') 
		AND (IsNull(MPVUnitType, '''') <> '''' )
		)
		Select PageDetailId,UnitType
		Into tempdb.dbo.[' + @MPVUnitTypeTempTableName + '] 
		from Tbl
		Where RoWNo=1'

	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
		exec(' alter table [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +']  alter column UnitType varchar(7000)')
	  END
	ELSE
	  BEGIN
		PRINT @SQL
		Print(' alter table [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +']  alter column UnitType varchar(7000)')
	  END
	 
    IF Cursor_Status('variable', 'MPVFieldValuesUpdate') >= 0
	    begin
        	Close MPVFieldValuesUpdate
            Deallocate MPVFieldValuesUpdate
        End
	set @SQL = 'Create table tempdb..[' + @mpvtemp1UnitType + '](PageDetailID BigInt, FieldValue varchar(7000), pos integer identity)'--VV3
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END

	--set @SQL = 'Insert Into Tempdb..[' + @mpvtemp1UnitType + '] (pagedetailid, fieldvalue)
	--	select MPV.PageDetailIDInt, IsNull(MPV.FieldValue, '''') as FieldValue from '+ @MPV +' mpv, [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +'] pdt
	--	where pdt.pagedetailid = mpv.pagedetailidInt and mpv.FieldName = ''UnitType'' ORDER BY mpv.pagedetailidInt, mpv.FieldValue'--VV4

	Set @Sql = 'Insert Into Tempdb..[' + @mpvtemp1UnitType + '] (pagedetailid, fieldvalue)
		select MPV.PageDetailID, MPV.UnitType
		From ' + replace(@MPV,'Variety','UnitType') + ' MPV 
		Join tempdb.dbo.[' + @MPVUnitTypeTempTableName + ']  PDT on PDT.PageDetailId=MPV.PageDetailId AND MPV.UnitType<>PDT.UnitType'

	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END

	set @SQL = 'Create clustered index idx_tmpMPVMergenitType on tempdb..[' + @mpvtemp1UnitType + '] (PageDetailID)'
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @SQL
		Exec (@Sql)
	  END
	ELSE
	  BEGIN
		PRINT @SQL
	  END

	set @NSQL = 'select top 1 @maxmpvcount = count(pagedetailid) from tempdb..[' + @mpvtemp1UnitType + '] 
	group by pagedetailid order by count(pagedetailid) desc'
	
	--Changes by prakash on 21/06/2013
	IF @IsDebug=0
	  BEGIN
		Print @NSQL
		execute sp_executesql @NSQL, N'@maxmpvcount integer OUTPUT', @maxmpvcount OUTPUT
	  END
	ELSE
	  BEGIN
		PRINT @NSQL
	  END
	SET @FieldValue = ''
	if @maxmpvcount < -1
	begin
		set @SQL = ''
		set @FieldValue = ''
		Exec('Declare MPVFieldValuesUpdate Cursor for Select distinct FieldValue from tempdb..[' + @mpvtemp1UnitType + '] order by FieldValue')
		open MPVFieldValuesUpdate 
		fetch next from MPVFieldValuesUpdate into @FieldValue 
		while @@fetch_status = 0
		begin
			set @SQL = @SQL + ' Max(Case when MPV.FieldValue = ''' + @FieldValue + ''' then '', ' + @FieldValue + ''' else '''' end) +'
			fetch next from MPVFieldValuesUpdate into @FieldValue 
		end
		Close MPVFieldValuesUpdate
		Deallocate MPVFieldValuesUpdate
	end
	else
	begin
		set @counter = 1
		--set @maxmpvcount = 11
		set @tempmaxsql = ''
		set @tempcasesql = ''
		set @sql = ''
		if @maxmpvcount > 0 
		begin
			while @counter <= @maxmpvcount
			begin
				set @tempmaxsql = @tempmaxsql + 'Max(Case when isnull(col' + cast(@counter as varchar) + ','''') = '''' then '''' else '', '' + col'  + cast(@counter as varchar) +' end) +' + char(13)
				set @tempcasesql = @tempcasesql + ' Case when pos-bpos = ' + cast(@counter-1 as varchar) + ' then fieldvalue else '''' end as Col' + cast(@counter as varchar) + ',' + char(13)
				set @counter = @counter + 1
			end 
			set @tempmaxsql = left(@tempmaxsql,len(@tempmaxsql)-2)
			set @tempcasesql = left(@tempcasesql,len(@tempcasesql)-2)		
			set @sql = 'select PageDetailID,'
			set @sql = @sql + @tempmaxsql
			
			set @sql = @sql + ' as FieldValue from '
			set @sql = @sql + '('
			set @sql = @sql + ' Select PageDetailID,  '
			set @sql = @sql + @tempcasesql
			
			set @sql = @sql + '  from'
			set @sql = @sql + ' ( '
			set @sql = @sql + '	select a.pagedetailid, a.fieldvalue, a.pos, b.pos as BPos from tempdb..[' + @mpvtemp1UnitType + ']  a, '
			set @sql = @sql + '	   ( '
			set @sql = @sql + '		select pagedetailid, min(pos) as pos from tempdb..[' + @mpvtemp1UnitType + '] group by pagedetailid'
			set @sql = @sql + '	   ) b'
			set @sql = @sql + '	where a.pagedetailid = b.pagedetailid '
			set @sql = @sql + ' ) x' 
			set @sql = @sql + ') y '
			set @sql = @sql + ' group by pagedetailid '
		end
	end
	if len(@SQL) > 0
	begin 
		if @maxmpvcount < -1
		begin
			set @SQL = left(@SQL, len(@SQL) - 1)
			set @SQL = 'Select PageDetailID, ' + @SQL + ' As FieldValue From tempdb..[' + @mpvtemp1UnitType + '] MPV group by PageDetailID '
		end
		set @FSQL = '
		UPDATE [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +'] set UnitType = 
		case when len(isNull(Tmp.FieldValue, '''')) > 2 then right(Tmp.FieldValue, len(Tmp.FieldValue) - 2) else '''' end from [tempdb].[dbo].['+ @MPVUnitTypeTempTableName +'] PDT1 join 
		('+ @SQL +'  )
		Tmp on pdt1.pagedetailid = tmp.pagedetailid '	
		
		--Changes by prakash on 21/06/2013
		IF @IsDebug=0
		  BEGIN
			Print @FSQL
			Exec (@FSQL)
		  END
		ELSE
		  BEGIN
			PRINT @FSQL
		  END
	end

	set @SQL = 'Drop table tempdb..[' + @mpvtemp1UnitType + ']'
	--Changes by prakash on 21/06/2013
		IF @IsDebug=0
		  BEGIN
			PRINT @FSQL
			Exec (@SQL)
		  END
		ELSE
		  BEGIN
			PRINT @SQL
		  END	

----------UPDATE Comments1 Column -------------
	Set @SQL = ''
--	SELECT pdt.PageDetailId, Type, tmp.Variety as MPVVariety, 
--	replace(isnull(convert(varchar(255),pkgsize), ''),'.00','') pkgsize, 
--	isnull(unittype, '') unittype, isnull(pdt.Variety, '') Variety, 
--	isnull(Origin, '') Origin, isnull(Comments1, '') Comments1,
--	dbo.ConCatString(1, Type, isnull(pdt.Variety, ''), IsNull(tmp.Variety, ''), isnull(Origin, ''), isnull(Comments1, ''), isnull(unittype, ''), replace(isnull(convert(varchar(255),pkgsize), ''),'.00',''))
	Set @SQL = 
				'Update ' + 
					@PDT + ' 
				Set Comments1 = Convert(varchar(255), dbo.ConCatString(' + 
															Cast(@IsConcat As Varchar(1)) + ', 
															Type, 
															isnull(pdt.MPVVariety, ''''), 
															CASE WHEN IsNull(rtrim(tmp.Variety), '''') = isnull(rtrim(pdt.MPVVariety), '''') THEN '''' ELSE IsNull(tmp.Variety, '''') END, 
															isnull(MPVOrigin, ''''), 
															isnull(Comments1, ''''), 
															isnull(pdt.MPVUnittype, ''''), 
															CASE WHEN IsNull(rtrim(tmpUnitType.UnitType), '''') = isnull(rtrim(pdt.MPVUnitType), '''') THEN '''' ELSE IsNull(tmpUnitType.UnitType, '''') END, 
															replace(isnull(convert(varchar(255),pkgsize), ''''),''.00'',''''))) '
	--Set @SQL = @SQL + 
	--			',pkgsize = Case When Type=1 Then null Else pkgsize End, 
	--			variety=null, 
	--			origin=null, 
	--			unittype= Case When Type = 1 Or Type = 3 Then null Else pdt.unittype End '	
	Set @SQL = @SQL + 
				' From ' + @PDT + ' pdt join (Select Distinct mc.category, type From ' + @MC + ' mc, ConcatItemDescription cid where mc.realcategory=cid.category ' + @type + ') a on 
					pdt.category = a.category left outer join tempdb..[' + @MPVTempTableName + '] tmp on 
					pdt.pagedetailid = tmp.pagedetailid left outer join tempdb..[' + @MPVUnitTypeTempTableName + '] tmpUnitType on 
					pdt.pagedetailid = tmpUnitType.pagedetailid 
				where ((IsNull(pdt.MPVOrigin, '''') <> ''''
					or IsNull(pdt.MPVVariety, '''') <> '''')
					or IsNull(pdt.MPVUnitType, '''') <> '''''

	--if @IsConcat = 1 or @IsConcat = 3
	--	Set @SQL = @SQL + ' or IsNull(pdt.UnitType, '''') <> '''''

	if @IsConcat = 1
		Set @SQL = @SQL + ' or PkgSize is not null ' 
	Set @SQL = @SQL + ' ) option (maxdop 1)'	
	
	--Changes by prakash on 21/06/2013
		
		IF @IsDebug=0
		  BEGIN
			Print @SQL
			Exec (@SQL)
		  END
		ELSE
		  BEGIN
			PRINT @SQL
		  END	
	--if exists (select * from tempdb..sysobjects where id = object_id('[tempdb]..['+ @MPVTempTableName +']'))
	--	exec('drop table [tempdb].[dbo].['+ @MPVTempTableName +']')
End














GO

/****** Object:  StoredProcedure [dbo].[CreateMPVFieldsTables]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[CreateMPVFieldsTables]

  @sourcePDTCode as varchar(100),
 @sourceMPVCode as varchar(100),
 @sourceServer as varchar(100),
 @sourceDB as varchar(100),
 @destCode as varchar(100),
 @replaceTable as tinyint,
 @IsMaster as tinyint=1,
 @Isoffer as tinyint=0,
 @BitCatLevelOffer as Bit,
 @IsDebug as bit=0 --Values : "0 = Run / 1 = Print".

AS
BEGIN
PRINT '-- START mt_proc_DataLoad_MPV SP : ' + convert(varchar(100),current_timestamp,20)
DECLARE @tablename VARCHAR(100)
		,@IsInteger Int

	--Temporary Integer Based ID Changes
	
	SELECT 
		@IsInteger = ISNULL(@IsInteger,0)
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @destCode 
					
	--Changes End		

set @tablename = @destCode + 'DetailReports'


If @IsMaster=1
	BEGIN
		--CHANGED BY PRAKASH ON 9/07/2013
		
			
				--IF @IsDebug=0 
				--	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV tables variety for ','CreateMPVTables Variety for ' + @destCode, GETDATE()
				--exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'Variety', @replaceTable,@IsDebug--VV
				--Print @sourcePDTCode
				--Print @sourceMPVCode
				--Print @sourceServer
				--Print @sourceDB
				--Print @destCode
				--Print  'Variety'
				--Print  @replaceTable
				--Print @IsDebug--VV
				
				--/* --Commented by Hiren on 8/22/2012 for #19829
				--INsert into CategoryCodeLog(SQL, QueryTime) Select '--CreateMPVTables PageTheme for ' + @destCode, GETDATE()
				--exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'PageTheme', @replaceTable
				--*/
				IF @IsDebug=0
					INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV tables PageEvent for ','CreateMPVTables PageEvent for ' + @destCode, GETDATE()
				exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'PageEvent', @replaceTable,@IsDebug--VV
				
				IF @IsDebug=0
					INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV tables Origin for ','CreateMPVTables Origin for ' + @destCode, GETDATE()
				exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'Origin', @replaceTable,@IsDebug--VV

				IF @IsDebug=0
					INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV tables Variety for ','CreateMPVTables Variety for ' + @destCode, GETDATE()
				exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'Variety', @replaceTable,@IsDebug--VV

				--IF @IsDebug=0
				--	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV tables UnitType for ','CreateMPVTables UnitType for ' + @destCode, GETDATE()
				--exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'UnitType', @replaceTable,@IsDebug--VV

				/* --Commented by Hiren on 8/22/2012 for #19829
				INsert into CategoryCodeLog(SQL, QueryTime) Select '--mt_proc_DataLoad_DetailReports_MPV_Update PageTheme for ' + @destCode, GETDATE()
				exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'PageTheme'
				*/
				--IF @IsDebug=0
				--	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV Update PageEvent for ','mt_proc_DataLoad_DetailReports_MPV_Update PageEvent for ' + @destCode, GETDATE()
				--exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'PageEvent',@IsDebug
				
				IF @IsDebug=0
					INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV Update Variety for ','mt_proc_DataLoad_DetailReports_MPV_Update Variety for ' + @destCode, GETDATE()
				exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'Variety',@IsDebug
				
				IF @IsDebug=0
					INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV Update Origin for ','mt_proc_DataLoad_DetailReports_MPV_Update Origin for ' + @destCode, GETDATE()
				exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'Origin',@IsDebug
			
				--IF @IsDebug=0
				--	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV Update UnitType for ','mt_proc_DataLoad_DetailReports_MPV_Update UnitType for ' + @destCode, GETDATE()
				--exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'UnitType',@IsDebug		
		
		If @Isoffer=1 --AND @BitCatLevelOffer = 0
			BEGIN
				--CHANGED BY PRAKASH ON 9/07/2013
				
						--IF @IsDebug=0
						--	Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV_Update Offer for ','mt_proc_DataLoad_DetailReports_MPV_Update Offer for ' + @destCode, GETDATE()
						--exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'Offer', @replaceTable,@IsDebug--VV
						IF @IsDebug=0 
							Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV_Update OfferType for ','mt_proc_DataLoad_DetailReports_MPV_Update OfferType for ' + @destCode, GETDATE()
						exec CreateMPVTables @sourcePDTCode, @sourceMPVCode, @sourceServer, @sourceDB, @destCode, 'OfferType', @replaceTable,@IsDebug--VV
						 print 'vvvvv'
						 print @sourcePDTCode
						  print  @sourceMPVCode
						  print @sourceServer
						   print @sourceDB
						    print @destCode
							print  @replaceTable

						--IF @IsDebug=0 
						--	Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV_Update Offer for ','mt_proc_DataLoad_DetailReports_MPV_Update Offer for ' + @destCode, GETDATE()
						--exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'Offer',@IsDebug
						--IF @IsDebug=0 
						--	Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @destCode,'MPV_Update OfferType for ','mt_proc_DataLoad_DetailReports_MPV_Update OfferType for ' + @destCode, GETDATE()
						--exec mt_proc_DataLoad_DetailReports_MPV_Update  @destCode, 'OfferType',@IsDebug
				
						--exec mt_proc_Create_ID_Update @tablename, 'MainOffer',@IsDebug
					
				
			END
	END

PRINT '-- END mt_proc_DataLoad_MPV SP : ' + convert(varchar(100),current_timestamp,20)


END

GO

/****** Object:  StoredProcedure [dbo].[PopulateOfferFields]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[PopulateOfferFields]
	@pvchrCategoryCode VARCHAR(50),
	@pvchrPdtTable VARCHAR(50),
	@pvchrMpvTable VARCHAR(50),
	@pbitisFull BIT,
	@pbitDebug BIT =0
AS
BEGIN
	DECLARE @vchrStartSql VARCHAR(8000), @vchrEndSql VARCHAR(8000), @vchrSql VARCHAR(8000)
	DECLARE @vchrTempPageEventMerge VARCHAR(100), @vchrTempPdtIdPageEvent VARCHAR(100), @vchrTempPdtOfferTable VARCHAR(100)
	DECLARE @vchrPageEventList VARCHAR(8000), @vchrPageEventCase VARCHAR(8000)
	DECLARE @vchrPageEventVal VARCHAR(100)
	DECLARE @vchrAccessLevel VARCHAR(10), @nvchrSql NVARCHAR(4000)
	DECLARE @intCategoryCodeId INT
	DECLARE @bitIsMaster	BIT
	DECLARE @CatMPVOffer varchar(100)
	DECLARE @CatMPVOfferType varchar(100)
	SET @vchrPageEventList = ''
	SET @vchrPageEventCase = ''
	SET @vchrPageEventVal = ''
	SET @bitIsMaster = 0
	SET @pvchrMpvTable=@pvchrCategoryCode+@pvchrMpvTable
	SET @CatMPVOffer=@pvchrCategoryCode+'MPVOffer'
	SET @CatMPVOfferType=@pvchrCategoryCode+'MPVOfferType'
	
	--Define the AccessLevel (Master/Category) for Offer fields
	SET @nvchrSql = 'SELECT @intCategoryCodeId = [ID], @bitIsMaster = IsMaster FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryCode 
				WHERE Category = ''' + @pvchrCategoryCode + ''''
	EXECUTE sp_executesql @nvchrSql, N'@intCategoryCodeId INT OUTPUT, @bitIsMaster BIT OUTPUT', @intCategoryCodeId  OUTPUT, @bitIsMaster OUTPUT
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''OfferControl'') 
				DROP TABLE Tempdb.dbo.OfferControl'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'SELECT * INTO Tempdb.dbo.OfferControl FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControl 
					WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR) 
					  
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Define the AccessLevel (Master/Category) for Offer fields
	--Generate comma seperated pageevent list and pageevent case
	IF CURSOR_STATUS('variable', 'DisplayValue') >= 0
	BEGIN
		CLOSE DisplayValue
		DEALLOCATE DisplayValue
	END
	SET @vchrSql = 'DECLARE DisplayValue CURSOR READ_ONLY FAST_FORWARD FOR 
			SELECT DISTINCT M.PageEvent FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'MasterPromotions M 
			JOIN Tempdb.dbo.OfferControl O ON M.PageEvent = O.PageEvent 
			WHERE O.PageEvent LIKE ''%'' + M.PageEvent + ''%'' ORDER BY M.PageEvent'
	EXEC(@vchrSql)
	OPEN DisplayValue
	FETCH NEXT FROM DisplayValue INTO @vchrPageEventVal
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--print @vchrPageEventVal
		SET @vchrPageEventList = @vchrPageEventList + '''' + @vchrPageEventVal + ''','
		SET @vchrPageEventCase = @vchrPageEventCase + 'MAX(CASE WHEN PageEvent = ''' + @vchrPageEventVal + ''' THEN '', ' + @vchrPageEventVal + ''' ELSE '''' END) + '
		FETCH NEXT FROM DisplayValue INTO @vchrPageEventVal
	END
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
	SET @vchrPageEventList = LEFT(@vchrPageEventList, LEN(@vchrPageEventList) - 1)
	SET @vchrPageEventCase = LEFT(@vchrPageEventCase, LEN(@vchrPageEventCase) - 2)
	--Generate comma seperated pageevent list and pageevent case
	--PDT Process
	
	SET @vchrTempPdtIdPageEvent = @pvchrCategoryCode + 'PdtIdPageEvent'
	SET @vchrTempPageEventMerge = @pvchrCategoryCode + 'PageEventMerge'
	SET @vchrTempPdtOfferTable = @pvchrPdtTable + '_Offer'
	--Step1 : Get distinct PageDetailID, PageEvent from PDT table.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''' + @vchrTempPdtIdPageEvent + ''') 
				DROP TABLE Tempdb.dbo.' + @vchrTempPdtIdPageEvent 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'SELECT PageDetailID, PageEvent INTO Tempdb.dbo.' + @vchrTempPdtIdPageEvent + ' FROM ' + 
			@pvchrPdtTable + ' WHERE PageEvent IN(' + @vchrPageEventList + ') '
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step2 : Get distinct PageDetailID, PageEvent from MPV table.
	SET @vchrSql = 'INSERT INTO Tempdb.dbo.' + @vchrTempPdtIdPageEvent + '
			Select PageDetailId,
			FieldValue AS PageEvent FROM ' + @pvchrMpvTable + ' WHERE FieldName = ''PageEvent'' AND 
			FieldValue IN(' + @vchrPageEventList + ') '--VV1
		If @pvchrMpvTable LIKE '%.%'
			Set @vchrSql = replace(@vchrSql,'Select PageDetailId,','Select PageDetailIdInt,')
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	
	--Step3 : Perform PageEvent Merge On Temp Table.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''' + @vchrTempPageEventMerge + ''') 
				DROP TABLE Tempdb.dbo.' + @vchrTempPageEventMerge 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	
	SET @vchrSql = 'SELECT PageDetailID, ' + @vchrPageEventCase  + ' AS PageEvent 
				INTO Tempdb.dbo.' + @vchrTempPageEventMerge + ' FROM Tempdb.dbo.' + @vchrTempPdtIdPageEvent + '
				GROUP BY PageDetailId '
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step4 : Create Clustered Index on PageEventMerge table.
	SET @vchrSql = 'CREATE CLUSTERED INDEX IDX_' + @vchrTempPageEventMerge + ' ON 
				Tempdb.dbo.' + @vchrTempPageEventMerge + '(PageDetailId)'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step5 : Perform necessary updates on PageEventMerge table.
	SET @vchrSql = 'UPDATE Tempdb.dbo.' + @vchrTempPageEventMerge + ' SET PageEvent = LTRIM(RIGHT(PageEvent,LEN(PageEvent) -1))
				WHERE PageEvent <> '''''
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step6 : Populate Temp PDT table with Offer details
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pvchrCategoryCode,'Start procPopulateOfferFields Populate Temp PDT table with Offer details ','Populate Temp PDT table with Offer details', GETDATE()		

	
		SET @vchrStartSql = 'SELECT P.PageDetailId,O.OfferId,
					ISNULL(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.Offer1, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
					''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
					''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0)),''Under Review'') As Offer, 
					ISNULL(O.OfferType1,''Under Review'') AS OfferType, ISNULL(O.MainOffer,''Under Review'') AS MainOffer,cast( 0 as Int) MainOfferId '
		SET @vchrEndSql = ' INTO ' + @vchrTempPdtOfferTable + ' FROM ' + @pvchrPdtTable + ' P LEFT OUTER JOIN Tempdb.dbo.' + @vchrTempPageEventMerge + ' T 
					ON P.PageDetailId = T.PageDetailId 
					LEFT OUTER JOIN TempDb..OfferControl O ON
					CASE WHEN P.saleprice1 IS NULL THEN 0 ELSE 1 END  = O.saleprice1  And 
					CASE WHEN P.regularprice1 IS NULL THEN 0 ELSE 1 END = O.regularprice1  And 
					CASE WHEN P.norprice IS NULL THEN 0 ELSE 1 END  = O.norprice  And 
					CASE WHEN P.unitprice IS NULL THEN 0 ELSE 1 END = O.unitprice  And 
					CASE WHEN P.requiredquantity IS NULL THEN 0 ELSE 1 END = O.requiredquantity  And 
					CASE WHEN P.couponvaluep1 IS NULL THEN 0 ELSE 1 END = O.couponvaluep1  And 
					CASE WHEN P.couponvalued2 IS NULL THEN 0 ELSE 1 END = O.couponvalued2  And 
					CASE WHEN P.otherdiscountd2 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd2 And 
					CASE WHEN P.otherdiscountd1 IS NULL THEN 0 ELSE 1 END = O.otherdiscountd1  And 
					CASE WHEN P.numberpackage IS NULL THEN 0 ELSE 1 END = O.numberpackage  And 
					CASE WHEN P.lowestdiscountprice IS NULL THEN 0 ELSE 1 END = O.lowestdiscountprice And 
					ISNULL(T.PageEvent,'''') = O.PageEvent'
	
	IF @pbitDebug = 0 
	BEGIN
		EXECUTE(@vchrStartSql + @vchrEndSql)
	END
	ELSE
	BEGIN
		PRINT @vchrStartSql
		PRINT @vchrEndSql
	END

	--Step11 : Create OfferControlDetails in tempdb.
	SET @vchrSql = 'IF EXISTS (SELECT Name FROM Tempdb.dbo.sysobjects WHERE XType = ''U'' AND Name = ''OfferControlDetails'') 
				DROP TABLE Tempdb.dbo.OfferControlDetails'
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--SET @vchrSql = 'SELECT * INTO Tempdb.dbo.OfferControlDetails FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'OfferControlDetails' 
	--Note: "CategoryOfferControl" is used in below check as it is possible that for a categorycode configured
	-- on category may not have any entry in CategoryOfferControlDetails.
	SET @vchrSql = 'SELECT * INTO Tempdb.dbo.OfferControlDetails FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryOfferControlDetails 
					WHERE CategoryCodeId = ' + CAST(@intCategoryCodeId AS VARCHAR)

	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	SET @vchrSql = 'CREATE INDEX IDX_TempOfferControlDetails ON Tempdb.dbo.OfferControlDetails(OfferId)' 
	IF @pbitDebug = 0
		EXECUTE(@vchrSql)
	ELSE
		PRINT @vchrSql + CHAR(10) + ' GO '
	--Step12 : Populate MPV table.
--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pvchrCategoryCode,'Start procPopulateOfferFields --Populate MPV table ','Populate MPV Table', GETDATE()		

	
	
		IF @pbitisFull =1 
			SET @vchrSql = 'SELECT P.PageDetailId, cast( 0 as Int) OfferId,
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.FieldValue, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
				''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
				''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0))
				 As Offer 
				INTO ' + @CatMPVOffer + ' 
				FROM ' + @pvchrPdtTable + ' P JOIN Tempdb.dbo.OfferControlDetails O ON P.OfferId = O.OfferId
				Where O.FieldName = ''Offer'''
		ELSE
			SET @vchrSql = 'Insert Into ' + @CatMPVOffer + ' 
				Select  P.PageDetailId, cast( 0 as Int) OfferId,
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(O.FieldValue, ''<(otherdiscountd1 + otherdiscountd2)>'', (ISNULL(P.otherdiscountd1,0) + ISNULL(P.otherdiscountd2,0))), ''<otherdiscountd1>'', ISNULL(P.otherdiscountd1,0)), ''<otherdiscountd2>'', ISNULL(P.otherdiscountd2,0)),''<SalePrice1>'', ISNULL(P.SalePrice1,0)),
				''<RegularPrice1>'',ISNULL(P.RegularPrice1,0)),''<NorPrice>'',ISNULL(P.NorPrice,0)),''<UnitPrice>'',ISNULL(P.UnitPrice,0)),''<RequiredQuantity>'',ISNULL(P.RequiredQuantity,0)),''<CouponValueP1>'',ISNULL(P.CouponValueP1,0)),
				''<CouponValueD2>'',ISNULL(P.CouponValueD2,0)),''<OtherDiscountD2>'',ISNULL(P.OtherDiscountD2,0)),''<OtherDiscountD1>'',ISNULL(P.OtherDiscountD1,0)),''<NumberPackage>'',ISNULL(P.NumberPackage,0)),''<LowestDiscountPrice>'',ISNULL(P.LowestDiscountPrice,0))
				 As Offer 				
				FROM ' + @pvchrPdtTable + ' P JOIN Tempdb.dbo.OfferControlDetails O ON P.OfferId = O.OfferId
				Where O.FieldName = ''Offer'''

		--IF @pbitDebug = 0
		--EXECUTE(@vchrSql)
		--ELSE
		--	PRINT @vchrSql + CHAR(10) + ' GO '

		--Exec mt_proc_Create_ID_Update @CatMPVOffer, 'Offer',@pbitDebug
		
		IF @pbitisFull =1 
			SET @vchrSql = 'SELECT P.PageDetailId, cast( 0 as Int) OfferTypeId,O.FieldValue As OfferType 
				INTO ' + @CatMPVOfferType + '  
				FROM ' + @pvchrPdtTable + ' P JOIN Tempdb.dbo.OfferControlDetails O ON P.OfferId = O.OfferId
				Where O.FieldName = ''OfferType'''
		ELSE
			SET @vchrSql = 'Insert INTO ' + @CatMPVOfferType + '  
				 SELECT P.PageDetailId, cast( 0 as Int) OfferTypeId,O.FieldValue As OfferType 				
				FROM ' + @pvchrPdtTable + ' P JOIN Tempdb.dbo.OfferControlDetails O ON P.OfferId = O.OfferId
				Where O.FieldName = ''OfferType'''



		IF @pbitDebug = 0
			EXECUTE(@vchrSql)
		ELSE
			PRINT @vchrSql + CHAR(10) + ' GO '

		Exec mt_proc_Create_ID_Update @CatMPVOfferType, 'OfferType',@pbitDebug

		Exec mt_proc_Create_ID_Update @pvchrPdtTable, 'MainOffer',@pbitDebug

		SET @vchrSql = 'Update PDT Set MainOffer=o.MainOffer,MainOfferId=o.MainOfferId
						From '+ @pvchrPdtTable +' PDT
						Join '+@pvchrPdtTable+' o on PDT.PageDetailId=O.PageDetailid'
		IF @pbitDebug = 0
			EXECUTE(@vchrSql)
		ELSE
			PRINT @vchrSql + CHAR(10) + ' GO '


		--IF @pbitDebug=0 
		--	Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pvchrCategoryCode,'MPV_Update Offer for ','mt_proc_DataLoad_DetailReports_MPV_Update Offer for ' + @pvchrCategoryCode, GETDATE()
		--exec mt_proc_DataLoad_DetailReports_MPV_Update  @pvchrCategoryCode, 'Offer',@pbitDebug
		IF @pbitDebug=0 
			Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pvchrCategoryCode,'MPV_Update OfferType for ','mt_proc_DataLoad_DetailReports_MPV_Update OfferType for ' + @pvchrCategoryCode, GETDATE()
		exec mt_proc_DataLoad_DetailReports_MPV_Update  @pvchrCategoryCode, 'OfferType',@pbitDebug
				
		
	
	--EXECUTE procPopulateOfferFields 'scj','scjPageDetailTable','scjMultiplePageValues','scjMultiplePageValues',1
--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pvchrCategoryCode,'End procPopulateOfferFields','End procPopulateOfferFields', GETDATE()		
END












GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DisplayTables_index]    Script Date: 2/25/2019 9:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Hiren,Nishant
-- Create date: 5 jun 2012
-- Description:	To create indexes in display tables
-- =============================================
Create PROCEDURE [dbo].[mt_proc_Create_DisplayTables_index]
 @Code as varchar(20),
 @CWMOnly as tinyint=0,
 @IsOffer as tinyint=0,
 @IsEvent as tinyint=0,
 @IsTheme as TinyiNt=0,
 @IsDebug as bit --Values : "0 = Run / 1 = Print".
AS
BEGIN
	SET NOCOUNT ON;
	Declare @lsql varchar(max)=''
	--Index for AdvertiserMaerket
	SET @lSQL = N'
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisAMBasic'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisAdvertiserMarket]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisAdvertiserMarket''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisAMBasic] ON [dbo].[' + @code + 'DisAdvertiserMarket]([AdvertiserId], [Advertiser], [MarketId], [Market], [RetMktId]) ON [PRIMARY]

		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisAMGroup'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisAdvertiserMarket]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisAdvertiserMarket''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisAMGroup] ON [dbo].[' + @code + 'DisAdvertiserMarket]([TradeclassId], [Tradeclass], [regionId], [Region], [DistrictId], [District], [CountryId], [Country], [SalesTerritory], [SalesTerritoryId]) ON [PRIMARY]
		
		If Not Exists(SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisAMRetMktID'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisAdvertiserMarket]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisAdvertiserMarket''  and Type=''u'')
			CREATE NONCLUSTERED INDEX [idx_' + @code + 'DisAMRetMktID] ON [dbo].[' + @code + 'DisAdvertiserMarket]([RetMktId] ASC) ON [PRIMARY]
		'
	Print '-- start mt_proc_Create_DisplayTables_index SPs ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/11/2013
	INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Code,'Start to create indexes on Display table ','Start to create indexes on Display table ', GETDATE()
	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	
	
	--Index for DateRange
	SET @lSQL = N'
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisDateRanges'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisDateRanges]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisDateRanges''  and Type=''u'')
			CREATE  INDEX [idx_' + @Code + 'DisDateRanges] ON [dbo].[' + @Code + 'DisDateRanges]([AdDate]) ON [PRIMARY]

		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisWeekOfs'' and id = object_id(N''[dbo].[' + @Code + 'DisDateRanges]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisDateRanges''  and Type=''u'')
			CREATE  INDEX [idx_' + @Code + 'DisWeekOfs] ON [dbo].[' + @Code + 'DisDateRanges]([WeekOf], [WeekOfi], [WeekOfn]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisAdMonth'' and id = object_id(N''[dbo].[' + @Code + 'DisDateRanges]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisDateRanges''  and Type=''u'')
			CREATE  INDEX [idx_' + @Code + 'DisAdMonth] ON [dbo].[' + @Code + 'DisDateRanges]([AdMonthId]) INCLUDE ([AdMonth]) ON [PRIMARY]
		'
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--Index For Media
	
	SET @lSQL = N'
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisMedia'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisMedia]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisMedia''  and Type=''u'')
			CREATE  INDEX [idx_' + @Code + 'DisMedia] ON [dbo].[' + @Code + 'DisMedia]([MediaID]) INCLUDE ([Media]) ON [PRIMARY]
		 '
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	--index for publication
	
	SET @lSQL = N'
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisPublication'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisPublication]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisPublication''  and Type=''u'')
			CREATE  INDEX [idx_' + @Code + 'DisPublication] ON [dbo].[' + @Code + 'DisPublication]([PublicationID]) INCLUDE ([Publication]) ON [PRIMARY]
		 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	--index for event
	If @IsEvent=1
	Begin
		SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisEvent'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisEvent]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisEvent''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisEvent] ON [dbo].[' + @Code + 'DisEvent]([EventID]) INCLUDE ([Event]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	END

	--index for theme
		
	If @IsTheme=1
	Begin
		SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisTheme'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisTheme]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisTheme''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisTheme] ON [dbo].[' + @Code + 'DisTheme]([ThemeID]) INCLUDE ([Theme]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	END
	
	
	if @CWMOnly=0 --Dis tables from PDT Table
	BEGIN
	
	--index for Feature 
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisFeatures'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisFeatures]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisFeatures''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisFeatures] ON [dbo].[' + @Code + 'DisFeatures]([FeaturesID]) INCLUDE ([Features]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for PageEvent
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisPageEvent'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisPageEvent]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisPageEvent''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisPageEvent] ON [dbo].[' + @Code + 'DisPageEvent]([PageEventID]) INCLUDE ([PageEvent]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for Variety
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisVariety'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisVariety]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisVariety''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisVariety] ON [dbo].[' + @Code + 'DisVariety]([VarietyID]) INCLUDE ([Variety]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for Origin
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisOrigin'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisOrigin]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisOrigin''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisOrigin] ON [dbo].[' + @Code + 'DisOrigin]([OriginID]) INCLUDE ([Origin]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for PageTheme
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisPageTheme'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisPageTheme]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisPageTheme''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisPageTheme] ON [dbo].[' + @Code + 'DisPageTheme]([PageThemeID]) INCLUDE ([PageTheme]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	IF @IsOffer = 1
	BEGIN
	--index for DisOffer
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisOffer'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisOffer]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisOffer''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisOffer] ON [dbo].[' + @Code + 'DisOffer]([OfferID]) INCLUDE ([Offer]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for DisOfferType
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisOfferType'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisOfferType]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisOfferType''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisOfferType] ON [dbo].[' + @Code + 'DisOfferType]([OfferTypeID]) INCLUDE ([OfferType]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for DisMainOffer
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisMainOffer'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisMainOffer]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisMainOffer''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisMainOffer] ON [dbo].[' + @Code + 'DisMainOffer]([MainOfferID]) INCLUDE ([MainOffer]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	END

	--index for QP
	SET @lSQL = N'
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisQPBrand'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisQueryPage''  and Type=''u'')
			CREATE  CLUSTERED  INDEX [idx_' + @code + 'DisQPBrand] ON [dbo].[' + @code + 'DisQueryPage]([BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisQPCategory'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisQPCategory] ON [dbo].[' + @code + 'DisQueryPage]([CategoryID], [Category], [BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisQPCatBraMfrMSC'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisQPCatBraMfrMSC] ON [dbo].[' + @code + 'DisQueryPage]([CategoryID], [Category], [ManufacturerID], [Manufacturer], [BrandID], [Brand], [MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisQPBraMfrParent'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisQPBraMfrParent] ON [dbo].[' + @code + 'DisQueryPage]([MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory], [ManufacturerID], [Manufacturer], [BrandID], [Brand]) ON [PRIMARY]
		
		IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @code + 'DisQPConsolidated'' AND ID = OBJECT_ID(N''[dbo].[' + @code + 'DisQueryPage]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisQueryPage''  and Type=''u'')
			CREATE  INDEX [idx_' + @code + 'DisQPConsolidated] ON [dbo].[' + @code + 'DisQueryPage]([BrandID], [Brand], [ManufacturerID], [Manufacturer], [CategoryID], [Category], [MerchandiseSubCatID], [MerchandiseSubCat], [MerchandiseCategoryID], [MerchandiseCategory], [ProductTerritoryID], [ProductTerritory]
			--, [SKUTypeID], [SKUType]
			) ON [PRIMARY]
		'
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	
	--index for DisUnitType
	SET @lSQL = N'
			IF NOT EXISTS (SELECT 1 FROM dbo.SysIndexes WHERE NAME = N''idx_' + @Code + 'DisUnitType'' AND ID = OBJECT_ID(N''[dbo].[' + @Code + 'DisUnitType]'')) AND EXISTS (SELECT 1 FROM sys.objects WHERE NAME = ''' + @code + 'DisUnitType''  and Type=''u'')
				CREATE  INDEX [idx_' + @Code + 'DisUnitType] ON [dbo].[' + @Code + 'DisUnitType]([UnitTypeID]) INCLUDE ([UnitType]) ON [PRIMARY]
			 '	
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXECUTE(@lSQL)
       END
     ELSE
       BEGIN
			Print @lSQL
       END
	END
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Code,'Index created on Display tables ','Index created on Display tables', GETDATE()
	
Print '-- End mt_proc_Create_DisplayTables_index SPs ' + convert(varchar(100),current_timestamp,20)	
END





GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_DisplayTables]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create  PROCEDURE  [dbo].[mt_proc_Create_DisplayTables]

 @Code as varchar(20),
 @CWMOnly as tinyint=0,
 @IsOffer as tinyint=0,
 @IsEvent as tinyint=0,
 @IsTheme as TinyiNt=0,
 @IsDebug as bit =0  --Values : "0 = Run / 1 = Print".
 --select * from ddhDisQueryPage
--exec [mt_proc_Create_DisplayTables] 'ddh',0,1,0,0,0
AS
BEGIN
	SET NOCOUNT ON;--DisAdvertiserMarket
	
	declare @SQL as nvarchar(4000)
			,@ClientID as Int -- Added by Hiren on 06/27/2012	
			,@IsDAA as Int
			,@QTRDis nvarchar(max)=''
			,@SaleDis nvarchar(max)=''
	declare @controlprefix varchar(1000)
IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category=@Code AND FVcctype=6 )
	BEGIN
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			SET @SQL='IF  EXISTS (SELECT * FROM tempdb.sys.objects WHERE name = ''DisRangePeriodDP'')
				DROP TABLE [tempdb].[dbo].[DisRangePeriodDP] '
			EXEC (@SQL)

			EXEC('SELECT * INTO [tempdb].[dbo].[DisRangePeriodDP] FROM [MT2ASQL06].[SiteControl].[dbo].[DisRangePeriod]
			WHERE CategoryCodeid in (Select ID from [MT2ASQL06].[SiteControl].[dbo].[CategoryCode] Where Category='''+@Code+''')')

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			EXEC('CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2ASQL06].[SiteControl].[dbo].[CategoryCode]')
		END
	ELSE
		BEGIN
			SET @SQL='IF  EXISTS (SELECT * FROM tempdb.sys.objects WHERE name = ''DisRangePeriodDP'')
				DROP TABLE [tempdb].[dbo].[DisRangePeriodDP] '
			EXEC (@SQL)

			EXEC('SELECT * INTO [tempdb].[dbo].[DisRangePeriodDP] FROM [Masteracfv].[dbo].[DisRangePeriod]
			WHERE CategoryCodeid in (Select ID from [MT2SQL14].[SiteControl].[dbo].[CategoryCode] Where Category='''+@Code+''')')

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			EXEC('CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2SQL14].[SiteControl].[dbo].[CategoryCode]')		
		END															
	end
	Select @ClientID = ClientID, @IsDAA = IsNull(IsDAA,0)  From CategoryCodetable Where Category=@Code

	Print '-- start mt_proc_Create_DisplayTables SPs ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
	Insert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Code,'Start to create Display tables ','create Display tables', GETDATE()
	
	set @SQL= '
	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisAdvertiserMarket]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [' + @Code + 'DisAdvertiserMarket]

	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	SELECT DISTINCT [TradeclassId], 
	Isnull([Tradeclass],'''') Tradeclass, 
	[AdvertiserId], 
	Isnull([Advertiser],'''') Advertiser, 
	[MarketId], 
	Isnull([Market],'''') Market, 
	[RetMktId], 
		[regionId],  Isnull([Region], '''') Region, 
		[districtId], isnull([District],'''') District, 
		[CountryId], [Country],
		isnull(SalesTerritory, '''') SalesTerritory,
		SalesTerritoryId,
		Isnull(SalesTerritoryGroup, '''') SalesTerritoryGroup,
		SalesTerritoryGroupId,
		Isnull(SalesTerritorySubGroup, '''') SalesTerritorySubGroup,
		SalesTerritorySubGroupId,
		ChannelID,
		Isnull(Channel, '''') Channel, 
		ACRepflag'

		IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category=@Code AND FVcctype=6 ) 
		begin
				set @sql = @sql+',ACAdvertiserId,ACCityId' + SPACE(1) 
		end
		
		set @SQL= @sql+  SPACE(1) +' 
		INTO [dbo].[' + @Code + 'DisAdvertiserMarket]
	FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
      '
     --Change by prakash on 14/06/2013
     IF @IsDebug=0
       BEGIN
			EXEC sp_EXECutesql @SQL
       END
     ELSE
       BEGIN
			Print @SQL
       END
	
		--Changes For ACFVd Master Code
	
	

	--Below Fragment Added By Ashish
	Select @controlprefix = dbo.[mtfunc_GetDatabasePrefix]('control')
	set @SQL= '
		if exists(Select FieldName From ' + @controlprefix + 'vw_QVFCFields Where FieldId IN (55, 56) AND ClientID = ' + Cast(@ClientID AS Varchar) + ' AND DisplaySeq Is Not Null )
		BEGIN
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisDateRanges]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisDateRanges]
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT distinct [AdDate], [WeekOf], 
			dateadd(dd, (-1 * datepart(dd, AdDate)) + 1, AdDate) as [AdMonthId]
			, DateName(mm, AdDate) + '' - '' + DateName(yyyy,AdDate) As [AdMonth]
			, [WeekOfi], [WeekOfn], [SaleStartDate], [SaleEndDate]
			INTO [dbo].[' + @Code + 'DisDateRanges]
			FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
		END
		ELSE
		BEGIN
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisDateRanges]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisDateRanges]
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT distinct [AdDate], [WeekOf], 
			dateadd(dd, (-1 * datepart(dd, AdDate)) + 1, AdDate) as [AdMonthId]
			, DateName(mm, AdDate) + '' - '' + DateName(yyyy,AdDate) As [AdMonth]
			, [WeekOfi], [WeekOfn], [SaleStartDate], [SaleEndDate] 
			INTO [dbo].[' + @Code + 'DisDateRanges]
			FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
		END
	'	

	--Change by prakash on 14/06/2013
		
     IF @IsDebug=0
		   BEGIN
				EXEC sp_EXECutesql @SQL
		   END
     ELSE
		   BEGIN
				Print @SQL
		   END


	--Changes For ACFV Master Code
	IF(@Code = 'ACFV')
	Begin
				set @sql = '		
								if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisDateRanges]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
										drop table [' + @Code + 'DisDateRanges]
								
								if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
										SELECT distinct [AdDate], [WeekOf], 
										dateadd(dd, (-1 * datepart(dd, AdDate)) + 1, AdDate) as [AdMonthId]
										, DateName(mm, AdDate) + '' - '' + DateName(yyyy,AdDate) As [AdMonth]
										, [WeekOfi], [WeekOfn], [SaleStartDate], [SaleEndDate] 
										INTO [dbo].[' + @Code + 'DisDateRanges]
										FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
							'

				IF @IsDebug=0
				BEGIN
						EXEC sp_EXECutesql @SQL
				END
				ELSE
				BEGIN
						Print @SQL
				END
				
	End

	

	IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category=@Code AND FVcctype=6 )
	BEGIN

	set @sql='Select @QTRDis=QTR_Display, @SaleDis=Sale_Display from [tempdb].[dbo].[DisRangePeriodDP]'
	exec sp_executesql @sql, N'@QTRDis nvarchar(max) OUTPUT, @SaleDis nvarchar(max) OUTPUT', @QTRDis OUTPUT, @SaleDis OUTPUT

	IF @QTRDis =''
		Set @QTRDis='CAST(YEAR(SaleEndDate) AS VARCHAR(10)) + '' - Q'' + CAST(DATENAME(QQ, SaleEndDate) AS VARCHAR(10))'

	IF @SaleDis =''
		Set @SaleDis='CAST(CAST(SaleStartDate AS DATE) AS VARCHAR(MAX)) + '' - '' + CAST(CAST(SaleEndDate AS DATE) AS VARCHAR(MAX))'
	  set @sql = '		
	  				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisRangePeriod]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	  						drop table [' + @Code + 'DisRangePeriod]
	  				
	  				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisDateRanges]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	  						SELECT distinct '+@QTRDis+' AS [QTR_Display],
							CAST(YEAR(SaleEndDate) AS VARCHAR(10)) + '' - Q'' + CAST(DATENAME(QQ, SaleEndDate) AS VARCHAR(10)) AS [QTR],
							CAST(CAST(SaleStartDate AS DATE) AS VARCHAR(MAX)) + '' - '' + CAST(CAST(SaleEndDate AS DATE) AS VARCHAR(MAX)) AS [SaleStartDate-SaleEndDate],
							'+@SaleDis+' AS [Sale_Display]
	  						INTO [dbo].[' + @Code + 'DisRangePeriod]
	  						FROM [dbo].[' + @Code + 'DisDateRanges] with(nolock)
	  			'
	  
	  IF @IsDebug=0
	  BEGIN
	  		EXEC sp_EXECutesql @SQL
	  END
	  ELSE
	  BEGIN
	  		Print @SQL
	  END
	END
	


	set @SQL= '

	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisMedia]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [' + @Code + 'DisMedia]

	--DisMedia

	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	SELECT DISTINCT [MediaId], Isnull([Media],'''') Media '
	IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category=@Code AND FVcctype=6 ) 
		begin
				set @sql = @sql+',ACMediaType'
		end
		
		
			SET @SQL = @SQL + SPACE(1) +
	'INTO [dbo].[' + @Code + 'DisMedia]
	FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
		  '
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
		   BEGIN
				EXEC sp_EXECutesql @SQL
		   END
     ELSE
		   BEGIN
				Print @SQL
		   END


	--DisPublication
	set @SQL= '
	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisPublication]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [' + @Code + 'DisPublication]


	if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	SELECT DISTINCT [PublicationId], Isnull([Publication] ,'''') Publication
	INTO [dbo].[' + @Code + 'DisPublication]
	FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
		  '
	--Change by prakash on 14/06/2013
     IF @IsDebug=0
		   BEGIN
				EXEC sp_EXECutesql @SQL
		   END
     ELSE
		   BEGIN
				Print @SQL
		   END


	If @IsEvent=1
	Begin
		--DisEvent
		set @SQL= '
		if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisEvent]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
		drop table [' + @Code + 'DisEvent]

		if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
		SELECT DISTINCT [EventId], Isnull([Event] ,'''') Event
		INTO [dbo].[' + @Code + 'DisEvent]
		FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
			  '
			--Change by prakash on 14/06/2013
		 IF @IsDebug=0
			   BEGIN
					EXEC sp_EXECutesql @SQL
			   END
		 ELSE
			   BEGIN
					Print @SQL
			   END

	End

	--DisTheme
	If @isTheme=1
		begin
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisTheme]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisTheme]


			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'FlyerReports]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT DISTINCT [ThemeId], Isnull([Theme] ,'''') Theme
			INTO [dbo].[' + @Code + 'DisTheme]
			FROM [dbo].[' + @Code + 'FlyerReports] with(nolock)
				  '
			--Change by prakash on 14/06/2013
			 IF @IsDebug=0
				   BEGIN
						EXEC sp_EXECutesql @SQL
				   END
			 ELSE
				   BEGIN
						Print @SQL
				   END

		end

	If @CWMOnly=0
		Begin
			--disfeature
				set @SQL= '
				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisFeatures]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table [' + @Code + 'DisFeatures]
				--DisFeatures
				SELECT distinct [FeaturesId], Isnull([Features],'''') Features 
				INTO [dbo].[' + @Code + 'DisFeatures]
				FROM [dbo].[' + @Code + 'DetailReports] with(nolock)
					  '
				--Change by prakash on 14/06/2013
				IF @IsDebug=0
				   BEGIN
						EXEC sp_EXECutesql @SQL
				   END
				ELSE
				   BEGIN
						Print @SQL
				   END
				
				--New Features Change Item 19401: Nishant
				--IF @@SERVERNAME <> 'MT2SQL03' AND @ClientID <> 3 --condition to filter demo server
				--	BEGIN
				--		 -- Modified by Hiren on 06/27/2012
				--		SET @SQL='IF EXISTS(SELECT 1 FROM [dbo].[' + @Code + 'DisFeatures]
				--		WHERE FeaturesId=2037)
				--			INSERT INTO [dbo].[' + @Code + 'DisFeatures]([FeaturesId],[Features]) SELECT 574033,''Online Only, Exclude'''
				--	END
				--ELSE 
				--IF @@SERVERNAME <> 'MT2SQL03' --AND @ClientID = 3
				BEGIN
					 -- Modified by Hiren on 06/27/2012
					SET @SQL='IF EXISTS(SELECT 1 FROM [dbo].[' + @Code + 'DisFeatures]
					WHERE FeaturesId=2037)
						INSERT INTO [dbo].[' + @Code + 'DisFeatures]([FeaturesId],[Features]) SELECT 574033,''Online Digital Pages, Exclude'';
					Update [dbo].[' + @Code + 'DisFeatures] Set Features = ''Online Digital Pages, Include'' Where FeaturesID = 2037'					
				END					
				
				--Change by prakash on 14/06/2013
				IF @IsDebug=0
				   BEGIN
						EXEC sp_EXECutesql @SQL
				   END
				ELSE
				   BEGIN
						Print @SQL
				   END
				

			--DisPageEvent
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisPageEvent]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisPageEvent]
			
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'MPVPageEvent]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT DISTINCT [PageEventId], Isnull([PageEvent],'''') PageEvent 
			INTO [dbo].[' + @Code + 'DisPageEvent]
			FROM [dbo].[' + @Code + 'MPVPageEvent] with(nolock) WHERE PageEvent not like ''%None Selected%''
				  '
			--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				

			--DisVariety
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisVariety]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisVariety]
			
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'MPVVariety]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT DISTINCT [VarietyId], Isnull([Variety] ,'''') Variety
			INTO [dbo].[' + @Code + 'DisVariety]
			FROM [dbo].[' + @Code + 'MPVVariety] with(nolock) WHERE Variety not like ''%None Selected%''
				  '
				--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				
			----DisUnitType
			--set @SQL= '
			--if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisUnitType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			--drop table [' + @Code + 'DisUnitType]
			
			--if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'MPVUnitType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			--SELECT DISTINCT [UnitTypeId], Isnull([UnitType],'''') UnitType 
			--INTO [dbo].[' + @Code + 'DisUnitType]
			--FROM [dbo].[' + @Code + 'MPVUnitType]  WHERE UnitType not like ''%None Selected%''
			--	  '
			--	--Change by prakash on 14/06/2013
			--IF @IsDebug=0
			--	 BEGIN
			--		EXEC sp_EXECutesql @SQL
			--	 END
			--ELSE
			--	 BEGIN
			--		Print @SQL
			--	 END

			
				--DisUnittype
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisUnitType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisUnitType]
			
			SELECT DISTINCT [UnitTypeId], Isnull([UnitType],'''') UnitType 
			INTO [dbo].[' + @Code + 'DisUnitType]
			FROM [dbo].[' + @Code + 'DetailReports] with(nolock) WHERE UnitType not like ''%None Selected%''
				  '
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END



			--DisComments3
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisComments3]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisComments3]

			SELECT DISTINCT Isnull([Comments3],'''') Comments3 
			INTO [dbo].[' + @Code + 'DisComments3]
			FROM [dbo].[' + @Code + 'DetailReports] with(nolock)
				  '
				--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END					

			--DisOrigin
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisOrigin]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisOrigin]
			
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'MPVOrigin]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT DISTINCT [OriginId], Isnull([Origin],'''') Origin 
			INTO [dbo].[' + @Code + 'DisOrigin]
			FROM [dbo].[' + @Code + 'MPVOrigin] with(nolock) WHERE Origin not like ''%None Selected%''
				  '
				--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				


			--DisPageTheme
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisPageTheme]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisPageTheme]

			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'MPVPageTheme]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			SELECT DISTINCT [PageThemeId], Isnull([PageTheme],'''') PageTheme 
			INTO [dbo].[' + @Code + 'DisPageTheme]
			FROM [dbo].[' + @Code + 'MPVPageTheme] with(nolock) WHERE PageTheme not like ''%None Selected%''
				  '
				--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				
			
			If @IsOffer=1
				Begin
				--DisOffer
				set @SQL= '
				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisOffer]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table [' + @Code + 'DisOffer]

				SELECT DISTINCT [OfferId], Isnull([Offer],'''') Offer 
				INTO [dbo].[' + @Code + 'DisOffer]
				FROM [dbo].[' + @Code + 'MPVOffer] with(nolock)
					  '
				--	--Change by prakash on 14/06/2013
				--IF @IsDebug=0
				--	 BEGIN
				--		EXEC sp_EXECutesql @SQL
				--	 END
				--ELSE
				--	 BEGIN
				--		Print @SQL
				--	 END
					
			
			
				--DisOfferType
				set @SQL= '
				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisOfferType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table [' + @Code + 'DisOfferType]

				SELECT DISTINCT [OfferTypeId], Isnull([OfferType],'''') OfferType 
				INTO [dbo].[' + @Code + 'DisOfferType]
				FROM [dbo].[' + @Code + 'MPVOfferType] with(nolock)
					  '
					--Change by prakash on 14/06/2013
				IF @IsDebug=0
					 BEGIN
						EXEC sp_EXECutesql @SQL
					 END
				ELSE
					 BEGIN
						Print @SQL
					 END											
			
				--DisMainOffer
				set @SQL= '
				if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisMainOffer]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table [' + @Code + 'DisMainOffer]

				SELECT DISTINCT [MainOfferId], Isnull([MainOffer],'''') MainOffer 
				INTO [dbo].[' + @Code + 'DisMainOffer]
				FROM [dbo].[' + @Code + 'DetailReports] with(nolock)
					  '
					--Change by prakash on 14/06/2013
				IF @IsDebug=0
					 BEGIN
						EXEC sp_EXECutesql @SQL
					 END
				ELSE
					 BEGIN
						Print @SQL
					 END							
			End
			
			set @SQL= '
			if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisQueryPage]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [' + @Code + 'DisQueryPage]

			--DisQueryPage
			SELECT 
				DISTINCT [BrandId], Isnull([Brand],'''') Brand, 
				[ManufacturerId], Isnull([Manufacturer],'''') Manufacturer, 
				[MerchandiseCategoryId], Isnull([MerchandiseCategory],'''') MerchandiseCategory, 
				[MerchandiseSubCatId], Isnull([MerchandiseSubCat],'''') MerchandiseSubCat, 
				[CategoryId], Isnull([Category],'''') Category,
				ProductTerritoryID,
				Isnull(ProductTerritory,'''') ProductTerritory,
				ProductTerritoryGroupID,
				Isnull(ProductTerritoryGroup,'''') ProductTerritoryGroup,
				ProductTerritorySubGroupID,
				Isnull(ProductTerritorySubGroup,'''') ProductTerritorySubGroup,
				LTRIM(RTRIM(SKUDescription1)) AS SKUDescription1,
				SKUDescription1ID,
				LTRIM(RTRIM(SKUDescription2)) AS SKUDescription2,
				SKUDescription2ID,
				LTRIM(RTRIM(SKUDescription3)) AS SKUDescription3,
				SKUDescription3ID,
				LTRIM(RTRIM(SKUType)) AS SKUType,
				SKUTypeID,ACBrandFamily , ACBrandFamilyId
				'
			

			IF EXISTS(Select 1 From CategoryCodeTable Where Category=@Code and IsNull(BuPC,0)=1)
				SET @SQL = @SQL + 	
					',Isnull(ParentCompany,'''') ParentCompany,
					ParentCompanyID' + SPACE(1)
			IF EXISTS (SELECT * FROM dbo.CategoryCodetable WHERE Category=@Code AND FVcctype=6 ) 
		begin
				set @sql = @sql+',ACSegment,ACCategoryId'
		end
		
		
			SET @SQL = @SQL + SPACE(1) + 'INTO [dbo].[' + @Code + 'DisQueryPage]
			FROM 
				[dbo].[' + @Code + 'DetailReports] with(nolock)
				  '
			--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				

			--set @SQL= '
			--if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisUnitType]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			--drop table [' + @Code + 'DisUnitType]

			----DisQueryPage
			--SELECT DISTINCT [UnitTypeId], [UnitType]
			--INTO [dbo].[' + @Code + 'DisUnitType]
			--FROM [dbo].[' + @Code + 'DetailReports]
			--	  '
			----Change by prakash on 14/06/2013
			--IF @IsDebug=0
			--	 BEGIN
			--		EXEC sp_EXECutesql @SQL
			--	 END
			--ELSE
			--	 BEGIN
			--		Print @SQL
			--	 END
				
		End
		
	IF @IsDAA = 1 
		BEGIN
			--disfeature
			SET @SQL= '
			IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N''[' + @Code + 'DisFeatures]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
				drop table [' + @Code + 'DisFeatures]
			
			IF EXISTS (SELECT TOP 1 * FROM information_schema.columns where table_name =''' + @Code + 'PageReports'' and column_name = ''Features'')
				BEGIN
			--DisFeatures
					SELECT distinct [FeaturesId], Isnull([Features] ,'''') Features
					INTO [dbo].[' + @Code + 'DisFeatures]
					FROM [dbo].[' + @Code + 'PageReports] with(nolock)
				END
				  '
			--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END
				
			 
			--IF @@SERVERNAME <> 'MT2SQL03' --AND @ClientID = 3
			BEGIN
				 -- Modified by Hiren on 06/27/2012
				SET @SQL='IF EXISTS(SELECT 1 FROM [dbo].[' + @Code + 'DisFeatures]
				WHERE FeaturesId=2037)
					INSERT INTO [dbo].[' + @Code + 'DisFeatures]([FeaturesId],[Features]) SELECT 574033,''Online Digital Pages, Exclude'';
				Update [dbo].[' + @Code + 'DisFeatures] Set Features = ''Online Digital Pages, Include'' Where FeaturesID = 2037'					
			END					
			--Change by prakash on 14/06/2013
			IF @IsDebug=0
				 BEGIN
					EXEC sp_EXECutesql @SQL
				 END
			ELSE
				 BEGIN
					Print @SQL
				 END		
		END
	--Changes by prakash on 14/06/2013
	IF @IsDebug=0
	  BEGIN
		EXEC mt_proc_Create_DisplayTables_index @code,@CWMOnly,@IsOffer,@IsEvent,@IsTheme,0
	  END	
	ELSE
		BEGIN
			EXEC mt_proc_Create_DisplayTables_index @code,@CWMOnly,@IsOffer,@IsEvent,@IsTheme,1
		END
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @Code,'Created Display tables ','Created Display tables', GETDATE()
		
Print '-- End mt_proc_Create_DisplayTables SPs ' + convert(varchar(100),current_timestamp,20)	
END

GO

/****** Object:  StoredProcedure [dbo].[mt_proc_Create_ID_Update]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		jhetler
-- Create date: Feb 2011
-- Description:	Creates generic ID update proc
--Exec mt_proc_Create_ID_Update_MediaDetailChange 'bpcDetailReports','MediaDetail',1
-- =============================================
Create  PROCEDURE [dbo].[mt_proc_Create_ID_Update]

 @codeTable as varchar(50),
 @columnName as varchar(100),
 @IsDebug as bit=0 --Values : "0 = Run / 1 = Print".

AS
BEGIN
	SET NOCOUNT ON;
declare @SQLInsert as nvarchar(4000)
declare @SQLUpdate as nvarchar(4000)	
declare @SQLIndex as nvarchar(4000)	
declare @tempIndexName as varchar(1000)

PRINT '-- START mt_proc_Create_ID_Update SP for  '+ @codeTable +'  '+@columnName +' at ' + convert(varchar(100),current_timestamp,20)
set @tempIndexName='IDX_temp_' + @columnName + '_' + @codeTable


SET @SQLIndex = '
IF EXISTS (SELECT name FROM sysindexes WHERE name = ''' + @tempIndexName + ''') DROP index ' + @codeTable + '.' + @tempIndexName

-- change by praksh 13/06/2013
IF @IsDebug=0
  BEGIN
    exec sp_executesql @SQLIndex
  END
ELSE
 BEGIN
    Print @SQLIndex
  END
--SET @SQLIndex = 'CREATE INDEX ' + @tempIndexName + ' ON ' + @codeTable + '(' + @columnName + ')'
--exec sp_executesql @SQLIndex
--temp prformance test change - nishant
SET @SQLIndex = 'CREATE INDEX ' + @tempIndexName + ' ON ' + @codeTable + '(' + @columnName + ') INCLUDE ('+@columnName+'ID)'
-- change by praksh 13/06/2013
IF @IsDebug=0
  BEGIN
    exec sp_executesql @SQLIndex
  END
ELSE
 BEGIN
    Print @SQLIndex
  END
set @SQLInsert = '
Insert Into IDDB.dbo.' + @columnname + ' (' + @columnname + ') 
Select distinct  IsNull(detail.' + @columnname + ', '''')
From ' + @codeTable + ' detail
left outer join IDDB.dbo.' + @columnname + ' id on id.' + @columnname + '=detail.' + @columnname + '
where id.' + @columnname + ' is null
and detail.' + @columnname + ' is not null'

If @columnName='MediaDetail'
Set @SQLInsert=replace(replace(@SQLInsert,'MediaDetail','Media'),'detail.Media','detail.MediaDetail')

If @columnName='ACBrandFamily'
Set @SQLInsert=replace(replace(@SQLInsert,'ACBrandFamily','Brand'),'detail.Brand','detail.ACBrandFamily')


INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'INSERT Start in ID Update SP ','INSERT Start in ID Update SP', GETDATE()
-- change by praksh 13/06/2013
IF @IsDebug=0
  BEGIN
    exec sp_executesql @SQLInsert
  END
ELSE
 BEGIN
    Print @SQLInsert
  END
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'INSERT End in ID Update SP ','INSERT End in ID Update SP', GETDATE()
set @SQLUpdate = '
Update ReportTable Set ' + @columnname + 'ID = IDTable.' + @columnname + 'ID 
From ' + @codeTable + ' ReportTable Join IDDB.dbo.' + @columnname + ' IDTable  On IsNull(ReportTable.' + @columnname + ', '''') 
= IsNull(IDTable.' + @columnname + ', '''') Where Isnull(ReportTable.' + @columnname + 'ID,0) <> IDTable.' + @columnname + 'ID '

If @columnName='MediaDetail'
Set @SQLUpdate =replace(replace(@SQLUpdate,'IDTable.MediaDetail','IDTable.Media'),'IDDB.dbo.MediaDetail','IDDB.dbo.Media')

If @columnName='ACBrandFamily'
Set @SQLUpdate =replace(replace(@SQLUpdate,'IDTable.ACBrandFamily','IDTable.Brand'),'IDDB.dbo.ACBrandFamily','IDDB.dbo.Brand')

INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'Update Start in ID Update SP ','Update Start in ID Update SP', GETDATE()
-- change by praksh 13/06/2013
IF @IsDebug=0
  BEGIN
    exec sp_executesql @SQLUpdate
  END
ELSE
 BEGIN
    Print @SQLUpdate
  END
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'Update end in ID Update SP ','Update End in ID Update SP', GETDATE()


SET @SQLIndex = ' DROP index ' + @codeTable + '.' + @tempIndexName

-- change by praksh 13/06/2013
IF @IsDebug=0
  BEGIN
    exec sp_executesql @SQLIndex
  END
ELSE
 BEGIN
    Print @SQLIndex
  END
PRINT '-- END mt_proc_Create_ID_Update SP : ' + convert(varchar(100),current_timestamp,20)
END



GO

/****** Object:  StoredProcedure [dbo].[BatchUpdate]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[BatchUpdate]
	@pCategoryCode varchar(50), --
	@pDebugRun bit,  --Values : "0 = Run / 1 = Print".
	@pCWMPDT bit --Value : : "0 = CWM / 1 = PDT".
AS 
SET NOCOUNT ON
BEGIN
	Declare @crlf char(2)
	set @crlf = char(13)+char(10)
	Declare @fullclause varchar(8000)
	Declare @lErrorDes varchar(5000)	
	Declare @lSql varchar(8000)
	Declare @lUpdateSql1 varchar(500)
	Declare @lUpdateSql2 varchar(500)
	Declare @lUpdateSql3 varchar(500)
	Declare @lcParam1 varchar(100) --User for storing cursor values.
	Declare @lcParam2 varchar(100) --User for storing cursor values.
	Declare @lcParam3 varchar(100) --User for storing cursor values.
	Declare @lcCounter int --User as counter in Cursor.
	Declare @lBatchCount int
	Declare @lSelectCaseSql1 varchar(8000)
	Declare @lSelectCaseSql2 varchar(8000)
	Declare @lSelectCaseSql3 varchar(8000)
	Declare @lSelectCaseSql4 varchar(8000)
	Declare @lSelectCaseSql5 varchar(8000)
	Declare @lAlternateSelectCaseSql1 varchar(8000)
	Declare @lAlternateSelectCaseSql2 varchar(8000)
	Declare @lAlternateSelectCaseSql3 varchar(8000)
	Declare @lAlternateSelectCaseSql4 varchar(8000)
	Declare @lAlternateSelectCaseSql5 varchar(8000)
	Declare @lTableNames varchar(255) --Name of the "TableNames" table.
	Declare @lPdtTable varchar(255) --Name of PDT table corresponding to categorycode.
	Declare @lManufacturerTable varchar(255) --Name of Manufacturer table corresponding to categorycode.
	Declare @lProductTerritoryTable varchar(255) --Name of ProductTerritory table corresponding to categorycode.
	Declare @lProductTerritoryGroupsTable varchar(255) --Name of ProductTerritoryGroup table corresponding to categorycode.
	Declare @lUpdateManufacturer bit--Value : 1/0
	Declare @lUpdateProductTerritory bit --Value : 1/0
	Declare @lUpdateProductTerritoryGroup bit --Value : 1/0
	Declare @lUpdateProductTerritorySubGroup bit --Value : 1/0
	Declare @lCwmTable varchar(255) --Name of CWM table corresponding to categorycode.
	Declare @lMarketSalesRegionsTable varchar(255) --Name of MarketSalesRegions table corresponding to categorycode.
	Declare @lAdvertiserSalesTerritoryTable varchar(255) --Name of AdvertiserSalesTerritory table corresponding to categorycode.
	Declare @lSalesTerritoryGroupsTable varchar(255) --Name of SalesTerritoryGroups table corresponding to categorycode.
	Declare @lUpdateDistrict bit --Value : 1/0
	Declare @lUpdateRegion bit --Value : 1/0
	Declare @lUpdateSalesTerritory bit --Value : 1/0
	Declare @lUpdateSalesTerritoryGroup bit --Value : 1/0
	Declare @lUpdateSalesTerritorySubGroup bit --Value : 1/0
	Declare @lPDTFull bit -- Value : 1 - Full / 0 - New
	Declare @lCWMFull bit -- Value : 1 - Full / 0 - New
	Declare @lUpdateParentCompany bit
	Declare @lParentCompanyTable varchar(255)
	Declare @lParentCompanyTableExists varchar(100)
	Declare @lParentCompanyColumnExists varchar(100)
	--Adview2Control Changes
	Declare @strNewId varchar(255)
	Declare @NSQL Nvarchar(1000)
	Declare @CategoryCodeTable varchar(255)
	--Adview2Control Changes
	Declare @lManufacturerTableExists varchar(100)
	Declare @lProductTerritoryTableExists varchar(100)
	Declare @lProductTerritoryGroupsTableExists varchar(100)
	Declare @lMarketSalesRegionsTableExists varchar(100)
	Declare @lAdvertiserSalesTerritoryTableExists varchar(100)
	Declare @lSalesTerritoryGroupsTableExists varchar(100)
	Declare @lTableNamesExists varchar(100)
	--Initialize the variables.
	SET @lSql = ''
	SET @lUpdateSql1 = ''
	SET @lUpdateSql2 = ''
	SET @lUpdateSql3 = ''
	SET @lcParam1 = ''
	SET @lcParam2 = ''
	SET @lcParam3 = ''
	SET @lSelectCaseSql1 = ''
	SET @lSelectCaseSql2 = ''
	SET @lSelectCaseSql3 = ''
	SET @lSelectCaseSql4 = ''
	SET @lSelectCaseSql5 = ''
	SET @lAlternateSelectCaseSql1 = ''
	SET @lAlternateSelectCaseSql2 = ''
	SET @lAlternateSelectCaseSql3 = ''
	SET @lAlternateSelectCaseSql4 = ''
	SET @lAlternateSelectCaseSql5 = ''
	SET @lTableNames = 'TableNames'
	SET @lPdtTable = ''
	SET @lcCounter = 0
	SET @lBatchCount = 90
	SET @lManufacturerTable = ''
	SET @lProductTerritoryTable = ''
	SET @lProductTerritoryGroupsTable = ''
	SET @lCwmTable = ''
	SET @lMarketSalesRegionsTable = ''
	SET @lAdvertiserSalesTerritoryTable = ''
	SET @lSalesTerritoryGroupsTable = ''
	set @lParentCompanyColumnExists = ''
	SET @fullclause = ''
	--Adview2Control Changes
PRINT '-- START BatchUpdate SP : ' + convert(varchar(100),current_timestamp,20)
	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	--Adview2Control Changes
	--If CWM Process is to be done.
	IF @pCWMPDT = 0
	BEGIN
		--Adview2Control Changes		
		select @NSQL = N'SELECT @lUpdateDistrict = ISNULL(BUDt,0), @lUpdateRegion = ISNULL(BURn,0),@lUpdateSalesTerritory = ISNULL(BUST,0), @lUpdateSalesTerritoryGroup = ISNULL(BUSTG,0),@lUpdateSalesTerritorySubGroup = ISNULL(BUSTSG,0), @lCWMFull = CASE WHEN ISAdlert = 1 THEN 1 ELSE CWMFull END  FROM ' + @CategoryCodeTable + ' Where Category = ''' + @pCategoryCode + ''''
		Print @Nsql
		execute sp_executesql @NSQL, N'@lUpdateDistrict bit OUTPUT,@lUpdateRegion bit OUTPUT,@lUpdateSalesTerritory bit OUTPUT,@lUpdateSalesTerritoryGroup bit OUTPUT,@lUpdateSalesTerritorySubGroup bit OUTPUT,@lCWMFull bit OUTPUT', @lUpdateDistrict  OUTPUT,@lUpdateRegion  OUTPUT,@lUpdateSalesTerritory  OUTPUT,@lUpdateSalesTerritoryGroup  OUTPUT,@lUpdateSalesTerritorySubGroup  OUTPUT,@lCWMFull  OUTPUT
		--Adview2Control Changes
		IF @lCWMFull IS NULL
		BEGIN
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ERROR CWMFull',GETDATE(),'CWMFull Column of CategoryCode table is containing NULL.')
			ELSE
				PRINT '--Error : CWMFull Column of CategoryCode table is containing NULL.'
	
			RETURN
		END			
	END
	--If PDT Process is to be done.
	ELSE
	BEGIN
		--Adview2Control Changes
		select @NSQL = N'SELECT @lUpdateManufacturer = ISNULL(BUMfr,0), @lUpdateProductTerritory = ISNULL(BUPT,0),@lUpdateProductTerritoryGroup = ISNULL(BUPTG,0), @lUpdateProductTerritorySubGroup = ISNULL(BUPTSG,0), @lUpdateParentCompany = ISNULL(BuPC,0), @lPDTFull = isfull FROM ' + @CategoryCodeTable + ' Where Category = ''' + @pCategoryCode + ''''
		execute sp_executesql @NSQL, N'@lUpdateManufacturer bit OUTPUT,@lUpdateProductTerritory bit OUTPUT,@lUpdateProductTerritoryGroup bit OUTPUT,@lUpdateProductTerritorySubGroup bit OUTPUT, @lUpdateParentCompany bit OUTPUT, @lPDTFull bit OUTPUT', @lUpdateManufacturer  OUTPUT,@lUpdateProductTerritory  OUTPUT,@lUpdateProductTerritoryGroup  OUTPUT,@lUpdateProductTerritorySubGroup OUTPUT, @lUpdateParentCompany OUTPUT, @lPDTFull  OUTPUT
		--Adview2Control Changes
		IF @lPDTFull IS NULL
		BEGIN
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ERROR ISFull',GETDATE(),'ISFull Column of CategoryCode table is containing NULL.')
			ELSE
				PRINT '--Error : ISFull Column of CategoryCode table is containing NULL.'
				
			RETURN
		END
	END
	--Initialize the variables.
	--Print All The Details.
	IF @pCWMPDT = 0
		PRINT '--CWM UPDATE ::'	
	ELSE
		PRINT '--PDT UPDATE ::'	
	PRINT '--CategoryCode = ' + @pCategoryCode
	IF @pDebugRun = 1
		PRINT '--Mode = Print[Debug]' 
	ELSE
		PRINT '--Mode = Run[Execute]'
	--PRINT '--DebugRun = ' + CAST(@pDebugRun AS VARCHAR(1))
	--PRINT '--CWMPDT = ' + CAST(@pCWMPDT AS VARCHAR(1))
	
	IF @pCWMPDT = 0
	BEGIN
		
		IF @lCWMFull = 1
			PRINT '--CWMFull = All Records'
		ELSE
			PRINT '--CWMFull = New Records'
		
		IF @lUpdateDistrict = 1
			PRINT '--BUDt = ' + CAST(@lUpdateDistrict AS VARCHAR(1))
		IF @lUpdateRegion = 1
			PRINT '--BURn = ' + CAST(@lUpdateRegion AS VARCHAR(1))
		IF @lUpdateSalesTerritory = 1
			PRINT '--BUST = ' + CAST(@lUpdateSalesTerritory AS VARCHAR(1))
		
		IF @lUpdateSalesTerritoryGroup = 1
			PRINT '--BUSTG = ' + CAST(@lUpdateSalesTerritoryGroup AS VARCHAR(1))
		IF @lUpdateSalesTerritorySubGroup = 1
			PRINT '--BUSTSG = ' + CAST(@lUpdateSalesTerritorySubGroup AS VARCHAR(1))
		EXECUTE GetTableName @pCategoryCode, 3, @lCwmTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 14, @lMarketSalesRegionsTable OUTPUT
		EXECUTE GetTableName @pCategoryCode, 2, @lAdvertiserSalesTerritoryTable OUTPUT
		EXECUTE GetTableName @pCategoryCode, 28, @lSalesTerritoryGroupsTable OUTPUT
		PRINT '--CwmTable = ' + @lCwmTable		
		IF (@lUpdateDistrict = 1 OR @lUpdateRegion = 1)
			PRINT '--MarketSalesRegionsTable = ' + @lMarketSalesRegionsTable
		IF (@lUpdateSalesTerritory = 1 OR @lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1)
			PRINT '--AdvertiserSalesTerritoryTable = ' + @lAdvertiserSalesTerritoryTable
		IF (@lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1)
			PRINT '--SalesTerritoryGroupsTable = ' + @lSalesTerritoryGroupsTable
		--SET @lCwmTable = 'TEMP' + @lCwmTable
	END
	ELSE
	BEGIN
		IF @lPDTFull = 1
			PRINT '--isfull = All Records'
		ELSE
			PRINT '--isfull = New Records'
		IF @lUpdateManufacturer = 1
			PRINT '--BUMfr = ' + CAST(@lUpdateManufacturer AS VARCHAR(1))
		IF @lUpdateProductTerritory = 1
			PRINT '--BUPT = ' + CAST(@lUpdateProductTerritory AS VARCHAR(1))
		IF @lUpdateProductTerritoryGroup = 1
			PRINT '--BUPTG = ' + CAST(@lUpdateProductTerritoryGroup AS VARCHAR(1))
		IF @lUpdateProductTerritorySubGroup = 1
			PRINT '--BUPTSG = ' + CAST(@lUpdateProductTerritorySubGroup AS VARCHAR(1))
		IF @lUpdateParentCompany = 1
			PRINT '--BuPC = ' + CAST(@lUpdateParentCompany AS VARCHAR(1))
		EXECUTE GetTableName @pCategoryCode, 22, @lPdtTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 12, @lManufacturerTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 24, @lProductTerritoryTable OUTPUT		
		EXECUTE GetTableName @pCategoryCode, 25, @lProductTerritoryGroupsTable OUTPUT
		--SELECT @lParentCompanyTable = dbo.mtfunc_GetDatabasePrefix('Control') + 'AnhdPCGroupAssign'
		EXECUTE GetTableName @pCategoryCode, 52, @lParentCompanyTable OUTPUT
		PRINT '--PdtTable = ' + @lPdtTable
		--Manufacturer
		IF @lUpdateManufacturer = 1
		BEGIN
			PRINT '--MfrTable = ' + @lManufacturerTable
			IF PARSENAME(@lManufacturerTable,1) = ''
			BEGIN
				SET @lErrorDes = 'Manufacturer not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lManufacturerTable = ''
				SET @lUpdateManufacturer = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lManufacturerTable,1))
				SELECT @NSQL = N'SELECT @lManufacturerTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lManufacturerTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lManufacturerTableExists varchar(50) OUTPUT, @lManufacturerTable varchar(255)', @lManufacturerTableExists OUTPUT, @lManufacturerTable
				SELECT @lManufacturerTableExists = ISNULL(@lManufacturerTableExists,'')
				IF @lManufacturerTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lManufacturerTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lManufacturerTable = ''
					SET @lUpdateManufacturer = 0
				END	
				ELSE
				BEGIN
					--Create Temp Manufacturer table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TManu' + @strNewId + ' FROM ' + @lManufacturerTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lManufacturerTable = 'TEMPDB..TManu' + @strNewId
					--Create Temp Manufacturer table
				END
			END
		END
		--Parent Company
		IF @lUpdateParentCompany = 1
		BEGIN
			PRINT '--ParentCompany = ' + @lParentCompanyTable
			IF PARSENAME(@lParentCompanyTable,1) = ''
			BEGIN
				SET @lErrorDes = 'ParentCompany not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lParentCompanyTable = ''
				SET @lUpdateParentCompany = 0
			END
			ELSE
			BEGIN
				SELECT @NSQL = N'SELECT @lParentCompanyTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lParentCompanyTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lParentCompanyTableExists varchar(50) OUTPUT, @lParentCompanyTable varchar(255)', @lParentCompanyTableExists OUTPUT, @lParentCompanyTable
				SELECT @lParentCompanyTableExists = ISNULL(@lParentCompanyTableExists,'')
				IF @lParentCompanyTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lParentCompanyTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lParentCompanyTable = ''
					SET @lUpdateParentCompany = 0
				END	
				ELSE
				BEGIN
					--Create Temp ParentCompany table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TParentCompany' + @strNewId + ' FROM ' + @lParentCompanyTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lParentCompanyTable = 'TEMPDB..TParentCompany' + @strNewId
					--Create Temp ParentCompany table
				END
			END
		END
		--PT, PTGROUP, PTSUBGROUP
		IF (@lUpdateProductTerritory = 1 OR @lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1)
		BEGIN
			PRINT '--PTTable = ' + @lProductTerritoryTable
			IF PARSENAME(@lProductTerritoryTable,1) = ''
			BEGIN
				SET @lErrorDes = 'ProductTerritory not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lProductTerritoryTable = ''
				SET @lUpdateProductTerritory = 0
				SET @lUpdateProductTerritoryGroup = 0
				SET @lUpdateProductTerritorySubGroup = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lProductTerritoryTable,1))
				SELECT @NSQL = N'SELECT @lProductTerritoryTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lProductTerritoryTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lProductTerritoryTableExists varchar(50) OUTPUT, @lProductTerritoryTable varchar(255)', @lProductTerritoryTableExists OUTPUT, @lProductTerritoryTable
				SELECT @lProductTerritoryTableExists = ISNULL(@lProductTerritoryTableExists,'')
				IF @lProductTerritoryTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lProductTerritoryTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
	
					SET @lProductTerritoryTable = ''
					SET @lUpdateProductTerritory = 0
					SET @lUpdateProductTerritoryGroup = 0
					SET @lUpdateProductTerritorySubGroup = 0
				END	
				ELSE
				BEGIN
					--Create Temp ProductTerritory table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TPT' + @strNewId + ' FROM ' + @lProductTerritoryTable
					EXEC(@lSql)		
					IF @pDebugRun <> 0		
						PRINT @lSql	
		
					SET @lProductTerritoryTable = 'TEMPDB..TPT' + @strNewId
					--Create Temp ProductTerritory table
				END
			END
		END
		--PTGROUP, PTSUBGROUP
		IF (@lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1)
		BEGIN
			PRINT '--PTGTable = ' + @lProductTerritoryGroupsTable
			IF PARSENAME(@lProductTerritoryGroupsTable,1) = ''
			BEGIN				
				SET @lErrorDes = 'ProductTerritoryGroups not present in TableNames.'
				IF @pDebugRun = 0
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END	
				
				SET @lProductTerritoryGroupsTable = ''
				SET @lUpdateProductTerritoryGroup = 0
				SET @lUpdateProductTerritorySubGroup = 0
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND 
				--		NAME = PARSENAME(@lProductTerritoryGroupsTable,1))
				SELECT @NSQL = N'SELECT @lProductTerritoryGroupsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lProductTerritoryGroupsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lProductTerritoryGroupsTableExists varchar(50) OUTPUT, @lProductTerritoryGroupsTable varchar(255)', @lProductTerritoryGroupsTableExists OUTPUT, @lProductTerritoryGroupsTable
				SELECT @lProductTerritoryGroupsTableExists = ISNULL(@lProductTerritoryGroupsTableExists,'')
				IF @lProductTerritoryGroupsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lProductTerritoryGroupsTable
					IF @pDebugRun = 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
	
					SET @lProductTerritoryGroupsTable = ''
					SET @lUpdateProductTerritoryGroup = 0
					SET @lUpdateProductTerritorySubGroup = 0
				END	
				ELSE
				BEGIN
					--Create Temp ProductTerritoryGroups table
					SELECT @strNewId = REPLACE(NEWID(),'-','')
					SET @lSql = 'SELECT * INTO TEMPDB..TPTG' + @strNewId + ' FROM ' + @lProductTerritoryGroupsTable
					IF @pDebugRun = 0		
						EXEC(@lSql)		
					ELSE
						PRINT @lSql	
		
					SET @lProductTerritoryGroupsTable = 'TEMPDB..TPTG' + @strNewId
					--Create Temp ProductTerritoryGroups table
				END
			END
		END
		--SET @lPdtTable = 'TEMP' + @lPdtTable
	END
	SELECT @NSQL = N'SELECT @lTableNamesExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lTableNames,1)'
	EXECUTE sp_executesql @NSQL, N'@lTableNamesExists varchar(100) OUTPUT, @lTableNames varchar(255)', @lTableNamesExists OUTPUT, @lTableNames
	SELECT @lTableNamesExists = ISNULL(@lTableNamesExists,'')
	IF @lTableNamesExists = ''
	BEGIN
		SET @lErrorDes = 'Invalid object name ' + @lTableNames
		IF @pDebugRun = 0 
		BEGIN
			--BEGIN TRANSACTION
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
			--COMMIT
		END
		ELSE
		BEGIN
			PRINT '--Error : ' + @lErrorDes	
			PRINT CHAR(13)
		END
		RETURN
	END
	--START : Update CWM Fields.
	---************************************** CWM UPDATE ****************************************************************************
	IF @pCWMPDT = 0
	BEGIN
		IF @pDebugRun = 0
		BEGIN
			--BEGIN TRANSACTION		
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'CWM Start Time',GETDATE(),'')
			----COMMIT
		END
		--################ CWM TABLE EXISTANCE ####################################
		IF @lCwmTable = ''
		BEGIN
			SET @lErrorDes = 'ChildWebMain not present in TableNames.'
			IF @pDebugRun = 0
			BEGIN
				--BEGIN TRANSACTION
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				--COMMIT
			END	
			ELSE
			BEGIN
				PRINT '--Error : ' + @lErrorDes
				PRINT ''
			END
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT Name FROM SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lCwmTable,1))
			BEGIN
				SET @lErrorDes = 'Invalid object name ' + @lCwmTable
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lCwmTable = ''
			END
		END
		--################  CWM TABLE EXISTANCE ####################################
		IF @pDebugRun = 1
		BEGIN
			PRINT ''
			PRINT '-----Batch Update-------------' 
		END
	
		--START : Update District,Region.
		--##############################################################################################################################
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Start CWM Update for District Region ','Start CWM Update for District Region', GETDATE()
	
		IF (@lUpdateDistrict = 1 OR @lUpdateRegion = 1) AND @lCwmTable <> ''
		BEGIN
			IF @lMarketSalesRegionsTable = ''
			BEGIN
				SET @lErrorDes = 'MarketSalesRegions not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lMarketSalesRegionsTable,1))
				SELECT @NSQL = N'SELECT @lMarketSalesRegionsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lMarketSalesRegionsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lMarketSalesRegionsTableExists varchar(50) OUTPUT, @lMarketSalesRegionsTable varchar(255)', @lMarketSalesRegionsTableExists OUTPUT, @lMarketSalesRegionsTable
				SELECT @lMarketSalesRegionsTableExists = ISNULL(@lMarketSalesRegionsTableExists,'')
				IF @lMarketSalesRegionsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lMarketSalesRegionsTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lMarketSalesRegionsTable = ''
				END
			END
	
			IF @lUpdateDistrict = 1 AND @lMarketSalesRegionsTable <> ''
			BEGIN	
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET District = Msr.District, '
				SET @lSql = @lSql + 'DistUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lMarketSalesRegionsTable + ' Msr '
				SET @lSql = @lSql + ' ON Cwm.Market = Msr.Market'
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.DistUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'District Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'District Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
	
			IF @lUpdateRegion = 1 AND @lMarketSalesRegionsTable <> ''
			BEGIN
	
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET Region = IsNULL(Msr.Region,''''), '
				SET @lSql = @lSql + 'RegionUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lMarketSalesRegionsTable + ' Msr '
				SET @lSql = @lSql + ' ON Cwm.Market = Msr.Market '
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.RegionUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Region Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Region Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END	
		END
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Updated  District Region ','Updated  District Region', GETDATE()
		--END : Update District.
		--##############################################################################################################################
	
		--START : Update SalesTerritory, SalesTerritoryGroup,SalesTerritorySubGroup
		--##############################################################################################################################
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Start CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup ','Start CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup', GETDATE()
		IF (@lUpdateSalesTerritory = 1 OR @lUpdateSalesTerritoryGroup = 1 OR @lUpdateSalesTerritorySubGroup = 1) AND @lCwmTable <> ''
		BEGIN
			IF @lAdvertiserSalesTerritoryTable = ''
			BEGIN
				SET @lErrorDes = 'AdvertiserSalesTerritory not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)	
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lAdvertiserSalesTerritoryTable,1))
				SELECT @NSQL = N'SELECT @lAdvertiserSalesTerritoryTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lAdvertiserSalesTerritoryTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lAdvertiserSalesTerritoryTableExists varchar(50) OUTPUT, @lAdvertiserSalesTerritoryTable varchar(255)', @lAdvertiserSalesTerritoryTableExists OUTPUT, @lAdvertiserSalesTerritoryTable
				SELECT @lAdvertiserSalesTerritoryTableExists = ISNULL(@lAdvertiserSalesTerritoryTableExists,'')
				IF @lAdvertiserSalesTerritoryTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lAdvertiserSalesTerritoryTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lAdvertiserSalesTerritoryTable = ''
				END
			END
	
			IF @lUpdateSalesTerritory = 1 AND @lAdvertiserSalesTerritoryTable <> ''
			BEGIN
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritory = Ast.SalesTerritory, '
				SET @lSql = @lSql + 'StUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.Advertiser = Ast.Advertiser AND Cwm.Market = Ast.Market '
			
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
			
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritory Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritory Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			IF @lSalesTerritoryGroupsTable = ''
			BEGIN
				SET @lErrorDes = 'SalesTerritoryGroups not present in TableNames.'
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END			
			END
			ELSE
			BEGIN
				--IF NOT EXISTS(SELECT Name FROM [MT2SQL04].Adview2Control.dbo.SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lSalesTerritoryGroupsTable,1))
				SELECT @NSQL = N'SELECT @lSalesTerritoryGroupsTableExists = Name FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'SYSOBJECTS WHERE XTYPE = ''U'' AND NAME = PARSENAME(@lSalesTerritoryGroupsTable,1)'
				EXECUTE sp_executesql @NSQL, N'@lSalesTerritoryGroupsTableExists varchar(50) OUTPUT, @lSalesTerritoryGroupsTable varchar(255)', @lSalesTerritoryGroupsTableExists OUTPUT, @lSalesTerritoryGroupsTable
				SELECT @lSalesTerritoryGroupsTableExists = ISNULL(@lSalesTerritoryGroupsTableExists,'')
				IF @lSalesTerritoryGroupsTableExists = ''
				BEGIN
					SET @lErrorDes = 'Invalid object name ' + @lSalesTerritoryGroupsTable
					IF @pDebugRun = 0
					BEGIN
						--BEGIN TRANSACTION
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
						--COMMIT
					END
					ELSE
					BEGIN
						PRINT '--Error : ' + @lErrorDes
						PRINT ''
					END
					SET @lSalesTerritoryGroupsTable = ''
				END
			END
			IF @lUpdateSalesTerritoryGroup = 1 AND @lAdvertiserSalesTerritoryTable <> '' AND @lSalesTerritoryGroupsTable <> ''
			BEGIN
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritoryGroup = Stg.SalesTerritoryGroup, '
				SET @lSql = @lSql + 'StgUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.advertiser = Ast.advertiser AND Cwm.Market = Ast.Market '
				SET @lSql = @lSql + 'INNER JOIN ' + @lSalesTerritoryGroupsTable + ' Stg '
				SET @lSql = @lSql + 'ON Ast.SalesTerritory = Stg.SalesTerritory '
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StgUpdatedOn IS NULL'
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritoryGroup Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritoryGroup Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			IF @lUpdateSalesTerritorySubGroup = 1 AND @lAdvertiserSalesTerritoryTable <> '' AND @lSalesTerritoryGroupsTable <> ''
			BEGIN
				SET @lSql = 'UPDATE ' + @lCwmTable + ' SET SalesTerritorySubGroup = Stg.SalesTerritorySubGroup, '
				SET @lSql = @lSql + 'StsgUpdatedOn = GETDATE() FROM ' + @lCwmTable + ' Cwm '
				SET @lSql = @lSql + 'INNER JOIN ' + @lAdvertiserSalesTerritoryTable + ' Ast '
				SET @lSql = @lSql + ' ON Cwm.advertiser = Ast.advertiser AND Cwm.Market = Ast.Market '
				SET @lSql = @lSql + 'INNER JOIN ' + @lSalesTerritoryGroupsTable + ' Stg '
				SET @lSql = @lSql + 'ON Ast.SalesTerritory = Stg.SalesTerritory '
				IF @lCWMFull = 0 --Only New Records
					SET @lSql = @lSql + ' WHERE Cwm.StsgUpdatedOn IS NULL'
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritorySubGroup Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'SalesTerritorySubGroup Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
		END
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup ','End CWm Update for SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup', GETDATE()
		--END : Update SalesTerritory, SalesTerritoryGroup,SalesTerritorySubGroup
		--##############################################################################################################################
		IF @pDebugRun = 0
		BEGIN
			--BEGIN TRANSACTION
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'CWM Complete Time',GETDATE(),'')
			--COMMIT
		END
	END
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End CWm Update ','End CWM Update', GETDATE()
	---**************************************CWM UPDATE****************************************************************************
	--END : Update CWM Fields.
	
	--START : Update PDT Fields.
	---************************************** PDT UPDATE ****************************************************************************
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Batch Update ','Batch Update', GETDATE()
	IF @pCWMPDT = 1
	BEGIN
		IF @pDebugRun = 1
			PRINT ''
		
		IF @pDebugRun = 0 
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'PDT Start Time',GETDATE(),'')
		IF @lPdtTable = ''
		BEGIN
			SET @lErrorDes = 'PageDetailTable not present in TableNames.'
			IF @pDebugRun = 0 
				INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
			ELSE
			BEGIN
				PRINT '--Error : ' + @lErrorDes
				PRINT ''
			END
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT Name FROM SYSOBJECTS WHERE XTYPE = 'U' AND NAME = PARSENAME(@lPdtTable,1))
			BEGIN
				SET @lErrorDes = 'Invalid object name ' + @lPdtTable
				IF @pDebugRun = 0 
					INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lErrorDes)
				ELSE
				BEGIN
					PRINT '--Error : ' + @lErrorDes
					PRINT ''
				END
				SET @lPdtTable = ''
			END
		END
		--START : Update Manufacturer.
		--##############################################################################################################################
		IF @lUpdateManufacturer = 1 AND @lPdtTable <> ''
		BEGIN	
			IF @lManufacturerTable <> ''
			BEGIN
				SET @lSql = 'UPDATE ' + @lPdtTable + ' SET Manufacturer = Mfr.Manufacturer, '
				SET @lSql = @lSql + 'MfrUpdatedOn = GETDATE() FROM ' + @lManufacturerTable + ' Mfr '
				SET @lSql = @lSql + 'INNER JOIN ' + @lPdtTable + ' Pdt '
				SET @lSql = @lSql + ' ON Mfr.Category = Pdt.Category AND Mfr.Brand = Pdt.Brand'
	
				--IF @lPDTFull = 0 --Only New Records
				--	SET @lSql = @lSql + ' WHERE Pdt.MfrUpdatedOn IS NULL'	
				SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Manufacturer Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Manufacturer Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
		END		
		--END : Update Manufacturer.
		--START : Update ParentCompany.
		--##############################################################################################################################
		IF @lUpdateParentCompany = 1 AND @lPdtTable <> ''
		BEGIN 		
			--PRINT GETDATE()	
			IF @lParentCompanyTable <> ''
			BEGIN
				--Add ParentCompany Column To PDT Table.
				SELECT @NSQL = N'SELECT @lParentCompanyColumnExists = Name FROM Syscolumns 
						WHERE [Id] IN(SELECT [Id] FROM SysObjects WHERE XType = ''U'' AND Name = ''' + PARSENAME(@lPdtTable,1) + ''') AND Name = ''ParentCompany'''
				EXECUTE sp_executesql @NSQL, N'@lParentCompanyColumnExists varchar(50) OUTPUT', @lParentCompanyColumnExists OUTPUT
				IF @lParentCompanyColumnExists = ''
				BEGIN
					SET @lSql = 'ALTER TABLE ' + @lPdtTable + ' ADD ParentCompany VARCHAR(37)'
					IF @pDebugRun = 0
						EXEC(@lSql)
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END						
				END
				--Create Index.
				SET @lSql = 'CREATE CLUSTERED INDEX Tmp_' + PARSENAME(@lParentCompanyTable,1) + ' ON ' + @lParentCompanyTable + '(Category,Brand)'	
				IF @pDebugRun = 0
				BEGIN
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Create Index Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Create Index',GETDATE(),@lSql)
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
				--Update Table
				SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ParentCompany = T.ParentCompany
						FROM ' + @lPdtTable + ' P JOIN ' + @lParentCompanyTable + ' T 
						ON P.Category = T.Category AND P.Brand = T.Brand OPTION (MAXDOP 1)'	
				IF @pDebugRun = 0
				BEGIN
					--BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Error',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ParentCompany Update',GETDATE(),@lSql)
					--COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			END
			--PRINT GETDATE()
		END
		--END : Update ParentCompany.
		--##############################################################################################################################
		--START : Update ProductTerritory, ProductTerritoryGroup, ProductTerritorySubGroup.
		--##############################################################################################################################
		Print '@lUpdateProductTerritory = '+ Cast(@lUpdateProductTerritory as Varchar(2))
		Print '@lUpdateProductTerritoryGroup = '+ Cast(@lUpdateProductTerritoryGroup as Varchar(2))
		Print '@lUpdateProductTerritorySubGroup = '+ Cast(@lUpdateProductTerritorySubGroup as Varchar(2))
		Print '@lPdtTable = '+ @lPdtTable
		Print '@lProductTerritoryTable = '+ @lProductTerritoryTable
		-- Changes is done for #24966	
		--IF EXISTS (SELECT * FROM MT2SQL14.SiteControl.dbo.TableNames WHERE TableID=24 and ClientTableName LIKE '%VarietyProductTerritory%' AND CategoryCodeID IN
		--			(SELECT ID FROM CategoryCodeTable Where Category= @pCategoryCode)) 
		--IF EXISTS (SELECT TOP 1 * FROM tempdb.information_schema.columns where table_name =@lProductTerritoryTable  and column_name = 'Variety')
		IF EXISTS (select top 1 * from tempdb.information_schema.columns where table_name = replace(@lProductTerritoryTable,'TEMPDB..','') and column_name = 'Variety')
			BEGIN 
				--select * from MT2SQL14.SiteControl.dbo.albProductTerritory
				--Select * from MT2SQL14.SiteControl.dbo.TableNames where CategoryCodeID=2967 and TableID=24
				IF @lUpdateProductTerritory = 1 
					BEGIN
						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritory = PT.Productterritory, 
							PtUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety 
						WHERE 
							F.RID = 1
						OPTION (MAXDOP 1)'
			
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
				
				IF @lUpdateProductTerritoryGroup = 1 
					BEGIN
						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritoryGroup = PT.ProductTerritoryGroup, 
							PtgUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety
						WHERE 
							F.RID = 1							 
						OPTION (MAXDOP 1)'
						
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
				
					END
				
				IF @lUpdateProductTerritorySubGroup = 1 
					BEGIN

						SET @lSql = ';with FirstVariety as
						(
						Select 
							ROW_NUMBER() OVER (PARTITION BY PagedetailID ORDER BY Variety) as RID, 
							Variety,PagedetailID 
						FROM 
							'+ @pCategoryCode + 'mpvvariety
						)
						Update 
							PDT 
						SET 
							PDT.ProductTerritorySubGroup = PT.ProductTerritorySubGroup, 
							PtsgUpdatedOn = GETDATE()
						From
							'+ @lPdtTable + ' PDT INNER JOIN ' + @lProductTerritoryTable + ' PT ON 
							PDT.Category = PT.category Inner Join FirstVariety F ON 
							F.PageDetailID=PDT.PAgeDetailID AND PT.variety = F.Variety 
						WHERE 
							F.RID = 1							
						OPTION (MAXDOP 1)'
						
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END					
					END			
			END
		ELSE
			BEGIN
				IF (@lUpdateProductTerritory = 1 OR @lUpdateProductTerritoryGroup =1 OR @lUpdateProductTerritorySubGroup = 1) AND @lPdtTable <> ''
				BEGIN
					IF @lPDTFull = 0 --Only New Records
						SET @fullclause = 'Pdt.PtUpdatedOn IS NULL'
					ELSE
						SET @fullclause = ''
					--START : Update "ProductTerritory"				
					IF @lUpdateProductTerritory = 1 AND @lProductTerritoryTable <> ''
					BEGIN
						IF EXISTS (select top 1 * from tempdb.information_schema.columns where table_name = replace(@lProductTerritoryTable,'TEMPDB..','') and column_name = 'ExactMatch')
						BEGIN
							print '--Doing BrandGroup update'
							set @lsql = 'if object_id(''tempdb.dbo.#pdtupdates'') is not null'+@crlf+
									   '	drop table #pdtupdates'+@crlf+
									   'create table #pdtupdates ('+@crlf+
									   '	pagedetailid varchar(50),'+@crlf+
									   '	brand varchar(255),'+@crlf+
									   '	category varchar(255),'+@crlf+
									   '	productterritory varchar(255),'+@crlf+
									   '	brandExactMatch tinyint default(0),'+@crlf+
									   '	brandMatch tinyint default(0),'+@crlf+
									   '	storeBrand tinyint default(0)'+@crlf+
									   ')'+@crlf+
									   '-- update brands that match exactly'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, brandExactMatch)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgcb.productterritory,1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgcb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgcb.category = pdt.category and bgcb.brand = pdt.brand'+@crlf+
									   'where bgcb.ExactMatch = 1'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update brands that match wildcard'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, brandMatch)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgcb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgcb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgcb.category = pdt.category and pdt.brand like bgcb.brand+''%'''+@crlf+
									   'where bgcb.ExactMatch = 0'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update store brands that match exactly'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, storeBrand)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgsb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgsb'+@crlf+
									   'join '+@lPdtTable+' pdt on bgsb.brand = pdt.brand'+@crlf+
									   'where bgsb.category is null'+@crlf+
									   'and bgsb.ExactMatch = 1'+@crlf+
										 'and not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update store brands that match wildcard'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory, storeBrand)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, bgsb.productterritory, 1'+@crlf+
									   'from '+@lProductTerritoryTable+' bgsb'+@crlf+
									   'join '+@lPdtTable+' pdt on pdt.brand like bgsb.brand+''%'''+@crlf+
									   'where bgsb.category is null'+@crlf+
									   'and bgsb.ExactMatch = 0'+@crlf+
										 'and not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   '-- update Others'+@crlf+
									   'insert into #pdtupdates(pagedetailid, brand, category, productterritory)'+@crlf+
									   'select distinct pdt.pagedetailid, pdt.brand, pdt.category, ''Other'''+@crlf+
									   'from '+@lPdtTable+' pdt'+@crlf+
									   'where not exists (select top 1 * from #pdtupdates e where pdt.pagedetailid = e.pagedetailid)'+@crlf+
									   case when @fullclause <> '' then 'and ' + @fullclause + @crlf else '' end + 
   									   'option (maxdop 1)' + @crlf + 
									   'if exists (select pagedetailid, count(distinct productterritory) from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1)'+@crlf+
									   'begin'+@crlf+
									   '	if object_id(''tempdb.dbo.##multiplematches'') is not null'+@crlf+
									   '		drop table ##multiplematches'+@crlf+
									   '	select pu.pagedetailid, pu.brand, pu.category, pu.productterritory, pu.brandExactMatch, pu.brandMatch, pu.storeBrand'+@crlf+
									   '	into ##multiplematches'+@crlf+
									   '	from #pdtupdates pu'+@crlf+
									   '	join (select pagedetailid, count(distinct productterritory) as bgcount from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1) d on pu.pagedetailid = d.pagedetailid'+@crlf+
									   '	if object_id(''tempdb.dbo.#keepers'') is not null'+@crlf+
									   '		drop table #keepers'+@crlf+
									   '	select pagedetailid, min(productterritory) as productterritory'+@crlf+
									   '	into #keepers'+@crlf+
									   '	from ##multiplematches'+@crlf+
									   '	group by pagedetailid'+@crlf+
									   '	delete pu'+@crlf+
									   '	from #pdtupdates pu'+@crlf+
									   '	join (select pagedetailid, count(distinct productterritory) as bgcount from #pdtupdates group by pagedetailid having count(distinct productterritory) > 1) d on pu.pagedetailid = d.pagedetailid'+@crlf+
									   '	where not exists (select top 1 * from #keepers k where pu.pagedetailid = k.pagedetailid and pu.productterritory = k.productterritory)'+@crlf
									   if @pCategoryCode in ('prdcan','prdcnen','prdcan50','prdcnen50')
									   begin
											set @lSQL = @lSQL + '	exec master.dbo.mt_proc_send_cdosysmail @from=''sql@markettrack.com'','+@crlf+
									   '		@to=''halapati@markettrack.com;eabando@markettrack.com;bsingh@markettrack.com;ztarapore@markettrack.com'','+@crlf+
									   '		@cc='''','+@crlf+
									   '		@subject=''Dupe Brand Group found in '+@pCategoryCode+''','+@crlf+
									   '		@query=''select distinct brand, category, productterritory, brandExactMatch, brandMatch, storeBrand'+@crlf+
									   'from ##multiplematches'+@crlf+
									   'order by brand'','+@crlf+
									   '		@queryoutput=''attachment'','+@crlf+
									   '		@queryattachmentname='''+@pCategoryCode+' Dupe Brand Group.xls'''+@crlf
									   end
									   set @lSQL = @lSQL + 'end'+@crlf+
									   '-- do the update'+@crlf+
									   'update pdt'+@crlf+
									   'set pdt.ProductTerritory = bg.productterritory, pdt.PtUpdatedOn = GETDATE()'+@crlf+
									   'from '+@lPdtTable+' pdt'+@crlf+
									   'join #pdtupdates bg on pdt.pagedetailid = bg.pagedetailid' + @crlf + 
									   case when @fullclause <> '' then 'where ' + @fullclause + @crlf else '' end + 
									   'option (maxdop 1)'
							IF @pDebugRun = 0
							BEGIN
								--BEGIN TRANSACTION
								EXEC(@lSql)
								IF @@ERROR <> 0
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
								ELSE
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
								--COMMIT
							END
							ELSE
							BEGIN
								PRINT @lSql			
								PRINT 'Go'
								PRINT CHAR(13)
							END
						END
						ELSE
						BEGIN
							print 'doing simple product territory update'
							SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritory = Pt.ProductTerritory, '
							SET @lSql = @lSql + 'PtUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
							SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
							SET @lSql = @lSql + ' ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand'
							IF @lPDTFull = 0 --Only New Records
								SET @lSql = @lSql + ' WHERE Pdt.PtUpdatedOn IS NULL'
							SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
				
							IF @pDebugRun = 0
							BEGIN
								--BEGIN TRANSACTION
								EXEC(@lSql)
								IF @@ERROR <> 0
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Error',GETDATE(),@lSql)
								ELSE
									INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritory Update',GETDATE(),@lSql)
								--COMMIT
							END
							ELSE
							BEGIN
								PRINT @lSql			
								PRINT 'Go'
								PRINT CHAR(13)
							END
						END
					END
					--END : Update "ProductTerritory"
					--START : Update "ProductTerritoryGroup"				
					IF @lUpdateProductTerritoryGroup = 1 AND @lProductTerritoryTable <> '' AND @lProductTerritoryGroupsTable <> ''
					BEGIN
						SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritoryGroup = Ptg.ProductTerritoryGroup, '
						SET @lSql = @lSql + 'PtgUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
						SET @lSql = @lSql + 'ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryGroupsTable + ' Ptg '
						SET @lSql = @lSql + 'ON Pt.ProductTerritory = Ptg.ProductTerritory '
						IF @lPDTFull = 0 --Only New Records
							SET @lSql = @lSql + ' WHERE Pdt.PtgUpdatedOn IS NULL'
						SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritoryGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
					--END : Update "ProductTerritoryGroup"
				
					--START : Update "ProductTerritorySubGroup"				
					IF @lUpdateProductTerritorySubGroup = 1 AND @lProductTerritoryTable <> '' AND @lProductTerritoryGroupsTable <> ''
					BEGIN
						SET @lSql = 'UPDATE ' + @lPdtTable + ' SET ProductTerritorySubGroup = Ptg.ProductTerritorySubGroup, '
						SET @lSql = @lSql + 'PtsgUpdatedOn = GETDATE() FROM ' + @lPdtTable + ' Pdt '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryTable + ' Pt '
						SET @lSql = @lSql + 'ON Pdt.Category = Pt.Category AND Pdt.Brand = Pt.Brand '
						SET @lSql = @lSql + 'INNER JOIN ' + @lProductTerritoryGroupsTable + ' Ptg '
						SET @lSql = @lSql + 'ON Pt.ProductTerritory = Ptg.ProductTerritory '
						IF @lPDTFull = 0 --Only New Records
							SET @lSql = @lSql + ' WHERE Pdt.PtsgUpdatedOn IS NULL'
						SET @lSql = @lSql + ' OPTION (MAXDOP 1)'	
						IF @pDebugRun = 0
						BEGIN
							--BEGIN TRANSACTION
							EXEC(@lSql)
							IF @@ERROR <> 0
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Error',GETDATE(),@lSql)
							ELSE
								INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'ProductTerritorySubGroup Update',GETDATE(),@lSql)
							--COMMIT
						END
						ELSE
						BEGIN
							PRINT @lSql			
							PRINT 'Go'
							PRINT CHAR(13)
						END
					END
					--END : Update "ProductTerritorySubGroup"			
				END
			END				
		--END : Update ProductTerritory.
		--##############################################################################################################################
		IF @pDebugRun = 0
			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'PDT Complete Time',GETDATE(),'')
		--ADIVEW2CONTROL CHANGES
		IF @lManufacturerTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lManufacturerTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lManufacturerTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lParentCompanyTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lParentCompanyTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lParentCompanyTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lProductTerritoryTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lProductTerritoryTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lProductTerritoryTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		IF @lProductTerritoryGroupsTable <> '' AND EXISTS(SELECT * FROM tempdb..sysobjects where XTYPE= 'U' and NAME = REPLACE(@lProductTerritoryGroupsTable,'tempdb..',''))
		BEGIN
			SET @lSql = 'DROP TABLE ' + @lProductTerritoryGroupsTable
			IF @pDebugRun = 0		
				EXEC(@lSql)		
			ELSE
				PRINT @lSql	
		END
		--ADIVEW2CONTROL CHANGES
	END
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End Batch Update ','End Batch Update', GETDATE()
	---************************************** PDT UPDATE ****************************************************************************
	--START : Update PDT Fields.
	
	IF @pDebugRun = 0
		INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Complete Time',GETDATE(),'')
		
	PRINT '-- END BatchUpdate SP : ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Batch Update Completed ','Batch Update Completed', GETDATE()
END

GO

/****** Object:  StoredProcedure [dbo].[GetServerType]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create      PROCEDURE  [dbo].[GetServerType]
@pServerName as varchar(100),
@pServerType as varchar(25) OUTPUT
AS
	SET ANSI_NULLS ON
	SET ANSI_WARNINGS ON 
	Declare @NSQL nvarchar(3000)
	/*
	If @pServerName = 'MT2SQL00'
	Begin
		SET @pServerType = 'Master'
	End
	Else
	Begin
		SELECT @NSQL = N'Select @pServerType = Type FROM ' + dbo.mtfunc_GetDatabasePrefix('Connection') + 'Adview2DataServers 
				WHERE ServerName = ''' + @pServerName + ''''
		EXECUTE sp_executesql @NSQL, N'@pServerType varchar(25) OUTPUT', @pServerType OUTPUT
	End
	*/
	SELECT @NSQL = N'Select @pServerType = Type FROM ' + dbo.mtfunc_GetDatabasePrefix('Connection') + 'Adview2DataServers 
		WHERE ServerName = ''' + @pServerName + ''''
	EXECUTE sp_executesql @NSQL, N'@pServerType varchar(25) OUTPUT', @pServerType OUTPUT


GO

/****** Object:  StoredProcedure [dbo].[GetTableName]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create         PROCEDURE  [dbo].[GetTableName]
@pCategoryCode as varchar(50),
@pTableId as int,
@pTableName as varchar(100) OUTPUT
AS
	SET ANSI_NULLS ON
	SET ANSI_WARNINGS ON 
	Declare @NSQL nvarchar(3000)
	Declare @ServerType varchar(25)
	Declare @CategoryCodeId int
	IF @pCategoryCode = 'ClientBrandException'
	BEGIN
		SET @pTableName = dbo.mtfunc_GetDatabasePrefix('Control') + 'ClientBrandException'
	END
	ELSE IF @pCategoryCode = 'CategoryCode'
	BEGIN
		SET @pTableName = dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryCode'
	END
	ELSE
	BEGIN
		SELECT @NSQL = N'SELECT @CategoryCodeId = [id] FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'CategoryCode WHERE Category = @pCategoryCode'
		EXECUTE sp_executesql @NSQL, N'@CategoryCodeId int OUTPUT,@pCategoryCode varchar(50)', @CategoryCodeId OUTPUT,@pCategoryCode
		EXECUTE GetServerType @@SERVERNAME,@ServerType OUTPUT
 		IF @ServerType = 'Master'
 		BEGIN
 			SELECT @NSQL = N'SELECT @pTableName = MasterTableName FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'TableNames WHERE CategoryCodeID = @CategoryCodeId AND TableId = @pTableId'
 		END
 		ELSE
 		BEGIN
 			SELECT @NSQL = N'SELECT @pTableName = ClientTableName FROM ' + dbo.mtfunc_GetDatabasePrefix('Control') + 'TableNames WHERE CategoryCodeID = @CategoryCodeId AND TableId = @pTableId'
 		END
		EXECUTE sp_executesql @NSQL, N'@pTableName varchar(100) OUTPUT,@CategoryCodeId int,@pTableId int', @pTableName OUTPUT,@CategoryCodeId,@pTableId
		if @pTableId = 11 or @pTableId = 27 or @pTableId = 41 or @pTableId = 42 or @pTableId = 47  or @pTableId = 16  or @pTableId = 2 or @pTableId = 14 or @pTableId = 24
			or @pTableId = 25 or @pTableId = 28 or @pTableId = 12 or @pTableId = 52
		BEGIN
			SET @pTableName = dbo.mtfunc_GetDatabasePrefix('Control') + @pTableName
		END
	END



GO

/****** Object:  StoredProcedure [dbo].[CWMUpdate_50]    Script Date: 2/25/2019 9:16:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





Create  PROCEDURE [dbo].[CWMUpdate_50]
	@pCategoryCode varchar(50), --
	@pDebugRun bit  --Values : "0 = Run / 1 = Print".
AS 
SET NOCOUNT ON
BEGIN
	Declare	@lSql varchar(8000)
			,@lIsWeekOf bit
			,@lDisAdvertiserTradeClassTable varchar(100)
			,@lCwmTable varchar(50) --Name of CWM table corresponding to categorycode.
			,@lCreateIndex bit
			,@CWMFULL bit
			,@bitBUST bit
			,@bitBUSTG bit
			,@bitBUSTSG bit
			,@NSQL Nvarchar(4000)
			,@CategoryCodeTable varchar(255)

	--Initialize the variables.
	SET @lSql = ''	
	SET @lDisAdvertiserTradeClassTable = ''
	SET @lIsWeekOf = 0
	SET @lCwmTable = ''
	SET @lCreateIndex = 0
PRINT '-- START CWMUpdate_50 SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'START CWMUpdate_50 SP','START CWMUpdate_50 SP', GETDATE()
	
	--Adview2Control Changes
	EXECUTE GetTableName 'CategoryCode', 0, @CategoryCodeTable OUTPUT
	--Adview2Control Changes
	--SELECT @lIsWeekOf = ISNULL(isWeekOf,0), @CWMFULL = CwmFull FROM CategoryCode Where Category = @pCategoryCode
	
	SELECT @NSQL = N'SELECT 
						@bitBUST = ISNULL(BUST,0), 
						@bitBUSTG = ISNULL(BUSTG,0), 
						@bitBUSTSG = ISNULL(BUSTSG,0), 
						@lIsWeekOf = ISNULL(isWeekOf,0), @CWMFULL = CwmFull 
					FROM ' + 
						@CategoryCodeTable + ' 
					WHERE 
						Category = ''' + @pCategoryCode + ''''
				
	EXECUTE sp_executesql @NSQL, N'@lIsWeekOf bit OUTPUT,@CWMFULL bit OUTPUT, @bitBUST BIT OUTPUT, @bitBUSTG BIT OUTPUT, @bitBUSTSG BIT OUTPUT', @lIsWeekOf  OUTPUT,@CWMFULL OUTPUT, @bitBUST OUTPUT,@bitBUSTG OUTPUT, @bitBUSTSG OUTPUT
	--To Create Necessary Indexes as CWMFULL is set to NULL for this codes in CategoryCode table.
	
	IF @pCategoryCode  IN('ad21','ad22','ad23','ad24','ad25')
		SET @CWMFULL = 1
	
	
	--SELECT @lCwmTable = TableName FROM TableNames WHERE Category = @pCategoryCode AND TableID = 3
	EXECUTE GetTableName @pCategoryCode, 3, @lCwmTable OUTPUT
	Print @lCwmTable
	IF @pDebugRun = 1
	BEGIN
		PRINT '--isWeekOf = ' + CAST(@lIsWeekOf AS VARCHAR(1))
		PRINT '--CWMFULL = ' + CAST(@CWMFULL AS VARCHAR(1))
	END
	
	IF EXISTS (SELECT name FROM sysobjects WHERE name LIKE  @lCwmTable)
	BEGIN
		print '-- CREATE CONSTRA INT & INDEX : ' + convert(varchar(100),current_timestamp,20)
		IF @CWMFULL = 1
		BEGIN
			--################ STEP1 :: CREATE CWM INDEXES ####################################
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'START CREATE CWM INDEXES','CREATE CWM INDEXES', GETDATE()
			--Index1
			--IF NOT EXISTS (SELECT name FROM sysindexes WHERE name like 'pk_' + @pCategoryCode + 'ChildWebMain')
			IF NOT EXISTS (SELECT name FROM sysobjects WHERE xtype='PK' AND parent_obj = OBJECT_ID(@lCwmTable))
			BEGIN
				SET @lSql = 'ALTER TABLE [dbo].[' + @lCwmTable + '] WITH NOCHECK ADD CONSTRAINT [pk_' + @lCwmTable + '] PRIMARY KEY  CLUSTERED 
					([FlyerID])  ON [PRIMARY] '
	
				IF @pDebugRun = 0
				BEGIN
					BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Create CWMPK Index',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Create: CWMPK Index',GETDATE(),@lSql)
	
					COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
	
				IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = @pCategoryCode + 'CWMRetMkt' AND id = OBJECT_ID(@lCwmTable))
				BEGIN
					SET @lSql = 'CREATE  INDEX [' + @pCategoryCode + 'CWMRetMkt] ON [dbo].[' + @lCwmTable + ']([Advertiser] , [Market] , [Flyerid]) ON [PRIMARY]'
		
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Create CWMRetMkt Index',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Create: CWMRetMkt Index',GETDATE(),@lSql)
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
	
				END
	
	
				SET @lCreateIndex = 1
	
			END
			--################ STEP1 :: CREATE CWM INDEXES ####################################
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'CWM INDEXES CREATED','CWM INDEXES CREATED', GETDATE()
		END
	
		--################ STEP2 :: CALL BATCHUPDATE FOR CWM ####################################
		print '-- BATCH UPDATE START : ' + convert(varchar(100),current_timestamp,20)
		--chnaged by prakash on 7/11/2013
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'Batch Update Start','Batch Update Start', GETDATE()
		EXECUTE BatchUpdate @pCategoryCode,@pDebugRun,0
	
		--################ STEP2 :: CALL BATCHUPDATE FOR CWM ####################################
		--CREATE INDEX
		IF @CWMFULL = 0
		BEGIN
			print '-- DBREINDEX : ' + convert(varchar(100),current_timestamp,20)
			IF @pDebugRun = 0
				DBCC DBREINDEX(@lCwmTable,'',90)
			ELSE
				PRINT 'dbcc DBREINDEX(''' + @lCwmTable + ''','''',90)'
		END
		ELSE
		BEGIN
			IF @lCreateIndex = 1
			BEGIN
				PRINT '-- CREATE INDEX : ' + convert(varchar(100),current_timestamp,20)
				--Index2
				--IF NOT EXISTS(SELECT name FROM sysindexes WHERE name like @pCategoryCode + 'CWMConsolidated')
				IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = @pCategoryCode + 'CWMConsolidated' AND id = OBJECT_ID(@lCwmTable))
				BEGIN
					SET @lSql = 'CREATE  INDEX [' + @pCategoryCode + 'CWMConsolidated] ON [dbo].[' + @lCwmTable + ']([Advertiser] , [AdDate] , [WeekOf] , [media] , [event] , [theme] , [market] , [Publication] , [tradeclass] , [Region] , [District] , [SalesTerritory] , [SalesTerritoryGroup] , [SalesTerritorySubGroup] ) ON [PRIMARY]'
		
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Create CWMConsolidated Index',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Create: CWMConsolidated Index',GETDATE(),@lSql)
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
	
				END
		
				--Index3
				--IF NOT EXISTS (SELECT name FROM sysindexes WHERE name like @pCategoryCode + 'CWMLarge')
				IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = @pCategoryCode + 'CWMLarge' AND id = OBJECT_ID(@lCwmTable))
				BEGIN
					SET @lSql = 'CREATE  INDEX [' + @pCategoryCode + 'CWMLarge] ON [dbo].[' + @lCwmTable + ']([AdDate], [Advertiser], [WeekOf], [media], [event], [theme], [market], [Publication], [tradeclass], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [FlyerID]) ON [PRIMARY]'
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Create CWMLarge Index',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Create: CWMLarge Index',GETDATE(),@lSql)
	
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
				END
		
				--Index4
				--IF NOT EXISTS (SELECT name FROM sysindexes WHERE name like @pCategoryCode + 'CWMINDEX1')
				IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = @pCategoryCode + 'CWMINDEX1' AND id = OBJECT_ID(@lCwmTable))
				BEGIN
					SET @lSql = 'CREATE  INDEX [' + @pCategoryCode + 'CWMINDEX1] ON [' + @lCwmTable + ']([AdDate]) WITH  FILLFACTOR = 90 ON [PRIMARY]'
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Create CWMINDEX1 Index',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Create: CWMINDEX1 Index',GETDATE(),@lSql)
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
				END
			END
		END
		--CREATE INDEX
	
		--################ STEP3 :: PROCESS WEEKOF ####################################
		IF @lIsWeekOf = 1
		BEGIN	
			print '-- WEEKOF PROCESS : ' + convert(varchar(100),current_timestamp,20)	
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'START WEEKOF PROCESS','WEEKOF PROCESS', GETDATE()
			IF @pDebugRun = 1
				PRINT '------Process WeekOf------'
	
			--IF EXISTS(SELECT name FROM sysobjects WHERE name LIKE @pCategoryCode + 'WeekOF')
			--BEGIN		
				IF EXISTS(SELECT name FROM sysobjects WHERE name LIKE @pCategoryCode + 'weekofi')
				BEGIN
					SET @lSql = 'DROP TABLE ' + @pCategoryCode + 'weekofi'
		
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Drop Table WeekOfi',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Drop: Table WeekOfi',GETDATE(),@lSql)
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
				END
	
				IF EXISTS(SELECT name FROM sysobjects WHERE name LIKE @pCategoryCode + 'weekofn')
				BEGIN
					SET @lSql = 'DROP TABLE ' + @pCategoryCode + 'weekofn'
					IF @pDebugRun = 0
					BEGIN
						BEGIN TRANSACTION
						EXEC(@lSql)
						IF @@ERROR <> 0
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Drop Table Weekofn',GETDATE(),@lSql)
						ELSE
							INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Drop: Table Weekofn',GETDATE(),@lSql)
	
						COMMIT
					END
					ELSE
					BEGIN
						PRINT @lSql			
						PRINT 'Go'
						PRINT CHAR(13)
					END
				END
	
				--IF EXISTS(SELECT col.name FROM syscolumns col, sysobjects obj WHERE col.id = obj.id AND obj.name = @lCwmTable + '' AND col.name ='Weekofi')
				--BEGIN
				--	SET @lSql = 'ALTER TABLE ' + @lCwmTable + ' DROP COLUMN WeekOfi'
				--	IF @pDebugRun = 0
				--	BEGIN
				--		BEGIN TRANSACTION
				--		EXEC(@lSql)
				--		IF @@ERROR <> 0
				--			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Drop Column WeekOfi',GETDATE(),@lSql)
				--		ELSE
				--			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Drop: Column WeekOfi',GETDATE(),@lSql)
				--		COMMIT
				--	END
				--	ELSE
				--	BEGIN
				--		PRINT @lSql			
				--		PRINT 'Go'
				--		PRINT CHAR(13)
				--	END
				--END
	
				--IF EXISTS(SELECT col.name FROM syscolumns col, sysobjects obj WHERE col.id = obj.id AND obj.name = @lCwmTable + '' AND col.name ='WeekOfn')
				--BEGIN
				--	SET @lSql = 'ALTER TABLE ' + @lCwmTable + ' DROP COLUMN WeekOfn'
				--	IF @pDebugRun = 0
				--	BEGIN
				--		BEGIN TRANSACTION
				--		EXEC(@lSql)
				--		IF @@ERROR <> 0
				--			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Drop Column WeekOfn',GETDATE(),@lSql)
				--		ELSE
				--			INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Drop: Column WeekOfn',GETDATE(),@lSql)
				--		COMMIT		
				--	END
				--	ELSE
				--	BEGIN
				--		PRINT @lSql			
				--		PRINT 'Go'
				--		PRINT CHAR(13)
				--	END
				--END
	
	
				--SET @lSql = 'ALTER TABLE ' + @lCwmTable + ' ADD WeekOfn Datetime NULL,WeekOfi Datetime NULL'
				--IF @pDebugRun = 0
				--BEGIN
				--	BEGIN TRANSACTION
				--	EXEC(@lSql)
				--	IF @@ERROR <> 0
				--		INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Add CWM WeekOfi,WeekOfn',GETDATE(),@lSql)
				--	ELSE
				--		INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Add: CWM WeekOfi,WeekOfn',GETDATE(),@lSql)
				--	COMMIT
				--END
				--ELSE
				--BEGIN
				--	PRINT @lSql			
				--	PRINT 'Go'
				--	PRINT CHAR(13)
				--END
				----------- NOT REquried for PEP-------------------------------
				IF @CWMFULL = 1
				BEGIN
					SET @lSql = 'UPDATE ' + @lCwmTable + ' SET WeekOfi = Dateadd(day, 8 - DatePart(weekday,Addate), Addate), 
							WeekOfn =  Dateadd(day, -1, Dateadd(day, 8 - DatePart(weekday,Addate), Addate)) OPTION (MAXDOP 1)'
				END
				ELSE
				BEGIN
					SET @lSql = 'UPDATE ' + @lCwmTable + ' SET WeekOfi = Dateadd(day, 8 - DatePart(weekday,Addate), Addate), 
							WeekOfn =  Dateadd(day, -1, Dateadd(day, 8 - DatePart(weekday,Addate), Addate)) 
							WHERE (WeekOfi IS NULL AND WeekOfn IS NULL) OR (WeekOfi = '''' AND WeekOfn = '''') 
							OPTION (MAXDOP 1)'
				END
			
				IF @pDebugRun = 0
				BEGIN
					BEGIN TRANSACTION
					EXEC(@lSql)
					IF @@ERROR <> 0
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error: Update CWM WeekOfi,WeekOfn',GETDATE(),@lSql)
					ELSE
						INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Update: CWM WeekOfi,WeekOfn',GETDATE(),@lSql)
					COMMIT
				END
				ELSE
				BEGIN
					PRINT @lSql			
					PRINT 'Go'
					PRINT CHAR(13)
				END
			--END								
		END
	
		--################ STEP3 :: PROCESS WEEKOF ####################################
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'End WEEKOF PROCESS','WEEKOF PROCESS Completed', GETDATE()
			
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION
		PRINT '--ERROR : ' + @lCwmTable + ' Table do not exists.'
		INSERT INTO BULog(Category,Details,DtTime,Error) VALUES(@pCategoryCode,'Error',GETDATE(),@lCwmTable + ' Table do not exists.')
		COMMIT	
	END
PRINT '-- END CWMUpdate_50 SP : ' + convert(varchar(100),current_timestamp,20)
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @pCategoryCode,'END CWMUpdate_50 SP','END CWMUpdate_50 SP', GETDATE()
			
END





GO

/****** Object:  StoredProcedure [dbo].[DebugOrExecute]    Script Date: 2/25/2019 9:16:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create Procedure [dbo].[DebugOrExecute] 
	
	@SQL varchar(8000),
	@Debug bit,
	@CatCode varchar(15),
	@Return_Val int output,
	@Details varchar(8000)=''
as
begin
	declare @ReturnValue int
	if @Debug = 1
	begin
		print replace(@SQL,char(9),'')	
		print 'GO'
		print char(13)
	end	
	else
	begin
		
		INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,@Details ,@SQL, GETDATE()
		--begin tran
		exec (@SQL)
		Select @Return_Val = @@Error
		if @Return_Val <> 0
		begin
			--rollback tran
			--begin tran
			update CategoryCode set Error = 'Error Code:' + cast(@Return_Val as varchar) + '##' + @SQL where category = @CatCode
			--commit tran
			Return
		end
		--commit
	end
	
end





GO

/****** Object:  StoredProcedure [dbo].[CreateFlyerReports]    Script Date: 2/25/2019 9:16:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[CreateFlyerReports]
(
	@CatCode VARCHAR(20),
	@SourceCWM VARCHAR(100),
	@IsDebug bit = 1,
	@IncrLoad Bit = 0,	
	@WHEREClause VARCHAR(8000) = ' WHERE 1=1 ',
	@FetchRetMktID bit = 0

)
AS

BEGIN

	Declare @ServerType AS VARCHAR(20)
			,@strDate AS DateTime
			,@IsDAA Bit
			,@CWMFULL bit
			,@ClientID integer
			,@CategoryCodeId integer
			,@CodeID integer
			,@vchrHSPClause VARCHAR(50)=''
			,@bitHSP BIT
			,@CWMTableName VARCHAR(100)
			,@SQL VARCHAR(Max) = ''
			,@mapSQL VARCHAR(max)=''
			,@FieldNames VARCHAR(max) = ''
			,@CTFieldNames VARCHAR(max) = ''
			,@CWMExpSql VARCHAR(Max) = ''			
			,@RetMktIdFlag bit =0
			,@RetIdFlag bit =0
			,@MktIdFlag bit =0
			,@TcIDFlag bit =0
			,@SqlMcc VARCHAR(MAX) = ''
			,@DeleteFilterClause VARCHAR(Max) = ''
			,@strTempRetMktTableName AS VARCHAR(100)=''
			,@Return_Val int
			,@InsertFieldNames AS VARCHAR(MAX)
			,@CTInsertFieldNames AS VARCHAR(MAX)
			,@CwmChangeCounter tinyint
			,@lTableName VARCHAR(100)
			,@lIsWeekOf bit
			,@lIsEvent bit
			,@lIsTheme bit
			,@lIsPublication bit
			,@intCategoryCodeId int
			--Changes done by Hiren for Item #19777
			,@IsEmail Bit
			,@IsCT TinyInt
			--Changes End
			,@Nsql nvarchar(max)
			,@IsMaster Int
			,@DBName Varchar(20) = DB_Name()
			,@IsInteger Int
			,@BuCH Bit
			,@CWMTableSP varchar(100) = @CatCode + 'FlyerReports'
			,@ClientCWMExceptionFlag BIT=0		
			,@IncrAdRun Bit
			,@IsAdlert Bit
				,@Clientid_TBL_Lookup INT
			,@ID_Tbl_Lookup INT
			, @stagingcolumns varchar(max)
			,@vchrControDbPrefix varchar(100)
			SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
	PRINT '-- START CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)			
	
	-- Commented by Hiren
	SET @strTempRetMktTableName = 'TempRetMkt' + @CatCode
	
	IF @FetchRetMktID = 1  
		SET @IsDebug = 1	
		
	--IF  EXISTS (SELECT * FROM sys.sysobjects WHERE name = N'tbl_lookup' AND Type='U')
	--	Exec SP_Rename 'tbl_lookup','New_tbl_lookup';
	
	IF @@SERVERNAME LIKE 'MT2A%'
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2ASQL06].[SiteControl].[dbo].[CategoryCode]
							
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR
														[MT2ASQL06].[SiteControl].[dbo].[TableNames]														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
														
																												
			--Temporary commented as Access is not given on MT2aSQL06 server

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A')
				DROP SYNONYM [dbo].[Connection_MT2A]

			CREATE SYNONYM [dbo].[Connection_MT2A] FOR [MT2aSQL06].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2A_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2A_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2A_NightlyProcessing] FOR [MT2aSQL06].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				dbo.Connection_MT2A
			WHERE
				ServerName = @@SERVERNAME
			
			SELECT 
				@strDate = MAX(CWMStart) + 1 
			FROM 
				Connection_MT2A_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL01'
			
		END
	ELSE
		BEGIN
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'CategoryCodeTable')
				DROP SYNONYM [dbo].[CategoryCodeTable]

			CREATE SYNONYM [dbo].[CategoryCodeTable] FOR
														[MT2SQL14].[SiteControl].[dbo].[CategoryCode]

			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TableNames')
				DROP SYNONYM [dbo].[TableNames]

			CREATE SYNONYM [dbo].[TableNames] FOR
														[MT2SQL14].[SiteControl].[dbo].[TableNames]														
														
			set @Nsql = 'SELECT @ID_Tbl_Lookup = ID , @Clientid_TBL_Lookup = CLIENTID from '+@vchrControDbPrefix+'Categorycode WHERE Category = '''+@CatCode+''''
			EXEC SP_EXECUTESQL @Nsql,N'@ID_Tbl_Lookup INT OUTPUT , @Clientid_TBL_Lookup INT OUTPUT',@ID_Tbl_Lookup OUTPUT , @Clientid_TBL_Lookup OUTPUT

			set @SQL = 'IF Exists ( Select top 1 * from '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Category_temp
				SELECT * INTO tbl_lookup_Category_temp FROM '+@vchrControDbPrefix+'tbl_lookup_Category_ac WHERE categorycodeid = '+cast(@ID_Tbl_Lookup as varchar(50))+'
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Category_temp]
			END		
				end
			ELSE IF Exists ( SELECT TOP 1 * FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+')
			BEGIN
				DROP TABLE tbl_lookup_Client_temp
				SELECT * INTO tbl_lookup_Client_temp FROM  '+@vchrControDbPrefix+'tbl_lookup_client WHERE clientid = '+cast(@Clientid_TBL_Lookup as varchar(50))+'
				IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N''tbl_lookup'')
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				CREATE SYNONYM [dbo].[tbl_lookup] FOR
														[dbo].[tbl_lookup_Client_temp]
											
				END		
			end
			ELSE													
				begin
				DROP SYNONYM [dbo].[tbl_lookup]
				
			CREATE SYNONYM [dbo].[tbl_lookup] FOR
														'+@vchrControDbPrefix+'[tbl_lookup_ac]
				end'

			--print @sql
			exec (@sql)
																												
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2')
				DROP SYNONYM [dbo].[Connection_MT2]

			CREATE SYNONYM [dbo].[Connection_MT2] FOR [MT2SQL14].[Connection].dbo.Adview2DataServers
			
			IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Connection_MT2_NightlyProcessing')
				DROP SYNONYM [dbo].[Connection_MT2_NightlyProcessing]

			CREATE SYNONYM [dbo].[Connection_MT2_NightlyProcessing] FOR [MT2SQL14].[Connection].dbo.NightlyProcessing
			
			SELECT 
				@ServerType = [Type]
			FROM 
				Connection_MT2
			WHERE
				ServerName = @@SERVERNAME
				
			SELECT 
				@strDate =  MAX(CWMStart) + 1 
			FROM 
				Connection_MT2_NightlyProcessing 
			WHERE 
				SQLSERVER = 'SQL00'
			
		END
		
	SELECT 
		@CWMFULL = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN 1 ELSE CWMFull END, 
		@SourceCWM = CASE WHEN @WHEREClause = 'ExceptionalCode' THEN @SourceCWM ELSE SourceCWM END,
		@CategoryCodeId = [id],
		@ClientID = ClientId ,
		@ISDAA = ISNULL(ISDAA, 0),
		@intCategoryCodeId=ID
		--Changes done by Hiren for Item #19777
		,@IsEmail = IsNull(IsEmail, 0)
		,@IsCT = IsNull(IsCT, 0)
		--Changes End
		--Temporary Integer Based ID Changes
		,@IsMaster = IsNULL(IsMaster,0)
		,@IsInteger = IsNULL(IsIntegerID,0)
		,@BuCH = ISNULL(BuCH,0)
		,@IncrAdRun = ISNULL(IncrAdRun,0)
		,@IsAdlert = ISNULL(IsAdlert,0)
		--Changes End		
	FROM 
		CategoryCodeTable 
	WHERE 
		Category = @CatCode 

		
	IF @IncrLoad = 1 AND @IncrAdRun = 1 
		SET @IncrAdRun = 1
	ELSE
		SET @IncrAdRun = 0

	IF @FetchRetMktID = 0
		BEGIN
			PRINT '--@CatCode = ' + CAST(@CatCode AS VARCHAR(50))
			PRINT '--@CWMFULL = ' + CAST(@CWMFULL AS VARCHAR(50))
			PRINT '--@SourceCWM = ' + CAST(@SourceCWM AS VARCHAR(50))
			----########################## CWM LOAD  ##########################
			PRINT '-- CWM LOAD START : ' + CONVERT(VARCHAR(100),CURRENT_TIMESTAMP,20)
		END

	SET @vchrHSPClause = ''
	
	IF EXISTS(SELECT 1 FROM MasterClientCoverage..MasterClientCWMPEP WHERE CategoryCodeId =@CategoryCodeId  AND IsHSP = 1)
		BEGIN
			SET @bitHSP = 1
			SET @vchrHSPClause = ', ISNULL(IsHSP,0) IsHSP '
		END
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempFlyerReports')
		DROP SYNONYM [dbo].[TempFlyerReports]

	EXEC ('CREATE SYNONYM [dbo].[TempFlyerReports] FOR dbo.' + @CatCode + 'FlyerReports')
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempPageReports')
		DROP SYNONYM [dbo].[TempPageReports]

	EXEC ('CREATE SYNONYM [dbo].[TempPageReports] FOR dbo.' + @CatCode + 'PageReports')
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempCatCodeCWM')
		DROP SYNONYM [dbo].[TempCatCodeCWM]

	EXEC ('CREATE SYNONYM [dbo].[TempCatCodeCWM] FOR dbo.' + @CatCode + 'ChildWebMain')
	
	


	--Hiren CWM Level Refresh
	IF @CWMFULL = 1
		BEGIN
			SET @CwmTableName =  @CatCode +'FullFlyerReports'
		END
	

	IF @IncrAdRun = 1 
		BEGIn
			SET @CwmTableName =  @CatCode +'IncrFlyerReports'
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'Start to delete exisiting flyers for IncrFlyerReports','Start to delete exisiting flyers for IncrFlyerReports', GETDATE()		
			SET @SQL = 
					'DELETE TFR FROM 
						TempFlyerReports TFR INNER JOIN MasterClientCoverage..MasterFlyerReportsdelete MCMAD ON
						TFR.FlyerID=MCMAD.FlyerID
					
					DELETE TFR FROM 
						TempFlyerReports TFR INNER JOIN acfv..tempacfvflyerreports MCMAU ON
						TFR.FlyerID=MCMAU.FlyerID
					
					DELETE TPR FROM 
						TempPageReports TPR INNER JOIN MasterClientCoverage..MasterFlyerReportsdelete MCMAD ON
						TPR.FlyerID=MCMAD.FlyerID
					
					DELETE TPR FROM 
						TempPageReports TPR INNER JOIN acfv..tempacfvflyerreports MCMAU ON
						TPR.FlyerID=MCMAU.FlyerID '
			
			

			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL 	
				
			--chnaged by prakash on 7/11/2013
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'deleted exisiting flyers for IncrFlyerReports','deleted exisiting flyers for IncrFlyerReports', GETDATE()		
			
			IF CHARINDEX('FlyerReports',@SourceCWM,1) > 0 
				SET @SourceCWM = @SourceCWM 
			ELSE
				SET @SourceCWM = @SourceCWM + 'Incr'
			
		END
		--Would be SET blank for exceptional catcodes like "Mac"
	----------P1
	IF @SourceCWM <> '' 
		-- Commented By Hiren
		-- AND @CatCode NOT IN('ad21','ad22','ad23','ad24','ad25') -- Not in Use
		BEGIN
			--DROP & Create CWM TABLE
			SET @SQL = 'IF EXISTS (	SELECT 1 
									FROM 
										SYSOBJECTS 
									WHERE 
										ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
										OBJECTPROPERTY(id, N''IsUserTable'') = 1)
						DROP TABLE [dbo].[' + @CWMTableName + ']'
			--PRINT @SQL
			IF @IsDebug = 0
				EXECUTE(@SQL)
			ELSE
				PRINT @SQL  /* chnage by prakash 10/6/2013*/ 
						--	PRINT 'Narrowing SELECTion Field names'
			-----C1
			--SET @FieldNames = 'S.'
			--IF @SourceCWM LIKE '%.%' OR @SourceCWM LIKE 'TempChildwebmain%'
			--	BEGIN
			--		SELECT 
			--			--@FieldNames = COALESCE(@FieldNames ,'') + CASE WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN LTRIM(RTRIM(CategoryValue)) ELSE LTRIM(RTRIM(CategoryValue)) + ',S.' END
			--			@FieldNames = COALESCE(@FieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
			--		FROM
			--			tbl_LookUp
			--		WHERE
			--			CategoryType = 'WithSourceCWM'
			--		SET @FieldNames = REPLACE(@FieldNames, 'S.CAST(' , 'CAST(')
			--		SELECT @InsertFieldNames = COALESCE(@InsertFieldNames ,'') + 
			--									CASE 
			--										WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
			--										WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
			--										ELSE LTRIM(RTRIM(CategoryValue))
			--									END + 
			--									','
			--		FROM
			--			tbl_LookUp
			--		WHERE
			--			CategoryType = 'WithSourceCWM'
			--	END
			--ELSE
			--	BEGIN
			--		SELECT 
			--			@FieldNames = COALESCE(@FieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
			--		FROM
			--			tbl_LookUp
			--		WHERE
			--			CategoryType = 'WithoutSourceCWM'
			--		SET @FieldNames = REPLACE(@FieldNames, 'S.CAST(' , 'CAST(')
			--		SELECT @InsertFieldNames = COALESCE(@InsertFieldNames ,'') + 
			--									--CASE 
			--									--	WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
			--									--	ELSE LTRIM(RTRIM(CategoryValue))
			--									--END + 
			--									CASE 
			--										WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
			--										WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
			--										--WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
			--										ELSE LTRIM(RTRIM(CategoryValue))
			--									END + 
			--									','
			--		FROM
			--			tbl_LookUp
			--		WHERE
			--			CategoryType = 'WithoutSourceCWM'
			--	END
			--	--C1
			

			SELECT 
						@FieldNames = COALESCE(@FieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'FLYERInsert' order by id 
					SET @FieldNames = REPLACE(@FieldNames, 'S.CAST(' , 'CAST(')
					

					SELECT @InsertFieldNames = COALESCE(@InsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'Flyer' order by id 
print 'viks'
		print @fieldnames
		print @insertfieldnames 

		--Changes done by Hiren for Item #19777
		Declare @SourceDB Varchar(100)=''
				--,@SourceCWM varchar(100)='masterclientcoverage..Tblemail'
				,@TableName Varchar(100)
				--,@NSQL Varchar(1000)
		IF CharIndex('.', @SourceCWM,1)>0 
			BEGIN
				SET @SourceDB = SUBSTRING(@SourceCWM,1,CharIndex('.', @SourceCWM, 1)-1) + '.'
				SET @TableName = SUBSTRING(@SourceCWM,CharIndex('.', @SourceCWM, 1)+ 2,LEN(@SourceCWM)-CharIndex('.', @SourceCWM, 1))
			END
		print 	@SourceDB
			print @TableName
			
			
			
				IF @isCT=1
				BEGIN

					SELECT 
						@CTFieldNames = COALESCE(@CTFieldNames ,'') + LTRIM(RTRIM(CategoryValue)) +',S.'
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'
					SET @CTFieldNames = REPLACE(@CTFieldNames, 'S.CAST(' , 'CAST(')
					SELECT @CTInsertFieldNames = COALESCE(@CTInsertFieldNames ,'') + 
												CASE 
													WHEN CHARINDEX('CAST(', LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(') AS ',LTRIM(RTRIM(CategoryValue)))+5)
													WHEN CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))>0 THEN SUBSTRING(LTRIM(RTRIM(CategoryValue)),CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4, LEN(LTRIM(RTRIM(CategoryValue)))-CHARINDEX(' AS ',LTRIM(RTRIM(CategoryValue)))+4)
													ELSE LTRIM(RTRIM(CategoryValue))
												END + 
												','
					FROM
						tbl_LookUp
					WHERE
						CategoryType = 'WithCTFields'


						SET @NSQL = 'IF (SELECT 
									Count(1) 
								FROM' + SPACE(1) + 
									@SourceDB + 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + @SourceDB + 'SYS.SYSObjects O
									ON C.ID=O.ID 
								WHERE 
									C.Name IN (' + '''' + REPLACE (left(@CTInsertFieldNames,len(@CTInsertFieldNames) -1 ),',',''',''') + '''' + ') AND 
									O.Name = ''' + @TableName + ''') = 22
								SET @isCT = 1
							ELSE 
								SET @isCT = 0'
						EXEC SP_EXECUTESQL @Nsql,N'@isCT BIT OUTPUT',@isCT OUTPUT
						

				IF @isCT=1
					BEGIN

					SET @FieldNames = @FieldNames + @CTFieldNames 
					SET @InsertFieldNames = @InsertFieldNames + @CTInsertFieldNames	
					
				END
			END

		
		

			SET @FieldNames = LEFT(@FieldNames, LEN(@FieldNames)-3)
			
			SET @InsertFieldNames = LEFT(@InsertFieldNames, LEN(@InsertFieldNames)-1)
				
		print 'viks'
		print @fieldnames
		print @insertfieldnames 
			
			--IF @IsEmail=1 
			--Begin
			--	SET @NSQL = 'IF (SELECT 
			--						Count(1) 
			--					FROM' + SPACE(1) + 
			--						@SourceDB + 'SYS.SYSColumns C INNER JOIN'  + SPACE(1) + @SourceDB + 'SYS.SYSObjects O
			--						ON C.ID=O.ID 
			--					WHERE 
			--						C.Name IN (''City'',''State'',''ZipCode'',''Gender'',''DoB'',''AgeBracket'') AND 
			--						O.Name = ''' + @TableName + ''') = 6
			--					SET @IsEmail = 1
			--				ELSE 
			--					SET @IsEmail = 0'
			--	EXEC SP_EXECUTESQL @Nsql,N'@IsEmail BIT OUTPUT',@IsEmail OUTPUT
			--	print @Nsql
			--End
			
			--IF @IsEmail = 1 
			--	BEGIN
			--		SET @FieldNames = @FieldNames + ',S.City,S.State,S.ZipCode,S.Gender,S.DoB,S.AgeBracket'
			--		SET @InsertFieldNames = @InsertFieldNames + ',City,State,ZipCode,Gender,DoB,AgeBracket'
			--	END
				
			--Changes End
			
			--Item 23261 changes start..done by prakash on 852013
			/*IF @CatCode ='ad50' 
				BEGIN
					SET @FieldNames = @FieldNames + ',S.Coupon,S.Priority,S.DateTimeRecordEntered,S.recordenteredby'
					SET @InsertFieldNames = @InsertFieldNames + ',Coupon,Priority,DateTimeRecordEntered,recordenteredby'
					
				END*/
			-- Item 23261 changes end
			
			SET @SQL = 'SELECT  ' + 
							@FieldNames + ' INTO ' + @CWMTableName + ' 
						FROM ' + 
							@SourceCWM + ' S 
						WHERE 
							1 = 2'
			print @SQL
			--Commented for Centralize FlyerID Start
			
			--IF @IsInteger = 1 
			--	BEGIN
			--		IF @IsMaster = 0 AND @IsDAA = 0 --AND @CWMFULL=1
			--			SET @SQL = REPLACE(@SQL,'SELECT  S.FlyerID,','SELECT S.OriginalFlyerID as FlyerID,')
			--	END
				
			--Commented for Centralize FlyerID End
				
			--Item #22441 Changes Start	
			
			--SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
			SET @SQL = REPLACE(@SQL, 'isNull(' , '')	
			SET @SQL = REPLACE(@SQL, ',0)' , '')	
			--Item #22441 Changes End	
				IF @IsDebug = 0
				BEGIN
					EXECUTE(@SQL)					
				END
			ELSE
				PRINT @SQL

		ENd

		SET @FieldNames = REPLACE(@FieldNames, 'S.isNull(' , 'isNull(S.')
		-----------------P1
	
	IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'TempFlyerReports')
		DROP SYNONYM [dbo].[TempFlyerReports]
		
	EXEC ('CREATE SYNONYM [dbo].[TempFlyerReports] FOR dbo.' + @CWMTableName)
	
	
	
	IF @SourceCWM <> '' AND @WhereClause = 'ExceptionalCode'  
	BEGIN
	
		SET @SQL = 'INSERT INTO TempFlyerReports (' + @InsertFieldNames + ') 
					SELECT DISTINCT ' + @FieldNames + ' 	
					FROM ' + @SourceCWM + ' S '

		Print @SQL	
		print 'viaks'
	print @insertfieldnames
	print @fieldnames 
		EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into tempFlyerReports'
		
		IF @Return_Val <> 0
			Return
	END			
	--START : FULL AUTO LOAD
	ELSE IF @SourceCWM <> '' And @WHEREClause <> 'ExceptionalCode'
		BEGIN
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE
			SET @CWMExpSql = ''
			IF EXISTS(
					SELECT 1 
					 FROM 
						MasterClientCoverage..ClientCWMException 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						FieldID NOT IN(153, 154, 155))
				BEGIN
					-- This is not being used.
					IF @IsInteger=1 and @IsMaster=0
						SET @ClientCWMExceptionFlag = 1
					
					IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'SiteControlMasterFields')
						DROP SYNONYM [dbo].[SiteControlMasterFields]
						
					IF @@SERVERNAME LIKE 'MT2A%'
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2aSQL06].SiteControl.dbo.MasterFields
					ELSE
						CREATE SYNONYM [dbo].[SiteControlMasterFields] FOR [MT2SQL14].SiteControl.dbo.MasterFields
					
					SELECT @CWMExpSql = COALESCE(@CWMExpSql ,'') + SQLWHERE 
					FROM
					(
					SELECT 
						'(S.' + FieldName + 
						CASE WHEN CHARINDEX('%',FieldValue)>0 THEN ' LIKE ' ELSE ' = ' END +
						'''' + REPLACE(FieldValue,'%','') + '''' + 
						CASE 
							WHEN ISNULL(StartDate,'') <> '' THEN 
								CASE
									WHEN ISNULL(ENDDate,'') = '' THEN 
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),@strDate,101)+ ''') OR '
									ELSE					
										' AND S.AdDate BETWEEN ''' + CONVERT(VARCHAR(20),StartDate,101) + ''' AND ''' + CONVERT(VARCHAR(20),ENDDate,101) + ''') OR '
								END
							ELSE
								') OR '
						END AS SQLWHERE
					FROM
						MasterClientCoverage..ClientCWMException CCE INNER JOIN SiteControlMasterFields MF ON
						CCE.FieldID=MF.FieldID
					WHERE 
						CategoryCodeID = @CategoryCodeID AND 
						CCE.FieldID NOT IN(153, 154, 155)
					) tbl
					
					IF LEN(@CWMExpSql) > 0 
					BEGIN
						SET @CWMExpSql = '(' + LEFT(@CWMExpSql, LEN(@CWMExpSql) - 3) + ')'	
					END
				END
		END
	--Start : Check whether there are any condition for the CategoryCode in "ClientCWMException" TABLE

		IF EXISTS	(SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetMktId IS NOT NULL
					)
			BEGIN
				SET @RetMktIdFlag = 1
				SET @SqlMcc = '	
							SELECT 
								RETMKTID,MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' +  CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '
							FROM 
								MasterClientCoverage..MasterClientCWMPEP 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ''
			END
		IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						RetId IS NOT NULL
					)
					
			BEGIN
				SET @RetIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(20),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + ' 
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.RetId = RM.RetId  and mcc.retmktid is null 
							WHERE 
								CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
		IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						MktID IS NOT NULL AND 
						TcID IS NULL)
			BEGIN
				SET @MktIdFlag = 1
				IF @SqlMcc <> ''
					SET @SqlMcc = @SqlMcc  + ' UNION '
				SET @SqlMcc = @SqlMcc  + ' 
							SELECT 
								RM.RetMktId,RM.MediaID,
								ISNULL(StartDate,''01/01/1990'') STARTDATE, 
								ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDATE ' + @vchrHSPClause + '  
							FROM 
								MasterClientCoverage..MasterClientCWMPEP MCC JOIN MasterClientCoverage..RETMKTPEP RM ON 
								MCC.MktId = RM.MktId and mcc.retmktid is null
							WHERE CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
			END
					
		IF EXISTS(	SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL)
			BEGIN
				SET @TcIDFlag = 1
				IF EXISTS(
					SELECT 1 
					FROM 
						MasterClientCoverage..MasterClientCWMPEP 
					WHERE 
						CategoryCodeID = @CategoryCodeId AND 
						TCID IS NOT NULL AND 
						MKTID IS NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
									SELECT  
										RM.RetMktId,RM.MediaID,
										ISNULL(StartDate,''01/01/1990'') StartDate,
										ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '  
									FROM 
										MasterClientCoverage..RETMKTPEP RM, 
										MasterClientCoverage..MasterClientCWMPEP MCC  '
				
						SET @SqlMcc = @SqlMcc + ' 
									WHERE 
										RM.TcId = MCC.TCId AND 
										MCC.MktId IS NULL AND mcc.retmktid is null and 
										MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				IF EXISTS(
						SELECT 1 
						FROM 
							MasterClientCoverage..MasterClientCWMPEP 
						WHERE 
							CategoryCodeID = @CategoryCodeId AND 
							TCID IS NOT NULL AND 
							MKTID IS NOT NULL)
					BEGIN
						IF @SqlMcc <> ''
							SET @SqlMcc = @SqlMcc  + ' UNION '
				
						SET @SqlMcc = @SqlMcc  + ' 
										SELECT  
											RM.RetMktId,RM.MediaID,
											ISNULL(StartDate,''01/01/1990'') StartDate,
											ISNULL(ENDDate,''' + CONVERT(VARCHAR(25),@strDate,101) + ''') ENDDate ' + @vchrHSPClause + '   
										FROM 
											MasterClientCoverage..RetMktPEP RM, 
											MasterClientCoverage..MasterClientCWMPEP MCC '
						SET @SqlMcc = @SqlMcc + ' 
										WHERE 
											RM.TcId = MCC.TCId AND 
											RM.MktId = MCC.MktId AND 
											MCC.TCID IS NOT NULL AND 
											MCC.MKTID IS NOT NULL AND mcc.retmktid is null and 
											MCC.CategoryCodeId = ' + CAST(@CategoryCodeId AS VARCHAR(10)) + ' '
					END
				END

	--Check IF CWM Load is on the basis of ClientException TABLE values.
				IF @RetMktIdFlag = 0 AND @RetIdFlag = 0 AND @MktIdFlag = 0 AND @TcIDFlag = 0
					BEGIN
						IF @CWMExpSql <> ''
							SET @CWMExpSql = ' WHERE ' + @CWMExpSql
											
						SET @SQL = '
									INSERT  INTO 
										TempFlyerReports 
									SELECT ' + 
										@FieldNames + ' 
									FROM ' + @SourceCWM + ' S '
					
										
						IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
							SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '											
														
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--Item 22441 End	
						
					

						SET @SQL = @SQL + @CWMExpSql + ' OPTION (MAXDOP 1) '
						--New Approach Partial Load
				
					--	EXEC DebugOrExecute  @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --New Approach Partial Load'
						
						IF @Return_Val <> 0
							RETURN
					END
			--Check IF CWM Load is on the basis of ClientException TABLE values.		
				ELSE
					BEGIN
						IF @FetchRetMktID = 1 
							SET @IsDebug = 0
						SET @SQL = 'IF EXISTS (SELECT 1 
												FROM 
													[TEMPDB]..SYSOBJECTS 
												WHERE 
													Name = ''' + @strTempRetMktTableName + ''' AND 
													XTYPE=''U''
												)'
						SET @SQL = @SQL + ' DROP TABLE [TEMPDB]..' + @strTempRetMktTableName + ' '

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL 
							
						IF @bitHSP = 1
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate, 
												IsHSP  INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID,
												IsHSP'
						ELSE
							SET @SqlMcc = 'SELECT 
												retmktid,MediaID,
												min(startdate) StartDate,
												max(ENDdate) ENDDate  
											INTO [TEMPDB]..' + @strTempRetMktTableName + ' 
											FROM 
												(' + @SqlMcc + ') A 
											GROUP BY 
												RetMktId,MediaID '

						IF @IsDebug = 0
							EXECUTE(@SqlMcc)
						ELSE
							PRINT @SqlMcc
							
						SET @SQL = 'CREATE CLUSTERED INDEX IDX_CLSRetMktStDt ON 
									tempdb..' + @strTempRetMktTableName + '(RETMKTID,MEDIAID,STARTDATE,ENDDATE)'

						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL
							
						IF @FetchRetMktID = 1 
						BEGIN
							SET @IsDebug = 1
							RETURN 
						END 
					
						--Commented for Centralize FlyerID End
						SET @SQL = 'INSERT INTO  
										 TempFlyerReports (' + @InsertFieldNames + ') 
									SELECT ' + 
										@FieldNames + ' 
									FROM ' + @SourceCWM + ' S '
						print 'viaks'
	print @insertfieldnames
	print @fieldnames
							
						IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
							SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '																		
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND MCC.MediaID IS NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into tempFlyerReports'
						Else
							Print @SQL						
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END

---------------------- Media Base changes --------------------------

						SET @SQL = 'INSERT INTO  
										 TempFlyerReports (' + @InsertFieldNames + ') 
									SELECT ' + 
										@FieldNames + ' 
									FROM ' + @SourceCWM + ' S '
						print 'viaks'
	print @insertfieldnames
	print @fieldnames
							
						IF @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1
							SET @SQL = @SQL + SPACE(1) + 'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '																		
												
						SET @SQL = @SQL + ' JOIN tempdb..' + @strTempRetMktTableName + ' MCC ON  
																S.RetMktId = MCC.RetMktId AND S.MediaID=MCC.MediaID AND MCC.MediaID IS NOT NULL '
						--Item 22441 Start
						IF @BuCH = 1
							BEGIN 
								IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
									BEGIN 
										IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
											NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
										ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
												S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
										ELSE
											SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
												S.TradeClass=MCA.TradeClass'

										SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

									END
								--ELSE
								--	SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
								--				S.TradeClass=MCA.TradeClass'
							END
						--ELSE
						--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')

						--Item 22441 End
						
						SET @SQL = @SQL + ' WHERE 
												(S.AdDate Between StartDate AND ENDDate) --and (s.media  !=''Newspaper'' and s.media != ''Web Promotion'' and s.media != ''email Promotion''  and s.media ! = ''Training Circular'' and  s.advertiser != ''fsi'')  '													

					

						IF @CWMExpSql <> ''							
							SET @SQL = @SQL + ' AND ' + @CWMExpSql			
						
						
						IF @bitHSP = 1
							BEGIN
								SET @SQL = @SQL + ' AND ISNULL(IsHSP,0) = 0 '
							END
							
						SET @SQL = @SQL + ' OPTION (MAXDOP 1) '
						
					
						Print @SQL
			
						IF @IsDebug = 0
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT,'--CreateClientCWMTable_50 --Insert records into tempFlyerReports'
						Else
							Print @SQL						
							
						IF @Return_Val <> 0
							Return
							
						IF @bitHSP = 1
							BEGIN
								IF @IncrAdRun = 1 
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReportsIncr')
								ELSE
									SET @SQL = REPLACE(@SQL, @SourceCWM, 'MasterClientCoverage..EphspFlyerReports')
								SET @SQL = REPLACE(@SQL, 'ISNULL(IsHSP,0) = 0', 'IsHSP = 1')
								EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
								IF @Return_Val <> 0
									Return
							END
---------------------- Media Base changes --------------------------
					END
	----------P2
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--153, 154, 155
					IF EXISTS(SELECT * FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
					BEGIN
						SET @SQL = ''
						SET @DeleteFilterClause = ''
						
						;WITH ClientCWMException (FieldName,RID,StartDate, ENDDate,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								StartDate,
								ENDDate,
								FieldID 
							FROM 
								(SELECT 
									Distinct
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									StartDate,  
									ENDDate,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						SELECT 
							RID,
							--Commented for Centralize FlyerID End
							'INSERT INTO TempFlyerReports (' + @InsertFieldNames + 
										') SELECT ' + 
											@FieldNames + SPACE(1) + 
										'FROM 
											'+@sourcecwm+' S' + SPACE(1) +
									
									CASE 
										WHEN @ISInteger = 1 AND @IsMaster = 0  AND @SourceCWM LIKE '%FlyerReports' AND @IncrAdRun =1 THEN
											'JOIN acfv..tempacfvflyerreports I ON S.FlyerID = I.Flyerid '  + SPACE(1)
										ELSE ''
									END +
											
									--Item 22441 Start
									CASE 
										WHEN @BuCH = 1 THEN
											CASE 
												WHEN EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId ) THEN
													CASE 
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
															NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
														WHEN NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														WHEN NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	THEN
															' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
																S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
														ELSE
															' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
																S.TradeClass=MCA.TradeClass'
													END
												ELSE
													SPACE(1)
													--' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													--	S.TradeClass=MCA.TradeClass'
											END
										ELSE
											SPACE(1)
										END
										--Item 22441 End								
								
										+ SPACE(1) + ' WHERE ' +  
											FieldName + ' IN (SELECT 
																	FieldValue 
																FROM 
																	MasterClientCoverage..ClientCWMException 
																WHERE
																	CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																	FieldID = ' + Cast(FieldID AS VARCHAR(10))+ ' AND 
																	IsNull(StartDate,'''') = ''' + CAST(IsNull(StartDate,'') as VARCHAR(20)) + ''' AND
																	IsNull(EndDate,'''') = ''' + CAST(IsNull(EndDate,'') as VARCHAR(20)) + '''
																) AND 
											AdDate BETWEEN ''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(StartDate,'') = '' THEN '01/01/1990' ELSE StartDate END,101) + ''' AND 
															''' + Convert(VARCHAR(20),CASE WHEN  IsNULL(ENDDate,'') = '' THEN @strDate ELSE ENDDate END ,101) + '''' 
							As Query
						INTO #Temp_ClientCWMException	
						FROM 
							ClientCWMException
						ORDER BY
							RID
						--SELECT * FROM 	#Temp_ClientCWMException							
						SET @CwmChangeCounter = @@ROWCOUNT
						
						--IF @BuCH = 0 
						--	BEGIN
						--		UPDATE #Temp_ClientCWMException 
						--			SET Query = REPLACE(Query,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
						--	END
						
						 IF @BuCH = 1 AND EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )
								UPDATE #Temp_ClientCWMException SET Query = REPLACE(Query,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

						IF @IncrAdRun = 1 
							BEGIN
								UPDATE #Temp_ClientCWMException 
									SET Query = REPLACE(Query,'Masteracfv..acfvflyerreports','acfv..tempacfvflyerreports')
									--Commented for Centralize FlyerID Start
									--,
									--	MAPQuery = REPLACE(MAPQuery,'MasterAdviewData.dbo.AdViewMain','MasterClientCoverage.dbo.AdviewMainUpdate')
									--Commented for Centralize FlyerID End
							END
					
						WHILE @CwmChangeCounter > 0 
							BEGIN
								SELECT 
									@SQL = 
										CASE 
											WHEN @IncrAdRun = 1 
											THEN Query +
												' AND Flyerid NOT IN(SELECT FLYERID FROM TempFlyerReports' + ')' --+
											ELSE
												Query
											END
								FROM 
									#Temp_ClientCWMException 
								WHERE 
									RID = @CwmChangeCounter
								ORDER BY
									RID DESC									
									
								IF @IsDebug = 0
									BEGIN	
										PRINT @SQL
										EXEC(@SQL)
									END
								ELSE
									BEGIN
										PRINT @SQL 
										PRINT @mapSQL
									END
								
								SET @CwmChangeCounter = @CwmChangeCounter - 1
							END	
						DROP TABLE #Temp_ClientCWMException
						
						--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							
						;WITH ClientCWMException (Query,ID,FieldID) AS 
						(
							SELECT 
								FieldName, 
								Row_Number() OVER (ORDER BY FieldID) AS RN,
								FieldID 
							FROM 
								(SELECT 
									Distinct 
									CASE WHEN FieldId=153 THEN 'RetMktId' WHEN FieldId=154 THEN 'RetId' WHEN FieldId=155 THEN 'MktId' END AS FieldName,
									FieldID
								FROM 
									MasterClientCoverage..ClientCWMException
								WHERE
									CategoryCodeID = @CategoryCodeId AND 
									FieldID IN(153, 154, 155)
								)DT
						)
						,GetExecutableQuery (FId, Query) AS
						(
							SELECT 
								1, CAST('' AS VARCHAR(MAX)) 
							UNION ALL
							SELECT 
								B.FId + 1, B.Query +  CAST(A.Query AS VARCHAR(MAX)) + ' IN (SELECT 
																								FieldValue 
																							FROM 
																								MasterClientCoverage..ClientCWMException 
																							WHERE
																								CategoryCodeID = ' + Cast(@CategoryCodeId AS VARCHAR(10)) + ' AND  
																								FieldID = ' + Cast(FieldID AS VARCHAR(10))+ '
																							) OR (' 
							FROM 
								ClientCWMException A INNER JOIN GetExecutableQuery B ON A.ID = B.FId 
						)
						SELECT 
							TOP 1 @DeleteFilterClause = LEFT(Query, LEN(Query)-5) 
						FROM 
							GetExecutableQuery 
						ORDER BY 
							FId DESC
						--Print 'cursor ends -2'									
						--PRINT @DeleteFilterClause	
						--EXEC DebugOrExecute @DeleteFilterClause, @IsDebug, @CatCode, @Return_Val OUTPUT
						--Print 'cursor ends'	
					END
	--Start : Check Whether Pull is to be done FROM AdviewMain
	--Start : Check for "PRDHSP"
					--Commented By Hiren
					--IF @CatCode IN('PRDHSP','mfdHisp','mfdTtl') Or @CatCode = 'ADV13GR'
					IF @CatCode IN('PRDHSP','mfdHisp50','mfdTtl50','ADV13GR')
						BEGIN

							SET @SQL = 'INSERT INTO ' + @CWMTableName + '(' + @InsertFieldNames + ') 
									SELECT ' + 
										@FieldNames + 
									' FROM 
										MasterClientCoverage..EPHSPFlyerReports S '
										
							--Item 22441 Start
							IF @BuCH = 1
								BEGIN
									IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
										BEGIN 
											IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
												NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
											ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
													S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
											ELSE
												SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
													S.TradeClass=MCA.TradeClass'
												SET @SQL = REPLACE(@SQL,'S.Channel,','CAST(MCA.Channel as varchar(100)) as Channel,')

										END
									--ELSE
										--SET @SQL = @SQL + ' LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
										--			S.TradeClass=MCA.TradeClass'
								END
							--ELSE
							--	SET @SQL = REPLACE(@SQL,'CAST(MCA.Channel as varchar(100)) as Channel','CAST('''' as varchar(100)) as Channel')
							--Item 22441 End	
										
							IF @IncrAdRun = 1
							BEGIN
								SET @SQL = @SQL + ' WHERE Flyerid NOT IN(SELECT FLYERID FROM TempFlyerReports)' --Temp Incremental TABLE
								SET @SQL = REPLACE(@SQL, 'MasterClientCoverage..EPHSPFlyerReports', 'MasterClientCoverage..EphspFlyerReportsIncr')								
								--SET @SQL = @SQL + ' AND Flyerid NOT IN(SELECT FLYERID FROM TempCatCodeCWM)' --Actual CWM TABLE.
							END
							Print @SQL
							EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val OUTPUT
							IF @Return_Val <> 0
								Return				
						END
					--END : Check for "PRDHSP"
			END
	--END : FULL AUTO LOAD	

	-------------P3
				IF @CWMFULL = 1
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)	
						IF @ServerType = 'Master' OR (@ServerType = 'Client' AND @@servername = 'MT2SQL00')
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMFullRundate = ''' + Cast(@strDate as Varchar(20))+ ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMFullRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				IF @IncrAdRun = 1
					BEGIN
						SELECT @strDate = CAST(GETDATE() AS VARCHAR(30)) --CONVERT(VARCHAR(25),GETDATE(),101)
						IF @ServerType = 'Master'	
							SET @SQL = 'UPDATE CategoryCodeTable SET CWMPartialRundate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						ELSE
							SET @SQL = 'UPDATE CategoryCodeTable SET ClientCWMPartialRunDate = ''' + Cast(@strDate as Varchar(20)) + ''' WHERE Category = ''' + @CatCode + ''''
						--PRINT @SQL
						IF @IsDebug = 0
							EXECUTE(@SQL)
						ELSE
							PRINT @SQL	
					END
				----########################## CWM LOAD  ##########################
				--########################## CWM CHANGES  ##########################
				--PRINT '-- CWMCHANGES START : ' + convert(VARCHAR(100),current_timestamp,20)
				--chnaged by prakash on 7/12/2013
				--INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMCHANGES START ','CWMCHANGES START', GETDATE()
	
				--SET @CwmChangeCounter = 1
				
				--Commented By Hiren
				--SET @CwmChangesWHEREClause = ''
	--IF @CWMChanges = 1 
	--IF EXISTS(SELECT * FROM MasterClientCoverage.dbo.ClientCwmChanges WHERE ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId)
	--BEGIN
	--------------------------------------------------kishan----------------------------------------
--	declare @select varchar(max)
----declare @sql varchar(max)
----insert into cargPepFlyerReports

--SELECT --T.CATEGORYCODEID, 
--       @select= STUFF((SELECT ' OR ' + x.EXISTINGVALUE 
--                FROM MasterClientCoverage..CLIENTCWMCHANGES x
--               WHERE x.CATEGORYCODEID = t.CATEGORYCODEID AND CODEID = 84
--						--AND  X.CODEID = T.CODEID
--            GROUP BY x.EXISTINGVALUE
--             FOR XML PATH ('')), 1, 3,'') --AS ABC

--  FROM MasterClientCoverage..CLIENTCWMCHANGES t WHERE CATEGORYCODEID = @CategoryCodeId AND CODEID = 84
----GROUP BY t.CATEGORYCODEID
----print @abc
--set @sql = ' insert into ' + @CWMTableName + '('+@insertfieldnames+') select '+@insertfieldnames+' from ' + 
--							@SourceCWM + ' where addate >= ''01/01/2015'' and ('+ @select+')'
--print( @sql)
--exec (@sql)


--		;WITH ClientCWMChanges (FieldName,ID,RID, ExistingValue, NewValue, ExecutionOrder, CodeID_Main) AS 
--		(
--			SELECT  
--				FieldName, 
--				Row_Number() OVER (Partition BY CodeID,ExecutionOrder ORDER BY ExecutionOrder, CodeID) AS ID,
--				Row_Number() OVER (ORDER BY ExecutionOrder, CodeID) AS RID,
--				ExistingValue,
--				NewValue,
--				ExecutionOrder,
--				CodeID
--			FROM 
--				(SELECT 
--					DISTINCT 
--					CASE 
--						WHEN CodeID = 12 THEN 'Market' 
--						WHEN CodeID = 13 THEN 'Advertiser' 
--						WHEN CodeID = 14 THEN 'TradeClass' 
--						WHEN CodeID = 15 THEN 'Media' 
--						--when codeid= 84 then ''
--					END AS FieldName,
--					ExistingValue,
--					NewValue,
--					CASE 
--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) = 0 THEN 1

--						WHEN CodeID = 14 AND CHARINDEX('RetID',ExistingValue) > 0 THEN 2

--						WHEN CodeID <> 14 THEN 3
--					END AS ExecutionOrder,
--					CodeID
--				FROM 
--					MasterClientCoverage.dbo.ClientCwmChanges
--				WHERE
--					--ClientID = @ClientID AND
--					CategoryCodeID = @CategoryCodeId
--				)DT
--		)
--		,GetExecutableQuery (RowNum, Query, CodeID, Field_Name) AS
--		(
--			SELECT 
--				1, 
--				CAST('' AS VARCHAR(MAX)) ,0,CAST('' AS VARCHAR(100))
--			UNION ALL
--			SELECT 
--				1 + B.RowNum, 
--				CASE 
--					WHEN A.CodeID_Main = 11 THEN 
--						CASE 
--						WHEN ID = 1 THEN 
--							'Delete  FROM ' + @CWMTableName + ' WHERE ' 
--						ELSE 
--							B.Query 
--						END +  ExistingValue + ' OR '
--					ELSE
--						CASE 
--						WHEN ID = 1 THEN 
--							'UPDATE ' + @CWMTableName + ' SET ' + FieldName + ' = CASE ' 
--						ELSE 
--							B.Query 
--						END +  'WHEN ' + ExistingValue + ' THEN ' + NewValue + SPACE(1)
--					END,
--				 CASE WHEN B.CodeID <> A.CodeID_Main THEN A.CodeID_Main ELSE B.CodeID  END,
--				 CAST(FieldName AS VARCHAR(100))
--			FROM 
--				ClientCWMChanges A INNER JOIN GetExecutableQuery B ON 
--				A.RID=B.RowNum
--		)
--		SELECT 
--			CASE CodeID
--				WHEN 11 THEN LEFT(Query ,LEN(Query)-3)
--			ELSE
--				Query + 'ELSE ' + Field_Name + ' END'	
--			END AS Query,
--			ROW_NUMBER() OVER (Order BY CodeID)	AS RID
--			INTO #Temp
--		FROM 
--			GetExecutableQuery T2 INNER JOIN
--			(
--			SELECT MAX(RID)+1 AS RID FROM ClientCWMChanges GROUP BY FieldName,ExecutionOrder
--			) T1 ON T1.RID=T2.RowNum
--		OPTION (MAXRECURSION 0)
--		--Select * from #temp
--		SET @CwmChangeCounter = @@ROWCOUNT
		
--		WHILE @CwmChangeCounter > 0 
--			BEGIN
--				SELECT @SQL = Query FROM #Temp WHERE RID = @CwmChangeCounter
--				IF @IsDebug = 0
--					BEGIN	
--						EXEC(@SQL)
--					END
--				ELSE
--					PRINT @SQL 
				
--				SET @CwmChangeCounter = @CwmChangeCounter - 1
--			END	
--		DROP TABLE #Temp
--	--Added for Renamed Adv\Mkt\Mkt\TC
--	;With CTE 
--	As
--	(
--	SELECT Distinct CodeID,CASE WHEN CodeID = 12 THEN 'Market' WHEN CodeID = 13 THEN 'Advertiser'WHEN CodeID = 14 THEN 'TradeClass'WHEN CodeID = 15 THEN 'Media' END as Field
--	FROM MasterClientCoverage.dbo.ClientCwmChanges  WHERE  CodeID <> 11 AND ClientID = @ClientID AND CategoryCodeID = @CategoryCodeId 
--	)
--	Select Row_Number () Over( Order By CodeID) RID,'INSERT INTO 
--				IDDB.dbo.'+ Field +' ('+ Field +') 
--			Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From ' + @CWMTableName + '  Except Select 
--				DISTINCT ISNULL('+ Field +', '''')
--			From  
--				IDDB.dbo.'+ Field +'' as IQuery,
--			'Update F Set '+ Field +'ID =I.'+ Field +'ID
--					From ' + @CWMTableName + ' F 
--					Left Join IDDB..'+ Field +' I on I.'+ Field +'=F.'+ Field +'' as UQuery
--	Into #IDDBRenamingUpdate
--	From CTE

--	SET @CwmChangeCounter = @@ROWCOUNT
		
--	WHILE @CwmChangeCounter > 0 
--		BEGIN
--			SELECT @SQL = IQuery,@nSQL=UQuery FROM #IDDBRenamingUpdate WHERE RID = @CwmChangeCounter
--			IF @IsDebug = 0
--				BEGIN	
--					EXEC(@SQL)
--					EXEC(@nSQL)
--				END
--			ELSE
--				BEGIN
--					PRINT @SQL 
--					PRINT @nSQL
--				END
--			SET @CwmChangeCounter = @CwmChangeCounter - 1
--		END	
--	DROP TABLE #IDDBRenamingUpdate
--	ENd
	--------------------------------------------kishan---------------------------------------------------	
	
	--Item#23659 Changes for Updating Retid, MktID and RetMKTID
	
	SET @SQL= 
			'UPDATE F 
			SET 
				F.MktId=R.MKTID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.MktID <> R.MKTID AND F.Market = R.Market;

			UPDATE F 
			SET 
				F.RetId=R.RetID
			FROM 
				MasterClientCoverage..RETMKTPEP R JOIN ' + @CWMTableName + ' F 
					ON F.RetId <> R.RetID AND F.Advertiser = R.Advertiser;
					
			UPDATE F 
			SET 
				F.RetMktId=R.RetMktID
			FROM 
				MasterClientCoverage..RETMKTPEP R  JOIN ' + @CWMTableName + ' F 
					ON R.Advertiser=F.Advertiser and R.Market=F.Market 
			WHERE R.RetMktID<>F.RetMktId'
			
	IF 	@IsDebug=0
		BEGIN
			EXEC(@SQL)
		END	
	ELSE	
		BEGIN
			Print @SQL
		END			
	----P4
	--########################## CWM CHANGES  ##########################
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	IF @IncrAdRun = 1
		BEGIN
			
			PRINT '5.0 incr'
			-- change by praksh on 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,0
				END	
			ELSE	
				BEGIN
					EXEC [PopulateFlyerReports] 'Incr', '', '', @CatCode, 0,1
				END
				
			--Delete On Basis of SourceCWM TABLE				
			SET @SQL = 'DELETE 
						FROM 
							TempFlyerReports 
						WHERE 
							FlyerId NOT IN(	SELECT 
												FlyerId 
											FROM ' + 
												@SourceCWM + ') AND 
							FlyerId NOT LIKE ''FT%'''

			IF @bitHSP = 1
				SET @SQL = @SQL + Space(1) + 'AND 
							FlyerId NOT IN (SELECT 
												FlyerId 
											FROM 
												MasterClientCoverage..EphspFlyerReports)'
			--Start : Check Whether Pull is done from AdviewMain for the CategoryCode
			--153, 154, 155
			IF EXISTS(SELECT 1 FROM MasterClientCoverage..ClientCWMException WHERE CategoryCodeID = @CategoryCodeId AND FieldID IN(153, 154, 155))
				BEGIN
					IF LEN(@DeleteFilterClause) > 0
						SET @DeleteFilterClause = LEFT(@DeleteFilterClause,LEN(@DeleteFilterClause) - 3)
					SET @SQL = @SQL + ' AND NOT(' + @DeleteFilterClause + '))'	
					--SET @SQL = @SQL + ' AND FlyerId NOT IN (SELECT FlyerId FROM ' + @CwmTableName + ')'
				END
				
			--EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output

			IF @Return_Val <> 0
				Return		
			
		END
	--Transfert Partial Records To The Main CWM TABLE And DROP PartialTable.
	ELSE
		BEGIN
		--Full
			PRINT '5.0 full'
			--change by prakash 13/06/2013
			IF 	@IsDebug=0
				BEGIN
					EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,0
				END	
			ELSE
				BEGIN
				  EXEC [PopulateFlyerReports] 'Full', '', '', @CatCode, 1,1			  
				END
		END
		PRINT 'after  5.0'
		
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CWMUPDATE START ','CWMUPDATE START', GETDATE()	
	PRINT '-- CWMUPDATE START : ' + convert(varchar(100),current_timestamp,20)
	
	--APPLY CWMUPDATE - updated for 50
	EXECUTE CWMUPDATE_50 @CatCode ,@IsDebug
	
	--Update the CWM Media if not DAA for certain 360 Flyers
	If @IsDAA=0 AND @IsAdlert = 0
	BEGIN
		SET @SQL = 'Update CWM set Media = ''Insert-Paper'', MediaId=15
		from ' + @CatCode + 'FlyerReports CWM
		inner join MasterClientCoverage.dbo.FlyersToChangeToPrint360 F360 on F360.FlyerId = CWM.FlyerID '

		IF @IsDebug = 0
			EXECUTE(@SQL)
		ELSE
			PRINT @SQL
	END

	--Item 22441 Start
	IF @BuCH = 1
		BEGIN 
			IF EXISTS(SELECT TOP 1 * From MasterClientCoverage..CategoryChannelAssignment Where CategoryCodeID=@CategoryCodeId )									
				BEGIN 
					IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='') AND 
						NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')	
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))
					ELSE IF NOT EXISTS(SELECT Distinct TradeClass FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Tradeclass, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE IF NOT EXISTS(SELECT Distinct Advertiser FROM MasterClientCoverage.dbo.CategoryChannelAssignment WHERE CategoryCodeID=@CategoryCodeId AND ISNULL(Advertiser, '') ='')												
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.CategoryChannelAssignment MCA ON
							S.Advertiser=MCA.Advertiser AND MCA.CategoryCodeID = ' + CAST(@CategoryCodeId AS VARCHAR(10))	
					ELSE
						SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
							S.TradeClass=MCA.TradeClass'
				END
			--ELSE
			--	SET @SQL = 'UPDATE S SET S.Channel = MCA.Channel FROM ' + @CatCode + 'FlyerReports S LEFT OUTER JOIN MasterClientCoverage.dbo.MasterChannelAssignment MCA ON
			--		S.TradeClass=MCA.TradeClass'
			IF @IsDebug = 0
				 BEGIN
			 		EXECUTE(@SQL)
				 END
			ELSE
				BEGIN
					PRINT @SQL
				END
					
			EXEC mt_proc_Create_ID_Update @CWMTableSP, 'Channel',@IsDebug		
		END

	--Item 22441 End		

	--Item:19751

	Declare @intAdDate int
			--,@vchrControDbPrefix varchar(100)=dbo.mtfunc_GetDatabasePrefix('Control')
	
	SET @Nsql = 'SELECT @intAdDate  = count(1) FROM ' + @vchrControDbPrefix + 'vw_MerchandiseCategory   
			WHERE CategoryCodeId = @intCategoryCodeId AND (ISNULL(StartDt,'''')<> '''' or ISNULL(EndDt,'''')<> '''')'
	exec sp_executesql @Nsql,N'@intAdDate int output,@intCategoryCodeId int',@intAdDate  output,@intCategoryCodeId		
	IF @intAdDate > 0
	BEGIN
	SET @sql='IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].['+ @CatCode + 'FlyerReports]'') AND name = N''idx_'+ @CatCode + 'FlyerReportsAdDate'')
				DROP INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] WITH ( ONLINE = OFF )
			CREATE NONCLUSTERED INDEX [idx_'+ @CatCode + 'FlyerReportsAdDate] ON [dbo].['+ @CatCode + 'FlyerReports] 
			(
			[AdDate] ASC
			)
			INCLUDE ( [FlyerID])'
	IF @IsDebug = 0
	EXECUTE(@SQL)
	ELSE
	PRINT @SQL
	END
	--########################## CREATE DEPENDENT TABLES. ##########################
	--Adview2Control Changes
	PRINT '-- CREATE DEPENDENT TABLES START : ' + convert(varchar(100),current_timestamp,20)
	--chnaged by prakash on 7/12/2013
    INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'CREATE DEPENDENT TABLES START  ','CREATE DEPENDENT TABLES START ', GETDATE()	
	
	Select 
		@lIsEvent = ISNULL(IsEvent,0), 
		@lIsTheme = ISNULL(IsTheme,0), 
		@lIsPublication = ISNULL(IsPublication,0) 
	From 
		CategoryCodeTable 
	Where 
		Category = @CatCode 
	
	
	--Publication
	SET @lTableName = @CatCode + 'Publication'
	IF EXISTS (select * from sysobjects where id = object_id(@lTableName) and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		BEGIN
			SET @SQL = 'DROP TABLE ' + @lTableName
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'drop Publication table'
		END
	IF @lIsPublication = 1
		BEGIN
			SET @SQL = 'SELECT DISTINCT Publication INTO ' + @lTableName + ' From ' + @CatCode + 'FlyerReports'
			EXEC DebugOrExecute @SQL, @IsDebug, @CatCode, @Return_Val output,'create and insert disitinct publication in new table'
		END
		


	IF @IsDebug=0
		BEGIN
			--Change by prakash on 14/06/2013
			PRINT ' EXECUTE mt_proc_Create_ID_Update SP for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',0
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',0
			--Changes end		
		END
	ELSE
		BEGIN
		   --Change by prakash on 14/06/2013
			PRINT ' Print  mt_proc_Create_ID_Update SPs all statements for Region,Disitrict,Salesterritory,salesteritorygroup,salesteritorysubgroup '		
			--Changes made by Hiren on 06-04-2013
			--EXEC mt_proc_Create_FlyerReports_ID_Update @CatCode
			exec mt_proc_Create_ID_Update @CWMTableSP, 'Region',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'District',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritory',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritoryGroup',1
			exec mt_proc_Create_ID_Update @CWMTableSP, 'SalesTerritorySubGroup',1
		 END



--Changes by praksh on 14/06/2013
	IF @IncrAdRun = 1
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports] @SourceCWM, '', '', '', @CatCode, 0,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports] @SourceCWM, '', '', '', @CatCode, 0,1
				END			
		END	
	ELSE
		BEGIN
			IF @IsDebug=0
				BEGIN
					EXEC [PopulatePageReports] @SourceCWM, '', '', '', @CatCode, 1,0
				END
			ELSE
				BEGIN
					EXEC [PopulatePageReports] @SourceCWM, '', '', '', @CatCode, 1,1
				END
		END
				
	IF @IsDebug=0
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,0
		END
	ELSE
		BEGIN
			
			EXEC mt_proc_Create_DisplayTables @CatCode, 1, null, @lIsEvent, @lIsTheme,1
		END
--Start: drop temp fullCWM and incrCWM tables after code is processed 
SET @SQL = 'IF EXISTS (	SELECT 1 
		FROM 
			SYSOBJECTS 
		WHERE 
			ID = OBJECT_ID(N''' + @CWMTableName + ''') AND 
			OBJECTPROPERTY(id, N''IsUserTable'') = 1)
DROP TABLE [dbo].[' + @CWMTableName + ']'

IF @IsDebug = 0
EXECUTE(@SQL)
ELSE
PRINT @SQL  
--End: drop temp fullCWM and incrCWM tables after code is processed 
--chnaged by prakash on 7/11/2013
INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @CatCode,'END CreateClientCWMTable_50 SP ','END CreateClientCWMTable_50 SP', GETDATE()
	
PRINT '-- END CreateClientCWMTable_50 SP : ' + convert(varchar(100),current_timestamp,20)














GO

/****** Object:  StoredProcedure [dbo].[AC_FV_Backup_Restore_Database]    Script Date: 2/25/2019 9:16:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Divyang Patel
-- Create date: 24.07.2017
-- Description:	Restore Database
-- Execution Call: EXECUTE AC_FV_Backup_Restore_Database 'ACFVINCR', '', 'D:\SQLData\', '@FileName', 1, 1 -- Database Restore
-- Execution Call: EXECUTE AC_FV_Backup_Restore_Database 'ACFVINCR', '', '', '', 2, 1 -- Database Backup
-- =============================================
Create PROCEDURE [dbo].[AC_FV_Backup_Restore_Database] 
	-- Add the parameters for the stored procedure here
	@dbName varchar(100)
	, @backupLoc varchar(2000) = ''
	, @restoreLoc varchar(2000) = ''
	, @FileName varchar(250) = ''
	, @dboperation int
	, @isDebug int
AS
BEGIN

	SET NOCOUNT ON;

    Declare @SQL varchar(max)
			--, @backupLoc varchar(2000) = ''
			--, @restoreLoc varchar(2000) = ''
			--, @FileName varchar(250) = ''
			--, @dboperation int
			--, @isDebug int
			
	IF(@dboperation = 1)
	Begin
			Print 'Database Restore Starts'

			IF(@dbName = 'ACFVINCR') OR (@dbName = 'ACFVDEV')
				SELECT @backuploc = BackupLocation FROM [MT2SQL14].[Connection].dbo. AdviewBackupLocation WHERE BackupType = 'ACFV'
			Else
				SELECT @backuploc = BackupLocation FROM [MT2SQL14].[Connection].dbo. AdviewBackupLocation WHERE BackupType = @dbName


			IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name =@DBName)
			Begin
					SET @SQL =	'
									EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N''' + @dbName + '''
								'
					IF(@isDebug = 0)
						Exec (@SQL)
					Else
						Print @sql

					SET @SQL =	'
									ALTER DATABASE [' + @dbName + '] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
								'
					IF(@isDebug = 0)
						Exec (@SQL)
					Else
						Print @sql


					SET @SQL =	'
									DROP DATABASE [' + @dbName + ']
								'
					IF(@isDebug = 0)
						Exec (@SQL)
					Else
						Print @sql
			End


			SET @SQL =	'
							Restore Database ' + @DBName + ' 
							From Disk =''' + @backuploc + @FileName + '.bak'' 
							with Recovery, Replace,
							MOVE ''' + @dbName + ''' TO ''' + @restoreLoc + @dbName + '.mdf'', 
							MOVE ''' + @dbName + '_LOG'' TO ''' + @restoreLoc + @dbName + '_log.ldf''
						'
			IF(@isDebug = 0)
				Exec (@SQL)
			Else
				Print @sql
	End

	IF(@dboperation = 2)
	Begin
			Print 'Database Backup Starts'

			IF(@dbName = 'ACFVINCR') OR (@dbName = 'ACFVDEV')
				SELECT @backuploc = BackupLocation FROM [MT2SQL14].[Connection].dbo. AdviewBackupLocation WHERE BackupType = 'ACFV'
			Else
				SELECT @backuploc = BackupLocation FROM [MT2SQL14].[Connection].dbo. AdviewBackupLocation WHERE BackupType = @dbName

				
			SET @SQL =	'
							BACKUP DATABASE ' + @DBName + ' To Disk = ''' + @backuploc + @dbname + '.bak'' WITH INIT
						'
			IF(@isDebug = 0)
				Exec (@SQL)
			Else
				Print @sql
	End



	

			
END


GO


