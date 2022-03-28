--Take Backup of Exiting MasterClientCWM
Use MasterClientCoverage 
--Select * into masterclientcwm10032013 from mt2sql00.masterclientcoverage.dbo.masterclientcwm 
--End 

Regarding StartDate Changes : 

1) For All Non History Clients 
 where startdate =1/1/2008 - change it to 4/1/2008 and no change to end date 
--(3,12,46,92,95,98,146,147,162,999) --all these clients has hist db exists

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
--select distinct startdate ,enddate,DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid not in (3,12,46,92,95,98,146,147,162,999) and startdate<='10/1/2010'
*/

2) For All history Clients 
Case 1a : For History codes(eg. ***Hist)--Dont Set StartDate for CCChist(Item 19718)
/*
Update M set StartDate='10/01/2007' ,EndDate='09/30/2010' 
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select category,[id] from MT2SQL14.SiteControl.dbo.CategoryCode where category like '%hist%')
where Categorycodeid in (500,702,1490,1491,1494,1747,1911,1933,2245,2381,2485,2732,2745)
*/

Case 1b :
--Update only EndDates for 'ccchist50' till StartDates for these HistoryCodes codes matches with other History Codes
/*
Update M set EndDate='09/30/2010' 
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category in ('ccchist50'))
where Categorycodeid in (2340)
*/
--Ignore/Exclude 'HistCode'(CategoryCodeId=2390) as it is an Ad Hoc HistoryCode

Case 2: For Non History codes

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid in (3,12,46,92,95,98,146,147,162,999) and startdate <='10/1/2010'
--and Categorycodeid Not in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
and Categorycodeid Not in (500,702,1490,1491,1494,1747,1911,1933,2245,2340,2381,2390,2485,2732,2745)
*/
3) ClientCWMException table values update
/*
update x set startdate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select distinct startdate ,enddate 
from clientcwmexception x where startdate <='10/1/2010'
*/

4) --build MasterFVHist Package on mt2sql00 - ask hari
5) --restore fvhist db to mt2sql00a and process all fvhist codes(4,5) on mt2sql00a
6) --Run all hist codes for full
7) --backup clienthist db to location \\mt2bu1\MT2BU1D\SQLBU_Archive_Monthly Tape
