use sitecontrol

select distinct clientid,clientname,categorycodeid,category,HomePageLink ,clientserver,mt2aClientServer   from vw_catinfo where mt2aClientServer is not null and isnull(isadlert,0)=0 and (ispdt=1 or cwmfull=1 )order by clientserver

select distinct clientid,clientname,categorycodeid,category,HomePageLink ,clientserver,mt2aClientServer  from vw_catinfo where mt2aClientServer is not null and isnull(isadlert,0)=1 and (ispdt=1 or cwmfull=1 )order by clientserver 