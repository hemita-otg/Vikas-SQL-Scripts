use subscription

select * from holdprocessing

--insert into holdprocessing 
select [id] from mt2sql04.sitecontrol.dbo.categorycode where isadlert=1

--delete from holdprocessing where categorycodeid in 
(select [id] from mt2sql04.sitecontrol.dbo.categorycode where isadlert=1 )