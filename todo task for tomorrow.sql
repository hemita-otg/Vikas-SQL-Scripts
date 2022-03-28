select Distinct RetMktId,TradeClass,Advertiser,Market,null as AccountGroup ,Active,null as EntryProject into Tempdb..RM
from retmkt 

select * from tempdb..rm

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
r.retmktid=m.retmktid

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
r.advertiser=m.advertiser
where r.accountgroup is null

update tempdb..rm set accountgroup=m.tradeclass
from tempdb..rm r join masteradviewdata..adviewmain m on
replace(r.advertiser,' - adams','')=m.advertiser
where r.accountgroup is null 

update r set Entryproject = ep.descrip
from tempdb..rm r join masterclientcoverage..MasterEntryCWM me
on r.retmktid=me.retmktid join masterclientcoverage..entryproject ep on 
ep.entryprojectid=me.entryprojectid
where ep.entryprojectid not in (14,15)

select * from masterclientcoverage..MasterEntryCWM where  retmktid=1
select * from masterclientcoverage..entryproject
select top 100 * from masteradviewdata..adviewmain
--retmkt
0.	tradeclass
a.	Account Group 
b.	Retailer
c.	Market
d.	Active Y/N
e.	Current Entry Project - Exclude(14, 15) -- masterentrycwm
f.	CWM Publish date – Ad Date totaled and divided by number of CWM records
g.	PDT Entry date – Ad Date totaled and divided by number of PDT records
Followed by columns for each client build 


2.	Sales Site – My old standby CWM analysis for time period 2/1/2010 -1/31/2011 and 11/1/2010 – 1/31/2010. 
This is the one that list all the retailer/markets in CWM, Total CWM, Insert, ROP, then Pages Total, Insert pages, etc. 

select * from tempdb..CWORetMktTC
--Drop table tempdb..CWORetMktTC
select tradeclass, min(AVtradeclass) AccountGroup, advertiser, Market, 
count(Flyerid) [CWM], 
Sum(case when month(addate) in (11,12,1) then 1 end) [CWM3Mo], 
sum(pages) [Pages], 
Sum(case when month(addate) in (11,12,1) then pages end) [Pages3Mo], 
Sum(case when media in ('Insert', 'In-store', 'Mailer') then 1 end) [PrePrints],
Sum(case when media in ('Insert', 'In-store', 'Mailer') then pages end) [PrePrintPages],
Sum(case when media in ('ROP') then 1 end) [ROPCWM],
Sum(case when media in ('ROP') then pages end) [ROPPages],
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') then 1 end) [OtherCWM],
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') then pages end) [OtherPages],
Sum(case when media in ('Insert', 'In-store', 'Mailer') and month(addate) in (11,12,1) then 1 end) [PrePrints3Mo] ,
Sum(case when media in ('Insert', 'In-store', 'Mailer') and month(addate) in (11,12,1) then Pages end) [PrePrintPages3Mo],
Sum(case when media in ('ROP') and month(addate) in (11,12,1) then 1 end) [ROPCWM3Mo] ,
Sum(case when media in ('ROP') and month(addate) in (11,12,1) then Pages end) [ROPPages3Mo] ,
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') and month(addate) in (11,12,1) then 1 end) [OtherCWM3Mo] ,
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') and month(addate) in (11,12,1) then Pages end) [OtherPages3Mo]  
into tempdb..CWORetMktTC
from masteradviewdata..adviewmain a
join tblavtradeclass b on a.avtcid = b.avtcid 
where addate between '2/1/2010' and '1/31/2011'
group by tradeclass, advertiser, Market
option (maxdop 1)


3.	Sales Site – Retailer/Market/Entry project for all entry projects in JA


Select rm.advertiser, rm.market, descrip, rm.retmktid, startdate, enddate
into tempdb..cworetmkt
from masterclientcoverage..Retmkt rm 
join masterclientcoverage..masterentrycwm cc on rm.retmktid=cc.retmktid
join masterclientcoverage..entryproject ep on ep.entryprojectid=cc.entryprojectid
where cc.entryprojectid not in (14,15)

-- Insert into tempdb..cworetmkt
Select rm.advertiser, rm.market, descrip, rm.retmktid, startdate, enddate
from masterclientcoverage..Retmkt rm 
join masterclientcoverage..masterentrycwm cc on rm.retmktid=cc.retmktid
join masterclientcoverage..entryproject ep on ep.entryprojectid=cc.entryprojectid
where cc.entryprojectid in (14,15) and rm.retmktid not in (select retmktid from tempdb..cworetmkt)

Update tempdb..cworetmkt set descrip = cwo.descrip + ', Hispanic'
--Select rm.advertiser, rm.market, descrip 
from masterclientcoverage..Retmkt rm 
join tempdb..cworetmkt cwo on rm.advertiser=cwo.advertiser and rm.market=cwo.market
join masterclientcoverage..masterentrycwm cc on rm.retmktid=cc.retmktid
join masterclientcoverage..entryproject ep on ep.entryprojectid=cc.entryprojectid
where mediaid is not null

Update tempdb..cworetmkt set descrip = 'Hispanic'
--Select rm.advertiser, rm.market, descrip 
from masterclientcoverage..Retmkt rm 
join tempdb..cworetmkt cwo on rm.advertiser=cwo.advertiser and rm.market=cwo.market
join masterclientcoverage..masterentrycwm cc on rm.retmktid=cc.retmktid
join masterclientcoverage..entryproject ep on ep.entryprojectid=cc.entryprojectid
where mediaid is not null and cwo.descrip is null


select * from tempdb..cworetmkt where descrip is null
select * from tempdb..cworetmkttc
select * from tempdb..rm