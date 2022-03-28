
insert into tbl_lookup_category_ac (CategoryType,CategoryValue,CategoryCodeID,CreatedOn)
select CategoryType,replace(CategoryValue,'Origin','SkuType'),5867,getdate() from tbl_lookup_ac where categoryvalue like '%MPVOrigin%'



select * from tbl_lookup_ac where categoryvalue like '%MPVOrigin%'

---


select * from CategoryAppParameters   where categorycodeid in (select id from sitecontrol..categorycode where clientserver='mt2sql13')

insert into CategoryAppParameters(CategoryCodeID,AppName,ParamName,DatabaseParameterID)
select 5867,AppName,ParamName,DatabaseParameterID 
 from CategoryAppParameters   where categorycodeid =7224

 ---


 EXECUTE CreateFlyerReports 'sbapep','MasterACFV..acfvFlyerReports',0


	Exec CreateDetailReports_acfv 'sbapep','',0



	select count(1) from sbapepflyerreports 
	select count(1) from sbapeppagereports 
	select mpvskutype,mpvskutypeid,* from sbapepdetailreports where pagedetailid=806547001

	select * from sbapepMPVSkuType