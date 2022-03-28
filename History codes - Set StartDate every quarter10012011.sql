--select * into dbo.masterclientcwm10042011 from  masterclientcwm

Regarding StartDate Changes : 

1) For All Non History Clients 
 where startdate =4/1/2008 - change it to 7/1/2008 and no change to end date 
--(3,12,24,29,45,92,95,98,146,147,162,253) --all these clients has hist db exists

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)) 
from masterclientcoverage.dbo.masterclientcwm M
where clientid not in (3,12,24,29,45,92,95,98,146,147,162,253) and startdate<='10/1/2008'
*/

2) For All history Clients 
Case 1 : For History codes(eg. ***Hist)
Set StartDate= 7/1/2005 & Enddate=6/30/2008
/*
Update M set StartDate='10/1/2005' ,EndDate='9/30/2008' 
from masterclientcoverage.dbo.masterclientcwm M
--where Categorycodeid in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
where Categorycodeid in (500,522,702,758,1490,1491,1492,1493,1494,1495,1496,1503,1747)
*/
Case 2: For Non History codes

/*
Update M set StartDate=DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))
from masterclientcoverage.dbo.masterclientcwm M
where clientid in (3,12,24,29,45,92,95,98,146,147,162,253) and startdate <='10/1/2008' 
--and Categorycodeid Not in (Select [id] from MT2SQL04.SiteControl.dbo.CategoryCode where category like '%hist%')
and Categorycodeid Not in (500,522,702,758,1490,1491,1492,1493,1494,1495,1496,1503,1747)


*/



select year(addate), count(flyerid) from masteradviewdata.dbo.Adviewmain where addate>='4/1/2005' and active=0
group by year(addate)
option (maxdop 1)