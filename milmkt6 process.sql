SalesText1 = SalesTerritory
,SalesText6 = SalesTerritory
,SalesText7 = SalesTerritorySubGroup
,SalesText8 = SalesTerritoryGroup



-- Full Update ---------------------
select top 100 * from [MILMKT6FVBrandPackSizeMapping]
select top 10000 * from MILMKT6MPVBrandPackSize
select top 100 StoreAdZone ,* from [milmkt6Market6Feed]
select top 100 * from MILMKT6DisBrandPackSize

select SalesTerritory ,salestext1,salestext2,* from MILMKT6DetailReports where advertiser  like '%kroger%'

select top 100 * from [MILMKT6Market6SalesData_Intermediate]

select top 100 * from milmkt6_Market6BrewerRollup
select top 100 * from milmkt6_Market6SubsegmentRollup

-- Daily Update ---------------------
select * from Mil50dailyupdate
/* MANUFACTURER ROLL-UP VALUES. */
 SalesText3
/* MANUFACTURER ROLL-UP VALUES SORT ORDER. */
 SalesNumeric5 
on d.SalesText3 = m.SalesText3    --1.25
/* SEGMENT ROLL-UP VALUES */
SalesText4 
/* SEGMENT ROLL-UP VALUES SORT ORDER */
SalesNumeric6 
on d.SalesText4 = m.SalesText4

/* AD BLOCK TYPE VALUES */
SalesText5 = X.BlockType
/* AD BLOCK TYPE SORT ORDER */
 SalesNumeric20
on d.SalesText5 = m.SalesText5

/* UPDATING SIMPLIFIED PAGE POSITIONS */
	SalesText9
/* UPDATING SORT ORDER BY SIMPLIFIED PAGE POSITIONS */
SalesNumeric7

/* UPDATING SalesText11 AND SalesText12 */
SalesText11  d.SalesText12



--------------------------------------------------------------------------------------


select top 100 * from MILMKT6Market6SalesData_Intermediate
select top 100 * from MILMKT6Market6SalesData_ClusterWeeklyIndexValue




select top 100 * from [milmkt6Market6Feed] 
select top 100 * from [milmkt6Market6BrandPackSizeMapping] 