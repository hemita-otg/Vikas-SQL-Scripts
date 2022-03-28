select * from mt2sql14.sitecontrol.dbo.vw_catinfo where categorycodeid in (3000,7251)

select  a.category as MasterPdtcategory, b.category as SAZCategory, a.brand as MasterPDTBrand, b.brand as SAZBrand, a.variety as MasterPDTVariety, b.MPVVariety as SAZMPVVariety 
 from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable  a join
  mt2sql07.sql07.dbo.Sazdetailreports b 
  on a.pagedetailid = b.OriginalPagedetailid 
 where a.brand ='Southern Comfort' and a.category ='Blended Whisky'

select  a.category as MasterPdtcategory, b.category as SAZCategory, a.brand as MasterPDTBrand, b.brand as SAZBrand, a.variety as MasterPDTVariety, b.MPVVariety as SAZMPVVariety 
 from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable a join
  mt2sql07.sql07.dbo.Sazdetailreports b 
  on a.pagedetailid = b.OriginalPagedetailid 
  where a.brand ='FireBall' and a.category ='Canadian Whisky'


MasterAdViewData..Master
MasterBevAl..MasterBevAL

 select * from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable  a where a.brand ='Southern Comfort' and a.category ='Blended Whisky'
 select * from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable  a where a.brand ='FireBall' and a.category ='Canadian Whisky'
 
 select distinct category from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable  a where a.brand ='Southern Comfort' 
 select distinct category from mt2sql07.masteradviewdata.dbo.Masterpagedetailtable  a where a.brand ='FireBall' 

 select distinct category from mt2sql07.MasterBevAl.dbo.MasterBevALdetailreports  a where a.brand ='Southern Comfort' 
 select distinct category from mt2sql07.MasterBevAl.dbo.MasterBevALdetailreports  a where a.brand ='FireBall' 


  select * from mt2sql07.sql07.dbo.Sazdetailreports where brand in ('FireBall','Southern Comfort')
  select * from mt2sql14.sitecontrol.dbo.vw_merchandisecategory where CategoryCodeID=3145

  select  distinct category  from masterbeval..masterbevaldetailreports order by 1 


  select * from MasterCatBrandVarietyMfrUpdate   where category in ('Canadian Whisky') and brand ='FireBall' 