
--Take Backup of Exiting MasterClientCWM
Use MasterClientCoverage 
select * from sysobjects where name like 'masterclientcwm%'
--Drop table masterclientcwm10072016

--Select * into masterclientcwm04072017 from mt2sql00.masterclientcoverage.dbo.masterclientcwm 
--End 




Regarding StartDate Changes : 

1) For All Non History Clients 
 where startdate =1/1/2008 - change it to 4/1/2008 and no change to end date 
--(3,12,46,92,95,98,146,147,162,999) --all these clients has hist db exists

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
--select distinct startdate ,enddate,DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid not in (3,12,46,92,95,98,146,147,162,999) and startdate<='04/01/2014'
order by 1
*/

2) For All history Clients 
Case 1 : For History codes(eg. ***Hist)--Dont Set StartDate for CCChist(Item 19718)
/*
Update M set StartDate='04/01/2011' ,EndDate='03/31/2014' 
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select category,[id] from MT2SQL14.SiteControl.dbo.CategoryCode where category like '%hist%')
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
order by 1
*/


Case 2: For Non History codes

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate ,DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid in (3,12,46,92,95,98,146,147,162,999) and startdate <='04/01/2014'
--and Categorycodeid Not in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
and Categorycodeid Not in (500,702,1490,1491,1494,1747,1911,1933,2245,2340,2381,2390,2485,2732,2745)
*/
3) ClientCWMException table values update

select * from sysobjects where name like 'ClientCWMException%'
--Drop Table ClientCWMException10072016


/*
--Take backup of ClientCWMException table
select * into ClientCWMException04072017 from ClientCWMException
update x set startdate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate 
from clientcwmexception x where startdate <='04/01/2014'
*/


4) --Update table tbl_lookup for Orphaned records from 2% to  20%
--select * from  mt2sql14.sitecontrol.dbo.tbl_lookup  where categorytype = 'PercentageDeleteRecord'
--update mt2sql14.sitecontrol.dbo.tbl_lookup set categoryvalue = 20 where categorytype = 'PercentageDeleteRecord'

5) --Archive PDTProcessed table to Connection_Archive..PDTProcessed for records older than one quarter behind what is in FVHistory(Hari's Email on 01-13-2015)
--run from mt2sql14


--Create TempTable to archive MasterMapPageDetailId Table in below point 6,7
Drop Table tempdb.dbo.PDTProcessedArchive
Go
select *  
into tempdb.dbo.PDTProcessedArchive
from mt2sql14.connection.dbo.PDTProcessed 
where ProdImageCreatedOn < 
( 
select  distinct DATEADD(mm, -3, DATEADD(qq, DATEDIFF(qq,0,startdate), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
)
Go

Create NonClustered Index IDX_PDTID On tempdb.dbo.PDTProcessedArchive (PageDetailId)
Go
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

Insert Into Connection_Archive.dbo.MasterMapPagedetailID
select M.* from Connection.dbo.MasterMapPagedetailID M Join tempdb.dbo.PDTProcessedArchive T on M.OriginalPagedetailID=T.PagedetailId 
Go
Delete M   from Connection.dbo.MasterMapPagedetailID M Join tempdb.dbo.PDTProcessedArchive T on M.OriginalPagedetailID=T.PagedetailId 
Go


7) --Archive MasterMapPageDetailId from MT2SQL00..MAD for records which does not exist in MasterMapPageDetailId from MT2SQL14..Connection
--run from MT2SQL00

Select * into tempdb.dbo.PDTProcessedArchive From MT2SQL14.tempdb.dbo.PDTProcessedArchive
Go
Create NonClustered Index IDX_PDTID On tempdb.dbo.PDTProcessedArchive (PageDetailId)
Go
Delete M   from MasterAdviewData.dbo.MasterMapPagedetailID M Join tempdb.dbo.PDTProcessedArchive T on M.OriginalPagedetailID=T.PagedetailId 
Go

8) --build MasterFVHist Package on mt2sql00 - ask hari
9) --restore fvhist db to mt2sql00a and process all fvhist codes(4,5) on mt2sql00a
10) --Run all hist codes for full
11) --backup clienthist db to location \\mt2bu1\MT2BU1D\SQLBU_Archive_Monthly Tape
12)	--going forward when we are doing the End of Quarter changes
	--just make a note to copy the oldest quarter records from adviewmain to adviewmainarchive
	--send an email to me and Hiren about it and one of us will take care of that


13) --This needs to be done at mt3sql1, mt2sql00, mt2asql01 and mt4sql00.masterdata
--Hari's Email 4/14/2015

Insert into mt3sql1.fvstaging.dbo.AdviewMainArchive 
select * from mt3sql1.fvstaging.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--Disable Trigger on table and then fire delete 
Delete cwm from mt3sql1.fvstaging.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--Enable Trigger on table without fail


--mt2sql00
Insert into mt2sql00.MasterAdviewData.dbo.AdviewMainArchive 
select * from mt2sql00.MasterAdviewData.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))

Delete cwm from mt2sql00.MasterAdviewData.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))


--mt2asql01
Insert into mt2asql01.MasterAdviewData.dbo.AdviewMainArchive 
select * from mt2asql01.MasterAdviewData.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))

Delete cwm from mt2asql01.MasterAdviewData.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))


--mt4sql00
Insert into mt4sql00.masterdata.dbo.AdviewMainArchive 
select * from mt4sql00.masterdata.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))

Delete cwm from mt4sql00.masterdata.dbo.adviewmain cwm where CWM.AdDate < DATEADD(yy, -6, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))


14 ) verify Adviewmain count for 


select count(1) from mt3sql1.fvstaging.dbo.adviewmain--5078593
select count(1) from mt2sql00.masteradviewdata.dbo.adviewmain--5077025
select count(1) from mt2asql01.masteradviewdata.dbo.adviewmain --5077025 

select count(1) from mt4sql00.masterdata.dbo.adviewmain--5078510
---13, 14 Tomorrow, 5-12 after HistCode Processing Done




select count(1) from mt3sql1.fvstaging.dbo.adviewmain--8911614
select count(1) from mt2sql00.masteradviewdata.dbo.adviewmain--8896645
select count(1) from mt2asql01.masteradviewdata.dbo.adviewmain --8896645 
select count(1) from mt4sql00.masterdata.dbo.adviewmain --8932225
