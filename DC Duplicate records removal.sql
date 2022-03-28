select count(*)
from entrydata.dbo.durconspagedetailtable pdt 
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where map.durpagedetailid is null --615260

select count(*)
from entrydata.dbo.durconspagedetailtable pdt 
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where map.durpagedetailid is not null --7240547

select topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, count(*)
from entrydata.dbo.durconspagedetailtable pdt
where pdt.flyerid = '8706747'
group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page
having count(*) = 1

select saleprice1,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end as mapstatus, count(*)
from entrydata.dbo.durconspagedetailtable pdt
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where pdt.flyerid = '8706747'
group by saleprice1,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end
having count(*) > 1



select * from MasterDurData.dbo.DurPDTMapNational


select *
from entrydata.dbo.durconspagedetailtable pdt 
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where map.durpagedetailid is null --615260
and pdt.pagedetailid like '%ndc'



WITH CTE_Dup AS
(
 SELECT *,
ROW_NUMBER()OVER (PARTITION BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page ORDER BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page) 
 AS ROW_NO
 from entrydata.dbo.durconspagedetailtable 
)
 SELECT distinct topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,  row_no
 into tempdb..d 
 FROM CTE_Dup 
 where row_no <> 1 
 order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 

 select * from entrydata..DurConsPageDetailTable where pagedetailid = '010451873DC'


 select  min(dc.pagedetailid),dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page from entrydata..DurConsPageDetailTable dc join   tempdb..d d on 
	  dc.topleftx =  d.topleftx
 and  dc.toplefty = d.toplefty
 and dc.bottomrightx = d.bottomrightx
 and dc.bottomrighty = d.bottomrighty
 and dc.category = d.category
 and dc.brand = d.brand
 and dc.comments1 = d.comments1
 and dc.flyerid = d.flyerid
 and dc.page  =d.page
 group by dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page
 order by dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page



-- drop table tempdb..DurConsPageDetailTable_Review

 WITH CTE_Dup AS
(
 SELECT *,
ROW_NUMBER()OVER (PARTITION BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page ORDER BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page) 
 AS ROW_NO
 from entrydata.dbo.durconspagedetailtable 
)
 SELECT distinct min(pagedetailid) as PageDetailID ,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,  row_no
 into tempdb..DurConsPageDetailTable_Review1
 FROM CTE_Dup 
 group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no
 order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 

 select * from tempdb..ddd order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 

 select * from masterdurdata..DurPDTMapCons where conspagedetailid in ('010575598DC','009479396DC','002992562DC')


  select * from tempdb..ddd pdt left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid where map.durpagedetailid is null
  order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 


  alter table tempdb..DurConsPageDetailTable_Review add MapStatus bit

  

  update tempdb..DurConsPageDetailTable_Review set mapstatus=1 where pagedetailid in (select conspagedetailid from masterdurdata..DurPDTMapCons )
  update tempdb..DurConsPageDetailTable_Review set mapstatus=1 where pagedetailid in (select conspagedetailid from tempdb..mapview )


  select *  from tempdb..DurConsPageDetailTable_Review 
  where mapstatus =1 and row_no =1 
  --where pagedetailid in ('008494612DC' and '007508887DC' and '008406329DC')
  --where topleftx=6 and  toplefty=24 and  bottomrightx=598 and  bottomrighty=1421 and  category='Womens Clothing' and  brand='No Boundaries' and  comments1='blouse: asstd plaid slvless shirt' and  flyerid='8706747' and  page=10
  order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 

  sp_rename 'ddd','DurConsPageDetailTable_Review'


  select topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, pdt.pagedetailid, map.*
from entrydata.dbo.durconspagedetailtable pdt
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where pdt.flyerid = '8706747'
order by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end 



select *
from masterdurdata.dbo.DurPDTMapConsLog
where conspagedetailid  in ('008494612DC' , '007508887DC' , '008406329DC')
order by 1 desc   



select *
from masterdurdata.dbo.DurPDTMapConsLog
where conspagedetailid = '007407810DC' 
order by 1 desc

select top 10 *
from masterdurdata.dbo.DurPDTMapCons where CONSPageDetailId = '007407810DC'



select count(1) from entrydata..DurConsPageDetailTable
select count(1) from tempdb..DurConsPageDetailTable_Review



select distinct l.durpagedetailid,l.conspagedetailid 
from  tempdb..mapmissing mm join masterdurdata.dbo.DurPDTMapConsLog l on mm.pagedetailid =l.CONSPageDetailId 
where logdmloperation='i' and DURPageDetailId not like '%ndc'
order by 2 


select distinct min(l.durpagedetailid) as durpagedetailid,min(l.madcode) as madcode,l.conspagedetailid 
into tempdb..newmap
from  tempdb..mapmissing mm join masterdurdata.dbo.DurPDTMapConsLog l on mm.pagedetailid =l.CONSPageDetailId 
where logdmloperation='i' and DURPageDetailId not like '%ndc'
group by CONSPageDetailId 
order by 3


create view mapview as 
(
select distinct * from tempdb..newmap
union
select distinct * from masterdurdata.dbo.DurPDTMapCons
)




  select pagedetailid into tempdb..DurConsPageDetailTable_Dupes  from tempdb..DurConsPageDetailTable_Review 
  where mapstatus =1 and row_no <>1


--delete from tempdb..newmap where CONSPageDetailId in (select pagedetailid from tempdb..DurConsPageDetailTable_Dupes)

select count(1) from tempdb..DurConsPageDetailTable_Dupes
select count(1) from tempdb..newmap 

select *
from tempdb..newmap 
where conspagedetailid = '007407810DC' 
order by 1 desc


SELECT * INTO DurConsPageDetailTable_Dupes FROM ENTRYDATA..DurConsPageDetailTable WHERE PAGEDETAILID IN (SELECT PAGEDETAILID FROM TEMPDB..DurConsPageDetailTable_Dupes )

--DELETE FROM ENTRYDATA..DurConsPageDetailTable WHERE PAGEDETAILID IN (SELECT PAGEDETAILID FROM TEMPDB..DurConsPageDetailTable_Dupes )

INSERT INTO MASTERDURDATA..DurPDTMapCons
select * from tempdb..newmap
WHERE CONSPageDetailId  IN (SELECT CONSPageDetailId FROM MASTERDURDATA..DurPDTMapCons)


select * INTO DurPDTMapCons_NewMapInserted from tempdb..newmap


select count(1) from entrydata..DurConsPageDetailTable
select count(1) from tempdb..DurConsPageDetailTable_R

select * from tempdb..DurConsPageDetailTable_R where row_no <> 1 



  alter table tempdb..DurConsPageDetailTable_R add MapStatus bit

  

  update tempdb..DurConsPageDetailTable_R set mapstatus=1 where pagedetailid in (select conspagedetailid from masterdurdata..DurPDTMapCons )

  
  select distinct durpagedetailid,madcode,conspagedetailid   from masterdurdata..DurPDTMapConslog where conspagedetailid in (
  select pagedetailid from tempdb..DurConsPageDetailTable_R where mapstatus is null )
  and durpagedetailid  like '%ndc' and LogDMLOperation = 'i'

  insert into masterdurdata..DurPDTMapCons
  select distinct min(durpagedetailid),min(madcode),conspagedetailid   from masterdurdata..DurPDTMapConslog where conspagedetailid in (
  select pagedetailid from tempdb..DurConsPageDetailTable_R where mapstatus is null )
  and durpagedetailid  like '%ndc' and LogDMLOperation = 'i'
  group by CONSPageDetailId 


  
  alter table tempdb..DurConsPageDetailTable_RR add MapStatus bit

  

  update tempdb..DurConsPageDetailTable_RR set mapstatus=1 where pagedetailid in (select conspagedetailid from masterdurdata..DurPDTMapCons )

  insert into DurConsPageDetailTable_Dupes 
select * from entrydata..DurConsPageDetailTable where pagedetailid in (
select pagedetailid from tempdb..DurConsPageDetailTable_RR  where row_no <> 1 )



delete from entrydata..DurConsPageDetailTable where pagedetailid in (
select pagedetailid from tempdb..DurConsPageDetailTable_RR  where row_no <> 1 )



tempdb..DurConsPageDetailTable_Review1


alter table tempdb..DurConsPageDetailTable_Review1 add MapStatus bit

  

  update tempdb..DurConsPageDetailTable_Review1 set mapstatus=1 where pagedetailid in (select conspagedetailid from masterdurdata..DurPDTMapCons )


  select * from tempdb..DurConsPageDetailTable_Review1  where row_no <> 1 or mapstatus is null 




select count(1) from Entrydata_Archive..DurConsPageDetailTable_Dupes
select count(1) from Entrydata_Archive..DurPDTMapCons_NewMapInserted