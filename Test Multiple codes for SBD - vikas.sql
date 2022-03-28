


delete 
select * from masterclientcoverage.dbo.masterclientcwm  where CategoryCodeID in (
select CategoryCodeID from masterclientcoverage.dbo.masterclientcwmdur )


insert into masterclientcoverage.dbo.masterclientcwm
select * from masterclientcoverage.dbo.masterclientcwmdur

------------------------------------
--select * into tbl_lookup_SBD from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup]


select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] where categorytype='detailselect' and categoryvalue like '%MadCode%'
select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] where categorytype='detailselect' and categoryvalue like '%trackno%'

select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] where categorytype='DetailInsert' and categoryvalue like '%MadCode%'
select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] where categorytype='DetailInsert' and categoryvalue like '%trackno%'

insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] values('DetailSelect','PDT.TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] values('DetailSelect','PDT.MadCode',getdate())


insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] values('DetailInsert','TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup_sbd] values('DetailInsert','MadCode',getdate())
----------------------------------


SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM PEL50DETAILREPORTS ORDER BY 1,2,3
SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM dbagDETAILREPORTS where trackno is not null ORDER BY 1,2,3
SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM PEL50DETAILREPORTS ORDER BY 1,2,3

---------------------------


SELECT * FROM MASTERCLIENTCOVERAGE..MASTERCLIENTCWM WHERE CATEGORYCODEID=2328
INSERT INTO MASTERCLIENTCOVERAGE..MASTERCLIENTCWM 
SELECT * FROM MASTERCLIENTCOVERAGE..MASTERCLIENTCWMDUR WHERE CATEGORYCODEID=2328

select * from categorycodetable where category in 
('hhgs')

select distinct sourcecwm from categorycodetable where category in 
('mtl50','NIN50','flws50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

update categorycodetable set isfull=1,ispdt=1,clientpdt=1,cwmfull=1,fullsourcecode='MasterDurData..masterDur'
--select * from categorycodetable
 where category in 
(select catcode  from sql12..catcodelist) and mt2aclientserver=@@servername 



update master..LocalCategoryCode set  run =1 
--select * from master..LocalCategoryCode
 where category in 
(select catcode  from sql12..catcodelist) and mt2aclientserver=@@servername 


update categorycodetable set isfull=1,ispdt=1,clientpdt=1,cwmfull=1,fullsourcecode='MasterDurData..masterDur' select * from sql12..Categorycodetable where category in 
('mtl50','NIN50','flws50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

masterclientcoverage..CanadaFlyerReports
masterclientcoverage..USAllFlyerReports
masterclientcoverage..USCAFlyerReports
masterclientcoverage..USOtherFlyerReports
masterclientcoverage..USCANoRepFlyerReports

select count(1) from masterclientcoverage..USAllFlyerReports
select * from mt2asql06.sitecontrol.dbo.categorycode 

Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USOther',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'Canada',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USAll',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USCA',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USCANoRep',0
select clientserver,mt2aclientserver,* from Master..LocalCategoryCode where run=1 order by ProcessOrder 

EXEC CreateFlyerReports 'gild50','',0
EXEC CreateFlyerReports 'MWVS50','',0
EXEC CreateFlyerReports 'flws50','',0
EXEC CreateFlyerReports 'bic50','',0
EXEC CreateFlyerReports 'pel50','',0

EXEC CreateDetailReports 'giladl50','',0
EXEC CreateDetailReports 'NIN50','',0
EXEC CreateDetailReports 'flws50','',0
EXEC CreateDetailReports 'dbag','',0
EXEC CreateDetailReports 'pel50','',0

SELECT COUNT(1) FROM masterclientcoverage..USAllFlyerReports


SELECT COUNT(1) FROM dbagFLYERREPORTS -- 84824 -- 71167
SELECT COUNT(1) FROM dbagDETAILREPORTS --218343 --324920

SELECT COUNT(1) FROM MT2SQL01.SQL01.DBO.PEL50FLYERREPORTS -- 5099 -- 4743
SELECT COUNT(1) FROM MT2SQL01.SQL01.DBO.PEL50DETAILREPORTS --14328 --15295

SELECT COUNT(1) FROM MT2SQL05.SQL05.DBO.DBAGFLYERREPORTS -- 26002 --24008
SELECT COUNT(1) FROM MT2SQL05.SQL05.DBO.DBAGDETAILREPORTS --59245 --66589


/*

ALTER TABLE MasterDurData..masterDurDetailReports  ADD PROMOTIONS VARCHAR(100)
ALTER TABLE MasterDurData..masterDurDetailReports  ADD Coupon VARCHAR(100)
ALTER TABLE MasterDurData..masterDurDetailReports  ADD MPVUnitType VARCHAR(100)
ALTER TABLE MasterDurData..masterDurDetailReports  ADD MPVUnitTypeID VARCHAR(100)
ALTER TABLE MasterDurData..masterDurDetailReports  ADD MainOffer VARCHAR(100)
ALTER TABLE MasterDurData..masterDurDetailReports  ADD MainOfferId VARCHAR(100)

alter table MasterDurdetailReports add  TrackNo int

alter table Pel50FlyerReports add  TrackNo int
alter table Pel50Pagereports add  TrackNo int
alter table Pel50Detailreports add  TrackNo int
update m set trackno= T.trackno from Pel50FlyerReports m join mt2asql01.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll t on m.originalflyerid =t.durflyerid 
update m set trackno= T.trackno from Pel50Pagereports m join mt2asql01.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll t on m.originalflyerid =t.durflyerid 
update m set trackno= T.trackno from Pel50Detailreports m join mt2asql01.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll t on m.originalflyerid =t.durflyerid 
*/


select  top 10 trackno,madcode,page from masterdurdata..MasterDurDetailReports 

select  top 10 trackno,madcode,page from sql12..pel50detailreports 

WITH
L AS (SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM MT2SQL05.SQL05.DBO.DBAGDETAILREPORTS WHERE MEDIA NOT IN ('ROP') ),
M AS (SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM DBAGDETAILREPORTS WHERE MEDIA NOT IN ('ROP') )
SELECT * FROM L LEFT JOIN M ON L.TRACKNO = M.TRACKNO AND L.MADCODE = M.MADCODE AND L.PAGE = M.PAGE
WHERE M.TRACKNO IS NULL AND M.MADCODE IS NULL AND M.PAGE IS NULL 
			
select  *  from masterdurdata..MasterDurDetailReports WHERE TRACKNO=106567682 AND MADCODE=4049845	AND PAGE = 70
		
SELECT ADVERTISER,MARKET,ADDATE,MEDIA,Pages  FROM MT2SQL05.SQL05.DBO.DBAGDETAILREPORTS WHERE TRACKNO=106567682 AND MADCODE=4049845	AND PAGE = 70

SELECT *  FROM MT2SQL05.SQL05.DBO.DBAGDETAILREPORTS  WHERE TRACKNO=106567682 AND MADCODE=4049845	AND PAGE = 70
SELECT *  FROM DBAGDETAILREPORTS  WHERE TRACKNO=106567682 AND MADCODE=4049845	AND PAGE = 70

SELECT TRACKNO,* FROM dbagDetailReports WHERE ADVERTISER='Macys' AND MARKET='Dallas, TX' AND PAGES=70 AND MEDIA='Insert-Paper'   order by addate AND ADDATE='2013-11-06 00:00:00.000' order by addate

select * from tempdb..maepdtid WHERE TRACKNO=106567682 AND MADCODE=4049845	AND PAGE = 70

SELECT * FROM DBAGFlyerReports WHERE ADVERTISER='Macys' AND MARKET='Dallas, TX' AND MEDIA='Insert-Paper'   order by addate
SELECT * FROM masterclientcoverage..USCANoRepFlyerReports WHERE ADVERTISER='Macys' AND MARKET='Dallas, TX' AND PAGES=70  order by addate


SELECT addate,* FROM masterdurdata..masterdurFlyerReports WHERE ADVERTISER='Macys' AND MARKET='Dallas, TX' AND MEDIA='Insert-Paper'  order by 1 desc 


 select * from WHERE ADVERTISER='Macys' AND MARKET='Dallas, TX' AND PAGES=70

 


 

select * from dbo.mwv50flyerreports where advertiser='Target' and market='Representative' and media='insert-Paper'