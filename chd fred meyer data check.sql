select distinct advertiser  from triggercwm..tbldeflash order by 1 

select originalimage,* from mt3sql1.fvstaging.dbo.TblDEFlash where ForWeekOf = '6/19/16' and advertiser like 'fred meyer'
select * from masteradviewdata..masterpagedetailtable where flyerid in (select flyerid from mt3sql1.fvstaging.dbo.TblDEFlash where ForWeekOf = '6/19/16' and advertiser like 'fred meyer')

select * from mt2sql08.sql08.dbo.chd50detailreports where originalpagedetailid in (
select pagedetailid from masteradviewdata..masterpagedetailtable where flyerid in (
select flyerid from mt3sql1.fvstaging.dbo.TblDEFlash where ForWeekOf = '6/19/16' and advertiser like 'fred meyer')
)



select * from masteradviewdata..adviewmain where flyerid in ('8128363','8278911','8278949')
select entryprojectid,* from masteradviewdata..adviewmain where flyerid in ('8128364','8278912','8278950')
select * from adviewmain where flyerid ='7949260'

select * from masteradviewdata..masterpagedetailtable where flyerid in ('8128363','8278911','8278949')
select distinct category from masteradviewdata..masterpagedetailtable where flyerid in ('8128364','8278912','8278950')

select distinct category,count(1) from masteradviewdata..masterpagedetailtable where flyerid in ('8128364','8278912','8278950')
group by category order by 1 


select distinct flyerid,count(1) from masteradviewdata..masterpagedetailtable where flyerid in ('8128364','8278912','8278950')
group by flyerid order by 1 

select * from mt2sql08.sql08.dbo.chd50detailreports where flyerid in ('8128363','8278911','8278949')
select category,* from mt2sql08.sql08.dbo.chd50detailreports where flyerid in ('8128364','8278912','8278950')

select * from mt2sql08.sql08.dbo.chd50detailreports where flyerid in ('8128364','8278912','8278950')



select distinct flyerid,count(1) from mt2sql08.sql08.dbo.chd50detailreports where flyerid in ('8128364','8278912','8278950')
group by flyerid order by 1 



select * from acfvparentchildcopy where parent_flyerid='8278950'
select distinct cast(Parent_Adc_i as varchar) +'AC' from acfvparentchildcopy where child_flyerid='8278950'

select distinct pagedetailid  from entrydata..USACMCPageDetailTable where pagedetailid in (
select distinct cast(Parent_Adc_i as varchar) +'AC' from acfvparentchildcopy where child_flyerid='8278950')

select * from entrydata..USACMCPageDetailTable e join  acfvparentchildcopy a on e.pagedetailid= cast(Parent_Adc_i as varchar) +'AC' and e.page=a.parent_page 
where child_flyerid='8278950'

select prodimagecreated,* from masterclientcoverage..tempfuturepdt where flyerid='8278950'

select prodimagecreated,* from masterclientcoverage..tempfuturepdt where pagedetailid in (
select distinct pagedetailid  from entrydata..USACMCPageDetailTable where pagedetailid in (
select distinct cast(Parent_Adc_i as varchar) +'AC' from acfvparentchildcopy where child_flyerid='8278950')
 )


 select count(1) from MasterPageDetailTable 

 select * from adviewmain where flyerid in 
 (select distinct cast(child_flyerid as varchar) from mt3sql1.mcap.dbo.acfvparentchildcopy where parent_flyerid in  ('8202783' ))


 select *  from entrydatadur..USACMdPageDetailTable where flyerid in (  '8202783')

 select distinct vehicleid  from mcapvehiclepages where flyerid='8202778'

select * from masterpagedetailtable where pagedetailid in ('0008910E435','0008911e435','158023088ac')

