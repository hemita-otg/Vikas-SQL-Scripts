
--Take Backup of Exiting MasterClientCWM
Use MasterClientCoverage 
--Select * into masterclientcwm021014 from mt2sql00.masterclientcoverage.dbo.masterclientcwm 
--End 

Regarding StartDate Changes : 

1) For All Non History Clients 
 where startdate =1/1/2008 - change it to 4/1/2008 and no change to end date 
--(3,12,46,92,95,98,146,147,162,999) --all these clients has hist db exists

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
--select distinct startdate ,enddate,DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid not in (3,12,46,92,95,98,146,147,162,999) and startdate<='01/01/2012'
*/

2) For All history Clients 
Case 1 : For History codes(eg. ***Hist)--Dont Set StartDate for CCChist(Item 19718)
/*
Update M set StartDate='01/01/2009' ,EndDate='12/31/2011' 
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select category,[id] from MT2SQL14.SiteControl.dbo.CategoryCode where category like '%hist%')
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745,2340)
*/


Case 2: For Non History codes

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate ,DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid in (3,12,46,92,95,98,146,147,162,999) and startdate <='01/01/2012'
--and Categorycodeid Not in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
and Categorycodeid Not in (500,702,1490,1491,1494,1747,1911,1933,2245,2340,2381,2390,2485,2732,2745)
*/
3) ClientCWMException table values update
/*
update x set startdate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate 
from clientcwmexception x where startdate <='01/01/2012'
*/

4) --Update table to  --update tbl_lookup set categoryvalue = 20 where categorytype = 'PercentageDeleteRecord'
5) --Archive PDTProcessed table to Connection_Archive..PDTProcessed for records older than one quarter behind what is in FVHistory(Hari's Email on 01-13-2015)
6) --Archive MasterMapPageDetailId from Connection table to Connection_Archive..PDTProcessed for records which does not exist in PDTProcessed(Hari's Email on 01-13-2015)
7) --Archive MasterMapPageDetailId from MT2SQL00..MAD for records which does not exist in MasterMapPageDetailId from MT2SQL14..Connection
8) --build MasterFVHist Package on mt2sql00 - ask hari
9) --restore fvhist db to mt2sql00a and process all fvhist codes(4,5) on mt2sql00a
10) --Run all hist codes for full
11) --backup clienthist db to location \\mt2bu1\MT2BU1D\SQLBU_Archive_Monthly Tape
12)	--going forward when we are doing the End of Quarter changes
	--just make a note to copy the oldest quarter records from adviewmain to adviewmainarchive
	--send an email to me and Hiren about it and one of us will take care of that