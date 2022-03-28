If exists(select * from tempdb.dbo.sysobjects where name='FetchPageImage')
Drop table tempdb.dbo.FetchPageImage
Select * Into tempdb.dbo.FetchPageImage From MasterAdviewData.dbo.MasterPageDetailTable 
where pagedetailid in ('0286415H755','176699732AC')

--add required columns
Alter Table  tempdb.dbo.FetchPageImage Add ImageName varchar(20)
Alter Table  tempdb.dbo.FetchPageImage Add VehicleID Int
Alter Table  tempdb.dbo.FetchPageImage Add CreationMonth Int
Alter Table  tempdb.dbo.FetchPageImage Add VirtualDirectory varchar(10)
Go
Update A Set ImageName=B.ImageName,VehicleId=B.VehicleId,CreationMonth=B.CreationMonth 
From tempdb.dbo.FetchPageImage A Join MasterAdviewData.dbo.MCAPVehiclePages B On A.FlyerId=B.FlyerID And A.Page=B.PageNumber

Update A Set VirtualDirectory=B.VirtualDirectory
From tempdb.dbo.FetchPageImage A Join MT2SQL14.Connection.dbo.ArrayLocation B On '/'+cast(A.CreationMonth as varchar)=B.Array

--get PageImage column with required link
select 
'https://60.featurevision.com'+VirtualDirectory+'/'+cast(CreationMonth as varchar)+'/'+cast(VehicleID as varchar)+'/Full/'+ImageName+'.jpg' as PageImage
,topleftx,toplefty,bottomrightx,bottomrighty,category,brand,comments1,Features,saleprice1,Advertiser,Market,Addate,Media,Pages
from tempdb.dbo.FetchPageImage A Join MasterAdviewData.dbo.AdviewMain B ON A.FLyerId=B.FlyerId

