select * from ACFVCDetailMap where destpagedetailid = '019488919EC'	--4055714	011530301DC

select flyerid,page,pagedetailid,* from entrydatadur..usacmdpagedetailtable where pagedetailid='169940849AC'
select * from entrydatadur..usacmdfeatureproduct where pagedetailid='169940849AC'

select * from mt2sql00.masterdurdata.dbo.DurPDTMapCons where conspagedetailid='011530301DC'

select * from MCAPVehiclePages where flyerid='12871897'


select * from masterclientcoverage..tempjapagedetailtable_dur where trackno=114312752 and madcode=4055714 and page=11
--select * from masterclientcoverage..tempjapagedetailtable_dur where trackno=114312752 and madcode=4055714 and page=11

select * from mt2sql14.connection.dbo.pdtprocessed_dur where trackno=114312752 and madcode=4055714 and page=11

select * from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in ('011530301DC')


with 
ec as (select pagedetailid from masterclientcoverage..tempjapagedetailtable where pagedetailid like '%ec'),
cmap as (select * from ACFVCDetailMap ) 
select distinct ec.pagedetailid,cmap.sourcepagedetailid from 
ec join cmap on ec.pagedetailid = cmap.DestPageDetailId 



select * from masterclientcoverage..tempjapagedetailtable where pagedetailid like '%dc'
select * from masterclientcoverage..tempjapagedetailtable_dur 



select *  into tempdb..todays_dc from mt2sql00.masterdurdata.dbo.DurPDTMapCons where CONSPageDetailId in
(
select pagedetailid  from masterclientcoverage..tempjapagedetailtable where pagedetailid like '%dc') and DURPageDetailId like '%ec'

SELECT  * FROM TEMPDB..TODAYS_DC 

select distinct t.*,tja.flyerid,tja.Page ,tja.pagedetailid,mcap.VehicleId into tempdb..todays_dcdata from 
tempdb..todays_dc t join masterclientcoverage..tempjapagedetailtable tja on t.CONSPageDetailId =tja.PageDetailID 
join mcapvehiclepages mcap on tja.flyerid=mcap.flyerid and tja.Page =mcap.PageNumber 

select * from tempdb..todays_dcdata t join masterclientcoverage..tempjapagedetailtable_dur d on t.VehicleId =d.trackno and t.madcode =d.madcode and cast(t.Page as varchar(10)) =d.page 