select * from NightlyProcessing 
 where sqlserver not like 'mt2a%' and sqlserver  not in ('SQL00') and DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE() -1 ),0)  order by ProcessID desc 


declare @num1 int;
set @num1 =select count(distinct SQLServer) from NightlyProcessing a
where sqlserver not like 'mt2a%' and sqlserver  not in ('SQL00') 
and DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE() -1 ),0) 
and Processing=0 and DataLoaded=1 and FutureDeleted=1 

declare @num2 int;
set @num2=select count(distinct clientserver) from  sitecontrol.dbo.vw_catinfo where fvcctype in (2,3,6,4) and isnull(IsAdlert,'')=0 and clientserver not in ('MT2SQL00','MT2SQL00a')

if @num1=@num2

begin
Declare @BodyText as varchar(2000) = 'Legacy Consumable and PEP Client Processing Finished - ' + cast(GetDate() as varchar(max))

exec master.dbo.mt_proc_send_cdosysmail 
@from='sql@markettrack.com',
	@to='rameswari.bhoi@numerator.com',--'rick.hamada@numerator.com;jon.stephenson@numerator.com;beverly.tinglin@numerator.com;fvdataload@markettrack.com',
	@cc='',
	@subject='Legacy Consumable and PEP Client Processing Finished',
	@body=@BodyText,
	@bodytype='html'

EXEC msdb.dbo.sp_update_job      @job_name = N'Status - Legacy Consumable and PEP Processing Finished',  @enabled = 1 ;  
GO 	
end	
	


	Declare @BodyText as varchar(2000) = 'Legacy Consumable and PEP Client Processing Finished - ' + cast(GetDate() as varchar(max))

	exec master.dbo.mt_proc_send_cdosysmail 
@from='sql@markettrack.com',
	@to='rick.hamada@numerator.com;jon.stephenson@numerator.com;beverly.tinglin@numerator.com;fvdataload@markettrack.com',
	@cc='',
	@subject='Legacy Consumable and PEP Client Processing Finished',
	@body=@BodyText,
	@bodytype='html'