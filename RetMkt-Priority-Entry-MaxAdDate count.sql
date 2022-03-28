select advertiser,market,tradeclass,priority,RetMktId,null as Entry,null as MaxAdDate 
into tempdb..rm 
from retmkt where priority in (1,2)


update tempdb..rm 
set Entry=1
where retmktid in
(
select distinct retmktid from masterentrycwm)

delete from tempdb..rm where priority not in (1,2)

update tempdb..rm set Entry=0 where Entry is null

update r
set MaxAdDate= x.MAXADDATE
from 
(select retmktid,max(Addate) as MAXADDATE from masteradviewdata..adviewmain 
group by retmktid
) x join tempdb..rm r on
x.retmktid=r.retmktid



