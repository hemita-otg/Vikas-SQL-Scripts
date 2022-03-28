select * from mt2sql13.ACFVINCR.dbo.ad_DefaultMkt where company_nm='Target Stores'

--select * from masteracfv..ad_defaultmktexceptioncategorycode
select acrepflag,* from masteracfv..acfvflyerreports a join mt2sql13.ACFVINCR.dbo.ad_DefaultMkt b
on a.advertiser=b.company_nm and a.market=b.market and a.acrepflag <>  1 

select * from mt2sql14.sitecontrol.dbo.vw_catinfo where category like 'moet%'  categorycodeid=4714


select * from sql13..camPepflyerreports a join mt2sql13.ACFVINCR.dbo.ad_DefaultMkt b
on a.advertiser=b.company_nm and a.market=b.market 
where a.acrepflag = 1 
and retmktid not in (select retmktid from mt2sql00.masterclientcoverage.dbo.masterclientcwmpep where categorycodeid=4714)

select * from sql13..camPepdetailreports where acrepflag = 1 

select distinct startdate from mt2sql00.masterclientcoverage.dbo.masterclientcwmpep
where categorycodeid=4714