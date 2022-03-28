
Declare @IsFull bit
Declare @CategoryCodeID int
Declare @NSQL NVARCHAR(4000)
Declare @SpotFireDBName sysname
Declare @SpotFireTableName sysname
Declare @ControlDBPrefix varchar(100)
Declare @SQL varchar(8000)
Declare @SPOTFIRE_TABLE_NAME1 VARCHAR(100)
Declare @FieldsTableName VARCHAR(100)
Declare @isIntegerID bit
SET @CategoryCodeID = 320
SET @SpotFireDBName = 'SPOTFIRE_PG'
SET @SpotFireTableName = 'SPOTFIRE_CAN'
Select @ControlDBPrefix = dbo.mtfunc_GetDatabasePrefix('Control')
SET @NSQL = N'Select @IsFull = IsFull,@isIntegerID=isIntegerID From  ' + @ControlDBPrefix + 'CategoryCode Where ID=' + cast(@CategoryCodeID as varchar)
execute sp_executesql @NSQL, N'@IsFull bit output,@isIntegerID bit output', @IsFull OUTPUT,@isIntegerID output

SET @FieldsTableName  = @ControlDBPrefix + 'MasterFields'
SET @SPOTFIRE_TABLE_NAME1 = @SpotFireDBName + '..' + @SpotFireTableName

set @IsFull = 1

set @SQL = 'if exists(select name from ' + @SpotFireDBName + '..sysobjects where name = ''' + @SpotFireTableName + ''' and xtype = ''u'')
		drop table ' + @SpotFireDBName + '..' + @SpotFireTableName 
Exec(@SQL)


SET @SQL = ' Select 
 PDT.PageDetailID, 
''/ImageViewer.asp?BA8E341D95B8432D='' + PDT.PageDetailID + ''&AID='' as [Product Image],
''/ImageViewer.asp?F4E336FFEDF24678='' + pdt.flyerid + ''&Z39EB0EBDCF35191='' + cast(page as varchar) + ''&AID='' As [Page Image],
[Advertiser] AS [Account],
Cast([AdDate] as smalldatetime) AS [Ad Date],
[Media] AS [Media Type],
[Market] AS [Market],
[Category] AS [Category],
[Brand] AS [Brand],
[Comments1] AS [Item Description],
Cast([SalePrice1] AS Numeric(9,2)) AS [Sale Price],
Cast([RegularPrice1] AS Numeric(9,2)) AS [Reg. Price],
Cast([NORPrice] AS Numeric(9,2)) AS [NOR Price],
Cast([UnitPrice] AS Numeric(9,2)) AS [Unit Price],
[RequiredQuantity] AS [Pur Qty],
[CouponValueP1] AS [% Off],
Cast([CouponValueD2] AS Numeric(9,2)) AS [$ Off],
Cast([OtherDiscountD2] AS Numeric(9,2)) AS [Rtl Cpn $],
Cast([OtherDiscountD1] AS Numeric(9,2)) AS [Mfr Cpn $],
[NumberPackage] AS [Limit],
Cast([LowestDiscountPrice] AS Numeric(9,2)) AS [Save Up To],
[TaggedCompany] AS [Ad Type],
[MPVPageEvent] as PageEvent,
[Features] AS [Page Position],
Cast([SaleStartDate] as smalldatetime) AS [Sale Start Date],
cast([SaleEndDate] as smalldatetime) AS [Sale End Date],
[MerchandiseCategory] AS [Selling Stream],
[MerchandiseSubCat] AS [Category Group],
[Manufacturer] AS [Manufacturer]
Into ' + @SpotFireDBName + '..' + @SpotFireTableName  +
' from MT2SQL15.SQL15.DBO.pngca50DetailReports pdt  '

 Exec(@SQL)
-- print getdate()
--  Execute datasp..procMergeMPVField 'MPVPageEvent',  @SPOTFIRE_TABLE_NAME1 , 'SQL15..PGCORPMULTIPLEPAGEVALUES'

print getdate()

SET @SQL = 'Alter Table ' + @SPOTFIRE_TABLE_NAME1 + ' Drop Column PageDetailID'
Exec(@SQL)


SET @SQL = @SpotFireDBName + '..' + 'sp_rename ''' + @SpotFireTableName + '.[PageEvent]'', ''Promotions'', ''COLUMN'''
Exec(@SQL)