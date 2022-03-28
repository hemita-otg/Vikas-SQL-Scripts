Declare @subjectLine as varchar(100)
		set @subjectLine = 'FV Nightly Data Processing Status: ' + cast(getdate() as varchar(20)) 
		Declare @SQL as varchar(200)
		set @SQL=''
		
	IF exists(SELECT name FROM tempdb..sysobjects WHERE xtype = 'u' and name = 'NightlyStatus')
	                drop table tempdb..NightlyStatus_Updated 
		
		select * into tempdb..NightlyStatus_Updated from 
		(
			select Case when SQLServer in ('mt2sql03','mt2sql12') then 'Demo AdLert' When SqlServer in ( 'mt2sql01','mt2sql05','mt2sql09') Then 'Fv Adlert' Else 'FV 4.x Adlert' end as Process , SQLServer, DataLoaded, 
			Case When Processing = 1 Then 'Pending' Else 'Completed' End [Processing], ConversionStartTime, ConversionEndTime
			from [MT2SQL14].connection.dbo.vwnightlyconversioncurrent
			where ((SQLServer not like 'MT2a%') and (SQLServer not in ('MT2SQL00')))
			union
			select Case when servername in ('mt2sql03','mt2sql12') then 'Demo FV'
			when servername in ('MT2SQL02','MT2SQL04','MT2SQL06','MT2SQL07','MT2SQL08','MT2SQL15') then 'FV Consumable'
		
			when servername in ('MT2SQL11') then 'FV PRD'
			when servername in ('MT2SQL13') then 'FV PEP' 
			else 'NightlyProcessing' end as Process,
			Servername as SQLServer, DataLoaded,
			Case When Processing = 1 Then 'Pending' Else 'Completed' End [Processing], ProcessingStart, ProcessingEnd
			from [MT2SQL14].connection.dbo.vwnightlyprocessingcurrent
			where ((servername not like 'MT2a%') and (servername not in ('MT2SQL00', 'MT2SQL00A')))
		) tbl
		
	
			--Insert Into mo_wk_data_pull..NightlyStatusFinal
			Select Max([Built Date]) [Built Date],Max([FV PEP]) [FV PEP], Max([Demo FV]) [Demo FV], Max([Demo ADlert]) [Demo ADlert], Max([FV PRD]) [FV PRD], Max([FV Consumable]) [FV Consumable], Max([FV ADlert]) [FV ADlert] 
			From (
				Select Convert(varchar(10), GetDate(), 101) [Built Date], 
				[FV PEP] = Case When Process Like '%FV PEP%' Then Convert(varchar, Max(ConversionEndTime), 108) End,
				[Demo FV] = Case When Process Like '%Demo MT%' Then Convert(varchar, Max(ConversionEndTime), 108) End,
				[Demo ADlert] = Case When Process Like '%Demo ADlert%' Then Convert(varchar, Max(ConversionEndTime), 108) End,
				[FV PRD] = Case When Process Like '% PRD%' Then Convert(varchar, Max(ConversionEndTime), 108) End,
				[FV Consumable] = Case When Process Like '%FV Consumable%' Then Convert(varchar, Max(ConversionEndTime), 108) End,
				[FV ADlert] = Case When Process Like '%FV ADlert%' Then Convert(varchar, Max(ConversionEndTime), 108) End
				from tempdb..NightlyStatus_Updated Group By Process
			) X