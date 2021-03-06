USE [DataSP50Int]
GO
/****** Object:  StoredProcedure [dbo].[fv_GetRetailerActivityEventUsage]    Script Date: 7/10/2019 7:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[fv_GetRetailerActivityEventUsage]
				  @pTempTableName VARCHAR(255)
				, @pFlyerTableName VARCHAR(255)
				, @pDataDBPrefix VARCHAR(255)
				, @pWhereClause VARCHAR(MAX)
				, @pUserId INT
				, @pClientId INT  
				, @pCategoryCodeId INT	
				, @pSubscriptionDBPrefix VARCHAR(128)
				, @pControlDBPrefix VARCHAR(128)	
				, @pConnectionDBPrefix VARCHAR(128)	
				, @pLogDatabasePrefix VARCHAR(128)	
				, @pResultType TINYINT
				, @pFiscalYear VARCHAR(5) = '1/1'
				, @pPrintMediaIds VARCHAR(100)	
				, @pFieldName VARCHAR(20) = 'Event'
AS
BEGIN		
		DECLARE @lSQL VARCHAR(MAX), @lNoneId INT, @lIdFieldName VARCHAR(20)

		IF @pFieldName IS NULL
			SET @pFieldName = 'Event'

		SET @lIdFieldName = @pFieldName + 'Id'

		SET @lNoneId = 18
		IF @pFieldName = 'Theme'
			SET @lNoneId = 98

		--SET @lSQL = 'SELECT
		--				non empty { [Measures].[Flyer Count] } ON COLUMNS,
		--				NON EMPTY ({([<<<CubeName>>>DimDate].[WeekRange].[WeekRange],[<<<CubeName>>>DimAdvertiser].[Advertiser].[Advertiser],
		--				[<<<CubeName>>>DimMarket].[Market].[Market],[<<<CubeName>>>FactFlyerPage].[RetMktId].[RetMktId],
		--				(-{[<<<CubeName>>>DimEvent].[Event].[Event].&[None]}))}) on rows
		--				FROM [<<<CubeName>>>]'

		--SELECT @lSQL 

		IF @pResultType = 3
		BEGIN
			--EXEC fv_CreateDAAOnlyTempTable @pUserId, @pClientId, @pCategoryCodeId, @pDataDBPrefix, @pSubscriptionDBPrefix, @pControlDBPrefix, @pConnectionDBPrefix, @pLogDatabasePrefix, @pTempTableName, @pFlyerTableName, @pResultType, @pFiscalYear				
			SET @pTempTableName = REPLACE(@pTempTableName, 'Detail', 'DAAOnly')
			SET @pTempTableName = REPLACE(@pTempTableName, 'Filter', '')
		END

			SET @lSQL = 'with
						tempData AS
						(
							SELECT F.Weekof, F.advertiser, F.market, F.retmktid, F.'+  @pFieldName+' as event, F.Flyerid, F.'+ @lIdFieldName +' as eventid
							FROM ' + @pTempTableName + ' T
							INNER JOIN ' + @pDataDBPrefix + @pFlyerTableName + ' F ON F.FlyerId = T.FlyerId							
							WHERE MediaId IN ('+ @pPrintMediaIds +')' 

			IF @pWhereClause IS NOT NULL
				SET @lSQL = @lSQL + ' AND ' + @pWhereClause

			SET @lSQL = @lSQL + ')
						, EventCTE as
						(
						Select convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101) as weekrange,advertiser, market, retmktid,event,
						row_number() over (partition by retmktid,advertiser, market,event order by  retmktid ,event,convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101)) as Occurrence,
						row_number() over (partition by convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101), retmktid  order by event) as WeekOccurrence
						,Count(distinct Flyerid) as FlyerCount, Weekof
						from tempData
						where eventid<>'+ CAST(@lNoneId AS VARCHAR) +' 
						group by convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101),retmktid,advertiser, market, event, Weekof
						)
						,NoEvent as
						(
						Select  convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101) as weekrange ,advertiser, market,retmktid, event
						,0 as Occurrence,
						1 as WeekOccurrence,
						Count(distinct Flyerid) as FlyerCount, Weekof
						from tempData
						where eventid='+ CAST(@lNoneId AS VARCHAR) +'  
						group by convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101),retmktid,advertiser, market, event, Weekof
						)
						,AllWeeks as
						(Select distinct  weekrange,advertiser, market,retmktid,NULL As Event,0 as Occurrence,
						1 as WeekOccurrence, 0 as FlyerCount, b.Weekof
						From tempData a cross Join 
						(Select distinct convert(varchar(10),Weekof,101) + '' - '' + convert(varchar(10),Dateadd(d,6,weekof),101) as weekrange, weekof 
							from tempData ) b
						)
						select weekrange, advertiser, Market, retmktid, event, Occurrence, FlyerCount from (select A.weekrange, A.advertiser, A.Market, A.retmktid, A.event, A.Occurrence, A.FlyerCount, A.Weekof 
						From AllWeeks A Left outer join 
							(
								select A.*
								From NoEvent A Left outer join (select * from EventCTE  where WeekOccurrence =1) B ON
								A.weekrange = B.weekrange AND A.retmktid=b.retmktid
								Where B.weekrange is null 
								Union 
								Select * from EventCTE where WeekOccurrence =1
							) B ON A.weekrange = B.weekrange AND A.retmktid=b.retmktid
						Where B.weekrange is null 
						Union
						select A.weekrange, A.advertiser, A.Market, A.retmktid, A.event, A.Occurrence, A.FlyerCount , A.Weekof
						From NoEvent A Left outer join (select * from EventCTE  where WeekOccurrence =1) B 
								ON A.weekrange = B.weekrange  AND A.retmktid=b.retmktid
						Where B.weekrange is null
						Union 
						Select weekrange, advertiser, Market, retmktid, event, Occurrence, FlyerCount, Weekof  from EventCTE  where WeekOccurrence =1) a
						Order by advertiser, Market,event'

    print @lSQL
	EXEC(@lSQL)

END


