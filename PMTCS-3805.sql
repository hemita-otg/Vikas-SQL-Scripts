Select * from tempdb..TmpRetMktCat  



Select * from MasterBevAL..BevAlRetMktCoverage Where CategoryCodeID=3145  
Select * from MasterBevAL..BevAlCategoryCoverage Where CategoryCodeID=3145

select distinct rm.categorycodeid, R.retmktid,R.Advertiser,R.Market, category, 
case
	when rm.startdate is not null and c.startdt is not null then
		case when rm.startdate > c.startdt then rm.startdate else c.startdt end
	else isnull(rm.startdate,c.startdt)
end as startdate,
case
	when rm.enddate is not null and c.enddt is not null then
		case when rm.enddate > c.enddt then c.enddt else rm.enddate end
	else isnull(rm.enddate,c.enddt)
end as enddate
into tempdb..BevalRetMktCatCov
from MasterBevAL..BevAlRetMktCoverage rm, MasterBevAL..BevAlCategoryCoverage c,
MasterClientCoverage..retmkt R 
where rm.categorycodeid=c.categorycodeid and R.RetMktID = rm.RetMktID 


Select * from tempdb..BevalRetMktCatCov


Select Distinct bev.*
into tempdb..RetMktBevAlMissing
from toja.dbo.RetMktCatTable reg
right Join tempdb..BevalRetMktCatCov bev
on reg.Retailer = bev.Advertiser and reg.Market = bev.Market  
and reg.Category = bev.Category 
where reg.Category is null
Order by 1,2,3

Select * from toja.dbo.RetMktCatTable

Select * from tempdb..RetMktBevAlMissing

;With CTE As
(
Select Year(CWM.Addate)Addate, CWM.RetMktID,PDT.Category, Count(Distinct PDT.PageDetailID) PDTCnt
from tempdb..RetMktBevAlMissing R
Join MasterAdviewData..AdviewMain CWM
On CWM.RetMktID = R.RetMktID  
Join MasterAdviewData..MasterPageDetailTable PDT
On CWM.FlyerID = PDT.FlyerId 
and PDT.Category = R.Category 
group by Year(CWM.Addate),CWM.RetMktID,PDT.Category
)
Select * into tempdb..bevPDTCnt from CTE


Update R Set PDTCnt = CWM.PDTCnt
from tempdb..RetMktBevAlMissing R
Join tempdb..bevPDTCnt CWM
On CWM.RetMktID = R.RetMktID  
and CWM.Category = R.Category 

;With CTE As
(
Select Year(CWM.Addate)Addate,CWM.RetMktID,PDT.Category, Count(Distinct PDT.PageDetailID) PDTCnt
from tempdb..RetMktBevAlMissing R
Join MasterAdviewData..AdviewMain CWM
On CWM.RetMktID = R.RetMktID  
Join MasterAdviewData..MasterPageDetailTable PDT
On CWM.FlyerID = PDT.FlyerId 
and PDT.Category = R.Category 
Join Masterbeval..MasterBevALDetailReports BEV
On Bev.PageDetailID = PDT.PageDetailidInt 
group by Year(CWM.Addate),CWM.RetMktID,PDT.Category
)
Select * into tempdb..bevBevPDTCnt from CTE


Select Distinct Advertiser, Market, R.Category, CWM.Addate, CWM.PDTCnt MasterPDTCnt, CWM1.PDTCnt MasterBevCnt
from tempdb..RetMktBevAlMissing R
Left Join tempdb..bevBevPDTCnt CWM
On CWM.RetMktID = R.RetMktID  
and CWM.Category = R.Category 
Left Join tempdb..bevPDTCnt CWM1
On CWM1.RetMktID = R.RetMktID  
and CWM1.Category = R.Category 
and CWM1.Addate = CWM.Addate 
Order by 1,2,3,4




Select * from tempdb..RetMktBevAlMissing
where advertiser='Belmont Beverage' and market='Ft. Wayne, IN' and category='Vodka'