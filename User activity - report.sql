1)Number of authorized client users on our systems
2) total number of daily sessions for Dec 2009
3)average distinct user sessions  for Dec 2009

--**************************************************
--Report is formatted in column date wise
--**************************************************
select  username, clientid, 
[2009-12-02 00:00:00.000]  = sum(case when dttm='12/02/2009' then SessionCount else 0 end) , 
[2009-12-01 00:00:00.000] = sum(case when dttm='12/01/2009' then SessionCount else 0 end)  
from UserActivity_summary 
where dttm between '12/01/2009' and '12/31/2009'
--and username='pg-79aranm'
group by clientid,username

--**************************************************


select count(*) from useractivity
where year(dttm)=2010 and month(dttm)=1

select *
 from UserActivity_summary where dttm between '12/01/2009' and '12/31/2009'

select username, clientid, 
[2009-12-02 00:00:00.000] = case when dttm='12/02/2009' then SessionCount else 0 end , 
[2009-12-01 00:00:00.000] = case when dttm='12/01/2009' then SessionCount else 0 end from 
	UserActivity_summary where dttm between '12/01/2009' and '12/31/2009'
group by clientid,username,dttm,sessioncount

select username, clientid, 
	case when dttm = '2009-12-10 00:00:00.000' then SessionCount end as [2009-12-10 00:00:00.000]
from UserActivity_summary
group by username, clientid

select distinct username, clientid 
from
(
select  username, clientid, 
[2009-12-02 00:00:00.000]  = sum(case when dttm='12/02/2009' then SessionCount else 0 end) , 
[2009-12-01 00:00:00.000] = sum(case when dttm='12/01/2009' then SessionCount else 0 end)  
from UserActivity_summary 
where dttm between '12/01/2009' and '12/31/2009'
--and username='pg-79aranm'
group by clientid,username--,dttm--,sessioncount
 )

select * from UserActivity_summary where username='pg-79aranm'
and  dttm between '12/01/2009' and '12/31/2009'

select username, clientid, 

group by username, clientid

1)Number of authorized client users on our systems
2) total number of daily sessions for Dec 2009
3)average distinct user sessions  for Dec 2009

select count(distinct us.userid) as [authorized client users] 
from useractivity_summary us join vwuser v on 
us.userid=v.userid and v.type=1 where 
dttm between '12/01/2009' and '12/31/2009'


select dttm, sum(sessioncount) as [daily sessions] from useractivity_summary us join vwuser v on 
us.userid=v.userid and v.type=1  
where dttm between '12/01/2009' and '12/31/2009'
group by dttm order by dttm

select  sum(sessioncount)/31 from useractivity_summary us join vwuser v on 
us.userid=v.userid and v.type=1  
where dttm between '12/01/2009' and '12/31/2009'
group by dttm
