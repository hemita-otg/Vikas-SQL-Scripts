Use tempdb
Go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[todaysdc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].todaysdc
GO

select distinct  d.topleftx, d.toplefty, d.bottomrightx, d.bottomrighty, d.category, d.brand, d.comments1, d.flyerid, d.page, count(distinct d.pagedetailid) as cnt
into tempdb..todaysdc
 from entrydata.dbo.durconspagedetailtable dc join masterClientCoverage..TEMPJAPageDetailTable d  on 
	  dc.topleftx =  d.topleftx
 and  dc.toplefty = d.toplefty
 and dc.bottomrightx = d.bottomrightx
 and dc.bottomrighty = d.bottomrighty
 and dc.category = d.category
 and dc.brand = d.brand
 and dc.comments1 = d.comments1
 and dc.flyerid = d.flyerid
 and dc.page  =d.page
group by d.topleftx, d.toplefty, d.bottomrightx, d.bottomrighty, d.category, d.brand, d.comments1, d.flyerid, d.page
having count(*) > 1
order by  d.category, d.brand, d.comments1, d.flyerid, d.page
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dcdupereport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].dcdupereport
GO

select distinct  d.flyerid,dc.pagedetailid, d.category, d.brand, d.comments1,  d.page,d.topleftx, d.toplefty, d.bottomrightx, d.bottomrighty  
into tempdb..dcdupereport
from masterClientCoverage..TEMPJAPageDetailTable dc join tempdb..todaysdc d 
 on 
 dc.topleftx =  d.topleftx
 and  dc.toplefty = d.toplefty
 and dc.bottomrightx = d.bottomrightx
 and dc.bottomrighty = d.bottomrighty
 and dc.category = d.category
 and dc.brand = d.brand
 and dc.comments1 = d.comments1
 and dc.flyerid = d.flyerid
 and dc.page  =d.page
order by  d.category, d.brand, d.comments1, d.flyerid, d.page


---Send Email for Constellation

use tempdb
	Declare @MySql varchar(8000)
	
	Set @MySql = 'select * from tempdb..dcdupereport'

	--Print @mysql
	--Exec(@MySql)
	
	If @@RowCount > 0
	Begin
		Exec master.dbo.sp_procExportData
		@subject= 'DC Dupe Records in todays MasterClientCoverage..TempJaPageDetailTable'
		, @message = 'Attached are DC Dupe Records in todays MasterClientCoverage..TempJaPageDetailTable'
		, @recipients = 'vkantawala@markettrack.com;eabando@markettrack.com;halapati@markettrack.com;vipuld@markettrack.com;dpatel@markettrack.com'
		, @tabname='Dc Dupes'
		, @servername = 'MT2SQL00'
		, @dbname = 'tempdb'
		, @query = @MySql
		, @exporttype = 'csv'
	End
	Else
	Begin
		Exec master.dbo.sp_procExportData
		@subject= 'NO DC Dupe Records in todays MasterClientCoverage..TempJaPageDetailTable'
		, @message = 'There are no DC Dupe Records in todays MasterClientCoverage..TempJaPageDetailTable'
		, @recipients = 'vkantawala@markettrack.com'
		, @servername = 'MT2SQL00'	
	End




