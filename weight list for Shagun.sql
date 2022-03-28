Use tempdb
Go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SK]
GO

--based on control table.
--select distinct Advertiser, Market from mt2sql00.masterclientcoverage.dbo.masterclientcwm mcc
--join mt2sql00.masterclientcoverage.dbo.RetMkt rm on mcc.retmktid = rm.retmktid
--where mcc.retmktid not in (select retmktid from dbo.WeightRetMktClass)
--and mcc.categorycodeid in (select ID from sitecontrol.dbo.categorycode where clientpdt=1 and clientid < 900)

--based on master table
Select distinct FlyerID, PagedetailID, null RetMktID, TaggedCompany, Features, [Weight],Page
into tempdb..SK
from masteradviewdata.dbo.masterpagedetailtable pdt
--where pdt.weight is null OR pdt.features is null 
option (maxdop 1)

update m  set retmktid = rm.retmktid
from tempdb..SK m
join masteradviewdata.dbo.adviewmain rm on m.flyerid = rm.flyerid


update PDT  set Features = IsNull(vp.[FVSystemValue],pdt.[Features])
from tempdb..SK PDT
join masteradviewdata.dbo.MCAPVehiclePages VP on PDT.flyerid = vp.flyerid and   PDT.page = vp.pagenumber
--Where (PDT.Features IS NULL or rtrim(ltrim(pdt.Features)) = '')

-- Update  Weight
IF EXISTS(SELECT * FROM tempdb..sysobjects WHERE xtype = 'U' AND [name] = 'vwWeightScore')
DROP TABLE TempDB..vwWeightScore
GO
SELECT * INTO tempdb..vwWeightScore FROM MT2SQL14.SiteControl.DBO.vwWeightScore
GO

--select Pagedetailid,Weight,ws.score
update pdt set pdt.weight = ws.score
from tempdb..SK pdt
join tempdb.dbo.vwWeightScore ws with (nolock) on pdt.retmktid = ws.retmktid and pdt.Features = ws.features and pdt.taggedcompany = ws.taggedcompany
select * from tempdb..SK


select distinct retmktid,taggedcompany,features,weight,null as Advertiser,null as Market into tempdb..skf from tempdb..sk

update s set advertiser=r.advertiser,s.market = r.market from tempdb..skf s join MasterClientCoverage..retmkt r on s.retmktid=r.retmktid 

alter table tempdb..skf alter column market Varchar(200 )


select * from tempdb..skf  order by 5,6


