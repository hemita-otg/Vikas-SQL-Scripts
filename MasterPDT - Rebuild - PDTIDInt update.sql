

Declare @AlterTable varchar(1000),@MapNULLPDTIds varchar(5000),@UpdateTable varchar(5000)

Set @AlterTable=''
Set @MapNULLPDTIds=''
Set @UpdateTable=''

Declare Cursur_for_Mapping cursor for
select 
'Exec MasterClientCoverage..mt_proc_UpdateMasterMapPagedetailID ''MasterClientCoverage.dbo.'+so.name+''', ''MAsterAdviewData.dbo.MasterMapPagedetailID''' MapNULLPDTIds,
'Update MCC SET PageDetailIDInt=Mmap.PageDetailID
FROM '+so.name+' MCC 
JOIN MAsterAdviewData..MasterMapPagedetailID Mmap
on MCC.PageDetailId=Mmap.OriginalPageDetailId 
where MCC.PageDetailIdInt IS NULL' UpdateTable 
from sysobjects so join syscolumns sc on so.id=sc.id 
where so.xtype='u' and sc.name like '%PageDetailIdInt%'
and so.name in ('mastercatpagedetailtable','masterfsiMultiplePageValues','masterfsipagedetailtable','MasterMultiplePageValues','MasterPageDetailTable')


open Cursur_for_Mapping
fetch next from Cursur_for_Mapping
into @AlterTable,@MapNULLPDTIds,@UpdateTable

while @@fetch_Status = 0
begin
	
	Print (@MapNULLPDTIds)
	
	Print (@UpdateTable)
	
	
	
fetch next from Cursur_for_Mapping
into @AlterTable,@MapNULLPDTIds,@UpdateTable

END                       
close Cursur_for_Mapping
deallocate Cursur_for_Mapping
