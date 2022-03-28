Select  A.FlyerId,Advertiser,Market,Addate,WeekOf,Media,Pages,Page,PageDetailId,Category,Brand,Comments1,SalePrice1,topleftx,toplefty,bottomrightx,bottomrighty,
 Replace(master.dbo.SpotFireURL_GetPIImagePathMCAP_MT2SQL14(PageDetailID, 'PrF', 0), '50.featurevision.com', '60.featurevision.com') As ProductImagePath ,
cast(NULL as varchar(500)) AS PageImage,B.ImageName+'.jpg' as ImageName,VehicleId,CreationMonth,'\\mt2img03\MT2IMG03k\VehicleImage\'+cast(CreationMonth as varchar)+'\'+cast(VehicleId as varchar)+'\UnSized\' as NetworkPath
From  mt2sql00.tempdb.dbo.t  A 
join MT2SQL00.MasterAdviewData.dbo.AdviewMain C
on A.FlyerID = C.FlyerID --This table should have PDTID,FlyerID,Page
Left JOin MT2SQL14.Connection.dbo.MCAPVehiclePages B
On A.FlyerId=B.FlyerId AND A.Page=B.PageNumber
Where Brand like '%Horlick%' and Year(Addate) in (2013,2014)

select a.* into tempdb..t from Fvhistory..MasterFVHistoryDetailReports a join masteradviewdata..adviewmain b on a.flyerid=b.flyerid 
Where Brand like '%Horlick%' and Year(Addate) in (2013,2014)

insert into Connection..PDTProcessed
 select * from Connection..PDTProcessed where pagedetailid in ( select originalpagedetailid from mt2sql00.tempdb.dbo.t)