--Consumable
Select Distinct ClientID, X.CategoryCodeID, ClientName, HomePageLink, X.Advertiser, X.Market 
into tempdb..Consumable_PMTCS_7200
from (
Select Distinct CategoryCodeID, R.RetMktID, Advertiser, Market 
from MasterClientCoverage..RetMkt R
Join MasterClientCoverage..MasterClientCWM C
On R.RetMktID = C.RetMktID   
Union
Select Distinct CategoryCodeID, R.RetMktID, Advertiser, Market 
from MasterClientCoverage..RetMkt R
Join MasterClientCoverage..MasterClientCWM C
On R.RetID = C.RetID   
Union
Select Distinct CategoryCodeID, R.RetMktID, Advertiser, Market 
from MasterClientCoverage..RetMkt R
Join MasterClientCoverage..MasterClientCWM C
On R.MktID = C.MktID   
Union
Select Distinct CategoryCodeID, R.RetMktID, Advertiser, Market 
from MasterClientCoverage..RetMkt R
Join MasterClientCoverage..MasterClientCWM C
On R.TCID = C.TCID   
Union
Select Distinct CategoryCodeID, R.RetMktID, Advertiser, Market 
from MasterClientCoverage..RetMkt R
Join MasterClientCoverage..ClientCWMException C
On R.RetMktID = C.FieldValue
Where FieldID=153 ) X
Join MasterAdviewData..AdviewMain CWM
On X.RetMktID = CWM.RetMktID
Join MT2SQL14.SiteControl.dbo.vw_catinfo C
On C.CategoryCodeID = X.CategoryCodeID 
Where Active=1 and EntryProjectID is not null 
and (CWMFUll=1 Or ClientPDT=1)
and ClientServer in ('MT2SQL04','MT2SQL07','MT2SQL08')
Order by 1,2,3,4,5,6
  

--Durable

--Ret-Mkt Coverage for Durable Code on MT2SQL14
Select  Distinct CP.ClientId,CP.CategoryCodeID,ClientName, HomePageLink, B.Descrip as Retailer,C.Descrip as Market 
into tempdb.dbo.Durable_PMTCS_7200
from MT1SQL02.IADlertADmin.dbo.CLRetMkt A
Join MT1SQL02.IADlertADmin.dbo.Rets B
on A.RetId=B.RetId
Join MT1SQL02.IADlertADmin.dbo.Mkts C
on A.MktId=c.MktId 
Join MT1SQL01.MasterData.dbo.ADlertToFV AD
on A.ClientID=AD.ClientID
join MT2SqL14.SiteControl.dbo.vw_catinfo CP
on CP.Category = AD.DatabaseCategory
 where AD.[Enabled]=1
 and IsAdlert=1 and ClientServer in ('MT2SQL01','MT2SQL05','MT2SQL09')
 order by 1,2,3,4,5








--Durable
Select * from tempdb.dbo.Durable_PMTCS_7200

--Consumable
Select * from tempdb.dbo.Consumable_PMTCS_7200