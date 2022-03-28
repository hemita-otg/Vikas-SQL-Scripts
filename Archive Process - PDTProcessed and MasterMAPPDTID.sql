use connection 



select count(1) from pdtprocessed -- 129164115
select min(prodimagecreatedon),max(prodimagecreatedon) from pdtprocessed --2008-01-01 00:00:00	2015-01-13 04:23:00

select count(1) from (
select pagedetailid from mt2sql00.masteradviewdata.dbo.masterpagedetailtable
union
select pagedetailid from mt2sql00.masteradviewdata.dbo.masterfsipagedetailtable
union
select pagedetailid from mt2sql00.masteradviewdata.dbo.mastercatpagedetailtable
union
select pagedetailid from mt2sql00.MasterBevAL.dbo.BevALMAsterpagedetailtable
union
select pagedetailid from mt2sql00.fvhistory.dbo.fvhistorypagedetailtable 
) x 


5) --Archive PDTProcessed table to Connection_Archive..PDTProcessed for records older than one quarter behind what is in FVHistory(Hari's Email on 01-13-2015)
--run from mt2sql14

--Insert into Archive
insert into mt2sql14.connection_archive.dbo.PDTProcessed 
select *  from mt2sql14.connection.dbo.PDTProcessed where ProdImageCreatedOn < 
( 
select  distinct DATEADD(mm, -3, DATEADD(qq, DATEDIFF(qq,0,startdate), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
)

--Delete from Regular PDTProcessed table
Delete from mt2sql14.connection.dbo.PDTProcessed where ProdImageCreatedOn < 
( 
select  distinct DATEADD(mm, -3, DATEADD(qq, DATEDIFF(qq,0,startdate), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
)

6) --Archive MasterMapPageDetailId from Connection table to Connection_Archive..MasterMapPageDetailId for records which does not exist in PDTProcessed(Hari's Email on 01-13-2015)
--Run From MT2SQL14

insert into mt2sql14.connection_archive.dbo.MasterMapPageDetailId 
select *  from mt2sql14.connection.dbo.MasterMapPageDetailId where OriginalPageDetailid not in  
( 
select  PageDetailId from mt2sql14.connection.dbo.PDTProcessed
)

--Delete from  mt2sql14.connection.dbo.MasterMapPageDetailId where OriginalPageDetailid not in  
--( 
--select  PageDetailId from mt2sql14.connection.dbo.PDTProcessed
--)
--Updated to restrict removing expanded records from below table
select count(1) from  MasterAdviewData.dbo.MasterMapPageDetailId where OriginalPageDetailid not in 
(select PageDetailid  from MT2SQL14.connection.dbo.PDTProcessed)
and OriginalPagedetailID in (select PageDetailID from FVHistory.dbo.FVHistoryPageDetailTable)

7) --Archive MasterMapPageDetailId from MT2SQL00..MAD for records which does not exist in MasterMapPageDetailId from MT2SQL14..Connection
--run from MT2SQL00
--select  OriginalPageDetailid into tempdb..deleterecs from mt2sql14.connection.dbo.MasterMapPageDetailId

--Delete from  mt2sql00.MasterAdviewData.dbo.MasterMapPageDetailId where OriginalPageDetailid not in  
--( 
--select  OriginalPageDetailid from tempdb..deleterecs
--)

--Updated to restrict removing expanded records from below table
select count(1) from  MasterAdviewData.dbo.MasterMapPageDetailId where OriginalPageDetailid not in 
(select PageDetailid  from MT2SQL14.connection.dbo.PDTProcessed)
and OriginalPagedetailID in (select PageDetailID from FVHistory.dbo.FVHistoryPageDetailTable)


pdtprocessed
mcapvehiclepages
mastermappagedetailtable

connection

Connection_Hist




select top 10 *  from pdtprocessed 

select *  from mt2sql14.connection.dbo.PDTProcessed where ProdImageCreatedOn < 
( 
select  distinct DATEADD(mm, -3, DATEADD(qq, DATEDIFF(qq,0,startdate), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
)


select top 10 *  from  mt2sql00.MasterAdviewData.dbo.MasterMapPageDetailId


select top 10 *  from  mt2sql00.MasterAdviewData.dbo.mcapvehiclepages


---Start PDTProcessed ----
insert into dbo.PDTProcessed
select * from Connection..PDTProcessed with (nolock) where cast(ProdImageCreatedOn as date) <= DATEADD(year, -3, '2017-03-01')
order by 3 desc
--- End --------------


---Start MasterMapPageDetailId ----
insert into MasterMapPageDetailId
select mp.* from connection..MasterMapPageDetailId MP with (nolock)
join connection_hist..PDTProcessed p
on p.PagedetailID = mp.OriginalPagedetailID 
--- End ----------------


----Start mcapvehiclepages -------
select distinct  flyerid into tempdb..mcapvehiclepagesflyerlist from mt2sql00.masteradviewdata.dbo.masterpagedetailtable m with (nolock) 
join  connection_hist..MasterMapPageDetailId mp with (nolock)
on m.PagedetailIDint = mp.pagedetailid

insert into mcapvehiclepages
select mv.* from connection..mcapvehiclepages mv
join tempdb..mcapvehiclepagesflyerlist mp
on mv.FlyerId = mp.flyerid
----End --------------------