SELECT * FROM ClientAdvertiserTradeclass WHERE CLIENTID=92
SELECT * FROM ClientAdvertiserTradeclasspep

SELECT distinct clienttradeclass FROM ClientAdvertiserTradeclasspep
SELECT distinct tradeclass,displayname FROM TradeClasses WHERE CLIENTID=92



SELECT distinct * FROM ClientAdvertiserTradeclasspep
--insert into TradeClassespep
--select * from TradeClasses where clientid = 9999
SELECT * FROM TradeClassespep

--all week data --
select top 1 * from flashreport..flashadspep
--individual week data
select top 1 * from frnational..natchildwebmainpep
select top 1 * from frnational..natpdtpep
select top 1 * from flashreport..frretmktpep 


select top 1 * from frnational..natchildwebmainpep

---drop table ClientAdvertiserTradeclassPEP
select * from ClientAdvertiserTradeclassPEP

with 
fap as (select * from flashreport..flashadspep),
ncwm as (select * from frnational..natchildwebmainpep),
npdt as (select * from frnational..natpdtpep),
frm  as (select  * from flashreport..frretmktpep )
select distinct ClientID,channel as [ClientTradeClass],Advertiser 
--into ClientAdvertiserTradeclassPEP
from frm join ncwm on frm.retmktid=ncwm.retmktid -- where clientid not in (select clientid from ClientAdvertiserTradeclassPEP)



/*

insert into tradeclassespep values(34,'CLUB','Club',4)
insert into tradeclassespep values(34,'DEPT','Department/Specialty',3)
insert into tradeclassespep values(34,'MISC','Dollar',6)
insert into tradeclassespep values(34,'DRUG','Drug',1)
insert into tradeclassespep values(34,'HDWE','Hardware',5)
insert into tradeclassespep values(34,'MASS','Mass',2)
insert into tradeclassespep values(34,'MISC','Office',6)
insert into tradeclassespep values(34,'MISC','Pet',6)
insert into tradeclassespep values(34,'MISC','Supermarkets',6)



insert into tradeclassespep values(46,'CLUB','Club',4)
insert into tradeclassespep values(46,'DEPT','Department/Specialty',3)
insert into tradeclassespep values(46,'MISC','Dollar',6)
insert into tradeclassespep values(46,'DRUG','Drug',1)
insert into tradeclassespep values(46,'HDWE','Hardware',5)
insert into tradeclassespep values(46,'MASS','Mass',2)
insert into tradeclassespep values(46,'MISC','Office',6)
insert into tradeclassespep values(46,'MISC','Pet',6)
insert into tradeclassespep values(46,'MISC','Supermarkets',6)


insert into tradeclassespep values(1059,'CLUB','Club',4)
insert into tradeclassespep values(1059,'DEPT','Department/Specialty',3)
insert into tradeclassespep values(1059,'MISC','Dollar',6)
insert into tradeclassespep values(1059,'DRUG','Drug',1)
insert into tradeclassespep values(1059,'HDWE','Hardware',5)
insert into tradeclassespep values(1059,'MASS','Mass',2)
insert into tradeclassespep values(1059,'MISC','Office',6)
insert into tradeclassespep values(1059,'MISC','Pet',6)
insert into tradeclassespep values(1059,'MISC','Supermarkets',6)

*/




select * from clientvalues where clientid in (34,46,1059)


select * from FRNational.dbo.NATPDTPEP 
select distinct advertiser, market, count(*) from FRNational.dbo.NATPDT p join frnational..NATChildWebMain c on p.flyerid = c.flyerid  group by advertiser, market order by 3 desc 
select distinct advertiser, market, count(*) from FRNational.dbo.NATchildwebmainPEP group by advertiser, market order by 3 desc 


select distinct advertiser, market, count(*) from FRNational.dbo.NATPDT p join frnational..NATChildWebMain c on p.flyerid = c.flyerid  group by advertiser, market order by 3 desc 













with 
fap as (select * from flashreport..flashadspep),
ncwm as (select * from frnational..natchildwebmainpep),
npdt as (select * from frnational..natpdtpep),
frm  as (select  * from flashreport..frretmktpep )
select distinct frm.ClientID ,manufacturer 
from ncwm join npdt  on ncwm.flyerid =npdt.flyerid 
join frm on ncwm.RetMktID =frm.RetMktID 
order by 1




select * from TradeClasses 
select distinct tradeclass,displayname,seq from TradeClassespep order by 3 

select distinct a.clientid,f.tradeclass from frretmktpep a join FlashAdsPEP f on a.retmktid=f.RetMktID  order by 1 
select distinct clientid,channel,tradeclass from frretmktpep a join mt2sql13.masteracfv.dbo.acfvflyerreports  f on a.retmktid=f.RetMktID 

select top 1000 * from mt2sql13.masteracfv.dbo.acfvflyerreports 




insert into tradeclassespep values(34,'Dollar','Dollar',6)
insert into tradeclassespep values(34,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(34,'FSI','FSI',10)
insert into tradeclassespep values(34,'Mass','Mass',2)
insert into tradeclassespep values(34,'Drug','Drug',1)
insert into tradeclassespep values(34,'Pet','Pet',6)
insert into tradeclassespep values(46,'Mass','Mass',2)
insert into tradeclassespep values(46,'Pet','Pet',6)
insert into tradeclassespep values(46,'Dollar','Dollar',6)
insert into tradeclassespep values(46,'Club','Club',4)
insert into tradeclassespep values(46,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(46,'Drug','Drug',1)
insert into tradeclassespep values(99,'Mass','Mass',2)
insert into tradeclassespep values(99,'Drug','Drug',1)
insert into tradeclassespep values(99,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(208,'Mass','Mass',2)
insert into tradeclassespep values(208,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(286,'Dollar','Dollar',6)
insert into tradeclassespep values(286,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(286,'Pet','Pet',6)
insert into tradeclassespep values(286,'Mass','Mass',2)
insert into tradeclassespep values(286,'Drug','Drug',1)
insert into tradeclassespep values(711,'Mass','Mass',2)
insert into tradeclassespep values(711,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(754,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(754,'Mass','Mass',2)
insert into tradeclassespep values(754,'Hardware','Hardware',5)
insert into tradeclassespep values(765,'Pet','Pet',6)
insert into tradeclassespep values(765,'Dollar','Dollar',6)
insert into tradeclassespep values(765,'Hardware','Hardware',5)
insert into tradeclassespep values(765,'Mass','Mass',2)
insert into tradeclassespep values(813,'Dollar','Dollar',6)
insert into tradeclassespep values(813,'Department/Specialty','Department/Specialty',3)
insert into tradeclassespep values(813,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(813,'Electronics','Electronics',5)
insert into tradeclassespep values(813,'Office','Office',6)
insert into tradeclassespep values(813,'Drug','Drug',1)
insert into tradeclassespep values(813,'Mass','Mass',2)
insert into tradeclassespep values(836,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(1029,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(1059,'Department/Specialty','Department/Specialty',3)
insert into tradeclassespep values(1059,'Mass','Mass',2)
insert into tradeclassespep values(1059,'Drug','Drug',1)
insert into tradeclassespep values(1059,'Hardware','Hardware',5)
insert into tradeclassespep values(1059,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(1059,'Dollar','Dollar',6)
insert into tradeclassespep values(1059,'Office','Office',6)
insert into tradeclassespep values(9999,'Hardware','Hardware',5)
insert into tradeclassespep values(9999,'FSI','FSI',10)
insert into tradeclassespep values(9999,'Mass','Mass',2)
insert into tradeclassespep values(9999,'Electronics','Electronics',5)
insert into tradeclassespep values(9999,'Supermarkets','Supermarkets',6)
insert into tradeclassespep values(9999,'Club','Club',4)
insert into tradeclassespep values(9999,'Office','Office',6)
insert into tradeclassespep values(9999,'Department/Specialty','Department/Specialty',3)
insert into tradeclassespep values(9999,'Dollar','Dollar',6)
insert into tradeclassespep values(9999,'Drug','Drug',1)
insert into tradeclassespep values(9999,'Pet','Pet',6)



select * from AdvertisersGroup