--Consumable

--Exec [MT2STG0].msdb.dbo.sp_start_job 'Run ProductImages'
Exec [MT2STG1].msdb.dbo.sp_start_job 'Run ProductImages'
--Exec [MT2SQL00].msdb.dbo.sp_start_job 'Run ProductImages'
--Exec [MT2SQL00A].msdb.dbo.sp_start_job 'Run ProductImages'
Exec mt2bu0.msdb.dbo.sp_start_job 'Run ProductImages'
Exec mt2bu1.msdb.dbo.sp_start_job 'Run ProductImages'
Exec mt2bu2.msdb.dbo.sp_start_job 'Run ProductImages'
Exec mt2dev0.msdb.dbo.sp_start_job 'Run ProductImages'

Exec mt2rpt1.msdb.dbo.sp_start_job 'Run ProductImages'

--Durable


