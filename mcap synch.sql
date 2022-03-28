select distinct adnoteid,descrip  from MT1SQL01.MasterData.dbo.AdNotes




Hy Vee, Des Moines 7/6 VID 164265052 FID 17733570 
Hy Vee, Des Moines 8/31 VID 173591432 FID 18567806


select distinct tradeclass  from MasterAdviewData..adviewmain where advertiser like '%Kenyons Variety%'
select distinct tradeclass  from mt2sql15.sql15.dbo.bar50flyerreports where advertiser like '%Kenyons Variety%'

select * from MasterAdviewData..adviewmain where flyerid in ('17733570 ','18567806')
select MediaDetail , * from MasterAdviewData..masterpagedetailtable where flyerid in ('17733570 ','18567806')
select * from mt2sql11.sql11.dbo.prod50flyerreports where flyerid in ('17733570 ','18567806')
select * from mt2sql08.sql08.dbo.ANH50flyerreports where flyerid in ('17733570 ','18567806')
select mediadetail,* from mt2sql08.sql08.dbo.ANH50detailreports where flyerid in ('17733570 ','18567806')


select top 10 * from MasterAdviewData..MCAPVehiclePages 
select top 10 * from MasterAdviewData..masterpagedetailtable


case when F360.FlyerId is null then CWM.Media when IsNull(vp.[FVDisplayValue],pdt.[Features])  = ''Insert Online'' then ''Insert-Digital'' else ''Insert-Paper'' end as MediaDetail, 


with 
cwm as (select flyerid,media from MasterAdViewData..AdViewMain),
vp as (select  flyerid,PageNumber,[FVDisplayValue] from MasterAdviewData..MCAPVehiclePages ),
mpdt as (select  page,flyerid,pagedetailid,features,mediadetail  from MasterAdviewData..masterpagedetailtable),
f360 as (select * from tempdb.dbo.FlyersToCheck360)
select distinct mpdt.flyerid,mpdt.pagedetailid,mpdt.mediadetail,case when F360.FlyerId is null then CWM.Media when IsNull(vp.[FVDisplayValue],mpdt.[Features])  = 'Insert Online' then 'Insert-Digital' else 'Insert-Paper' end as MediaDetail1
into tempdb..kv
 from cwm join mpdt on cwm.FlyerID =mpdt.FlyerId 
 Left JOIN  vp on mpdt.flyerid = vp.flyerid and mpdt.page = vp.pagenumber
LEFT OUTER JOIN F360 on F360.FlyerId = CWM.FlyerID



select * from tempdb..kv where MediaDetail <> MediaDetail1 and flyerid in (17733570,18567806)

update m set mediadetail= t.mediadetail1 from 
 masteradviewdata..masterpagedetailtable m join tempdb..kv t on m.pagedetailid=t.pagedetailid where t.MediaDetail <> t.MediaDetail1 


update m set mediadetail= t.mediadetail1 from 
  mt2sql08.sql08.dbo.ANH50detailreports m join tempdb..kv t on m.originalpagedetailid=t.pagedetailid where t.MediaDetail <> t.MediaDetail1 

  update m set mediadetail='Insert-Digital' from 
  mt2sql08.sql08.dbo.ANH50detailreports m where originalpagedetailid in (  '036544153EC1',  '036544149EC1',  '039479403EC1')

  select distinct mediadetail from mt2sql08.sql08.dbo.ANH50detailreports where flyerid in (17733570 ,18567806)