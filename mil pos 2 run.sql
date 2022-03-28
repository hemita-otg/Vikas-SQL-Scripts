---14
select * from milSalesTerritoryGroups where SalesTerritory like '%GIANT EAGLE COLUMBUS CEN RTA%' 

select * from milAdvertiserSalesTerritory  where SalesTerritory like '%GIANT EAGLE COLUMBUS CEN RTA%' 

update milAdvertiserSalesTerritory  set SalesTerritory = 'GIANT EAGLE CLEVELAND CENSUS TA' where  SalesTerritory like '%GIANT EAGLE CLEVELAND CEN RTA%' 

update milSalesTerritoryGroups  set SalesTerritory = 'GIANT EAGLE CLEVELAND CENSUS TA' where  SalesTerritory like '%GIANT EAGLE CLEVELAND CEN RTA%' 


update milAdvertiserSalesTerritory  set SalesTerritory = 'GIANT EAGLE COLUMBUS CENSUS TA' where  SalesTerritory like '%GIANT EAGLE COLUMBUS CEN RTA%' 

update milSalesTerritoryGroups  set SalesTerritory = 'GIANT EAGLE COLUMBUS CENSUS TA' where  SalesTerritory like '%GIANT EAGLE COLUMBUS CEN RTA%' 


---00

select * from Nielsen_MillerCoors_SalesData  where [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 
update Nielsen_MillerCoors_SalesData  set [Market Short Description] = 'GIANT EAGLE CLEVELAND CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 


select * from Nielsen_MillerCoors_SalesData  where [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 
update Nielsen_MillerCoors_SalesData  set [Market Short Description] = 'GIANT EAGLE COLUMBUS CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 



select * from NielsenMarketMapping where NielsenMarketDescription ='GIANT EAGLE CLEVELAND CEN RTA' 
update NielsenMarketMapping set NielsenMarketDescription ='GIANT EAGLE CLEVELAND CENSUS TA' , SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA'  where NielsenMarketDescription ='GIANT EAGLE CLEVELAND CEN RTA'  



select * from NielsenMarketMapping where NielsenMarketDescription ='GIANT EAGLE COLUMBUS CEN RTA' 
update NielsenMarketMapping set NielsenMarketDescription ='GIANT EAGLE COLUMBUS CENSUS TA' , SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA'  where NielsenMarketDescription ='GIANT EAGLE COLUMBUS CEN RTA'  



---08

select * from Nielsen_MillerCoors_SalesData  where [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 
update Nielsen_MillerCoors_SalesData  set [Market Short Description] = 'GIANT EAGLE CLEVELAND CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 


select * from Nielsen_MillerCoors_SalesData  where [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 
update Nielsen_MillerCoors_SalesData  set [Market Short Description] = 'GIANT EAGLE COLUMBUS CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 



select * from NielsenMarketMapping where NielsenMarketDescription ='GIANT EAGLE CLEVELAND CEN RTA' 
update NielsenMarketMapping set NielsenMarketDescription ='GIANT EAGLE CLEVELAND CENSUS TA' , SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA'  where NielsenMarketDescription ='GIANT EAGLE CLEVELAND CEN RTA'  



select * from NielsenMarketMapping where NielsenMarketDescription ='GIANT EAGLE COLUMBUS CEN RTA' 
update NielsenMarketMapping set NielsenMarketDescription ='GIANT EAGLE COLUMBUS CENSUS TA' , SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA'  where NielsenMarketDescription ='GIANT EAGLE COLUMBUS CEN RTA'  

----



select * from mil50POSOverlay   where [Market_Short_Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 
update mil50POSOverlay  set [Market_Short_Description] = 'GIANT EAGLE CLEVELAND CENSUS TA',nielsen_store_cluster = 'GIANT EAGLE CLEVELAND CENSUS TA' where  [Market_Short_Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 

select * from mil50POSOverlay   where [Market_Short_Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 
update mil50POSOverlay  set [Market_Short_Description] = 'GIANT EAGLE COLUMBUS CENSUS TA',nielsen_store_cluster = 'GIANT EAGLE COLUMBUS CENSUS TA' where  [Market_Short_Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 


-----
select * from mil50NielsenSalesData_Intermediate   where [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 
update mil50NielsenSalesData_Intermediate  set [Market Short Description] = 'GIANT EAGLE CLEVELAND CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE CLEVELAND CEN RTA' 


select * from mil50NielsenSalesData_Intermediate  where [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 
update mil50NielsenSalesData_Intermediate  set [Market Short Description] = 'GIANT EAGLE COLUMBUS CENSUS TA' where  [Market Short Description] = 'GIANT EAGLE COLUMBUS CEN RTA' 
--

select * from iddb..SalesTerritory where SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA'
select * from iddb..SalesTerritory where SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA'
--insert into iddb..SalesTerritory (SalesTerritory ) values('GIANT EAGLE CLEVELAND CENSUS TA')
select * from mil50FlyerReports where SalesTerritory ='GIANT EAGLE CLEVELAND CEN RTA'

update mil50FlyerReports set SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA' ,SalesTerritoryId =11075157 where SalesTerritory ='GIANT EAGLE CLEVELAND CEN RTA'
update mil50FlyerReports set SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA' ,SalesTerritoryId =11075156 where SalesTerritory ='GIANT EAGLE COLUMBUS CEN RTA'


update mil50PageReports set SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA' ,SalesTerritoryId =11075157 where SalesTerritory ='GIANT EAGLE CLEVELAND CEN RTA'
update mil50PageReports set SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA' ,SalesTerritoryId =11075156 where SalesTerritory ='GIANT EAGLE COLUMBUS CEN RTA'


update mil50DetailReports set SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA' ,SalesTerritoryId =11075157 where SalesTerritory ='GIANT EAGLE CLEVELAND CEN RTA'
update mil50DetailReports set SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA' ,SalesTerritoryId =11075156 where SalesTerritory ='GIANT EAGLE COLUMBUS CEN RTA'


update mil50DisAdvertiserMarket  set salestext6='GIANT EAGLE CLEVELAND CENSUS TA' , SalesTerritory ='GIANT EAGLE CLEVELAND CENSUS TA' ,SalesTerritoryId =11075157 where SalesTerritory ='GIANT EAGLE CLEVELAND CEN RTA'
update mil50DisAdvertiserMarket set salestext6='GIANT EAGLE COLUMBUS CENSUS TA' , SalesTerritory ='GIANT EAGLE COLUMBUS CENSUS TA' ,SalesTerritoryId =11075156 where SalesTerritory ='GIANT EAGLE COLUMBUS CEN RTA'


------------------QC


select distinct advertiser,market,salestext1, salestext6,SalesTerritory  from mil50DetailReports where advertiser='giant eagle' and market in ('Cleveland, OH','Columbus, OH')