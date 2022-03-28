update pdt set features=FVSystemValue
--select FVSystemValue, *
 from CSPageDetailTable PDT
JOIN Tempdb..MCAPVehiclePages VP
ON VP.FlyerID = PDT.Flyerid And PDt.Page = VP.PageNumber


--select * into tempdb..CSPageDetailTable from CSPageDetailTable
