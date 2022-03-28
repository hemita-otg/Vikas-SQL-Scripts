Exec mt2sql00.masterclientcoverage.dbo.mtproc_GetPIToProcessRecsMCAP 0, 0, '', '[MT2SQL14]', '', 1

select top 10 * from  MasterClientCoverage.dbo.PIProcessingTableTempMCAP 
--Truncate table MasterClientCoverage.dbo.PIProcessingTableTempMCAP 
select prodimagecreated, * from MasterClientCoverage.dbo.PIProcessingTableTempMCAP  where pagedetailid in
('0035158E498','0035159E498','0035161E498','0035162E498','0035163E498','0035164E498','0035165E498','0035166E498','0035167E498','0035168E498','0035169E498','0035170E498','0035171E498','0035172E498','0035173E498','0035180E498','0035181E498','0035182E498','0035183E498','0035184E498','0035185E498','0035186E498','192865979AC','192865991AC','192866001AC','192866010AC','192866015AC','192866019AC','192866021AC','192866023AC','192866026AC','192866032AC','192866034AC','192866037AC','192866039AC','192866599AC','192866603AC','192866609AC','192866618AC')
--201608/101065032/Unsized/NUGSRN.Jpg

insert into  MasterClientCoverage.dbo.PIProcessingTableTempMCAP (PageDetailId,FullImagePath,TopLeftX,TopLeftY,BottomRightX,BottomRightY,Flyerid,Page,TableName,ProdImageCreated,FlyOrder,NormalImagePath,IsNewImagePath,CreationMonth,VehicleID)
select distinct PageDetailId,'201704/'+cast(Vehicleid as varchar)+'/unsized/'+imagename+'.jpg',TopLeftX,TopLeftY,BottomRightX,BottomRightY,t.Flyerid,Page,'TempJAPageDetailtable',ProdImageCreated,1,NormalImagePath,1,201704,vehicleid
from MasterClientCoverage..TEMPJAPageDetailTable t join mt2sql14.connection.dbo.MCAPVehiclePages v on t.FlyerId = v.FlyerId and t.Page = v.pagenumber
where pagedetailid in ('0035158E498','0035159E498','0035161E498','0035162E498','0035163E498','0035164E498','0035165E498','0035166E498','0035167E498','0035168E498','0035169E498','0035170E498','0035171E498','0035172E498','0035173E498','0035180E498','0035181E498','0035182E498','0035183E498','0035184E498','0035185E498','0035186E498','192865979AC','192865991AC','192866001AC','192866010AC','192866015AC','192866019AC','192866021AC','192866023AC','192866026AC','192866032AC','192866034AC','192866037AC','192866039AC','192866599AC','192866603AC','192866609AC','192866618AC')

select * from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP  where flyerid in ('15218282','15218330')

delete from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP  where flyerid not in ('15218282','15218330')

--Delete Unwanted records
Delete from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP Where FlyerID Not in (select flyerid from connection..mcapvehiclepages where vehicleid in (11269756, 51032652, 10412475))

--Unlock records from below table via truncating it
--select * from PIMultipleServerDistMCAP 
Truncate table PIMultipleServerDistMCAP

--Start instance on non MT2SQL00 server , particularly sms1 , stg1


insert into mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable
select * from mt2sql00.masteradviewdata.dbo.masterpagedetailtable where flyerid in ('15218282','15218330')

select ProdImageCreated ,* from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable where pagedetailid in (select pagedetailid from mt2sql00.masteradviewdata.dbo.masterpagedetailtable where flyerid in ('15218282','15218330'))

/*
--After todays regular PI is done please follow below steps
---Step 1 :  Take TempJaPDt bkup ( insert record in Tempjapagedetailtable on mt2sql00 for which PI to be created)

select * into tempdb..Tempjapagedetailtable from mt2sql00.masterclientcoverage.dbo.TempjaPagedetailTable

Truncate table mt2sql00.masterclientcoverage.dbo.TempjaPagedetailTable

insert into mt2sql00.masterclientcoverage.dbo.TempjaPagedetailTable
select * from mt2sql00.masteradviewdata.dbo.masterPagedetailTable where pagedetailid in ('155752564AC') -- Records whose PIs to be created

--Exec below call on MT2SQL00
Exec mt2sql00.masterclientcoverage.dbo.mtproc_GetPIToProcessRecsMCAP 0, 0, '', '[MT2SQL14]', '', 1

Please check our record come in below table once above call is done
select  * from  MasterClientCoverage.dbo.PIProcessingTableTempMCAP where pagedetailid in ('155752564AC')

Run ProductImage.exe from MT2DEV0 server from below path
\\mediatrack.net\FVData\Data\VB\Product Images Consolidated\

Restore Tempja bkup as is 


Truncate table mt2sql00.masterclientcoverage.dbo.TempjaPagedetailTable


 insert into mt2sql00.masterclientcoverage.dbo.TempjaPagedetailTable
 select * from tempdb..Tempjapagedetailtable

*/