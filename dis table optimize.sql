select  RetMktID,MediaID,CategoryID,BrandID,MPVOffer ,MPVOfferId  ,MPVPageEvent ,MPVPageEventId ,MPVPageTheme ,MPVPageThemeId 
into tempdb..v 
from MasterACFV.dbo.ACFVDetailReports

insert into MasteracfvOfferType_Test
select RetMktID,MediaID,CategoryID,BrandID,MPVOffer  as OfferType, MPVOfferId as OffertypeID 
from tempdb..v 
select * from tempdb..v 

select RetMktID,MediaID,CategoryID,BrandID,MPVPageEvent  as OfferType, MPVPageEventId as OffertypeID 
into MasteracfvOfferType_Test
from tempdb..v 

insert into MasteracfvOfferType_Test
select RetMktID,MediaID,CategoryID,BrandID,MPVPageTheme  as OfferType, MPVPageThemeId as OffertypeID 
from tempdb..v 
