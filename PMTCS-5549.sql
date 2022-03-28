
---Legacy 

Select Distinct R.Advertiser, LTRIM(RTRIM(Replace(R.Market, '-Email',''))) Market,
Case When R.Market in ('Internet')  Then 'Web'
When R.Market Like '%Email' Then 'Email' 
Else ''
End as [Web/Email]
from FRRetMkt F
Join MT2SQL00.MAsterClientCoverage.dbo.RetMkt R
on F.RetMktID = R.RetMktID
Join FlashAds AD on Ad.RetMktID = F.RetMktID 
Order by 1,2,3

Select Distinct R.Advertiser, LTRIM(RTRIM(Replace(R.Market, '-Email',''))) Market,
Case When R.Market in ('Internet')  Then 'Web'
When R.Market Like '%Email' Then 'Email' 
Else ''
End as [Web/Email]
from FRRetMktMW F
Join MT2SQL00.MAsterClientCoverage.dbo.RetMkt R
on F.RetMktID = R.RetMktID
Join FlashAdsMW AD on Ad.RetMktID = F.RetMktID 
Order by 1,2,3


Select Distinct R.Advertiser, LTRIM(RTRIM(Replace(R.Market, '-Email',''))) Market,
Case When R.Market in ('Internet')  Then 'Web'
When R.Market Like '%Email' Then 'Email' 
Else ''
End as [Web/Email]
from FRRetMktCan F
Left Join MT2SQL00.MAsterClientCoverage.dbo.RetMkt R
on F.RetMktID = R.RetMktID
Join FlashAdsCan AD on Ad.RetMktID = F.RetMktID 
Order by 1,2,3

---PEP 

Select Distinct R.Advertiser, R.Market,
Case When R.Media in ('Web Promotion')  Then 'Web'
When R.Media in ('Email Promotion') Then 'Email' 
Else ''
End as [Web/Email]
from FRRetMktPEP F
Join MT2SQL00.MAsterClientCoverage.dbo.RetMktpep R
on F.RetMktID = R.RetMktID
Join FlashAdsPEP AD on Ad.RetMktID = F.RetMktID 
Order by 1,2,3

Select Distinct R.Advertiser, R.Market,
Case When R.Media in ('Web Promotion')  Then 'Web'
When R.Media in ('Email Promotion') Then 'Email' 
Else ''
End as [Web/Email]
from FRRetMktMWPEP F
Join MT2SQL00.MAsterClientCoverage.dbo.RetMktpep R
on F.RetMktID = R.RetMktID
Join FlashAdsMWPEP AD on Ad.RetMktID = F.RetMktID 
Order by 1,2,3
