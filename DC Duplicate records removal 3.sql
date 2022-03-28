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
having count(*) > 1

select topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end as mapstatus, count(*)
from entrydata.dbo.durconspagedetailtable pdt
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
where pdt.flyerid = '8706747'
group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end
having count(*) > 1

select saleprice1,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end as mapstatus, count(*)
from entrydata.dbo.durconspagedetailtable pdt
left outer join masterdurdata.dbo.DurPDTMapCons map on pdt.pagedetailid = map.conspagedetailid
--where pdt.flyerid = '8706747'
group by saleprice1,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, case when map.durpagedetailid is null then 'Missing' else 'Existing' end
having count(*) > 1

select *  from entrydata.dbo.durconspagedetailtable where category='Electronics - Other' and brand='Unspecified' and comments1='2.6 cu ft,2.7 cu ft' and flyerid='8706747' and page=15
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
 into tempdb..dup 
 FROM CTE_Dup 
 where row_no <> 1 
 order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 

 select * from tempdb..dup where flyerid ='13351898' 

  select  min(dc.pagedetailid) as PageDetailID ,dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page 
  into tempdb..dup_keep 
  from entrydata..DurConsPageDetailTable dc join   tempdb..dup d on 
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

select * from tempdb..dup_keep where flyerid ='13351898' 


  select  dc.* into tempdb..dup_remove
   from entrydata..DurConsPageDetailTable dc join   tempdb..dup d on 
	  dc.topleftx =  d.topleftx
 and  dc.toplefty = d.toplefty
 and dc.bottomrightx = d.bottomrightx
 and dc.bottomrighty = d.bottomrighty
 and dc.category = d.category
 and dc.brand = d.brand
 and dc.comments1 = d.comments1
 and dc.flyerid = d.flyerid
 and dc.page  =d.page
 and dc.pagedetailid not in (select pagedetailid from tempdb..dup_keep) 
 

 select category,* from tempdb..dup_remove where flyerid ='13351898' 

 select  dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page,count(1) from entrydata..DurConsPageDetailTable dc where flyerid ='8706747' 
    group by dc.topleftx, dc.toplefty, dc.bottomrightx, dc.bottomrighty, dc.category, dc.brand, dc.comments1, dc.flyerid, dc.page
	having count(1) > 1 


select * from tempdb..dup 
select * from tempdb..dup_keep
select * from tempdb..dup_remove 


--insert into Entrydata_Archive..DurConsPageDetailTable_Dupes
select * from tempdb..dup_remove  where pagedetailid  not in (select pagedetailid from Entrydata_Archive..DurConsPageDetailTable_Dupes )


--delete from entrydata.dbo.durconspagedetailtable
where pagedetailid in (select pagedetailid from tempdb..dup_remove )

