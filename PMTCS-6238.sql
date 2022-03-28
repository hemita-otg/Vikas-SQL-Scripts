


Select Distinct ClientName,CC.Category Code, C.CategoryCodeId, C.MCTemplateID, CC.HomePageLink, MerchandiseCategory, MerchandiseSubCat, C.Category    
from SiteControl..vw_MerchandiseCategory C
Join SiteControl..vw_catinfo CC 
on C.CategoryCodeId = CC.CategoryCodeId 
Where C.Category in ('Other Meats','Dinner Sausage','Breakfast Sausage')
and FVCCType in (2,4,6)
Order by 1,3,6