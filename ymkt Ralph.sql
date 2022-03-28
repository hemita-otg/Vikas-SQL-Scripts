Select a.*  from 
Masteradviewdata..MasterPageDetailTable a join BevAlCategoryCoverage b on
a.category=b.realcategory and a.flyerid in 
(select distinct flyerid from dbo.BevALFlyers)
and  pagedetailid='034191284EC'


select * from mt2sql00.masterbeval.dbo.MasterCatBrandVarietyMfrUpdate   where Category='VODKA'


select * from ymktdetailreports where originalpagedetailid='034191284EC'

select * from masterbeval..masterbevaldetailreports where originalpagedetailid='034191284EC'

select * from MasterAdviewData..masterpagedetailtable where pagedetailid='034191284EC'

select retid,mktid,active,EntryProjectID ,retmktid,* from MasterAdviewData..adviewmain where flyerid=16981523


select * from masterbeval..BevAlMasterPageDetailTable where pagedetailid='034191284EC'


select * from MT2SQL00.MasterClientCoverage.dbo.MasterClientCWM where CategoryCodeID=3145 and retmktid=22578
Ralphs (VH) Los Angeles, CA