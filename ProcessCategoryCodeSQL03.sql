use conversioncontrol

Declare @nsql nvarchar(max)
DECLARE @DestFolder varchar(100)
DECLARE @SourceFolder varchar(100)
DECLARE @vcFileName varchar(200)
DECLARE @vcCmdLine varchar(200)
DECLARE @ZipFileName varchar(255)
DECLARE @DBCategory varchar(255)
DECLARE @ClientName varchar(255)
DECLARE @result int
DECLARE @sql varchar(8000)
DECLARE @IndexType integer
DECLARE @CatCode varchar(15)
DECLARE @CatPDTTable varchar(50)
DECLARE @CatMPVTable varchar(50)
DECLARE @CatCWMTable varchar(50)
DECLARE @CatPagesTable varchar(50)
DECLARE @TableNames varchar(255)
DECLARE @MasterCategoryCode varchar(255)
DECLARE @ConversionStart VARCHAR(50)
DECLARE @DAA bit
DECLARE @Seq int
Declare @ClientID int
Declare @IncrementalLoad bit
Declare @IsPDT bit
DECLARE @ConversionDataDb VARCHAR(50)
DECLARE @subjectLine as VARCHAR(100)
DECLARE @Is50 as int
DECLARE @subject as varchar(255)
DECLARE @body as varchar(8000)
DECLARE @crlf as char(2)
DECLARE @errorid as int
set @crlf = char(13)+char(10)

SET @ConversionDataDb = 'SQL03'
SET @SourceFolder = '\\mt2ftp\FTP\Chicago\ADlertToFVConversion\'
SET @DestFolder = 'E:\ConversionTemp\'

set @DBCategory = ''
set @ClientName = ''
set @IndexType = -1
set @DAA = 0
set @IsPDT = 0
IF DATEPART(hh,GETDATE()) IN(21,22,23)
	SELECT @ConversionStart = CAST(CONVERT(VARCHAR,GETDATE()+1,101) AS DATETIME) 
ELSE
	SELECT @ConversionStart = CAST(CONVERT(VARCHAR,GETDATE(),101) AS DATETIME) 
	

update cc
set cc.ftpstatus = 1, cc.ftptime = m.ftptime
from conversioncontrol..ConversionCategory cc
join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
join mt2sql01.conversioncontrol.dbo.ConversionCategory m on cc.databasecategory = m.databasecategory
where cc.ftptime < m.ftptime

select top 1 @DBCategory = ltrim(rtrim(cc.DatabaseCategory)), @ClientName = ltrim(rtrim(cc.ClientName)), 
@IndexType = cc.IndexType, @DAA = cc.DAA, @Is50 =cc.Is50 
from conversioncontrol..ConversionCategory cc
join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
where cc.ftpstatus = 1
order by cc.[sequence]

set datefirst 1
if (datepart(dw,getdate()) in (1,2,3,4,5) 
		and datepart(hh,getdate()) >= 8 
		and datepart(hh,getdate()) < 17)
	or (exists (select *
				from mt2sql14.connection.dbo.vwNightlyProcessingCurrent
				where servername = 'mt2SQL03'
				and processing = 1))
begin
	set @DBCategory = ''
end


While not @DBCategory=''
Begin
	use conversioncontrol 
	select @MasterCategoryCode = @DBCategory
	update conversioncontrol..conversioncategory set ftpstatus = 0, ConversionDone = 0, ClientXferDone = 0, MasterXferDone = 0
		where databasecategory = @DBCategory

	declare mergecategorycur cursor for select @DBCategory as DatabaseCategory, @ClientName as ClientName, 0 as seq union
					    select MergeCategory, ClientName, 1 from conversioncontrol..ConversionMergeCategory where MasterCategory = @DBCategory order by seq asc
	open mergecategorycur
	fetch next from mergecategorycur into @DBCategory, @ClientName, @Seq
	while @@fetch_status = 0
	begin
		print @DBCategory
		select @ZipFileName = @ClientName --+ convert(varchar,year(getdate())) + right('0' + convert(varchar, datepart(m, getdate())), 2) + right('0' + convert(varchar, datepart(d, getdate())), 2)
		select @vcCmdLine = @DestFolder + 'wzunzip.exe -d -o ' + @SourceFolder + @ZipFileName +  '.zip ' + @DestFolder

		EXEC @result = master..xp_cmdshell @vcCmdLine
	
		IF (@result = 0)
		begin
			Update conversioncontrol..ConversionCategory set status = 1, ConversionStart = getdate() where clientname = @Clientname
			set @sql = 'restore database ' + @ClientName + ' from Disk = ''' + @DestFolder + @ClientName + '.Bak''
			   WITH MOVE ''' + @ClientName + '_Data'' TO ''' + @DestFolder + @ClientName + '.mdf'',
				   MOVE ''' + @ClientName + '_log'' TO ''' + @DestFolder + @ClientName + '.ldf'', REPLACE'
			
			exec(@sql)
			set @result = @@Error

			if (@result = 0 )
			begin
				/* Dump .bak file*/
				SET @SQL = 'del ' + @DestFolder + @ClientName + '.bak'
				exec master..xp_cmdshell @SQL
				/* Dump .bak file*/
				
			--Start : Zip file move to Processed Folder
					DECLARE @DFileExists INT
					DECLARE @SFileExists INT
					Declare @ZIPSource varchar(1000)
					Declare @ZIPDest varchar(1000)
					Declare @ZIPCmdLine varchar(1000)

					-- Declare @ZipFileName varchar(1000)
					-- Set @ZipFileName='vipul'

					SET @ZIPSource = '\\mt2ftp\FTP\Chicago\ADlertToFVConversion\'  + @ZipFileName +  '.zip '
					SET @ZIPDest = '\\Mt2ftp\ftp\Chicago\ADlertToFVConversion\Processed\' + @ZipFileName +  '.zip '

					EXEC master..xp_fileexist @ZIPDest ,  @DFileExists OUTPUT
					Print @DFileExists -- if file exists in PRocessed folder then returns 1
					If @DFileExists=1
					 Begin 
					 --Remove File from Destination(processed) folder
					 Set @ZIPCmdLine= 'del '+@ZIPDest
					 Print @ZIPCmdLine
					 Execute xp_cmdshell @ZIPCmdLine
					End

					--check source folder and copy file to dest and delete from source folder
					EXEC master..xp_fileexist @ZIPSource,  @SFileExists OUTPUT
					Print @SFileExists
					If @SFileExists=1
					 Begin 
					 --Copy File from Source folder to Destination folder
					 Set @ZIPCmdLine='copy '+ @ZIPSource + @ZIPDest
					 Print @ZIPCmdLine
					 EXECUTE xp_cmdshell @ZIPCmdLine

					 --Remove File from Source folder
					 Set @ZIPCmdLine='del '+@ZIPSource
					 Print @ZIPCmdLine
					 Execute xp_cmdshell @ZIPCmdLine
					End
			
			--End : Zip file move to Processed Folder
				
			
			
				/*Check Incremental Load*/
				SET @IncrementalLoad = 0
				IF Cursor_Status('variable', 'Tables1') >= 0
				Begin
					Close Tables1
					Deallocate Tables1
				End
	
				SET @IncrementalLoad = 0
				set @sql='Declare Tables1 Cursor for select [name] from ' + @Clientname + '..sysobjects where Xtype = ''U'' And name = ''Delete_Trackno'''
				exec(@sql)
				Open Tables1
				Fetch next from Tables1 into @TableNames
				If @@Fetch_Status=0
				Begin
					SET @IncrementalLoad = 1	
				End	
				Else
					SET @IncrementalLoad = 0	
				Close Tables1
				Deallocate Tables1
				/*Check Incremental Load*/
		
				/* Drop existing tables */
				IF Cursor_Status('variable', 'Tables1') >= 0
				Begin
					Close Tables1
					Deallocate Tables1
				End

				IF NOT @IncrementalLoad = 1 
				BEGIN
					If @Is50 = 1
					Begin
						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'FlyerReports'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'FlyerReports')

						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'DetailReports'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'DetailReports')


						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'MPVPageEvent'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'MPVPageEvent')


						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'PageReports'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'PageReports')
					End
					Else
					BEGIN
						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'ChildWebMain'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'ChildWebMain')

						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'PageDetailTable'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'PageDetailTable')


						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'MultiplePageValues'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'MultiplePageValues')


						EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
								WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'Pages'')
							DROP TABLE ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'Pages')
					END
				END	
				/* Drop existing tables */
				/* Truncate Database*/
				dbcc shrinkfile (ConversionControl_Log, 5)
				--dbcc shrinkfile (SQL03_Log, 5)
				/* Truncate Database*/
				/* Process database */
				if @Is50=1
				begin
					set @sql = 'execute ' + @ClientName + '..sp_ConversionStoredProcedure_50 @categorycode = ''' + @DBCategory + ''', @adlertdatabase = ''' + @Clientname + ''', @PIPathTablePrefix = ''' + @ConversionDataDb + '..'', @ConversionDataDb = ''' + @ConversionDataDb + ''''
				end
				else
				begin
					set @sql = 'execute ' + @ClientName + '..sp_ConversionStoredProcedure @categorycode = ''' + @DBCategory + ''', @adlertdatabase = ''' + @Clientname + ''', @PIPathTablePrefix = ''' + @ConversionDataDb + '..'', @ConversionDataDb = ''' + @ConversionDataDb + ''''
				end
				begin try
					execute(@sql)
				end try
				begin catch
					insert into conversioncontrol.dbo.conversionErrorlog(categorycode,details,errornumber,errorseverity,errorstate,errorprocedure,errorline,errormessage)
					values(@DBCategory,@sql,ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
					select @errorid = @@identity
					
					set @subject = '[ADlertToFV] '+@@servername+' Conversion Error for ' + @DBCategory
					select @body = '<table><tr><td>CategoryCode:</td><td>'+CategoryCode+'</td></tr>'+@crlf+
											'<tr><td>Details:</td><td>'+details+'</td></tr>'+@crlf+
											'<tr><td>DtTm:</td><td>'+cast(dttm as varchar)+'</td></tr>'+@crlf+
											'<tr><td>ErrorNumber:</td><td>'+cast(errornumber as varchar)+'</td></tr>'+@crlf+
											'<tr><td>ErrorSeverity:</td><td>'+cast(errorseverity as varchar)+'</td></tr>'+@crlf+
											'<tr><td>ErrorState:</td><td>'+cast(errorstate as varchar)+'</td></tr>'+@crlf+
											'<tr><td>ErrorLine:</td><td>'+cast(errorline as varchar)+'</td></tr>'+@crlf+
											'<tr><td>ErrorMessage:</td><td>'+ErrorMessage+'</td></tr></table>'
					from conversioncontrol.dbo.conversionErrorlog
					where id = @errorid
					exec master.dbo.mt_proc_send_cdosysmail @to='fvdataload@markettrack.com',
						@subject=@subject,
						@body=@body,
						@bodytype='html'
				end catch
				/* Process database */
				print 'END conversion'
			End
			Else
			Begin
				--Problem with .bak file
				set @subjectLine = @@servername+': ADlert to FV Conversion: .bak Device Error For - ' + @DBCategory
				Exec mt2sql00.master.dbo.sp_ProcExportData 
					@recipients='fvdataload@markettrack.com;dipakp@markettrack.com'
					,@subject=@subjectLine				
					,@exporttype='message'
					
				Update conversioncontrol..ConversionCategory set ftpstatus=0,conversiondone = 1 where DatabaseCategory = @DBCategory 
				
				set @subjectLine = @@servername+': Re Export Device and reset Conversion for - ' + @DBCategory
				Exec mt2sql00.master.dbo.sp_ProcExportData 
					@recipients='vkantawala@markettrack.com;vipuld@markettrack.com;ramt@markettrack.com'
					,@subject=@subjectLine				
					,@exporttype='message'
			END
		end
		Else
		Begin
			-- problem with zip file
			set @subjectLine = @@servername+': ADlert to FV Conversion: zip file Error For - ' + @DBCategory
			Exec mt2sql00.master.dbo.sp_ProcExportData 
				@recipients='fvdataload@markettrack.com;dipakp@markettrack.com'
				,@subject=@subjectLine				
				,@exporttype='message'
				
			Update conversioncontrol..ConversionCategory set ftpstatus=0,conversiondone = 1 where DatabaseCategory = @DBCategory
			
			set @subjectLine = @@servername+': Re Export Device and reset Conversion for - ' + @DBCategory
				Exec mt2sql00.master.dbo.sp_ProcExportData 
					@recipients='vkantawala@markettrack.com;vipuld@markettrack.com;ramt@markettrack.com'
					,@subject=@subjectLine				
					,@exporttype='message'	
			
		END
	fetch next from mergecategorycur into @DBCategory, @ClientName, @Seq
	end
	close mergecategorycur
	deallocate mergecategorycur
	IF (@result = 0)
	begin
		select @DBCategory = @MasterCategoryCode 
		/* Create Dependent Tables */
		--EXEC('delete from ' + @DBCategory + 'childwebmain where addate > getdate()')

		select @CatCode = @DBCategory
		If @Is50=1
		Begin
			select @CatPDTTable = @Catcode + 'DetailReports'
			select @CatMPVTable = @Catcode + 'MPVPageEvent'
			select @CatCWMTable = @Catcode + 'FlyerReports'
			select @CatPagesTable = @CatCode +'PageReports'
		end
		else
		Begin
			select @CatPDTTable = @Catcode + 'pagedetailtable'
			select @CatMPVTable = @Catcode + 'multiplepagevalues'
			select @CatCWMTable = @Catcode + 'childwebmain'
			select @CatPagesTable = @CatCode +'pages'
		end	
		
		
		---------------			
		--Item #21508
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@CatCode,'Checking for Orphaned records',getdate())
		
		DECLARE	@TotalRecord Int,
				@DeletableRecord Int,
				@emailbody Varchar(max),
				@PercentageValue tinyint,
				@Ratio Decimal(10,6)
		
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
			
		SELECT 
			@PercentageValue = CategoryValue
		FROM 
			Tbl_Lookup	
		WHERE
			CategoryType = 'PercentageDeleteRecord'		
		
		SET @NSQL = 
			'SELECT 
				@TotalRecord = COUNT(1) 
			FROM ' + @ConversionDataDb    + '.dbo.' +
				@CatPDTTable + ' PDT'
		--PRINT @NSQL		
		EXECUTE sp_executesql @NSQL, N'@TotalRecord INT output', @TotalRecord output				
				
		SET @NSQL = 
			'SELECT 
				@DeletableRecord = COUNT(1) 
			FROM '  + @ConversionDataDb    + '.dbo.' + 
				@CatPDTTable + ' PDT LEFT OUTER JOIN '  + @ConversionDataDb    + '.dbo.' + @CatCWMTable + ' CWM on 
				CWM.FlyerID = PDT.FlyerID
			WHERE 
				CWM.FlyerID IS NULL'
		PRINT @NSQL		
		EXECUTE sp_executesql @NSQL, N'@DeletableRecord INT output', @DeletableRecord output				
		
		--PRINT CAST(@TotalRecord  as Varchar(10)) + ' - ' + CAST(@DeletableRecord  as Varchar(10)) + ' - ' + Cast(@PercentageValue as Varchar(2)) + '.'
		
		IF @DeletableRecord > 0
			Select @Ratio = (Cast(@DeletableRecord as Decimal(10,2))* 100)/Cast(@TotalRecord as Decimal(10,2))
		Else
			Select @Ratio = 0
		
			PRINT @Ratio
		IF @Ratio > 0 AND @Ratio <= @PercentageValue 
			BEGIN
				--#Item - 22337 Started
				SET @SQL = 
					'IF EXISTS (SELECT Top 1 * FROM ' + @ConversionDataDb + '.SYS.SYSOBJECTS 
								WHERE NAME = ''' + @CatCode + 'DetailReports_Orphaned'' AND TYPE = ''U'' )
						BEGIN
							INSERT INTO ' + @ConversionDataDb    + '.dbo.' + @CatCode + 'DetailReports_Orphaned 
							SELECT 
								PDT.*, Getdate() as Orphaned_DateTime 
							FROM 
								'  + @ConversionDataDb    + '.dbo.' + 
								@CatPDTTable + ' PDT LEFT OUTER JOIN '  + @ConversionDataDb    + '.dbo.' + @CatCWMTable + ' CWM on 
								CWM.FlyerID = PDT.FlyerID
							WHERE 
								CWM.FlyerID IS NULL
							
							DELETE FROM ' + @ConversionDataDb    + '.dbo.' + @CatCode + 'DetailReports_Orphaned WHERE Orphaned_DateTime < Dateadd(D, -7, Getdate())
						END
					ELSE
						SELECT 
							PDT.*, Getdate() as Orphaned_DateTime 
						INTO ' + @ConversionDataDb    + '.dbo.' + @CatCode + 'DetailReports_Orphaned 	
						FROM 
							'  + @ConversionDataDb    + '.dbo.' + 
							@CatPDTTable + ' PDT LEFT OUTER JOIN '  + @ConversionDataDb    + '.dbo.' + @CatCWMTable + ' CWM on 
							CWM.FlyerID = PDT.FlyerID
						WHERE 
							CWM.FlyerID IS NULL
					'
				PRINT @SQL
				EXECUTE(@SQL)
				--#Item - 22337 End					
			
				SET @SQL=
					'DELETE 
						PDT 
					FROM '  + @ConversionDataDb    + '.dbo.' + 
						@CatPDTTable + ' PDT LEFT OUTER JOIN '  + @ConversionDataDb    + '.dbo.' + @CatCWMTable + ' CWM on 
						CWM.FlyerID = PDT.FlyerID
					WHERE 
						CWM.FlyerID IS NULL'
				PRINT @SQL
				EXECUTE(@SQL)
				
				SET @Subject = 'Orphaned Records Deleted For ' + @Catcode + ' Code'
				SET @emailbody = @Catcode + ' Code has ' + CAST(@DeletableRecord as Varchar(8)) + ' Orphaned Records. They have been deleted.'
				EXEC MASTER.dbo.mt_proc_send_cdosysmail 
					@From= 'sql@markettrack.com', 
					@to='hkapadia@markettrack.com', --,FVDataLoad@markettrack.com
					@subject= 'Orphaned Records',
					@body=@emailbody,
					@bodytype='html',
					@Priority=1									
			END
		--ELSE IF @Ratio > @PercentageValue
		--	BEGIN
			
		--		SET @Subject = Cast(Round(@Ratio,2) as Varchar(10)) + '% Orphaned Records For ' + @Catcode + ' Code'
		--		SET @emailbody = @Catcode + ' Code has ' + CAST(@DeletableRecord as Varchar(8)) + ' Orphaned Records.'
		--		EXEC MASTER.dbo.mt_proc_send_cdosysmail 
		--			@From= 'sql@markettrack.com', 
		--			@to='hkapadia@markettrack.com,jhetler@markettrack.com', --,FVDataLoad@markettrack.com
		--			@subject= @Subject,
		--			@body=@emailbody,
		--			@bodytype='html',
		--			@Priority=2
		--	END
		
		INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@CatCode,'Orphaned records deleted if Ratio is below 2%. Ratio - ' + Cast(@Ratio as varchar(15)) + '%' ,getdate())
			
		--#Item :21508 END		
		---------------		
		
		
		Print 'Start Custom Client Updates'
		
		IF @DBCategory <> 'sfwa'
			EXEC('delete from ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' where addate > ''' + @ConversionStart + '''')

		if @DAA = 1
		begin
			EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
					WHERE XTYPE = ''U'' AND NAME = ''Ad' + @CatPagesTable + ''')
				DROP TABLE ' + @ConversionDataDb + '.dbo.Ad' + @CatPagesTable + '')


			EXEC('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
					WHERE XTYPE = ''U'' AND NAME = ''' + @CatPagesTable + ''')
				SELECT * INTO ' + @ConversionDataDb + '.dbo.Ad' + @CatPagesTable + ' 
					FROM ' + @ConversionDataDb + '.dbo.' + @CatPagesTable)
		
		end

		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 203
		Begin
			Exec('Update ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' 
					SET Market = ''National'' Where Market = ''Representative''')	
		End

		--Update Account - Item # 11979
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 378
		Begin
			Exec('Update ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' 
					SET Advertiser = ''Macys'' Where Advertiser = ''Macy''''s East''')	
		End
		--Update Account - Item # 11979

		--Update Advertiser,Market - Item # 15152
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 176
		Begin
			Exec('Update CWM 
			      SET Advertiser=C.RenamedAdvertiser
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Advertiser=C.Advertiser and CWM.Market=C.Market and databasecategory=''' + @DBCategory + '''')			
		
			Exec('Update ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' set Market=''Representative-Canada'' 
			      where Market=''Representative'' and TradeClass=''Canada''')
			
			Exec('Update ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' set Market=''Representative-US'' 
			      where Market=''Representative'' and TradeClass<>''Canada''')		
		End
		--Update Advertiser,Market - Item # 15152	

		--Update Advertiser, Market - Item # 15154
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 309
		Begin
			Exec('Update CWM 
			      SET Advertiser = C.RenamedAdvertiser 
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Advertiser=C.Advertiser and C.Market='''' and databasecategory=''' + @DBCategory + '''')
		End
		--Update Advertiser, Market - Item # 15154

		--Update Advertiser, Market - Item # 15590
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 429
		Begin
			Exec('Update CWM 
			      SET Advertiser=C.RenamedAdvertiser
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Advertiser=C.Advertiser and CWM.Market=C.Market and databasecategory=''' + @DBCategory + '''')			
		End
		--Update Advertiser, Market - Item # 15590

		--Update TradeClass - Item # 11835
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 313
		Begin
			Exec('Update CWM 
			      SET TradeClass = C.RenamedTradeClass 
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Advertiser=C.Advertiser  and databasecategory=''' + @DBCategory + '''')
		END
		--Update TradeClass - Item # 11835
	
		--Update FiscalPeriod - Item # 12046 (FLWS), 12917 (HBPS), 13673 (OFM), 14719 (EPS)	
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If  @DBCategory in ('flws','hbps','ofm','eps')
		Begin
			Exec('if not exists (Select top 1 * from ' + @ConversionDataDb + '.information_schema.columns where table_name = ''' + @CatCWMTable + ''' and column_name = ''FiscalPd'')
				ALTER TABLE ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' ADD FiscalPd varchar(15)')
								
			Exec('UPDATE CWM 
				SET FiscalPd = FP.FiscalPd
				FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl..flwsFiscalDateRanges FP
				On CWM.AdDate between FP.WeekStartDt and FP.WeekEndDt')

			Exec('if not exists (Select top 1 * from ' + @ConversionDataDb + '.information_schema.columns where table_name = ''' + @CatCWMTable + ''' and column_name = ''FiscalWk'')
				ALTER TABLE ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' ADD FiscalWk varchar(15)')
									
			Exec('UPDATE CWM 
				SET FiscalWk = FP.FiscalWk
				FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl..flwsnpdupdates FP
				On CWM.AdDate between FP.StartDate and FP.EndDate')
		
		End
		---Update FiscalPeriod - Item # 12046 (FLWS), 12917 (HBPS), 13673 (OFM), 14719 (EPS)	
		
		--START : Size Update for sfwa,sfwac code
		If @DBCategory in ('sfwa','sfwac')
		BEGIN			
			EXEC('UPDATE C SET [Size] =cast(s.width AS VARCHAR(10)) + '' X '' + cast(s.height AS VARCHAR(10))
				FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' C JOIN 
				     ' + @ConversionDataDb + '.dbo.' + @CatPagesTable + ' P ON C.trackno=P.trackno JOIN ConversionControl..sizes S 
				ON P.sizeid=S.sizeid and P.PageNo = 1 and [size] is null ')
		END
		--END : Size Update for sfwa,sfwac code

		--Update Advertiser,SalesTerritory - Item # 12163, 15335
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 266
		Begin
			Exec('Update CWM 
			      SET Advertiser=C.RenamedAdvertiser 
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Advertiser=C.Advertiser AND C.SalesTerritory is NULL and databasecategory=''' + @DBCategory + '''')

		End
		--Update Advertiser,SalesTerritory - Item # 12163, 15335

		--Update Start for Duplicate RetMktID - Item # 14855, # 15152, # 15154 and # 15355
		If @ClientID in (313,176,309,266)
		Begin
			IF @DBCategory in ('nb','gap','hbps','ema')
			Begin
				Exec( 'Update A Set RetId = dist.RetID, MktID = dist.MktID, RetMktID = dist.RetMktID
				       From ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' A
				       Join 
				       (select TradeClass, Advertiser, Market, Min(RetID) RetID, Min(MktID) MktID, Min(RetMktID) RetMktID
				       From ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + '
				       Group By TradeClass, Advertiser, Market Having Count(*) > 1) dist
				       On A.TradeCLass = dist.Tradeclass and A.Advertiser = dist.Advertiser and A.Market = dist.Market')
			End
		End
		--Update End for Duplicate RetMktID - Item # 14855, # 15152, # 15154 and # 15355

		--Update Market,District - Item # 12530		
		Select @ClientID = ClientID From Conversioncontrol..conversioncategory where DatabaseCategory = @CatCode
		If @ClientID = 123
		Begin
			Exec('Update CWM 
			      SET SalesTerritory = C.SalesTerritory 
			      FROM ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' CWM JOIN ConversionControl.dbo.CWMFieldsUpdate C
			      ON CWM.Market=C.Market and databasecategory=''' + @DBCategory + '''')
		End
		--Update Market,District - Item # 12530
        --Custom updates to remove 1-page ads socad50 - Item # 17627
        --If @DBCategory = 'socad50'
        --Begin
        --	Exec ('Delete from ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' where pages=1')
        --	Exec ('Delete from ' + @ConversionDataDb + '.dbo.' + @CatPagesTable + ' where pages=1')
        --	Exec ('Delete from ' + @ConversionDataDb + '.dbo.' + @CatPDTTable + ' where pages=1')
        --End
		--Custom updates to remove 1-page ads socad50 - Item # 17627

		--Update Email Subject: used SalesTerritory field as told by ashish for JCPd - Item # 14897		
		If  @DBCategory in ('jcpd' ,'emla')
		Begin
			Exec('ALTER TABLE ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + '  ALTER Column salesterritory	varchar(200)')

			Exec('update C set salesterritory=e.subject 
				from ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' 
				c join ConversionControl..emailattributes e 
				on c.trackno=e.trackno where e.subject is not null ')

		End

		--Update Email Subject for FV5.0: used Subject field as told by ashish for staSOC50 - as per Email		
		If  @DBCategory in ('adl2','adl3','mktd','adl7','emla50','socad50','adl4')
		Begin
			Exec('update C set subject=e.subject 
				from ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' 
				c join ConversionControl..emailattributes e 
				on c.trackno=e.trackno where e.subject is not null ')
				
					
			exec('IF EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.SYSOBJECTS 
				WHERE XTYPE = ''U'' AND NAME = ''' + @DBCategory + 'DetailReports'')
				update C set subject=e.subject 
				from ' + @ConversionDataDb + '.dbo.' + @CatPDTTable + ' 
				c join ConversionControl..emailattributes e 
				on c.trackno=e.trackno where e.subject is not null ')
				
				
			Exec('update C set subject=e.subject 
				from ' + @ConversionDataDb + '.dbo.' + @CatPagesTable + ' 
				c join ConversionControl..emailattributes e 
				on c.trackno=e.trackno where e.subject is not null ')

		End
		
		IF @DBCategory in ('webADL50')
			BEGIN
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'Drop Existing FlyerReportsPgCats Table', getdate())
				Set @SQL='IF EXISTS(SELECT [Name] FROM '+ @ConversionDataDb +'.dbo.SysObjects WHERE xtype = ''U'' AND Name = ''' + @DBCategory + 'FlyerReportsPgCat'') 
				DROP TABLE ' + @ConversionDataDb + '.dbo.['+ @DBCategory +'FlyerReportsPgCat]'
				Exec (@SQL)

				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'Start:Create FlyerReportsPgCats', getdate())
				Set @SQL='Select distinct CWM.*, pgCat.CatID, pgCat.CatDescrip As MerchandiseSubCat, Cast(null as int) MerchandiseSubCatID, pgCat.GrpID, pgCat.GrpDescrip As MerchandiseCategory, Cast(null as int) MerchandiseCategoryID, Cast(1 as int) as Page, Cast(null as varchar(11)) as PageDetailID
				Into ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'FlyerReportsPgCat
				From ' + @ConversionDataDb + '.dbo.' + @DBCategory +'FlyerReports CWM JOIN ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'PgCats pgCat ON CWM.TrackNo = pgCat.TrackNo'
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'End:Create FlyerReportsPgCats', getdate())
				Exec (@SQL)
				
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'Start:ID Update for SubCat Cat', getdate())
				Set @SQL='Exec '+@ConversionDataDb+'..mt_proc_Create_ID_Update ''' + @DBCategory + 'FlyerReportsPgCat'', ''MerchandiseSubCat'''
				Exec (@SQL)
				Set @SQL='Exec '+@ConversionDataDb+'..mt_proc_Create_ID_Update ''' + @DBCategory + 'FlyerReportsPgCat'', ''MerchandiseCategory'''
				Exec (@SQL)
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'End:ID Update for SubCat Cat', getdate())
				
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'Start:Create Indexes on FlyerReportsPgCats', getdate())
				
				Set @SQL='ALTER TABLE '+@ConversionDataDb+'.[dbo].['+@DBCategory+'FlyerReportsPgCat] ADD  CONSTRAINT [PK_'+@DBCategory+'FlyerReportsPgCat] PRIMARY KEY CLUSTERED 
				([FlyerID] ASC,[CatId] ASC) ON [PRIMARY]'
				Exec (@SQL)
				
				Set @SQL='CREATE NONCLUSTERED INDEX ['+@DBCategory+'FlyerReportsPgCat1] ON '+@ConversionDataDb+'.[dbo].['+@DBCategory+'FlyerReportsPgCat] 
				([Advertiser] ASC, [AdvertiserID] ASC,[AdDate] ASC,[WeekOf] ASC,[mediaID] ASC,[eventID] ASC,
				[themeID] ASC,[marketID] ASC,[tradeclassID] ASC,[MerchandiseSubCatID] ASC,[MerchandiseCategoryID] ASC) ON [PRIMARY]'
				Exec (@SQL)
				
				Set @SQL='CREATE NONCLUSTERED INDEX ['+@DBCategory+'FlyerReportsPgCat2] ON '+@ConversionDataDb+'.[dbo].['+@DBCategory+'FlyerReportsPgCat] 
				([MerchandiseSubCatID] ASC,[MerchandiseCategoryID] ASC,[AdDate] ASC,[FlyerID] ASC,[TrackNo] ASC,[Pages] ASC) ON [PRIMARY]'
				Exec (@SQL)
				
				Set @SQL='CREATE NONCLUSTERED INDEX ['+@DBCategory+'FlyerReportsPgCat3] ON '+@ConversionDataDb+'.[dbo].['+@DBCategory+'FlyerReportsPgCat] 
				([Advertiser] ASC,[AdvertiserID] ASC,[Market] ASC,[marketID] ASC,[RetMktID] ASC,[tradeclass] ASC,[tradeclassID] ASC) ON [PRIMARY]'
				Exec (@SQL)
				INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@DBCategory, 'End:Create Indexes on FlyerReportsPgCats', getdate())
		
			END
		
		--jhetler 7/3/2012 for MediaDetail
		--Add column if it doesn't exists (possible with full load)
		Exec('if exists(select top 1 * from ' + @ConversionDataDb + '.information_schema.tables where table_name = '''+ @CatPDTTable + ''') 
			and not exists (select top 1 * from ' + @ConversionDataDb + '.information_schema.columns where table_name = '''+ @CatPDTTable + ''' and column_name = ''MediaDetail'')
				alter table ' + @ConversionDataDb + '.dbo.' + @CatPDTTable + ' add MediaDetail [varchar](50) NULL')
				
		If @is50=1
		begin

			--5.0
			--jhetler 7/3/2012 for MediaDetail
			--Set column to match media		
			exec('Update '+ @CatPDTTable + ' set MediaDetail=case when Features = ''Insert Online'' then ''Insert-Digital'' else Media end
				from ' + @ConversionDataDb + '.dbo.' + @CatPDTTable + ' '+ @CatPDTTable + '
				where Isnull(MediaDetail, '''') <> case when Features = ''Insert Online'' then ''Insert-Digital'' else Media end')
		end
		else
		begin
			--item# 15938 : Update Media
			Exec('Update C SET Media = M.Media 
				from ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + '
				C Inner Join ConversionControl.dbo.MediaAssignment M 
				ON M.TrackNo=C.TrackNo ')

			Exec('Update ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' 
						SET Media =''Insert-Paper''  where Media = ''Insert''') 
			--item# 15938 : Update Media
			
			--jhetler 7/3/2012 for MediaDetail
			--Set column to match media		
			exec('Update '+ @CatPDTTable + ' set MediaDetail=case when Features = ''Insert Online'' then ''Insert-Digital'' else Media end
				from ' + @ConversionDataDb + '.dbo.' + @CatPDTTable + ' ' + @CatPDTTable + ' 
				inner join ' + @ConversionDataDb + '.dbo.' + @CatCWMTable + ' ' + @CatCWMTable + ' on '+ @CatCWMTable + '.FlyerId = '+ @CatPDTTable + '.FlyerId
				where MediaDetail is null')
		
		end
		
		
		Print 'End Custom Client Updates'
		
		Print 'start indexing'
		/* Index */
		if @Is50=1
		begin
			set @sql = 'Execute conversioncontrol..conversion_AddIndexes_50 '''+@CatCode+''', '+cast(@IndexType as varchar)+', '+cast(@DAA as varchar)+', '+cast(@IncrementalLoad as varchar)+', 0, '''+@ConversionDataDb+''''
		end
		else
		begin
			set @sql = 'Execute conversioncontrol..conversion_AddIndexes '''+@CatCode+''', '+cast(@IndexType as varchar)+', '+cast(@DAA as varchar)+', '+cast(@IncrementalLoad as varchar)+', 0, '''+@ConversionDataDb+''''
		end
		begin try
			execute(@sql)
		end try
		begin catch
			insert into conversioncontrol.dbo.conversionErrorlog(categorycode,details,errornumber,errorseverity,errorstate,errorprocedure,errorline,errormessage)
			values(@DBCategory,@sql,ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
			select @errorid = @@identity
			
			set @subject = '[ADlertToFV] '+@@servername+' Indexing Error for ' + @DBCategory
			select @body = '<table><tr><td>CategoryCode:</td><td>'+CategoryCode+'</td></tr>'+@crlf+
									'<tr><td>Details:</td><td>'+details+'</td></tr>'+@crlf+
									'<tr><td>DtTm:</td><td>'+cast(dttm as varchar)+'</td></tr>'+@crlf+
									'<tr><td>ErrorNumber:</td><td>'+cast(errornumber as varchar)+'</td></tr>'+@crlf+
									'<tr><td>ErrorSeverity:</td><td>'+cast(errorseverity as varchar)+'</td></tr>'+@crlf+
									'<tr><td>ErrorState:</td><td>'+cast(errorstate as varchar)+'</td></tr>'+@crlf+
									'<tr><td>ErrorLine:</td><td>'+cast(errorline as varchar)+'</td></tr>'+@crlf+
									'<tr><td>ErrorMessage:</td><td>'+ErrorMessage+'</td></tr></table>'
			from conversioncontrol.dbo.conversionErrorlog
			where id = @errorid
			exec master.dbo.mt_proc_send_cdosysmail @to='fvdataload@markettrack.com',
				@subject=@subject,
				@body=@body,
				@bodytype='html'
		end catch

		/* Index */

		Print 'end indexing'
		Print 'ConversionDependentTables'
		If @Is50 = 1 
		begin
			exec SQL03.dbo.mt_proc_Create_DisplayTables_AD @DBCategory
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@CatCode,'5.0 Display Tables created.',getdate())
		end
		Else
		begin
			EXECUTE ConversionDependentTables @DBCategory, @IncrementalLoad, 1, @ConversionDataDb
			INSERT INTO ConversionControl..conversionlog(CategoryCode,Details,dttm) values(@CatCode,'4.x Display Tables created.',getdate())
		end

		Update conversioncontrol..ConversionCategory set ConversionEnd = getdate(), FTPStatus = 0 where DatabaseCategory = @DBCategory
		--New Change
		--Update conversioncontrol..ConversionCategory set masterxferdone = 0 where DatabaseCategory = @DBCategory and DestServer <> 'MT2SQL03'
		Update conversioncontrol..ConversionCategory set conversiondone = 1 where DatabaseCategory = @DBCategory

		if @IncrementalLoad = 1	
			UPDATE ConversionControl..ConversionCategory SET PartialRun = getdate() where DatabaseCategory = @DBCategory
		else
			UPDATE ConversionControl..ConversionCategory SET FullRun = getdate() where DatabaseCategory = @DBCategory

		--Perform Coversion Of Child CategoryCodes
		If @Is50=1 
			EXECUTE ChildCategoryCodeConversion_50 @DBCategory, @Clientname, @IncrementalLoad, '[mt2sql14].SiteControl.dbo.', @ConversionDataDb
		else
			EXECUTE ChildCategoryCodeConversion @DBCategory, @Clientname, @IncrementalLoad, '[mt2sql14].SiteControl.dbo.', @ConversionDataDb

		IF @DBCategory = 'chradl'
		BEGIN 
			SET @vcCmdLine = @ConversionDataDb + '.dbo.CWMUpdate ''chradl'',0'
			EXECUTE(@vcCmdLine)
		END

		IF @DBCategory = 'taradl'
		BEGIN
			--taradl2
			EXECUTE ConversionControl..CustomCategoryCodeConversion @DBCategory,'taradl2',@Clientname,0,0,'[mt2sql14].SiteControl.dbo.',@ConversionDataDb
		END

		IF @DBCategory = 'toy'
		BEGIN
			--toy2
			EXECUTE ConversionControl..CustomCategoryCodeConversion @DBCategory,'toy2',@Clientname,0,0,'[mt2sql14].SiteControl.dbo.',@ConversionDataDb
		END
		--[All Categories] selection on QP for pagecat
		If @DBCategory in ('ADR')
		BEGIN
			Exec('IF NOT EXISTS(SELECT * FROM ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'DisQueryPage WHERE category=''[ALL CATEGORIES]'')
			Insert Into ' + @ConversionDataDb + '.dbo.' + @DBCategory + 'DisQueryPage Values(NULL,NULL,NULL,NULL,''[ALL CATEGORIES]'',NULL,NULL,NULL)')
		END
			
		

		/*  Drop Database*/
		-- if is multiple then dump multiple databases
		declare mergecategorycur cursor for select DatabaseCategory, ClientName, 0 as seq from conversioncontrol..conversioncategory where DatabaseCategory = @MasterCategoryCode union
						    select MergeCategory, ClientName, 1 from conversioncontrol..ConversionMergeCategory where MasterCategory = @DBCategory order by seq asc
		open mergecategorycur
		fetch next from mergecategorycur into @DBCategory, @ClientName, @Seq
		while @@fetch_status = 0
		begin
			Exec conversioncontrol..DropConversionDB @ClientName
			fetch next from mergecategorycur into @DBCategory, @ClientName, @Seq
		end
		close mergecategorycur
		deallocate mergecategorycur
		/*  Drop Database*/

		If @DBCategory ='ADR'
		begin
			EXEC MT2SQL00.msdb.dbo.sp_start_job @job_name = 'ADR Finished Notification'
			EXEC msdb.dbo.sp_start_job @job_name = 'ADlert-FV - ADR After Completion Tasks'
		end

		update cc
		set cc.ftpstatus = 1, cc.ftptime = m.ftptime
		from conversioncontrol..ConversionCategory cc
		join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
		join mt2sql01.conversioncontrol.dbo.ConversionCategory m on cc.databasecategory = m.databasecategory
		where cc.ftptime < m.ftptime

		set @DBCategory = ''
		select top 1 @DBCategory = ltrim(rtrim(cc.DatabaseCategory)), @ClientName = ltrim(rtrim(cc.ClientName)), 
		@IndexType = cc.IndexType, @DAA = cc.DAA  , @Is50 =cc.Is50 
		from conversioncontrol..ConversionCategory cc
		join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
		where cc.ftpstatus = 1
		order by cc.[sequence]

		set datefirst 1
		if (datepart(dw,getdate()) in (1,2,3,4,5) 
				and datepart(hh,getdate()) >= 8 
				and datepart(hh,getdate()) < 17)
			or (exists (select *
						from mt2sql14.connection.dbo.vwNightlyProcessingCurrent
						where servername = 'mt2SQL03'
						and processing = 1))
		begin
			set @DBCategory = ''
		end
	end
	else
	begin
		--Update conversioncontrol..ConversionCategory set ftptime = dateadd(d, -1, getdate()) where clientname = @Clientname
		
		update cc
		set cc.ftpstatus = 1, cc.ftptime = m.ftptime
		from conversioncontrol..ConversionCategory cc
		join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
		join mt2sql01.conversioncontrol.dbo.ConversionCategory m on cc.databasecategory = m.databasecategory
		where cc.ftptime < m.ftptime
		
		set @DBCategory = ''
		select top 1 @DBCategory = ltrim(rtrim(cc.DatabaseCategory)), @ClientName = ltrim(rtrim(cc.ClientName)), 
		@IndexType = cc.IndexType, @DAA = cc.DAA , @Is50 =cc.Is50  
		from conversioncontrol..ConversionCategory cc
		join SQL03.dbo.localconversioncategories t on cc.databasecategory = t.databasecategory
		where cc.ftpstatus = 1
		order by cc.[sequence]

		set datefirst 1
		if (datepart(dw,getdate()) in (1,2,3,4,5) 
				and datepart(hh,getdate()) >= 8 
				and datepart(hh,getdate()) < 17)
			or (exists (select *
						from mt2sql14.connection.dbo.vwNightlyProcessingCurrent
						where servername = 'mt2SQL03'
						and processing = 1))
		begin
			set @DBCategory = ''
		end
	end

	

	Use SQL03

	declare @running int
	exec msdb.dbo.mt_proc_jobinfo_currentlyrunning 'Client - DataDB Backup', @running output
	if @running = 0
	begin
		DBCC SHRINKFILE (SQL03_Log, 5)
	end
	
End
GO
