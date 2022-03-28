use masteracfv 

select distinct advertiser,market from ACFVFlyerReports where advertiser='cvs' and addate='2017-09-03 00:00:00.000' and ACRepflag =1  order by 1,2 desc 

select * from mt2sql14.flashreport.dbo.flashadspep where advertiser='cvs'

select * from mt2sql13.sql13.dbo.frdatapepflyerreports where advertiser='cvs' and addate='2017-09-03 00:00:00.000'

select * from mt2sql13.sql13.dbo.frdatapepflyerreports where advertiser='cvs' and addate='2017-09-10 00:00:00.000'

select * from mt2sql16.sql16.dbo.frdatapepflyerreports where advertiser='cvs' and addate='2017-09-03 00:00:00.000'


select * from mt2sql13.sql13.dbo.frdatapepdisadvertisermarket where advertiser='cvs' and addate='2017-09-03 00:00:00.000'