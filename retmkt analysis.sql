
--------------Run on MT2SQL00
/* From Control table toJA package script for retmktcattable
select distinct mcc.clientid, mcc.categorycodeid 
				from masterclientcoverage..masterclientcwm mcc
				Join mt2sql14.sitecontrol.dbo.categorycode cc on mcc.categorycodeid = cc.[id] 
					 and isnull(clientpdt,0) = 1 and isnull(ismaster,0)=1 and isnull(isadlert,0)<>1 and isnull(isct,0)<>1 and isnull(fvcctype,0)  not in (2,4,6)
				Join mt2sql14.subscription.dbo.clientprofile cp on cc.clientid = cp.clientid and cp.isactiveclient=1 and isnull(cp.IsInternal,0)=0 
				Left Outer Join masterclientcoverage..TrackedRetMktCatExclude excl on mcc.categorycodeid = excl.categorycodeid
				Where excl.categorycodeid is null 
*/
Use MasterAdviewData
Go

alter VIEW AM
AS 
SELECT DISTINCT A.ADDATE,A.FLYERID,B.PAGEDETAILID,RETMKTID,Advertiser, market, MerchandiseCategory, MerchandiseSubCat, CATEGORY,media, MediaDetail 
FROM ADVIEWMAIN A  
JOIN MASTERPAGEDETAILTABLE B 
ON A.FLYERID=B.FLYERID and YEAR(AdDate) in (2017,2018) and (PageDetailID not like '%EC' or PageDetailID not like '%MT')

--Active client collation
drop table tempdb..Categorycode

select distinct mcc.clientid, mcc.categorycodeid,cp.clientname, isdaa into tempdb..Categorycode
from masterclientcoverage..masterclientcwm mcc
Join mt2sql14.sitecontrol.dbo.categorycode cc on mcc.categorycodeid = cc.[id] 
	 and (isnull(clientpdt,0) = 1 or (isnull(isdaa,0) = 1 and isnull(cwmfull,'')= 1)) and  isnull(isadlert,0)<>1 and isnull(fvcctype,0) not in (2,4,6) and isnull(isfsi,0) != 1
join mt2sql14.subscription.dbo.clientdatabases b with (nolock)
	on cc.ID = b.CategoryCodeID and cc.clientid = b.clientid
Join mt2sql14.subscription.dbo.clientprofile cp on b.clientid = cp.clientid and cp.isactiveclient=1 and isnull(cp.IsInternal,0)=0 
Left Outer Join masterclientcoverage..TrackedRetMktCatExclude excl on mcc.categorycodeid = excl.categorycodeid
Where excl.categorycodeid is null --and isnull(IsCanadaClient,0) <> 1 

select * from mt2sql14.subscription.dbo.clientprofile where clientid = 94
select * from mt2sql14.subscription.dbo.clientdatabases where  clientid = 94
select * from mt2sql14.sitecontrol.dbo.categorycode where id = 2707 and clientid = 94 and (isnull(clientpdt,0) = 1 or (isnull(isdaa,0) = 1 and isnull(cwmfull,'')= 1)) and  isnull(isadlert,0)<>1 and isnull(fvcctype,0) not in (2,4,6) and isnull(isfsi,0) != 1
select * from masterclientcoverage..masterclientcwm where categorycodeid = 2707
select * from MasterClientCoverage..ClientCWMException where categorycodeid = 3397


select distinct fullsourcecode from mt2sql14.sitecontrol.dbo.vw_catinfo where sourcecwm like '%MasterAVData..MasterAVChildWebMain%'
delete from tempdb..Categorycode where CategoryCodeID in (select CategorycodeId from mt2sql14.sitecontrol.dbo.vw_catinfo where sourcecwm like '%MasterAVData..MasterAVChildWebMain%')
delete from tempdb..Categorycode where CategoryCodeID in (select CategorycodeId from mt2sql14.sitecontrol.dbo.vw_catinfo where fullsourcecode like 'FVHistory..MasterFVHistory')

--Client coverage table based on above table (active client)
drop table tempdb..reportRetMkt1--(00:04:51)

Select distinct * into tempdb..reportRetMkt1 from (
Select distinct cc.ClientID,cc.ClientName,Ret.Advertiser,Ret.Market , ret.RetMktID, cwm.CategoryCodeID, ret.CoverageID, isdaa
from MasterClientCoverage.dbo.MasterClientCWM  CWM with (nolock)
join MasterClientCoverage.dbo.RetMkt Ret with (nolock)
	on CWM.RetMktID = Ret.RetMktID  --OR CWM.TCID=Ret.TCID 
	or (CWM.RetID is null AND CWM.RetMktID IS NULL AND CWM.TCID = Ret.TCID AND CWM.MktID IS NULL) 
	or (CWM.RetID is null AND CWM.RetMktID IS NULL AND CWM.TCID = Ret.TCID AND CWM.MktID = Ret.MktID)
	or (CWM.RetID=Ret.RetID AND CWM.RetMktID IS NULL AND CWM.TCID = Ret.TCID AND CWM.MktID IS NULL) 
	or (CWM.RetID is null AND CWM.RetMktID = Ret.RetMktID AND CWM.TCID = Ret.TCID AND CWM.MktID IS NULL) 
	OR (CWM.RetID=Ret.RetID AND CWM.RetMktID IS NULL AND CWM.TCID IS NULL AND CWM.MktID IS NULL) 
	OR (CWM.MktID=Ret.MktID AND CWM.RetMktID IS NULL AND CWM.TCID IS NULL AND CWM.RetID IS NULL)
Join tempdb..Categorycode cc 
	on CWM.categorycodeid = cc.categorycodeid and cwm.ClientId = cc.ClientId 
	where active = 1
union
Select distinct cc.ClientID,cc.ClientName,Ret.Advertiser,Ret.Market  ,ret.RetMktID,cwm.CategoryCodeID, ret.CoverageID, isdaa
from MasterClientCoverage.dbo.ClientCWMException CWM with (nolock)
join MasterClientCoverage.dbo.RetMkt Ret with (nolock)
	on CWM.FieldValue = cast(Ret.RetMktID as bigint) and CWM.Fieldid = 153
Join tempdb..Categorycode cc 
	on CWM.categorycodeid = cc.categorycodeid
	where active = 1
) X order by 1,2,3,4

select * from  tempdb..reportRetMkt1 where market like '%Austin, TX%'  order by 2
select * from mt2sql14.sitecontrol.dbo.vw_catinfo where categorycodeid = 7086

--CA Retailers (WEB)
select * 
--delete
from tempdb..reportRetMkt1  where advertiser in ('Peapod (General IL)','Peapod (Stop & Shop NY)','Peapod (Giant - Carlisle PA)','Peapod (Giant - Landover MD)','Peapod (Stop & Shop MA)','Real Canadian Super Store - WebCan','Walmart (CAN)','Amazon.ca','Loblaws','Best Buy (CAN)','Centre Hi-Fi','Canadian Tire','Shoppers Drug Mart','London Drugs','Staples (CAN)','Costco (CAN)')

--CA Market delete
select *
--delete
from  tempdb..reportRetMkt1 where market in ('Master', 'Version', 'Version-Con','Puerto Rico','Halifax, Nova Scotia','Various (CAN)','St. Johns, Newfoundland','Calgary, Alberta','Shediac, New Brunswick','Montreal, Quebec','Toronto, Ontario','Vancouver, BC','Edmonton, Alberta','Ottawa, Ontario','Winnipeg, Manitoba','Moncton, New Brunswick','Kamloops, BC','Saskatoon, Saskatchewan')

--Create table for clientcoverage with Media
drop table tempdb..rretmkt1  

select distinct a.*,media 
into tempdb..rretmkt1  
from tempdb..reportRetMkt1 a
join masteradviewdata..am b
on a.retmktid = b.retmktid

--Adding retmkt which is not received by client
insert into tempdb..rretmkt1  (clientid,categorycodeid,  advertiser, market, retmktid, media, CoverageID)
select distinct 0,0, b.advertiser, b.market, b.retmktid, b.media , c.CoverageID
from tempdb..reportRetMkt1 a
right join masteradviewdata..AM b
on a.retmktid = b.retmktid
join MasterClientCoverage.dbo.RetMkt c
on b.RetMktID = c.retmktid
where a.retmktid is null


--for extra delete for CA
select * 
--delete b
from mt2sql00.master.dbo.activeretmktCA a
join tempdb..rretmkt1 b
on a.advertiser = b.advertiser
and a.market = b.market

--CA Retailers (WEB)
select * 
--delete
from tempdb..rretmkt1  where advertiser in ('Peapod (General IL)','Peapod (Stop & Shop NY)','Peapod (Giant - Carlisle PA)','Peapod (Giant - Landover MD)','Peapod (Stop & Shop MA)','Real Canadian Super Store - WebCan','Walmart (CAN)','Amazon.ca','Loblaws','Best Buy (CAN)','Centre Hi-Fi','Canadian Tire','Shoppers Drug Mart','London Drugs','Staples (CAN)','Costco (CAN)')

--CA Market delete
select *
--delete 
from  tempdb..rretmkt1 where market in ('Master', 'Version', 'Version-Con','Puerto Rico','Halifax, Nova Scotia','Various (CAN)','St. Johns, Newfoundland','Calgary, Alberta','Shediac, New Brunswick','Montreal, Quebec','Toronto, Ontario','Vancouver, BC','Edmonton, Alberta','Ottawa, Ontario','Winnipeg, Manitoba','Moncton, New Brunswick','Kamloops, BC','Saskatoon, Saskatchewan')

-----Addition for ZERO count-------
alter table tempdb..rretmkt1 alter column clientid int

update tempdb..rretmkt1 set clientid = null  where clientid = 0

-------Tradeclass Update-----
--alter table tempdb..rretmkt1 add TradeClass varchar(30)

--update trm set TradeClass = AVTradeclass
----select trm.*, AVTradeclass 
--from tempdb..rretmkt1 trm
--join masterclientcoverage.dbo.retmkt rm on trm.retmktid = rm.retmktid
--join masterclientcoverage.dbo.mastertradeclass mtc on rm.retid = mtc.retid 
--join masterclientcoverage.dbo.tblavtradeclass atc on mtc.avtcid = atc.avtcid

delete from tempdb..rretmkt1 where market = 'sld'
select * from  tempdb..rretmkt1

insert into  tempdb..rretmkt1
select distinct 758, 'Samsung Electronics America', b.Advertiser, b.market, b.retmktid, 3397, CoverageID, 1,media from mt2sql08.sql08.dbo.adsamwflyerreports b
join MasterClientCoverage.dbo.RetMkt c
on b.RetMktID = c.retmktid
-------------------------------------------------------------------------------
--Client category coverage table creation
drop table tempdb..merchandisecategory

select distinct categorycodeid, realcategory into tempdb..merchandisecategory  from mt2sql14.SiteControl.dbo.vw_MerchandiseCategory where CategoryCodeId in (select distinct CategoryCodeId from tempdb..rretmkt1 )

--Client retmkt & category coverage consolidated table
drop table tempdb..retmktcat

Select distinct Clientid, c.CategoryCodeID, ClientName, Media, RealCategory 
into tempdb..retmktcat
from tempdb..merchandisecategory c
join tempdb..rretmkt1 rm on c.categorycodeid = rm.CategoryCodeID

select count(*) from tempdb..retmktcat --98958
--Temp table create for number of client receiving number of pagedetailID
drop table tempdb..a --(00:16:05)

--select * into tempdb..am from masteradviewdata..am

select b.Media, Category, count(distinct clientname ) [# Clients Receiving], case when year(addate) = 2017 then count(distinct PageDetailID) else 0 end  [2017 PDT] , case when year(addate) = 2018 then count(distinct PageDetailID) else 0 end  [2018 PDT]  
into tempdb..a
from tempdb..retmktcat a
join masteradviewdata..am b
on a.realcategory = b.Category 
 and a.media = b.media
 group by b.Media,  Category, year(addate)

 select * from tempdb..a

insert into tempdb..a
select b.Media, Category, 0, case when year(addate) = 2017 then count(distinct PageDetailID) else 0 end  [2017 PDT] , case when year(addate) = 2018 then count(distinct PageDetailID) else 0 end  [2018 PDT]  
from tempdb..retmktcat a
right join masteradviewdata..am b with (nolock)
on a.realcategory = b.Category 
and a.media = b.media
where a.realcategory is null
group by b.Media, Category, year(addate)

--removing duplicat entries based on above table
drop table tempdb..aa

 select media, category , [# Clients Receiving], max([2017 pdt]) [2017 pdt], max([2018 pdt]) [2018 pdt] 
 into tempdb..aa from tempdb..a
 group by media, category , [# Clients Receiving]

-- Category Summary final table
drop table tempdb..finalsummary

select distinct Media, d.MerchandiseCategory, d.CategoryGroup,d.Category, [# Clients Receiving],[2017 PDT] ,[2018 pdt]
into tempdb..finalsummary
from  tempdb..aa a
 join mt2sql00.EntryData.dbo.JaAllDisplayCategory d
on a.category = d.category 

--Temp table create client name receiving
drop table tempdb..b

select distinct b.Media, Category, clientname 
into tempdb..b
from tempdb..retmktcat a
join masteradviewdata..am b
on 
 a.realcategory = b.Category 
 and a.media = b.media
 
insert into tempdb..b
select distinct  b.Media,  Category,  clientname 
from tempdb..retmktcat a
right join masteradviewdata..am b
on 
a.realcategory = b.Category 
and a.media = b.media
where a.realcategory is null

-- Category Detail final table
drop table tempdb..finaldetail

select distinct  Media,d.MerchandiseCategory, d.CategoryGroup,a.Category,isnull(clientname,'') ClientName
into tempdb..finaldetail
from  tempdb..b a
join mt2sql00.EntryData.dbo.JaAllDisplayCategory d
on a.category = d.category

drop table tempdb..Retmktsum
select distinct Media, a.Advertiser, a.Market,c.TradeClass,descrip Coverage, isnull(isdaa,0)  [Only Ad Level (DAA)], count(distinct clientid) [# Clients Receiving] 
into tempdb..Retmktsum
from tempdb..rretmkt1 a
join masterclientcoverage.dbo.code b
on a.CoverageID = CodeID and CodeTypeID = 2
join MasterClientCoverage..retmkt c
on a.Advertiser = c.Advertiser and a.Market = c.Market
group by Media, a.Advertiser, a.Market,c.tradeclass,descrip,isdaa


--Final 4 tab
--1) RetMkt # of clients receiving (Retailer Market  Summary)
select Media, Advertiser, Market,Tradeclass, Coverage, isnull([1],0) [# Clients Receiving DAA], isnull([0],0) [# Clients Receiving DE] 
from (select Media, Advertiser, Market,Tradeclass, Coverage, [Only Ad Level (DAA)],[# Clients Receiving] from  tempdb..Retmktsum) p
PIVOT 
(sum([# Clients Receiving]) for [Only Ad Level (DAA)] in ([0],[1])) as pvt
order by 2,3

--2) Retmkt detail (Retailer Market Detail)
select distinct Media, a.Advertiser, a.Market,c.TradeClass,descrip Coverage,ISNULL(isdaa,0) [Only Ad Level (DAA)], isnull(clientname,'') ClientName from tempdb..rretmkt1 a
join masterclientcoverage.dbo.code b
on a.CoverageID = CodeID and CodeTypeID = 2
join MasterClientCoverage..retmkt c
on a.Advertiser = c.Advertiser and a.Market = c.Market

--1) Category # of clients receiving (Category Summary)
select distinct * from tempdb..finalsummary a--order by 4,3,2,1


--2) Category detail (Category Detail)
select distinct * from tempdb..finaldetail  a--order by 4,3,2,1


SELECT * FROM masterclientcoverage.dbo.code