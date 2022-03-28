exec DataSP50Int.[dbo].[fv_GetRetailerActivityAdsByWeekGridData] @pTempTableName='[TempDB].[dbo].[FVcdebfd17Q001DAA]',@pDataTableName='seahnoADLFlyerReports',
@pDataDbPrefix='[MT2SQL09].[SQL09].[dbo].',
@pWhereClause=' 1=1 ' --'([AdDate] IN (''2/25/2017 12:00:00 AM'',''2/26/2017 12:00:00 AM'',''2/27/2017 12:00:00 AM'',''2/28/2017 12:00:00 AM'',''3/1/2017 12:00:00 AM'',''3/2/2017 12:00:00 AM'',''3/3/2017 12:00:00 AM''))',
,@pFVCCType=0

exec DataSP50Int.[dbo].[fv_GetRetailerActivityEventUsage] @pTempTableName='[TempDB].[dbo].[FVcdebfd17Q001DAA]'
,@pFlyerTableName='seahnoADLFlyerReports',@pDataDBPrefix='[MT2SQL09].[SQL09].[dbo].'
,@pWhereClause= ' 1=1 ' --'([AdDate] IN (''2/25/2017 12:00:00 AM'',''2/26/2017 12:00:00 AM'',''2/27/2017 12:00:00 AM'',''2/28/2017 12:00:00 AM'',''3/1/2017 12:00:00 AM'',''3/2/2017 12:00:00 AM'',''3/3/2017 12:00:00 AM''))'
,@pUserId=2504048,@pClientId=1354,@pCategoryCodeId=7221
,@pSubscriptionDBPrefix='[MT2SQL14].[Subscription].[dbo].'
,@pControlDBPrefix='[MT2SQL14].[SiteControl].[dbo].',@pConnectionDBPrefix='[MT2SQL14].[Connection].[dbo].'
,@pLogDatabasePrefix='[MT2SQL14].[SiteLog].[dbo].',@pResultType=1,@pFiscalYear='1/1'
,@pPrintMediaIds='1,2,5,6,8,10,12,13,14,15,17,18,19,20,21,22,23,574022,1000023,1000024,8904030,12006001,12286001'
,@pFieldName='Event'




