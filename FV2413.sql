

select distinct ClientID,ClientName,HomepageLink,case when clientserver in ('mt2sql12','mt2sql03') then 'Demo' else 'Regular FV' end FVType,clientserver  from sitecontrol..vw_catinfo where ( cwmfull=1 or clientpdt=1 or isadlert=1 ) and  clientname like '%market track%' or  clientname like '%markettrack%' order by clientname 

select * into tempdb..t  from subscription..vwuser where type=2 and clientid in 
(select clientid from 
 sitecontrol..vw_catinfo where ( cwmfull=1 or clientpdt=1 or isadlert=1 ) and  clientname like '%market track%' or  clientname like '%markettrack%' 
 ) 
 
select distinct clientname ,firstname,lastname,username  from tempdb..t  a join sitecontrol..vw_catinfo b on a.clientid=b.clientid order by firstname,lastname,username 