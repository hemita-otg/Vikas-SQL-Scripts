/*

select * into tempdb..brewerRollUp from [NielsenBrewerRollup] where 1=2

insert into tempdb..brewerRollUp values('ANHEUSER BUSCH INBEV','ABI',2)
insert into tempdb..brewerRollUp values('BOSTON','Boston',3)
insert into tempdb..brewerRollUp values('CROWN IMPORTS','Const',4)
insert into tempdb..brewerRollUp values('DIAGEO/GUINNESS','Others',6)
insert into tempdb..brewerRollUp values('HEINEKEN USA','Hein',5)
insert into tempdb..brewerRollUp values('MIKES HARD BEVERAGE CO','Others',6)
insert into tempdb..brewerRollUp values('MILLERCOORS','MC',1)
insert into tempdb..brewerRollUp values('NORTH AMERICAN BREWERIES','Others',6)
insert into tempdb..brewerRollUp values('REM DOMESTIC BREWER','Others',6)
insert into tempdb..brewerRollUp values('REM IMPORT BREWER','Others',6)
insert into tempdb..brewerRollUp values('S&P','Others',6)


select * into tempdb..subsegmentRollUp from [NielsenSubsegmentRollup] where 1=2 



insert into tempdb..subsegmentRollUp values('ALTERNATIVE','Remaining',9)
insert into tempdb..subsegmentRollUp values('BUDGET','Budget',3)
insert into tempdb..subsegmentRollUp values('CIDER','Cider',8)
insert into tempdb..subsegmentRollUp values('COOLERS','Remaining',9)
insert into tempdb..subsegmentRollUp values('CRAFT','Craft',4)
insert into tempdb..subsegmentRollUp values('FMB','FMB',7)
insert into tempdb..subsegmentRollUp values('IMPORT','Import',5)
insert into tempdb..subsegmentRollUp values('MALT LIQUOR','Remaining',9)
insert into tempdb..subsegmentRollUp values('NEAR PREMIUM','Near Premium',2)
insert into tempdb..subsegmentRollUp values('PREMIUM LIGHT','Premium',1)
insert into tempdb..subsegmentRollUp values('PREMIUM REGULAR','Premium',1)
insert into tempdb..subsegmentRollUp values('SUPER PREMIUM','Super Prem',6)


*/


-----intermediate 

TRUNCATE TABLE [MILMKT6Market6SalesData_Intermediate]
GO

if exists(select * from tempdb..sysobjects where name = 'MILMKT6WeekOfn' and type = 'u')
	drop table tempdb..MILMKT6WeekOfn

select distinct WeekOf, WeekOfn into tempdb..MILMKT6WeekOfn from MILMKT6DetailReports with (nolock)

INSERT INTO [MILMKT6Market6SalesData_Intermediate]([Period Description Short],[Market Short Description], [MC_BREWER(C)], [BrewerReportValue], [BrewerSortOrder], [MC_SUBSEGMENT(C)], [SubSegmentReportValue], [SubSegmentSortOrder], BrandPackSize, [Total$], [Base$], WeekOf, WeekOfn, [Incr$], [DisplayStoreCount], [OOS_Scans], [OOS_UnitOpportunity], [OOS_DolOpportunity])
SELECT [KROGER_DESC],StoreAdZone, S.BREWER, MIN(B.[ReportValue]) BrewerReportValue, MIN(B.[SortOrder]) BrewerSortOrder
	, S.SegmentFeature, MIN(SEG.[ReportValue]) SubSegmentReportValue, MIN(SEG.[SortOrder]) SubSegmentSortOrder, BrandPackSize
	, SUM([SCANNED_RETAIL_DOLLARS]) [Total$], SUM([GROSS_MARGIN_DOLLARS]) [Base$], s.[START_DATE] WeekOf ,WeekOfn, SUM([SCANNED_RETAIL_DOLLARS]) - SUM([GROSS_MARGIN_DOLLARS]) [Incr$]
	, SUM(DisplayStoreCount), SUM(OOS_Scans), SUM(OOS_UnitOpportunity), SUM(OOS_DolOpportunity)
FROM [milmkt6Market6Feed] S WITH (NOLOCK)
	LEFT JOIN  milmkt6_Market6BrewerRollup B WITH (NOLOCK)
		ON S.BREWER = B.[MC_BREWER(C)]
	LEFT JOIN milmkt6_Market6SubsegmentRollup SEG WITH (NOLOCK)
		ON S.SegmentFeature = SEG.[MC_SUBSEGMENT(C)]
	JOIN tempdb..MILMKT6WeekOfn D WITH (NOLOCK) 
		on s.[START_DATE] = D.WeekOf
GROUP BY [KROGER_DESC], StoreAdZone, S.BREWER, S.SegmentFeature, BrandPackSize,[START_DATE], WeekOfn
GO



--------------------------Daily Update ----------



/* CLEAN UP OLD VALUES */
UPDATE MILMKT6DetailReports 
SET SalesText3 = NULL, SalesNumeric5 = NULL ,SalesText4 = NULL,SalesNumeric6 = NULL 
GO

/* MANUFACTURER ROLL-UP VALUES. */
update d set SalesText3 = m.ReportValue 
from MILMKT6DetailReports d with (nolock)
join  milmkt6_Market6BrewerRollup m
on isnull(d.Optional1,'') = isnull(m.[MC_BREWER(C)],'') --1.49
GO

/* MANUFACTURER ROLL-UP VALUES SORT ORDER. */
update d set SalesNumeric5 = m.SortOrder
from MILMKT6DetailReports d with (nolock)
join  milmkt6_Market6BrewerRollup m
on d.SalesText3 = m.ReportValue    --1.25
GO

/* SEGMENT ROLL-UP VALUES */
update d set SalesText4 = m.ReportValue
from MILMKT6DetailReports d with (nolock)
join milmkt6_Market6SubsegmentRollup m
on isnull(d.productterritorysubgroup,'') = isnull(m.[MC_SUBSEGMENT(C)],'')
GO

/* SEGMENT ROLL-UP VALUES SORT ORDER */
update d set SalesNumeric6 = m.SortOrder
from MILMKT6DetailReports d with (nolock)
join milmkt6_Market6SubsegmentRollup m
on d.SalesText4 = m.ReportValue
GO




