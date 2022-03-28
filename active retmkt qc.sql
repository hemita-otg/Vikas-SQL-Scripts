--case 1 -------------------
select  * from mt2sql14.sitecontrol.dbo.categorycode where id=3209 or clientid=793

select * from masterclientcoverage..masterclientcwm where retmktid=34557
select * from tempdb..masterclientcwm  where retmktid=34557

select * from masterclientcoverage..retmkt where advertiser='Famous Footwear' and market='Internet'


FROM MASTERCLIENTCOVERAGE..MasterClientCWM 
			where clientid in 
				(
				SELECT clientid FROM MT2SQL14.SITECONTROL.DBO.CATEGORYCODE WHERE (IsNULL(ISAdlert,0)=0 and IsNULL(IsCT,0)=0)  and not  ISNULL(FVCCType,0)   IN (Select FVCCTypesId From MT2SQL14.SiteControl.dbo.MasterFVCCTypes Where ISNULL(Processing,0)=0)
				) 
--case 2 -------------------
select * from masterclientcoverage..retmkt where advertiser='Dunhams' and market='Internet'

select * from masterclientcoverage..masterclientcwm where retmktid=34554
select * from tempdb..masterclientcwm  where retmktid=34554


select * from masterclientcoverage..masterclientcwmdur where retmktid=34554
select * from tempdb..masterclientcwmdur  where retmktid=34554

select  * from mt2sql14.sitecontrol.dbo.categorycode where id in (942,3209) or clientid in (793,987 )
--case 3 -------------------
select * from masterclientcoverage..retmkt where advertiser='Foot Locker' and market='Representative-Email'
	

select * from masterclientcoverage..masterclientcwm where retmktid=34258
select * from tempdb..masterclientcwm  where retmktid=34258


select * from masterclientcoverage..masterclientcwmdur where retmktid=34258
select * from tempdb..masterclientcwmdur  where retmktid=34258

select  * from mt2sql14.sitecontrol.dbo.categorycode where id in (938,2240,3209 )or clientid in (162,793,983) 