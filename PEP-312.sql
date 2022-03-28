


Select MPV.*,MPVVAriety 
from SQL13..wlmPePDetailReports PDT
Join SQL13..wlmPePMPVVariety MPV
on PDT.PageDetailID = MPV.PageDetailId  
Where MerchandiseSubCat ='WINE'
Order by 1


Select MPV.*,MPVVAriety 
from MasterACFV..ACFVDetailReports PDT
Join MasterACFV..ACFVMPVVariety MPV
on PDT.PageDetailID = MPV.PageDetailId  
Where Category Like 'WINE%'
Order by 1


Select MPV.*,MPVVAriety 
from MasterACFV..ACFVDetailReports PDT
Join MasterACFV..ACFVMPVVariety MPV
on PDT.PageDetailID = MPV.PageDetailId  
Where OriginalPagedetailid=68702103 
Order by 1


--Robin
Select Distinct merchandisecategory, merchandisesubcat ,category,adc_i, L.adcompbrand_i, L.variety_i, variety_nm   
from ADCEntry..Variety_Link L
Join ADCEntry..Varieties P
on L.variety_i = P.variety_i 
Join ADCEntry..adcompbrand B
On L.adcompbrand_i = B.adcompbrand_i 
--Join adcentry.dbo.brand B1 on B1.brand_i = B.brand_i 
Join master..vwACFV_catbrandproduct_modified_2 V on V.brand_i = B.brand_i 
--Where V.category Like 'Wine%'
Where adc_i=162968659 
Order by adc_i
