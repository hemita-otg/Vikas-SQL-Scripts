
declare @sql varchar(7500)
Declare @NSQL nvarchar(3000)
declare @existingvalue varchar(100)
declare @newvalue varchar(100)
declare @ret varchar(50)
declare @mkt varchar(50)
declare @tc varchar(50)
declare @cnt int

declare @codeid int
set @codeid=0
set @existingvalue = ''
set @newvalue = ''
set @ret = ''
set @mkt = ''
set @tc = ''
set @sql = ''
set @cnt =0

IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE name = 'NotMatchingRecords' AND xtype = 'u')
	drop table tempdb..NotMatchingRecords

select codeid,existingvalue,newvalue 
into tempdb..NotMatchingRecords from MasterClientCoverage..clientcwmchanges where 1=2
	
declare curBFC cursor for
select  codeid,existingvalue,newvalue from MasterClientCoverage..clientcwmchanges where categorycodeid=154 

--select market FROM SQL03..bfcchildwebmain where (RetMktID=22603)


open curBFC

fetch next from curBFC
into @codeid,@existingvalue, @newvalue

while @@fetch_Status = 0
begin
	
	if @codeid= 12  --12 - Market Updates
	Begin
		SELECT @NSQL = N'SELECT  distinct @mkt =   market FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@mkt VARCHAR(50) OUTPUT',  @mkt OUTPUT

		SELECT @NSQL = N'SELECT  @cnt =   count(*) FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@cnt int OUTPUT',  @cnt OUTPUT

		print @mkt + '>>' + @newvalue
		if (('''' + @mkt + '''') <>  @newvalue) and @cnt <> 0 
			begin
				Set @SQL=' insert into tempdb..NotMatchingRecords  values(' + cast(@codeid as varchar(5)) + ',''' + @existingvalue + ''',' +  @newvalue + ')'
				exec (@SQL)
				print 'inside ' + @sql
				set @mkt=''
			end
		
	end
 	else if @codeid= 13 --13 - Advertiser Updates
 	Begin
		SELECT @NSQL = N'SELECT  distinct @ret =   advertiser FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@ret VARCHAR(50) OUTPUT',  @ret OUTPUT

		SELECT @NSQL = N'SELECT  @cnt =   count(*) FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@cnt int OUTPUT',  @cnt OUTPUT

		print @ret + '>>' + @newvalue
		if (('''' + @ret + '''') <>  @newvalue) and @cnt <> 0 
			begin
				Set @SQL=' insert into tempdb..NotMatchingRecords  values(' + cast(@codeid as varchar(5)) + ',''' + @existingvalue + ''',' +  @newvalue + ')'
				exec (@SQL)
				print 'inside ' + @sql
				set @ret=''
			end
 	end 
	else if @codeid= 14 --14 - TradeClass Updates
	Begin
		SELECT @NSQL = N'SELECT  distinct @tc =   tradeclass FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@tc VARCHAR(50) OUTPUT',  @tc OUTPUT

		SELECT @NSQL = N'SELECT  @cnt =   count(*) FROM SQL03..bfcchildwebmain where ' + @existingvalue
		EXECUTE sp_executesql @NSQL, N'@cnt int OUTPUT',  @cnt OUTPUT

		print @tc + '>>' + @newvalue
		if (('''' + @tc + '''') <>  @newvalue) and @cnt <> 0 
			begin
				Set @SQL=' insert into tempdb..NotMatchingRecords  values(' + cast(@codeid as varchar(5)) + ',''' + @existingvalue + ''',' +  @newvalue + ')'
				exec (@SQL)
				print 'inside ' + @sql
				set @tc=''
			end
 	end
	
fetch next from curBFC
into @codeid,@existingvalue, @newvalue

END                       
close curBFC
deallocate curBFC



select * from tempdb..NotMatchingRecords 



