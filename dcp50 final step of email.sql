IF Exists (Select * from tempdb.sys.objects where name='dcpfinalMFR')
	drop table tempdb..dcpfinalMFR
Go

Select distinct CB.* into tempdb..dcpfinalMFR 
from mt2sql14.tempdb.dbo.dcp50FinalAssignedCB CB
join mt2sql14.tempdb.dbo.dcp50AllAssignedPD PD
on PD.Category = CB.Category 
and PD.Brand = CB.Brand
and PD.Manufacturer = CB.Manufacturer 
and PD.[Updated Manufacturer] = '' 
order by 2,3
Go

Exec MT2Dev0.master.dbo.sp_procExportData
 @subject= 'Disney - Manufacturer Assignment Table - <date>'
 , @message = 'Manufacturer and MC Assignment'
 ,@recipients = 'vkantawala@markettrack.com;'
 --, @recipients = 'kturon@markettrack.com;adryden@markettrack.com;kandrichik@markettrack.com;mhamilton@markettrack.com;jreeves@markettrack.com;lroland@markettrack.com;'
 --, @cc_recipients = 'vkantawala@markettrack.com;kram@markettrack.com;pmakwana@markettrack.com;mjoshi@markettrack.com;krunals@markettrack.com;'
 , @tabname='dcp50-Unassigned;DistinctCatBrMfrPD'
 , @filename = 'Disney - Manufacturer Assignment Table - <date>.xlsx'
 , @servername = 'mt2sql14'
 , @dbname = 'sitecontrol'
 , @query = 'Select * from tempdb..dcpfinalMFR order by 2,3;Select distinct * from mt2sql14.tempdb.dbo.dcp50AllAssignedPD order by 1,2,4'
 , @exporttype = 'Excel'
 , @zip = 'True'
 , @debug = 0