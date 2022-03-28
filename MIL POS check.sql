select distinct [Market Short Description]  from mil50NielsenSalesData_Intermediate where [Market Short Description] like '%food lion%'


select * from Nielsen_MillerCoors_SalesData where [product key] in  (120488559,74280821) and [Market Short Description] ='Food Lion TN_PRI' and [Period Description Short] ='1 W/E 12/01/18'

select * from tempdb..map  where [product key] in  (120488559,74280821) and [Market Short Description] ='Food Lion TN_PRI' and [Period Description Short] ='1 W/E 12/01/18'


select *from NielsenBrandPackSizeMapping

---------------------------------------------------------------------------------------------------
select distinct D.PageDetailId, M.BrandPackSize, T.*,M.Category,M.ProductTerritoryGroup,M.ProductTerritorySubGroup,M.Manufacturer,M.Brand,M.ProductTerritory,M.MPVVariety,M.MPVUnitType
 --into tempdb..map 
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
			Where PageDetailId=6125479516101414 



			select * from tempdb..map 

			--------------------------------------------------------------------

			select * from Nielsen_MillerCoors_SalesData  where [product key] in  (250428958,74280811,74280831,74300732,74300736) 
			and [Market Short Description] ='Rite Aid Mkt - NoCal_PRI' and [Period Description Short] ='1 W/E 01/12/19'

			select * from FVBrandPackSizeMapping where brand='Pacifico'

			--select * from NielsenBrandPackSizeMapping Where [MC_BRAND.C.] like '%PACIFICO%'
			

	select distinct BPSM.* 	FROM Nielsen_MillerCoors_SalesData T WITH (NOLOCK)
	INNER JOIN NielsenBrandPackSizeMapping BPSM WITH (NOLOCK)
		ON  ISNULL(T.[MC_BRAND(C)],'') = ISNULL(BPSM.[MC_BRAND.C.],'')
			AND ISNULL(T.[MC_BRAND FAMILY(C)],'') = ISNULL(BPSM.[MC_BRAND.FAMILY.C.],'')
			AND ISNULL(T.[MC_BRAND FRANCHISE(C)],'') = ISNULL(BPSM.[MC_BRAND.FRANCHISE.C.],'')
			AND ISNULL(T.[MC_BREWER(C)],'') = ISNULL(BPSM.[MC_BREWER.C.],'')
			AND ISNULL(T.[MC_SUBSEGMENT(C)],'') = ISNULL(BPSM.[MC_SUBSEGMENT.C.],'')
			AND ISNULL(T.[MC_PACKAGE SIZE(C)],'') = ISNULL(BPSM.[MC_PACKAGE.SIZE.C.],'')
			AND ISNULL(T.[MC_CONTAINER(C)],'') = ISNULL(BPSM.[MC_CONTAINER.C.],'')
			AND ISNULL(T.[MC_OUNCE(C)],'') = ISNULL(BPSM.[MC_OUNCE.C.],'')
			where [product key] in  (250428958,74280811,74280831,74300732,74300736)
			 and [Market Short Description] ='Rite Aid Mkt - NoCal_PRI' and [Period Description Short] ='1 W/E 01/12/19'