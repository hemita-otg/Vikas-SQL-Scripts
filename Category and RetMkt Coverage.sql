

select * from mt2sql14.sitecontrol.dbo.vw_merchandisecategory where categorycodeid=2453 and exclude =0
select * from mt2sql14.sitecontrol.dbo.clientbrandexception where exclude=0
select * from mt2sql14.sitecontrol.dbo.clientretmktexception 

RealCategory,ClientName,CatPull,BrandPull


select ID,clientid,category from mt2sql14.sitecontrol.dbo.categorycode where clientid in (
select clientid from clienttable )

select * from clienttable 
select * from mastercategory 


select distinct c.clientid,c.clientname,categorycodeid,m.mastercategory into report from clienttable c join mastercategory m 
on c.clientid=m.clientid 



select * from report order by 2 
select * from categoryreport 


--insert into categoryreport
select realcategory,clientname,category,null from mt2sql14.sitecontrol.dbo.vw_merchandisecategory mc join report r 
on mc.categorycodeid =r.categorycodeid where exclude =0

--insert into categoryreport
select realcategory ,clientname,category,brand from mt2sql14.sitecontrol.dbo.clientbrandexception cbe join report r
on cbe.categorycodeid =r.categorycodeid where exclude=0

select * from categoryreport order by clientname 

--insert into retmktreport
select retailer,market,r.clientname from masterclientcoverage..rmc2lientCombo rmc join report r
on rmc.clientname=r.clientname 

select distinct clientname  from RetMktReport order by clientname 
select distinct clientname from CategoryReport order by clientname 



select *  from RetMktReport  where clientname='bayer' order by 1,2
select * from CategoryReport order by clientname 



select retailer,market,r.clientname,detail,daa from masterclientcoverage..rmc2lientCombo rmc join report r
on rmc.clientname=r.clientname order by clientname,retailer,market 