--	select * from ropcontrol

--	select * from rop

fwe_1111_282

	
	declare @categorycode varchar(15)
	declare @categorycodeid int
	declare @clientid int
	declare @clientserver varchar(50)
	declare @CWMTable varchar(100)
	declare @columnupdate varchar(500)
	declare @sql varchar (5000)

	DECLARE ropdata CURSOR		
	READ_ONLY		
	FOR Select [id],clientid,category,clientserver from ropcontrol		

	OPEN ropdata		
	FETCH NEXT FROM ropdata INTO @categorycodeid, @clientid,@categorycode,@clientserver		
	WHILE (@@fetch_status <> -1)		
	BEGIN		
		IF (@@fetch_status <> -2)	
		BEGIN	
			SET @CWMTable = 'MT2SQL00.'+replace(@clientserver,'mt2','')+ '.dbo.' + @categorycode+'childwebmain'

			DECLARE @nvchrSql AS NVARCHAR(500)
			Declare @count int
			SET @count=0
			--print @CWMTable
	/*				
			SET @nvchrSql = N'select top 1 @Count=1 from rop r join '+  @CWMTable +' cwm 		
					on r.market=cwm.market and r.publication=cwm.publication 
					where cwm.media=''rop'''
			EXECUTE SP_EXECUTESQL @nvchrSql,N'@count INT OUTPUT',@count OUTPUT		
	*/				
			set @columnupdate = @categorycode+'_'+cast(@categorycodeid as varchar(5))+'_'+cast(@clientid as varchar(5))		
			--PRINT  @columnupdate		
--			SET @SQL = 'update rop set ' + @columnupdate +'= 0' 

			SET @SQL = 'update rop set ' + @columnupdate +'= 1 from rop r join 		
			(Select distinct market, publication from '+  @CWMTable +' where addate between ''1/1/2008'' and ''1/1/2010'' and media = ''rop'') cwm		
				on r.market=cwm.market and r.publication=cwm.publication '	
			EXECUTE (@SQL)		
--			PRINT @SQL		

		END			
		FETCH NEXT FROM ropdata INTO @categorycodeid, @clientid,@categorycode,@clientserver
	END	

	CLOSE ropdata	
	DEALLOCATE ropdata	
	GO	
