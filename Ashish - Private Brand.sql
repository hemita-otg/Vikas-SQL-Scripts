use sql16 


exec DataSP50Int.[dbo].[fv_ExecuteQuery60] @pUserId=2412708,@pClientId=1174,@pCategoryCodeId=4776,@pDataDBPrefix='[MT2BU1].[SQL16].[dbo].',
@pSubscriptionDBPrefix='[MT2SQL14].[Subscription].[dbo].',@pControlDBPrefix='[MT2SQL14].[SiteControl].[dbo].',@pConnectionDBPrefix='[MT2SQL14].[Connection].[dbo].',
@pLogDatabasePrefix='[MT2SQL14].[SiteLog].[dbo].',@pQueryParamTableName='[MT2BU1].[TempDB].[dbo].[FVb3578bafQ001QueryDetail]',@pResultsTableName='[TempDB].[dbo].[FVb3578bafQ001Detail]',
@pFlyerReportsTableName='acfvFlyerReports',@pQueryId=0,@pSubscriptionId=-1,@pResultType=3,@pFiscalYear='1/1'

SELECT  PDT.PageDetailID, PDT.FlyerID, PDT.Page, PDT.OriginalPageDetailId
, ACPrivateBrand, Comments4, manufacturer 
  FROM [MT2BU1].[SQL16].[dbo].acfvDetailReports PDT WITH (NOLOCK) 
			INNER JOIN (SELECT DISTINCT RetMktId AS [ADCRetMktId], MediaId AS [ADCMediaId] FROM [MT2BU1].[SQL16].[dbo].mizacDisAdLevelCoverage) adc ON adc.ADCRetMktId = PDT.RetMktId AND adc.ADCMediaId = PDT.MediaId WHERE 1=1 
					AND ACBrandEquityFlag = 0
					AND ACPrivateBrand = 1 AND CategoryID IN(10303023,74494,10303268,1028983,10303601) AND (AdDate Between '10/01/2019' AND 'Oct 31 2019 ' OR AdDate Between '10/01/2018' AND 'Oct 31 2018 ') AND PDT.AdDate IN (SELECT DISTINCT AdDate FROM [MT2BU1].[SQL16].[dbo].mizacDisDateRanges WITH (NOLOCK))  AND PDT.CategoryId IN (SELECT DISTINCT CategoryId FROM [MT2BU1].[SQL16].[dbo].mizacDisQueryPage WITH (NOLOCK) )  ORDER BY Advertiser, Market, AdDate Desc, Media, PDT.PageDetailID



Truncate table [TempDB].[dbo].[FVb3578bafQ001Detail]