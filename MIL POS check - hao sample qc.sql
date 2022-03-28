
SELECT D.PageDetailID,D.SalesText1	-- Add ISNULL here 
	, M.BrandPackSize
	, T.[Period Description Short] AS [SalesText2], T.[$] AS SalesNumeric1, T.[Base $] AS SalesNumeric2, T.[%ACV] AS SalesNumeric3	
--INTO #mil50DetailReports_SalesDataPilot -- Pilot Table
FROM mil50DetailReports D WITH (NOLOCK)	
	INNER JOIN FVBrandPackSizeMapping M WITH (NOLOCK)
		ON ISNULL(D.[Category], '') = ISNULL(M.[Category], '')
			AND ISNULL(D.[ProductTerritoryGroup], '') = ISNULL(M.[ProductTerritoryGroup], '')
			AND ISNULL(D.[ProductTerritorySubGroup], '') = ISNULL(M.[ProductTerritorySubGroup], '')
			AND ISNULL(D.[Manufacturer], '') = ISNULL(M.[Manufacturer], '')
			AND ISNULL(D.[Brand], '') = ISNULL(M.[Brand], '')
			AND ISNULL(D.[ProductTerritory], '') = ISNULL(M.[ProductTerritory], '')
			AND ISNULL(D.[MPVVariety], '') = ISNULL(M.[MPVVariety], '')
			AND ISNULL(D.[MPVUnitType], '') = ISNULL(M.[MPVUnitType], '')
			--AND ISNULL(D.[SKUDescription2], '') = ISNULL(M.[SKUDescription2], '')
			--AND ISNULL(D.[SKUDescription1], '') = ISNULL(M.[SKUDescription1], '')
			--AND ISNULL(D.[SKUDescription3], '') = ISNULL(M.[SKUDescription3], '')
	INNER JOIN Nielsen_MillerCoors_SalesData T WITH (NOLOCK) 
		ON T.[Market Short Description] = D.SalesText1 
			AND T.BrandPackSize = M.BrandPackSize
			AND CAST(SUBSTRING([Period Description Short], CHARINDEX('W/E', [Period Description Short]) + 4, 8)  AS DATE) = D.WeekOfN
			where pagedetailid=83877168342
GO

select weekofn,salestext1,mpvbrandpacksize, category,ProductTerritoryGroup,ProductTerritorySubGroup,Manufacturer,Brand,ProductTerritory,MPVVariety,* FROM mil50DetailReports D WITH (NOLOCK)	where pagedetailid=83877168342
select category,ProductTerritoryGroup,ProductTerritorySubGroup,Manufacturer,Brand,ProductTerritory,MPVVariety,* FROM FVBrandPackSizeMapping where brand='miller' and mpvvariety='Miller Lite' and mpvunittype='18 Pack 12 oz Bottle or Can'

select * from Nielsen_MillerCoors_SalesData where [Market Short Description]='Food Lion GA_PRI' and BrandPackSize in ('MILLER PREMIUM 18PK 12OZ CAN','MILLER PREMIUM 18PK 12OZ BOTTLE')
and [Period Description Short]='1 W/E 06/10/18'
2018-10-06 00:00:00.000


select * from Nielsen_MillerCoors_SalesData 
where [product key] in (72590422,72570512) and [MC_BRAND(C)]='MILLER LITE' and  [Period Description Short]='1 W/E 10/06/18'
and [Market Short Description]='Food Lion GA_PRI'


-----------



select * from Nielsen_MillerCoors_SalesData 
where [product key] in (72590422,72570512) and [MC_BRAND(C)]='MILLER LITE' and  [Period Description Short]='1 W/E 10/06/18'
and [Market Short Description]='Food Lion GA_PRI'

select * from tempdb..MILLER_COORS_FH_012819extract

where [product key] in (72590422,72570512) and [MC_BRAND(C)]='MILLER LITE' and  [Period Description Short]='1 W/E 10/06/18'
and [Market Short Description]='Food Lion GA_PRI'