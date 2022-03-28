Clientid, Categorycodeid, Category, PDTCnt, FSICnt


--insert into RC
select cc.clientid,cc.[id],cc.category,case when cc.category not like 'fsi%' then  c.PDT else 0 end PDTcnt
,case when cc.category  like 'fsi%' then  c.PDT else 0 end fsicnt
 from MT2AClientRecordCounts c join mt2asql05.sitecontrol.dbo.categorycode cc
 on c.tablecode=cc.category
where c.pdt <>0
order by cc.clientid,cc.category



select clientid, count(categorycodeid) 
from RC where fsicnt = 0
group by clientid
having count(categorycodeid)=2

select * from RC where clientid=164 and fsicnt=0
--delete from RC where categorycodeid in (1077,1103,377,382,180),,,,,,,,,,,,,,,,,,,,
363,1138
select * from mt2asql05.sitecontrol.dbo.vw_merchandisecategory where categorycodeid = 956 and 
realcategory not in (
select realcategory from mt2asql05.sitecontrol.dbo.vw_merchandisecategory where categorycodeid = 956)

select * from masterclientcoverage..masterclientcwm where categorycodeid = 594 and 
retmktid not in (
select retmktid from masterclientcoverage..masterclientcwm where categorycodeid = 956)

select * from RC where clientid=164 and fsicnt=0
select * from RC where clientid=219 and fsicnt=1
select * from RC where clientid=246 and fsicnt=2
select * from RC where clientid=250 and fsicnt=3
select * from RC where clientid=255 and fsicnt=4
select * from RC where clientid=265 and fsicnt=5
select * from RC where clientid=271 and fsicnt=6
select * from RC where clientid=280 and fsicnt=7
select * from RC where clientid=285 and fsicnt=8
select * from RC where clientid=288 and fsicnt=9
select * from RC where clientid=293 and fsicnt=10
select * from RC where clientid=297 and fsicnt=11
select * from RC where clientid=306 and fsicnt=12
