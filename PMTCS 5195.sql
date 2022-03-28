select salestext4, salestext2, salestext1, MPVBrandPackSize,ProductTerritorySubGroup, * from mil50DetailReports d
where ProductTerritorySubGroupID = 10076094
and SalesText1 = 'NER-Price Chopper-CT_PRI' and SalesText2 = '1 W/E 03/09/19'
and MPVBrandPackSize = 'TRULY HARD SELTZER 12PK 12OZ CAN'

select SubSegmentReportValue, [Period Description Short], [Market Short Description], BrandPackSize, *
from mil50NielsenSalesData_Intermediate with (nolock) where [Market Short Description] = 'NER-Price Chopper-CT_PRI' and [Period Description Short] = '1 W/E 03/09/19'
and BrandPackSize = 'TRULY HARD SELTZER 12PK 12OZ CAN'

select ProductTerritorySubGroup,salestext4,* from Mil50dailyupdate
where ProductTerritorySubGroup='Seltzer'

select *
from Nielsen_MillerCoors_SalesData where [Market Short Description] = 'NER-Price Chopper-CT_PRI' and [Period Description Short] = '1 W/E 03/09/19'
and BrandPackSize = 'TRULY HARD SELTZER 12PK 12OZ CAN'





select distinct ProductTerritorySubGroup from mil50DetailReports where  category='FMBs' and brand='Truly Hard Seltzer'