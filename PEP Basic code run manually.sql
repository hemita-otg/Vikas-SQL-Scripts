EXEC SQL03.dbo.mt_proc_Create_DisQueryTables'acfvt',0,1,0,0,0


	EXECUTE SQL03.dbo.mt_proc_Html_Call 'acfvt'

	exec [DataSP50Int].[dbo].[fv_RefreshDefaultQueryTables_live]

insert into mt2sql14.Subscription.dbo.HTMLQueryPageChange values('acfvt')