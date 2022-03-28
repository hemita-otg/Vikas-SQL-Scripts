
Declare @subjectLine as varchar(100)
set @subjectLine = 'FV Client Data Processing Status :' + cast(getdate() as varchar(20)) 
Declare @result integer
Declare @SQL as varchar(200)
set @SQL=''

IF exists(SELECT name FROM tempdb..sysobjects WHERE xtype = 'u' and name = 'NPConversion')
	drop table tempdb..NPConversion

select * into tempdb..NPConversion from 
(
select Case when SQLServer='mt2sql02' then 'DemoServer(Adlert)' else  'AdlertConversion' end as Process , SQLServer,DataLoaded from [MT2SQL04\Connections1].connection.dbo.vwnightlyconversioncurrent
where ((SQLServer not like 'MT2a%') and (SQLServer not in ('MT2SQL00')))
union
select Case when servername='mt2sql02' then 'DemoServer(FV)'
 when servername in ('MT2SQL03','MT2SQL06','MT2SQL07','MT2SQL08','MT2SQL09','MT2SQL11','MT2SQL12') then 'FV 4.x Processing'
 when servername in ('MT2SQL13') then 'FV 4.x, 5.x Processing'
 when servername in ('MT2SQL15') then 'FV 5.x Processing'
else 'NightlyProcessing' end as Process,
 Servername as SQLServer,DataLoaded from [MT2SQL04\Connections1].connection.dbo.vwnightlyprocessingcurrent
where ((servername not like 'MT2a%') and (servername not in ('MT2SQL00')))
) tbl


	
set @SQL='select * from tempdb..NPConversion'
Exec master..sp_ProcExportData 
@recipients='eabando@markettrack.com;halapati@markettrack.com;vkantawala@markettrack.com',
@subject=@subjectLine,
@query=@SQL
,@exporttype='table'
,@tabname='FV Client Data Processing Status'
,@servername='mt2sql00'
,@dbname='master'