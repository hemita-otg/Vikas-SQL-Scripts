--select distinct ClientId,CategoryCodeID,RetMktID into dbo.rmc2 from MasterClientCWM where RetMktID is not null
select * from  MasterClientCWM

insert into rmc2
select distinct ClientId,CategoryCodeID,rm.RetMktID from masterclientcwm mec join retmkt rm on mec.RetID = rm.retid
where mec.retmktid is null and mec.RetID is not null


insert into rmc2
select distinct ClientId,CategoryCodeID,rm.RetMktID from masterclientcwm mec join retmkt rm on mec.MktID  = rm.MktID
where mec.retmktid is null and mec.MktID is not null


insert into rmc2
select distinct ClientId,CategoryCodeID,rm.RetMktID from masterclientcwm mec join retmkt rm on mec.TCID  = rm.TCID
where mec.retmktid is null and mec.TCID  is not null

--Insert into rmc2
select 0,c.CategoryCodeID ,FieldValue    from ClientCWMException  c left  join MasterClientCWM m
on c.CategoryCodeID =m.CategoryCodeID and c.FieldValue =m.RetMktID  and m.CategoryCodeID is null where  c.Fieldid =153

select * from rmc2 

select * from MasterClientCWM where RetMktID =19221  and ClientId=76

select *  from ClientCWMException where Fieldid=153  and CategoryCodeID=76 and isnull(FieldValue,0) not In 
(select isnull(retmktid,0) from masterclientcwm where CategoryCodeID =76)


--alter table rmc2 add ClientName varchar(70),CategoryCode varchar(15),Retailer varchar(100),Market varchar(50),Detail bit,DAA bit, Active Bit

select * from rmc2 where retmktid is null 
--delete from rmc2 where  retmktid is null 

update r
set categorycode =c.category ,clientid=c.clientid
from rmc2 r join mt2sql14.sitecontrol.dbo.categorycode c on r.CategoryCodeID  =c.id


delete R from rmc2 r where clientid > 800  

update r
set clientname =cp.clientname  
from rmc2 r join mt2sql14.subscription.dbo.clientprofile cp on r.ClientId =cp.clientid


update r
set retailer =c.advertiser, market=c.market, Active = c.Active
from rmc2 r join RetMkt  c on r.RetMktID   =c.RetMktID 

update r
set daa=1 from 
 mt2sql14.sitecontrol.dbo.categorycode cc join rmc2 r on cc.category=r.categorycode  where 
ISNULL(ISPDT,0)=0 AND  ISNULL(ClientPDT,0)=0 and cwmfull=1 and ISNULL(isadlert,0)<>1


update rmc2 
set detail=1 where isnull(daa,0) <> 1 

select * from rmc2 where clientid=3 

--select distinct Retailer,Market,Clientname,Detail,Daa,active  into rmc2Final from rmc2 

select distinct retailer,market,clientname, max(cast(ISNULL(detail,0) as int)) detail,max(cast(ISNULL(daa,0) as int)) daa
into rmc2lientCombo
 from rmc2final 
group by retailer,market,clientname
order by  retailer,market,clientname

select * from rmc2final order by 1,2,3


select * from rmc2lientCombo order by 1,2,3
rmc2lientCombo -- your final table




select * from sysobjects where xtype='u' and name like 'rmc2%' 

drop table rmc2
drop table rmc2Final
drop table rmc2lientCombo
