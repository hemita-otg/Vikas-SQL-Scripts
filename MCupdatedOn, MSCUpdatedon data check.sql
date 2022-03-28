use entrydata

select distinct min(mcupdatedon),min(mscupdatedon),max(mcupdatedon),max(mscupdatedon) from USACMCPageDetailTable  where McUpdatedOn <>  '1900-01-01 00:00:00'


select distinct  McUpdatedOn, MscUpdatedOn from  entrydata.dbo.USACMCPageDetailTable where isnull(rtrim(ltrim(McUpdatedOn)),'') <>'' or isnull(rtrim(ltrim(MscUpdatedOn)),'')  <> ''
select distinct  McUpdatedOn, MscUpdatedOn from  entrydata.dbo.USCTCMCPageDetailTable where isnull(rtrim(ltrim(McUpdatedOn)),'') <>'' or isnull(rtrim(ltrim(MscUpdatedOn)),'')  <> ''




select distinct min(mcupdatedon),min(mscupdatedon),max(mcupdatedon),max(mscupdatedon) from MasterAdviewData..MasterPageDetailTable   where McUpdatedOn <>  '1900-01-01 00:00:00'