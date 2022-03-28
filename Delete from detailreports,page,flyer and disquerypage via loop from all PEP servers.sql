If OBJECT_ID('tempdb..#a')is not null
drop table tempdb..#a
Go

If OBJECT_ID('tempdb..result')is not null
drop table tempdb..result
Go
select Clientname,categorycodeid,category
into #a
from mt2sql14.sitecontrol.dbo.vw_catinfo where clientserver = @@SERVERNAME and (ispdt=1 or clientpdt=1 or cwmfull=1) and fvcctype in (2,4,6) 

create table tempdb..result (query varchar(max))

Go
Declare @min bigint = (select min(categorycodeid) from #a),@max bigint = (select max(categorycodeid) from #a),@SQL VARCHAR(MAX)
While(@min <= @max)
Begin
Declare @category varchar(100) = (select category from #a where categorycodeid = @min)
	If exists (select 1 from sys.tables where name = @category+'disadvertisermarket')
	Begin
	set @sql = 'Delete
				from '+@category+'disadvertisermarket 
				where advertiser in (''Acme Fresh Markets'',''Giant Foods'')'

	print(@sql)
	Insert into tempdb..result select @SQL
  

	End

	If exists (select 1 from sys.tables where name = @category+'flyerreports')
	Begin
	set @sql = 'Delete
				from '+@category+'flyerreports  
				where advertiser in (''Acme Fresh Markets'',''Giant Foods'')'

	print(@sql)
	Insert into tempdb..result select @SQL
  

	End

If exists (select 1 from sys.tables where name = @category+'pagereports')
	Begin
	set @sql = 'Delete
				from '+@category+'pagereports  
				where advertiser in (''Acme Fresh Markets'',''Giant Foods'')'

	print(@sql)
	Insert into tempdb..result select @SQL
  

	End


	If exists (select 1 from sys.tables where name = @category+'detailreports')
	Begin
	set @sql = 'Delete
				from '+@category+'detailreports  
				where advertiser in (''Acme Fresh Markets'',''Giant Foods'')'

	print(@sql)
	Insert into tempdb..result select @SQL
  

	End



Set @min = (select min(categorycodeid) from #a where CategoryCodeid > @min)
End