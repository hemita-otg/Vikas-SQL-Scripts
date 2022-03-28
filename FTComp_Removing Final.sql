
-- 
-- Update AdamsFTFVRetTrans Set FVRetID = B.RetID
-- --Select FVRet, Advertiser, A.FVRetID, B.RetID 
-- From AdamsFTFVRetTrans A
-- JOIN (Select Distinct Advertiser, RetID From masterclientcoverage..RetMkt) b ON a.FVRet = b.Advertiser
-- 
-- Update AdamsFTFVRetTrans Set FVRetID = B.RetID
-- --Select FVRet, Advertiser, A.FVRetID, B.RetID 
-- From AdamsFTFVRetTrans A
-- JOIN (Select Distinct Advertiser, RetID From masterclientcoverage..RetMkt) b ON a.FTRet = b.Advertiser
-- and a.FVRetID = 0
-- 
-- Select Distinct Advertiser, RetID From masterclientcoverage..RetMkt order by 1
-- select * from AdamsFTFVRetTrans where FVRetID = 0 order by 1
-- 
-- Update B Set FTRetID = A.RetID
-- --select Distinct A.Advertiser, A.RetId, B.FVRet, B.FVRetID 
-- from FTCompDisAdvertiserMarket A
-- Join AdamsFTFVRetTrans B on A.RetID = B.FVRetID
-- 
-- SELECT * FROM FTCompDisAdvertiserMarket where advertiser like '%winn%'
-- select * from AdamsFTFVRetTrans order by FTRetID, fvrETID

select * from rndcChildWebMain

select Advertiser, Count(Distinct RetID) from mtwineChildWebMain group by advertiser having count(Distinct RetID) > 1
select TradeClass, Advertiser, Market, Count(Distinct RetMktID) from rndcChildWebMain group by TradeClass, advertiser, market having count(Distinct RetMktID) > 1

Alter Table rndcChildWebMain Add Ru Int

Update A Set RU = 1
--select Distinct A.Advertiser, B.FVRet, B.FTRet, A.RetID, B.FVRetID, Case When A.RetMktID = (A.RetID + A.MktID) Then 'FTComp' Else 'FV Pure' End 
from rndcChildWebMain A
Join AdamsFTFVRetTrans B ON A.Advertiser = B.FVRet And A.RetId = B.FVRetID
and IsNull(Ru, 0) = 0
Order by 1

Update A Set RetID = B.FVRetID, RU = 1
--select Distinct A.Advertiser, B.FVRet, B.FTRet, A.RetID, B.FVRetID, Case When A.RetMktID = (A.RetID + A.MktID) Then 'FTComp' Else 'FV Pure' End 
from rndcChildWebMain A
Join AdamsFTFVRetTrans B ON A.Advertiser = B.FVRet And A.RetId <> B.FVRetID
And IsNull(Ru, 0) = 0
Order by 1

Update A Set Advertiser = B.FVRet, RetID = B.FVRetID, RU = 1
--select Distinct A.Advertiser, B.FVRet, B.FTRet, A.RetID, B.FVRetID, Case When A.RetMktID = (A.RetID + A.MktID) Then 'FTComp' Else 'FV Pure' End 
from rndcChildWebMain A
Join AdamsFTFVRetTrans B ON A.RetId <> B.FVRetID And A.Advertiser = Replace(B.FTRet, ' - Adams', '')
And IsNull(RU, 0) = 0
Order by 1

Update A Set Advertiser = B.FVRet, RetID = B.FVRetID, RU = 1
--select Distinct A.Advertiser, B.FVRet, B.FTRet, A.RetID, B.FVRetID, Case When A.RetMktID = (A.RetID + A.MktID) Then 'FTComp' Else 'FV Pure' End 
from rndcChildWebMain A
Join AdamsFTFVRetTrans B ON A.RetId <> B.FVRetID And A.Advertiser = Replace(B.FTRet, ' - Adams', '')
And IsNull(RU, 0) = 0
Order by 1


---=====MARKET UPDATE=====-----
Update rndcChildWebMain Set Market = Right(Market, 2)  + ', ' + Left(Market, len(Market)-4) where CharIndex(',', Market)> 3 

--select Distinct Right(Market, len(Market)-4) + ', ' + Left(Market, 2) FVMkt, Market FTMkt, Cast(0 as Int) FVMktID, Cast(0 as Int) FTMktID Into AdamsFTFVMktTrans from rndcChildWebMain
-- 
-- Update A Set FVMktID = B.MktID
-- --Select Distinct A.*, B.Market, B.MktID 
-- From AdamsFTFVMktTrans A
-- Join (Select Distinct Market, MktID From masterclientcoverage..RetMkt) B On A.FVMkt = B.Market
-- Order by 1
-- 
-- Update A Set FVMktID = B.MktID
-- --Select Distinct A.*, B.Market, B.MktID 
-- From AdamsFTFVMktTrans A
-- Join (Select Distinct Market, MktID From masterclientcoverage..RetMkt) B On A.FVMkt = Replace(B.Market, ' - Adams', '')
-- And FVMktID = 0
-- Order by 1
-- 

Alter Table rndcChildWebMain Add Mu Int

Update A Set MktID = B.FVMktID, Mu = 1
--Select Distinct A.Market, B.FVMkt, B.FTMkt, B.FVMktID, A.MktID
from rndcChildWebMain A
Join AdamsFTFVMktTrans B On A.Market = B.FTMkt
And IsNull(Mu, 0) = 0
Order by 2

select Distinct Market from rndcChildWebMain where IsNull(MU, 0) = 0
select * from  masterclientcoverage..RetMkt where market like '%Chat%'
select * from  AdamsFTFVMktTrans --where market like '%Chat%'

--Insert Into AdamsFTFVMktTrans values ('Chattanooga, TN', 'TN, Chattanooga', 394, 0)

select * from AdamsFTFVMktTrans order by 1

Alter Table rndcChildWebMain Add RMu Int

Update A Set RMu = 1
--Select Distinct A.Advertiser, A.Market, A.RetMktID, B.RetMktID
from rndcChildWebMain A
Join  masterclientcoverage..RetMkt B 
On A.Retid = B.RetID and A.MktiD = B.MktID And A.RetMktID = B.RetMktID 
Order by 1

Update A Set RetMktID = B.RetMktID, RMu = 1
--Select Distinct A.Advertiser, A.Market, A.RetMktID, B.RetMktID
from rndcChildWebMain A
Join  masterclientcoverage..RetMkt B 
On A.Retid = B.RetID and A.MktiD = B.MktID And A.RetMktID <> B.RetMktID 
And IsNull(Rmu, 0) = 0
Order by 1, 2

-- select Distinct A.Advertiser, A.Market, A.RetMktID from rndcChildWebMain A where IsNull(RMu, 0) = 0 order by 1
-- select * from masterclientcoverage..RetMkt where retmktid in (109, 19853) or Mktid = 438
-- select * from rndcChildWebMain where Advertiser like 'County Market' or retmktid in (3923, 5792)

Update A Set A.RetMktID = B.Mx, Rmu = 2
--select Distinct A.Advertiser, A.Market, A.RetMktID, B.Mn, C.RetMktID, A.RetID, C.RetID, A.MktID, C.MktID
from rndcChildWebMain A
JOIN (select Advertiser, Market, Min(RetMktID) Mn, Max(RetMktID) Mx 
From rndcChildWebMain Group BY Advertiser, Market 
having count(Distinct RetMktID) > 1) B
ON A.Advertiser = B.Advertiser and A.Market = B.Market
Join FTCompDisAdvertiserMarket C
ON A.Advertiser = C.Advertiser And A.Market = Right(C.Market, 2) + ', ' + Left(C.Market, len(C.Market)-4)
And IsNull(Rmu, 0) = 0
Order by 1, 2

-- Select * from masterclientcoverage..RetMkt where retmktid in (138, 5185) or Mktid = 438

Update rndcChildWebMain Set TradeClass = ''

Update A Set TradeClass = C.AVTradeClass
--Select Distinct A.Advertiser, A.Market, A.TradeClass, C.AVTradeClass
From rndcChildWebMain A
-- Join (Select Distinct  TradeClass, RetMktID, RetID, TCID From masterclientcoverage..RetMkt) B 
-- ON A.RetMktID = B.RetMktID 
Join (Select * From masterclientcoverage..vw_TradeClassDesc) C 
On A.RetID = C.RetID --And B.TCID = C.AVTCID
Order by 1

Update rndcChildWebMain Set TradeClass = 'Liquor - Others' where TradeClass = 'Adams'
Update rndcChildWebMain Set Media = 'Insert' Where  Media = 'Adams' 
Update rndcChildWebMain Set Media = 'In-store' Where  Media = 'Adams - Instore' 


select * from sysobjects where name like 'bcr%'


Alter Table rndcChildWebMain Drop Column Ru 
Alter Table rndcChildWebMain Drop Column Mu 
Alter Table rndcChildWebMain Drop Column RMu 

Update rndcChildWebMain Set Advertiser = 'Thrifty Disc Liquor/ Mr. Thrifty', retmktid = 7069 where advertiser = 'Thrifty Disc Liquor/ Mr. Th'

if exists (select * from dbo.sysobjects where id = object_id(N'[rndcDisAdvertiserMarket]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [rndcDisAdvertiserMarket]
GO

SELECT DISTINCT TradeClass, Advertiser, Market, Region, SalesTerritory, District, RetMktID, RetID, MktID
Into rndcDisAdvertiserMarket
From rndcChildWebMain
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[rndcMedia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [rndcMedia]
GO

SELECT DISTINCT Media
 Into rndcMedia
From rndcChildWebMain
GO

