/*
select * into dbo.hdadlpagedetailtable052010 from hdadlpagedetailtable
select * into dbo.hdadldisquerypage052010 from hdadldisquerypage
*/

use sql01 
update pdt 
set merchandisecategory=mc.merchandisecategory,
merchandisesubcat=mc.merchandisesubcat
from hdadlpagedetailtable pdt with (nolock) join conversioncontrol.dbo.mcupdate mc on
pdt.category=mc.category and mc.databasecategory='hdadl'
option (maxdop 1)

drop table hdadldisquerypage

select distinct 
Brand,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,SKUDescription1,SKUDescription2,SKUDescription3
into dbo.hdadldisquerypage 
from hdadlpagedetailtable


