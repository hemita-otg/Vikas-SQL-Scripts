select distinct acrepflag from acfvflyerreports where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH'
select distinct acrepflag from acfvpagereports where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH'

select distinct acrepflag,advertiser,count(pagedetailid) from acfvdetailreports with ( nolock) where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH'
group by acrepflag,advertiser



--representative(based on ad_defaultmkt)

--SP on SQL13 MasterACFV..[AC_FV_Create_FlyerReports]

select count(1) from acfvflyerreports where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH' --305
select count(1) from acfvpagereports where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH' --9038

select Flyerid,PageDetailID into Tempdb..VN from acfvdetailreports with ( nolock) where advertiser in ('P&G Brand Saver','Smartsource','RedPlum','RetailMeNot') and market='Cleveland, OH' --46183




Flyerid,PageDetailID,acrepflag




select * from Tempdb..VN


Table : Tempdb..VN on MT2SQL13

Master:
MT2SQL03.SQL03
Mt2SQL06.MasterACFV
MT2SQL13.MasterACFV
MT2SQL16.SQL16
Mt2SQL17.SQL17

Client:
MT2SQL06..SQL06
MT2SQL13..SQL13


Scirpt for ref :

\\mediatrack.net\fvdata\SQL\Scripts\Pratik\PEP Master Client Update Cursor.sql