--SQL14



Select * from ArchiveSub..CategoryCode where ClientID=1009 and id=7142

Select * from ArchiveSub..ClientProfile Where ClientName like '%Duracell%'  


Select * from SiteControlLog..MerchandiseCategoryControlLog Where CategoryCodeId =7142

--SQL00
Select Distinct P.Advertiser, P.Market  
from FVDataLog..MasterClientCWMPEPLog L
Join MasterClientCoverage..retmktpep P
on P.retmktid = L.RetMktID  
Where CategoryCodeID=7142
Order by 1,2


Select Distinct MerchandiseCategory, MerchandiseSubCat, Category 
from SiteControlLog..MerchandiseCategoryTemplatesDetailLog Where MCTemplateID =4847