Use Connection_Hist 

truncate table MasterMapPageDetailId
truncate table PDTProcessed
truncate table mcapvehiclepages

/*
select * into dbo.PDTProcessed from Connection..PDTProcessed where 1 = 2

select * into dbo.MasterMapPageDetailId from Connection..MasterMapPageDetailId where 1 = 2

select * into dbo.mcapvehiclepages from Connection..mcapvehiclepages where 1 = 2
*/


---Start PDTProcessed ----
insert into dbo.PDTProcessed
select * from Connection..PDTProcessed with (nolock) where cast(ProdImageCreatedOn as date) <= DATEADD(year, -3, '2017-03-31')
order by 3 desc --79678751
--- End --------------


---Start MasterMapPageDetailId ----
insert into MasterMapPageDetailId
select mp.* from connection..MasterMapPageDetailId MP with (nolock)
join connection_hist..PDTProcessed p
on p.PagedetailID = mp.OriginalPagedetailID --73790756
--- End ----------------


----Start mcapvehiclepages -------
SELECT FlyerId, originalpagedetailid
INTO TempDB..MasterFVHistoryPDTs
 FROM mt2sql00.FVHistory.dbo.MasterFVHistoryDetailReports
go--

select distinct  flyerid into tempdb..mcapvehiclepagesflyerlist from TempDB..MasterFVHistoryPDTs m with (nolock) 
join  connection_hist..MasterMapPageDetailId mp with (nolock)
on m.originalpagedetailid = mp.originalpagedetailid
go--

insert into mcapvehiclepages
select mv.* from connection..mcapvehiclepages mv
join tempdb..mcapvehiclepagesflyerlist mp
on mv.FlyerId = mp.flyerid
go--
---3498911
----End --------------------



---Start : Delete from Connection for below 3 tables ----------------------
Delete l  from  CONNECTION..PDTProcessed l join CONNECTION_Hist..PDTProcessed h on
l.PagedetailID =h.PagedetailID 




Delete l  from CONNECTION..MasterMapPageDetailId l join CONNECTION_Hist..MasterMapPageDetailId h on
l.PagedetailID =h.PagedetailID 





delete l  from  CONNECTION..mcapvehiclepages l join CONNECTION_Hist..mcapvehiclepages h on
l.Flyerid  =h.Flyerid   and l.PageNumber   =h.PageNumber  and l.VehicleId = h.VehicleId and l.CreationMonth = h.CreationMonth

--- End : Delete from Connection for below 3 tables ----------------------

SELECT FlyerId, PageNumber,VehicleId,creationmonth, COUNT(1) FROM  CONNECTION..mcapvehiclepages  GROUP BY  FlyerId, PageNumber,VehicleId,creationmonth
having count(1) >1