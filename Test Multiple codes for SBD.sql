select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] where categorytype='detailselect' and categoryvalue like '%page%'

insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailSelect','PDT.TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailSelect','PDT.MadCode',getdate())


insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailInsert','TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailInsert','MadCode',getdate())




SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM PEL50DETAILREPORTS ORDER BY 1,2,3
SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM dbagDETAILREPORTS where trackno is not null ORDER BY 1,2,3
SELECT DISTINCT TRACKNO,MADCODE,PAGE FROM PEL50DETAILREPORTS ORDER BY 1,2,3

---------------------------


SELECT * FROM MASTERCLIENTCOVERAGE..MASTERCLIENTCWM WHERE CATEGORYCODEID=2328
INSERT INTO MASTERCLIENTCOVERAGE..MASTERCLIENTCWM 
SELECT * FROM MASTERCLIENTCOVERAGE..MASTERCLIENTCWMDUR WHERE CATEGORYCODEID=2328

select * from categorycodetable where category in 
('pel50')

select distinct sourcecwm from categorycodetable where category in 
('mtl50','NIN50','flws50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

update categorycodetable set isfull=1,ispdt=1,clientpdt=1,cwmfull=1,fullsourcecode='MasterDurData..masterDur' where category in 
('mtl50','NIN50','flws50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')


masterclientcoverage..CanadaFlyerReports
masterclientcoverage..USAllFlyerReports
masterclientcoverage..USCAFlyerReports
masterclientcoverage..USOtherFlyerReports
masterclientcoverage..USCANoRepFlyerReports

/*Step 1*/
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USOther',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'Canada',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USAll',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USCA',0
Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USCANoRep',0

/*Step 2*/
select * from categorycodetable
--update categorycodetable set cwmfull = 1
 where mt2aclientserver=@@servername and sourcecwm in ('masterclientcoverage..USOtherFlyerReports', 'masterclientcoverage..CanadaFlyerReports', 'masterclientcoverage..USAllFlyerReports', 'masterclientcoverage..USCANoRepFlyerReports')


EXEC CreateFlyerReports 'mtl50','',0
EXEC CreateFlyerReports 'NIN50','',0
EXEC CreateFlyerReports 'flws50','',0
EXEC CreateFlyerReports 'dbag','',0
EXEC CreateFlyerReports 'pel50','',0

EXEC CreateDetailReports 'mtl50','',0
EXEC CreateDetailReports 'NIN50','',0
EXEC CreateDetailReports 'flws50','',0
EXEC CreateDetailReports 'dbag','',0
EXEC CreateDetailReports 'pel50','',0

SELECT COUNT(1) FROM masterclientcoverage..USAllFlyerReports


SELECT COUNT(1) FROM MTL50FLYERREPORTS -- 84824 -- 71167
SELECT COUNT(1) FROM MTL50DETAILREPORTS --218343 --324920

SELECT COUNT(1) FROM MT2SQL01.SQL01.DBO.PEL50FLYERREPORTS -- 5099 -- 4743
SELECT COUNT(1) FROM MT2SQL01.SQL01.DBO.PEL50DETAILREPORTS --14328 --15295

SELECT COUNT(1) FROM MT2SQL05.SQL05.DBO.DBAGFLYERREPORTS -- 26002 --23973
SELECT COUNT(1) FROM MT2SQL05.SQL05.DBO.DBAGDETAILREPORTS --59245 --66432


/*
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


--PDT part

select *  from [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] where categorytype='detailselect' and categoryvalue like '%page%'

insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailSelect','PDT.TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailSelect','PDT.MadCode',getdate())


insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailInsert','TrackNo',getdate())
insert into [MT2ASQL06].[SiteControl].[dbo].[tbl_lookup] values('DetailInsert','MadCode',getdate())



select * from categorycodetable where fullsourcecode like '%masterdur%'
update Master..LocalCategoryCode set clientpdt = 1,isfull=1,fullsourcecode='MasterDurData..MasterDur' 
 where mt2aclientserver=@@servername and sourcecwm in ('masterclientcoverage..USOtherFlyerReports', 'masterclientcoverage..CanadaFlyerReports', 'masterclientcoverage..USAllFlyerReports', 'masterclientcoverage..USCANoRepFlyerReports')

 select categorycodeid,count(1) from mt2asql06.sitecontrol.dbo.vw_merchandisecategory where categorycodeid in 
  (select id from categorycodetable where mt2aclientserver=@@servername and sourcecwm in ('masterclientcoverage..USOtherFlyerReports', 'masterclientcoverage..CanadaFlyerReports', 'masterclientcoverage..USAllFlyerReports', 'masterclientcoverage..USCANoRepFlyerReports'))
  group by categorycodeid 


update categorycodetable set clientpdt = 0,isfull=0,fullsourcecode=null where id in (2601,2240)

Exec CreateDetailReports @CatCode,'',0


select category from categorycodetable where id in (1950,1951,1983,1984,2005,2053,2068,2069,2070,2116,2135,2186,2214,2219,2224,2225,2241,2278,2292,2306,2321,2328,2345,2346,2353,2399,2424,2429,2432,2433,2440,2441,2456,2501,2502,2503,2509,2579,2693,2813,2921,3103,3353,3354,3390,3403,3404,3407,3408,3414,3417,4492,4493,4495,4506,4518,4519,4551,4553,4555,4556,4557,4566,4568,4569,4573)


update mt2asql06.sitecontrol.dbo.categorycode set clientpdt = 1,isfull=1,fullsourcecode='MasterDurData..MasterDur' 
 where mt2aclientserver=@@servername and sourcecwm in ('masterclientcoverage..USOtherFlyerReports', 'masterclientcoverage..CanadaFlyerReports', 'masterclientcoverage..USAllFlyerReports', 'masterclientcoverage..USCANoRepFlyerReports')
