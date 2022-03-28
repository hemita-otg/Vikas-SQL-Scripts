------------------------------Check Subscription --------------------------------------------------------------


use Subscription 


Select Distinct Hostname, a.Error, Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken,Category,ClientServer, * 
From sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
Where stdttm > Convert(varchar(10), getdate(), 101) and Subtype < 3  
and a.error like '%cross.gif%' 
--and executeid is null--order by 2 desc 
--and categorycodeid in (2596, 2124, 2225, 2226, 2227, 2101, 2518, 3044, 3106, 4489, 4500, 4514, 4554, 4572)
--and hostname = 'mt2sql00'
--and subscriptionname like '%Current Week Security Software%'
--and Eddttm is null 
--and subscriptionid in (171094 ) order by subscriptionid
--And Error <> '' --and error like '%missing%'
--and userid = 2044060
Order By stdttm Desc
GO


select Hostname,ClientServer, Category, SubscriptionID, a.Error,userid, stdttm, eddttm , Cast(DateDiff(ss, stdttm, isnull(eddttm, getdate()))/60.00 as decimal(9,2)) timetaken, HasAttachment
 from sitelog..executedsubrequest a with (nolock) 
join SiteControl..CategoryCode b with (nolock) 
on a.CategoryCodeID = b.id
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3
And Subscriptionid in (select  Subscriptionid from sitelog..executedsubrequest with (nolock)
where stdttm > Convert(varchar(10), getdate(), 101) and SubType < 3 and Error <> '' --and error like '%cross%' 
) 
order by   categorycodeid, subscriptionid desc 
------------------------------Check Subscription --------------------------------------------------------------



------------------------------Park from detail report to FD table by changing code--------------------------------------------------------------		
Declare @PIEnd datetime
		   ,@CrDate datetime=getdate()-1
		   ,@ConnectionDB varchar(100)=''
		   ,@ControlDB varchar(100)=''
		   ,@SubDB varchar(100)=''
		   ,@SQL Nvarchar(max)=''
		   ,@IsIntegerID Bit
		   ,@ClientBuildVer smallint
		   ,@i INT =1
		   ,@ROWCount INT =0
		   ,@Category varchar(15)
		   ,@WhereClause varchar(max)
		   ,@FuturesCreated Bit
		   ,@SQL1 varchar(max)=''
		   ,@SQL2 varchar(max)=''
		   ,@SQL3 varchar(max)=''
		   

if object_id('tempdb..#FDTable') is not null
	Drop Table #FDTable

	Create TABLE  #FDTable (FDIDCount INT IDENTITY(1,1),Category VARCHAR(50))

	Set @SQL='INSERT INTO #FDTable(Category) 
			  SELECT DISTINCT Category FROM mt2sql14.sitecontrol.dbo.categorycode  
			  Where isadlert = 1 and clientserver = @@servername
			  and category in (''wldADL50'')
			  
			  '

	Exec (@SQL)

	SELECT @ROWCount = COUNT(Distinct FDIDCount) FROM #FDTable 
	
	WHILE (@i <= @ROWCount)
	BEGIN 
		
		Select @Category=Category From #FDTable Where FDIDCount=@i

		set @sql = 'IF not EXISTS (SELECT Top 1 * FROM SYS.SYSOBJECTS 
			WHERE NAME = ''' + @Category+'DetailReports_FutureDelete'' AND TYPE = ''U'' )
			BEGIN
				IF EXISTS (SELECT Top 1 * FROM SYS.SYSOBJECTS WHERE NAME = ''' + @Category+'DetailReports'' AND TYPE = ''U'' )
					select *, getdate() as FD_DateTime into dbo.' + @Category+'DetailReports_FutureDelete from dbo.' + @Category+'DetailReports where 1 = 2
			End '
		exec (@sql)
		
		Declare @FDInsert varchar(max)=''
		Declare @FDSelect varchar(max)=''
		Declare @SQLDel varchar(max)=''

		Set @SQL='SELECT 	@FDInsert = COALESCE(@FDInsert ,'''') + LTRIM(RTRIM(COLUMN_NAME)) +'',''
				  FROM INFORMATION_SCHEMA.COLUMNS
				  WHERE  table_name in (''' + @Category+'DetailReports'',''' + @Category+'DetailReports_FutureDelete'')
				  Group by COLUMN_NAME,DATA_TYPE
				  having Count(1)=2'
		--(1-FV 4.x), (2-FV 5/6 NonInt), (3-FV 5/6 Int), (4-FV 5/6 BIGINT)
		If IsNull(@ClientBuildVer,0) = 1
			Set @SQL=Replace(@SQL,'DetailReports','PageDetailTable')

		EXECUTE sp_executesql @SQL, N'@FDInsert varchar(max) output', @FDInsert output
		
		--print @FDInsert + '1'
	
	If Isnull(@FDInsert,'')<>''
			Begin
			Set @FDInsert=Left(@FDInsert,len(@FDInsert)-1)
			Set @FDSelect='PDT.'+replace(@FDInsert,',',',PDT.')
			End
	--print(len(@FDInsert))
	--print(len(@FDSelect))
	If Isnull(@FDInsert,'')<>''
			SET @SQL = 
			'IF EXISTS (SELECT Top 1 * FROM SYS.SYSOBJECTS 
			WHERE NAME = ''' + @Category+'DetailReports'' AND TYPE = ''U'' )
			BEGIN
			'+ CHAR(13)
			set @SQL2 = 'truncate table ' + @Category+'DetailReports_FutureDelete '+ CHAR(13) +'
			INSERT INTO dbo.' + @Category+'DetailReports_FutureDelete('+@FDInsert+',FD_DateTime) '
			SET @SQL3 ='SELECT 
			'+@FDSelect+', getdate()
			FROM 
			dbo.' + @Category+'DetailReports PDT left JOIN mt2sql14.Connection.dbo.pdtprocessed_dur FD with (nolock) on 
			FD.trackno = PDT.trackno and FD.madcode = PDT.madcode and cast(FD.page as varchar)= cast(PDT.page as varchar) where fd.trackno is null  '+ CHAR(13) +'
		delete pdt from dbo.' + @Category+'DetailReports PDT JOIN ' + @Category+'DetailReports_FutureDelete FD on 
			FD.trackno = PDT.trackno and FD.madcode = PDT.madcode and cast(FD.page as varchar)= cast(PDT.page as varchar)
			END'
			exec (@SQL +  @SQL2 + @SQL3)
			--print @sql
			--print @sql1
			--print @sql2
			--print @sql3

	SELECT @i = @i + 1
End


------------------------------Park from detail report to FD table by changing code--------------------------------------------------------------



----------------------------update and insert subscriptionid for rerun --------------------------------------------------------------
update subscription set DateTimeExecuted = getdate() - 7 where subscriptionid = 170399       
insert into temppendingsubscriptions values (170399 , Convert(varchar(10), getdate(), 101), 0)
------------------------------update and insert subscriptionid for rerun --------------------------------------------------------------