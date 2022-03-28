

Regarding StartDate Changes : 

1) For All Non History Clients 
 where startdate =1/1/2008 - change it to 4/1/2008 and no change to end date 
--(3,12,24,29,45,92,95,98,146,147,162,253) --all these clients has hist db exists

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
--select distinct startdate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid not in (3,12,24,29,45,92,95,98,146,147,162,253) and startdate<='7/1/2009'
*/

2) For All history Clients 
Case 1 : For History codes(eg. ***Hist)--Dont Set StartDate for CCChist(Item 19718)
Set StartDate= 4/1/2005 & Enddate=3/31/2008
/*
Update M set StartDate='7/1/2006' ,EndDate='6/30/2009' 
--select distinct startdate ,enddate 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
where Categorycodeid in (500,522,702,758,1490,1491,1492,1493,1494,1495,1496,1503,1747,1911,1933,2245)
*/
Case 2: For Non History codes

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
--select * 
from mt2sql00.masterclientcoverage.dbo.masterclientcwm M
where clientid in (3,12,24,29,45,92,95,98,146,147,162,253) and startdate <='7/1/2009'
--and Categorycodeid Not in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
and Categorycodeid Not in (500,522,702,758,1490,1491,1492,1493,1494,1495,1496,1503,1747,1911,1933,2245)


*/
3) ClientCWMException table values update
/*
update x set startdate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
from clientcwmexception x where startdate <='7/1/2009'
*/



4) --build MasterFVHist Package on mt2sql00 - ask hari
5) --restore fvhist db to mt2sql00a and process all fvhist codes(4,5) on mt2sql00a
6) --backup clienthist db to location \\mt2bu1\MT2BU1D\SQLArchive