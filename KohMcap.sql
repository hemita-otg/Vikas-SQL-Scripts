use sql09



drop table adkohcanVehiclePages

Select VehicleId As TrackNo, CWM.FlyerId, VehicleId, VP.FlyerId as FVFlyerID, PageNumber, ImageName, CreationMonth, PageName, PageTypeId, PageType, BaseCount, MaxCount, 
SinglePageAdInd, FrontPageInd, BackPageInd, InsideFrontPageInd, InsideBackPageInd, FVSystemValue, FVDisplayValue, ROPInd 
into adkohcanVehiclePages
from mt2sql01.tempdb.dbo.MCAPVehiclePages VP
inner join adkohcanChildWebMain CWM on CWM.FlyerId = VP.FlyerId 

Drop table adkohVehiclePages

Select VehicleId As TrackNo, CWM.FlyerId, VehicleId, VP.FlyerId as FVFlyerID, PageNumber, ImageName, CreationMonth, PageName, PageTypeId, PageType, BaseCount, MaxCount, 
SinglePageAdInd, FrontPageInd, BackPageInd, InsideFrontPageInd, InsideBackPageInd, FVSystemValue, FVDisplayValue, ROPInd 
into adkohVehiclePages
from mt2sql01.tempdb.dbo.MCAPVehiclePages VP
inner join adkohChildWebMain CWM on CWM.FlyerId = VP.FlyerId 


Declare @SQL varchar(8000)

			SET @SQL='CREATE CLUSTERED INDEX [idx_adkohVehiclePages] ON [dbo].[adkohVehiclePages] 
			(
			      [FlyerId] ASC
			)ON [PRIMARY]'
			EXEC(@SQL)
			
			SET @SQL='CREATE NONCLUSTERED INDEX [idx_adkohVehiclePages1] ON [dbo].[adkohVehiclePages] 
			(
			      [FlyerId] ASC,
			      [PageNumber] ASC
			)ON [PRIMARY]'
			EXEC(@SQL)



			SET @SQL='CREATE CLUSTERED INDEX [idx_adkohcanVehiclePages] ON [dbo].[adkohcanVehiclePages] 
			(
			      [FlyerId] ASC
			)ON [PRIMARY]'
			EXEC(@SQL)
			
			SET @SQL='CREATE NONCLUSTERED INDEX [idx_adkohcanVehiclePages1] ON [dbo].[adkohcanVehiclePages] 
			(
			      [FlyerId] ASC,
			      [PageNumber] ASC
			)ON [PRIMARY]'
			EXEC(@SQL)