--Select Distinct C.ClientID,ClientName,ID,Category,ClientServer, FVCCType  
--into tempdb..CanadianClientsList
--from Subscription..ClientProfile P
--Join SiteControl..CategoryCode C 
--On C.ClientID = P.ClientID 
--Where isnull(IsCanadaClient,0)=1
--and isnull(IsActiveClient,0)=1 
--and FVCCType=3
--Order by 5,1,3 

Select * from tempdb..CanadianClientsList where ClientServer in ('MT2SQL01','MT2SQL05','MT2SQL09')

Select Distinct ClientName,HomePageLink,RealCategory 
from vw_catinfo C
Join MT2SQL00.tempdb.dbo.CanadianClientListZCat T
On C.CategoryCodeId = T.CategoryCodeId



Select * into tempdb..CanadianCategory1 from MT2SQL14.SiteControl.dbo.vw_MerchandiseCategory 
Where CategoryCodeID in(Select ID from MT2SQL14.tempdb.dbo.CanadianClientsList where ClientServer in ('MT2SQL01','MT2SQL05','MT2SQL09'))

Select *  into tempdb..CanadianRetMkt1 from MasterClientCoverage..MasterClientCWMDur 
Where CategoryCodeID in(Select ID from MT2SQL14.tempdb.dbo.CanadianClientsList where ClientServer in ('MT2SQL01','MT2SQL05','MT2SQL09'))

select distinct rm.categorycodeid, R.retmktid,R.Advertiser,R.Market, Realcategory, 
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
into tempdb..CanadianClientListZCat
from tempdb..CanadianRetMkt rm, tempdb..CanadianCategory c,
MasterClientCoverage..retmkt R 
where rm.categorycodeid=c.categorycodeid and R.RetMktID = rm.RetMktID 
and C.RealCategory Like 'Z%'

Select CWM.Advertiser, CWM.Market, PDT.Category, Count(Distinct PDT.PageDetailID)
from tempdb..CanadianClientListZCat C
Join MasterAdviewData..AdviewMain CWM
On C.RetMktID = CWM.RetMktID 
Join MasterAdviewData..MasterPageDetailTable PDT
On CWM.FlyerID = PDT.FlyerId 
and C.RealCategory=PDT.Category    
group by CWM.Advertiser, CWM.Market, PDT.Category

Select Distinct Advertiser,Market,RealCategory from tempdb..CanadianClientListZCat 


-- Durable

select distinct rm.categorycodeid, retmktid, Realcategory, 
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
--into tempdb..CanadianClientListZCat
from tempdb..CanadianRetMkt1 rm, tempdb..CanadianCategory1 c
where rm.categorycodeid=c.categorycodeid

