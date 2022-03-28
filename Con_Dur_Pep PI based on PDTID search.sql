Select dbo.[AV_GetProductImagePathMCAP_AC] ('164855745','PrF','ActiveLocation','Website') -- PEP
Select 'https://www4.numerator.com' + dbo.[AV_GetProductImagePathMCAP] ('000000062EC','PrF','ActiveLocation','Website') -- Consumable
Select 'https://www4.numerator.com' + dbo.[AV_GetProductImagePathADLMCAP] ('0352502L735',20205386,13921455,'2','PrF','ActiveLocation','Website')  -- Durable


--PEP Product Images on MT2SQL14.Connection
Select dbo.[AV_GetProductImagePathMCAP_AC] ('164855745','PrF','ActiveLocation','Website') -- PEP

--PEP Page Images on MT2SQL13.MasterACFV
select distinct 'https://www.adcomparisons.com' + img
from MAsterACFV.dbo.ACFVDetailReports with (nolock)
Where OriginalPagedetailid='165246061' 

--Consumable Product Images on MT2SQL14.Connection
Select 'https://www4.numerator.com' + dbo.[AV_GetProductImagePathMCAP] ('000000062EC','PrF','ActiveLocation','Website') -- Consumable

--Consumable Page Images on MT2SQL00.MasterAdviewData
select distinct 
'https://www4.numerator.com'+VirtualDirectory+'/'+cast(CreationMonth as varchar)+'/'+cast(VehicleID as varchar)+'/Full/'+ImageName+'.jpg' as PageImage
from MasterAdviewData.dbo.MasterPageDetailTable A 
Join MasterAdviewData.dbo.AdviewMain B ON A.FLyerId=B.FlyerId
Join MasterAdviewData.dbo.MCAPVehiclePages C ON C.FlyerId=B.FlyerID And A.Page=C.PageNumber
Join MT2SQL14.Connection.dbo.ArrayLocation L ON '/'+cast(C.CreationMonth as varchar)=L.Array
Where PageDetailID='000000062EC' 


--Durable Product Images on MT2SQL14.Connection
-- PDTID, MadCode, TrackNo, Page
Select 'https://www4.numerator.com' + dbo.[AV_GetProductImagePathADLMCAP] ('0352502L735',20205386,13921455,'2','PrF','ActiveLocation','Website')  -- Durable

--Durable Page Images on MT2SQL14.Connection
SELECT DISTINCT
'https://www4.numerator.com'+VirtualDirectory+'/'+ cast(A.CreationMonth as varchar)+'/'+CAST(A.VehicleId AS VARCHAR(10)) + '/Full/' + A.ImageName + '.jpg'
FROM MT2SQL14.Connection.dbo.MCAPVehiclePages A
INNER JOIN MT2SQL14.Connection.dbo.TrackNoVehicleAssoc B
ON B.TrackNo = 217543162
AND A.VehicleId = B.VehicleId
INNER JOIN MT2SQL14.Connection.dbo.ArrayLocation C
ON '/'+cast(A.CreationMonth as varchar)=C.Array
WHERE A.PageNumber=157


