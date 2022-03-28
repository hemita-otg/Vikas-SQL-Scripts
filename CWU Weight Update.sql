UPDATE DR
	SET Weight = 
		  CASE WHEN Category IN ('Wine', 'Sparkling Wine', 'Dessert Wine', 'Wine with Fruit', 'Wine - Sparkling') THEN 
				[PageScore] * [ImageScore] * (2 * [RetailerScore100base]) * (2 * [MSWinebase100]) * 100
		  ELSE
				[PageScore] * [ImageScore] * (2 * [RetailerScore100base]) * (2 * [MSSpiritsbase100]) * 100
		  END 
--		select *
		FROM cwu50DetailReports DR Left Outer Join tblPageScore PS 
				ON DR.Features=PS.Features Left Outer Join tblImageScore IMS
				ON DR.TaggedCompany = IMS.TaggedCompany Left Outer Join tblRetailerScore100Base RS
				ON DR.District = RS.State2 and DR.Advertiser = RS.Advertiser LEFT Outer Join tblMSSpiritsWine100Base SW
				ON DR.District=SW.[State]
				where dr.advertiser <> 'bevmo' and weight is null and ((market not in ('internet','facebook','twitter') and market not like '%email%'))
				
				insert into tblRetailerScore100Base values('MO','Grain Valley Market',0.499250374812594)
				insert into tblRetailerScore100Base values('NY','Marketplace Emporium',0.50251256281407)

				select * from tblPageScore
				select * from tblimageScore
				select * from tblRetailerScore100Base where advertiser like '%HEB Plus%'
				select * from tblRetailerScore100Base where advertiser like '%Marketplace Emporium%'
				select * from tblMSSpiritsWine100Base
				select * from cwu50detailreports where features ='' and flyerid  in 
				(select flyerid from cwu50flyerreports )

				select * from cwu50pagereports where flyerid in 
				(select flyerid  from cwu50detailreports where features ='')

				Execute mt_proc_Create_ID_Update 'cwu50DetailReports', 'features'

				select top 100 * from categorycodelog order by id desc 

				update cwu50detailreports set features='Interior Page' , FeaturesId =6 where features ='' 

select distinct features from masteradviewdata..masterpagedetailtable where pagedetailid in 
(
select originalpagedetailID into tempdb..test
		FROM cwu50DetailReports DR Left Outer Join tblPageScore PS 
				ON DR.Features=PS.Features Left Outer Join tblImageScore IMS
				ON DR.TaggedCompany = IMS.TaggedCompany Left Outer Join tblRetailerScore100Base RS
				ON DR.District = RS.State2 and DR.Advertiser = RS.Advertiser LEFT Outer Join tblMSSpiritsWine100Base SW
				ON DR.District=SW.[State]
				where dr.advertiser <> 'bevmo' and weight is null 
)


select t.*,m.flyerid  from mt2sql00.tempdb.dbo.test t join tempdb..miss m on t.flyerid=m.flyerid 

update cwu50detailreports set features=t.fvdisplayvalue 
select * from cwu50detailreports m join mt2sql00.tempdb.dbo.test1 t  on  t.flyerid=m.flyerid  and t.pagenumber=m.page --where advertiser <> 'bevmo' and weight is null 
select  m.* from cwu50detailreports m  where advertiser <> 'bevmo' and weight is null 


select m.page,features,* from tempdb..miss m join mt2sql00.tempdb.dbo.test1 t on  t.flyerid=m.flyerid and t.pagenumber=m.page


update m set features=t.fvdisplayvalue from cwu50detailreports m join mt2sql00.tempdb.dbo.test1 t  on  t.flyerid=m.flyerid  and t.pagenumber=m.page join tempdb..miss mm on mm.pagedetailid=m.pagedetailid 




update cwu50detailreports set taggedcompany= x.taggedcompany 
from cwu50detailreports c join (
select c.originalpagedetailid,p.taggedcompany  
from mt2sql07.tempdb.dbo.cm c join mt2sql00.tempdb.dbo.nullTaggedCompanyED p 
on  c.originalpagedetailid=p.pagedetailid) 
x on c.OriginalPageDetailID =x.originalpagedetailid 




select * from masteradviewdata..masterpagedetailtable where pagedetailid in (select originalpagedetailid from tempdb..p)

  
update C set taggedcompany= 'B' from cwu50detailreports c where pagedetailid in (select pagedetailid from tempdb..p)




select distinct n.TaggedCompany ,m.TaggedCompany  from mt2sql00.tempdb.dbo.NullTaggedCompanyed n join masteradviewdata..masterpagedetailtable m on n.pagedetailid =m.PageDetailID 



update m set taggedcompany = n.taggedcompany 
--select distinct n.TaggedCompany ,m.TaggedCompany
from mt2sql00.tempdb.dbo.NullTaggedCompanyed n join masteradviewdata..masterpagedetailtable m on n.pagedetailid =m.PageDetailID 





update cwu50detailreports set taggedcompany='C' where taggedcompany='D' 






select * from tblPageScore
				select * from tblimageScore
				select * from tblRetailerScore100Base where advertiser like '%Family Fare%'
				select * from tblRetailerScore100Base where advertiser like '%Marketplace Emporium%'
				select * from tblMSSpiritsWine100Base

				insert into tblRetailerScore100Base values('NE','Family Fare','1')