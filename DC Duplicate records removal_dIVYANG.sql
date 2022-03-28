--Drop Table tempdb..DurConsPageDetailTable_Map_1
--Drop Table  tempdb..DurConsPageDetailTable_Map_N
--Drop Table tempdb..DurConsPageDetailTable_Map_2


--Select * INTO  tempdb..durconspagedetailtable_Temp From entrydata.dbo.durconspagedetailtable --(6577258 row(s) affected)
--Select * INTO tempdb..DurPDTMapCons_Temp From masterdurdata.dbo.DurPDTMapCons map where 1 = 2


--select * into tempdb..DurConsPageDetailTable_Map_1 from tempdb..DurConsPageDetailTable_Review 
--where mapstatus =1
--(5961704 row(s) affected)

--select * into tempdb..DurConsPageDetailTable_Map_N from tempdb..DurConsPageDetailTable_Review 
--where mapstatus is null
--(615554 row(s) affected)

--Select count(1)
--From tempdb..DurConsPageDetailTable_Map_1 One 
--	Inner join tempdb..DurConsPageDetailTable_Map_N Nu
--	On one.topleftx =  Nu.topleftx and  one.toplefty = Nu.toplefty and one.bottomrightx = Nu.bottomrightx and one.bottomrighty = Nu.bottomrighty and one.category = Nu.category and one.brand = Nu.brand
--		and one.comments1 = Nu.comments1 and one.flyerid = Nu.flyerid and one.page  =Nu.page
-- 526131 Need to Remove from tempdb..DurConsPageDetailTable_Map_N

--Delete Nu
--From tempdb..DurConsPageDetailTable_Map_N Nu 
--	Inner join tempdb..DurConsPageDetailTable_Map_1 One 
--	On one.topleftx =  Nu.topleftx and  one.toplefty = Nu.toplefty and one.bottomrightx = Nu.bottomrightx and one.bottomrighty = Nu.bottomrighty and one.category = Nu.category and one.brand = Nu.brand
--		and one.comments1 = Nu.comments1 and one.flyerid = Nu.flyerid and one.page  =Nu.page
--(512865 row(s) affected) Deleted



--Select Count(1) From tempdb..DurConsPageDetailTable_Map_1 One -- 5961704
--Select count(1) From tempdb..DurConsPageDetailTable_Map_N Nu -- 102689

--WITH CTE_Dup AS
--(
--	SELECT *,
--	ROW_NUMBER()OVER (PARTITION BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page ORDER BY topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page) 
--	AS ROW_NO_2
--	from tempdb.dbo.DurConsPageDetailTable_Map_N 
--)
--SELECT distinct min(pagedetailid) as PageDetailID ,topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,  row_no
--into tempdb..DurConsPageDetailTable_Map_2 
--FROM CTE_Dup 
--group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no
--order by  topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page,row_no; 
--(102689 row(s) affected)

--Select Count(1) From tempdb..DurConsPageDetailTable_Map_1 One -- 5961704
--Select count(1) From tempdb..DurConsPageDetailTable_Map_N Nu -- 102689
--Select * from tempdb..DurConsPageDetailTable_Map_2 -- 102689
--Select * from tempdb..DurConsPageDetailTable_Map_2 -- 102689

Select * from tempdb..DurConsPageDetailTable_Map_2 where row_no <> 1 -- 17659
Select * from tempdb..DurConsPageDetailTable_Map_2 where row_no = 1 -- 85030

-- Delete From tempdb..DurConsPageDetailTable_Map_2 where row_no <> 1

Select COUNT(1) from tempdb..DurConsPageDetailTable_Map_2
Select COUNT(1) From tempdb..DurConsPageDetailTable_Map_1
Select COUNT(1) From entrydata..DurConsPageDetailTable


Select top 10 *  from tempdb..DurConsPageDetailTable_Map_2
Select top 10 *  From tempdb..DurConsPageDetailTable_Map_1


select distinct pagedetailid into tempdb..keeppdt from tempdb..DurConsPageDetailTable_Map_2
insert into tempdb..keeppdt
select distinct pagedetailid  from tempdb..DurConsPageDetailTable_Map_1


select distinct  * from tempdb..keeppdt 


select top 100 * from masterdurdata.dbo.DurPDTMapConsLog
select * from tempdb..DurConsPageDetailTable_Map_2 m join masterdurdata.dbo.DurPDTMapConsLog l on m.pagedetailid = l.conspagedetailid 
--where l.LogDMLOperation = 'i' and DURPageDetailId not like '%ndc' and
select * from tempdb..DurConsPageDetailTable_Map_2 
where  pagedetailid = '007407810DC' 
