IF exists(SELECT name FROM tempdb..sysobjects WHERE xtype = 'u' and name = 'updateCCIDs')
	drop table tempdb..updateCCIDs

select [id] CategoryCodeID into tempdb..updateCCIDs from mt2sql04.sitecontrol.dbo.categorycode 
where  not category like '%hist'  -- clientpdt=1 and --clientid in (95, 98, 146, 147, 45, 12, 3, 253, 162, 24, 92) 

-- --Start: Add AconHist,AsmnHist and BauHist 
-- Insert into tempdb..updateCCIDs values(500)
-- Insert into tempdb..updateCCIDs values(522)
-- Insert into tempdb..updateCCIDs values(1503)
-- --End: Add AconHist,AsmnHist and BauHist 

/*update masterclientcwm set startdate = convert(varchar,dateadd(yy, -3,getdate()- 4 ),101)
where startdate < dateadd(yy, -3,getdate()) 
and categorycodeid in ( select categorycodeid from tempdb..updateccids)
*/ 
select convert(varchar,dateadd(yy, -3,getdate()- 4 ),101)
from masterclientcwm
where startdate < dateadd(yy, -3,getdate()) 
and categorycodeid in ( select categorycodeid from tempdb..updateccids)


select * from mt2sql04.sitecontrol.dbo.categorycode where id in (
select categorycodeid from tempdb..updateccids) and category  like 'wlm%'



select min(startdate),categorycodeid from masterclientcwm where min(startdate
group by categorycodeid order by 1

select * from masterclientcwm where categorycodeid=1494

select * from mt2sql04.sitecontrol.dbo.categorycode where clientid=92

select DATEADD(yy, -3, DATEADD(qq, DATEDIFF(qq,0,getdate()), 0))

--4/1/2005 for all hist codes - enddate - 3/31/2008
--for all regualr codes where startdate =1/1/2008 - change it to 4/1/2008 and no change to end date 
