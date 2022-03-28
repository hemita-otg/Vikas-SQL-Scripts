------------step 1 

select count(distinct productimagepath) from PDTProcessed where year(prodimagecreatedon)='2017' and month(prodimagecreatedon)=1 --1032215


select top 100 *  from PDTProcessed where year(prodimagecreatedon)='2017' and month(prodimagecreatedon)=3


select count(1) from mt2asql01.masteradviewdata.dbo.masterpagedetailtable p join  mt2asql01.masteradviewdata.dbo.adviewmain c on p.flyerid=c.flyerid  where year(addate )='2017' and month(addate)=1 --1032215


select distinct  rtrim(ltrim(replace(replace(substring(productimagepath,CHARINDEX('/',productimagepath,22), CHARINDEX('.',productimagepath)) ,'/',''),'.jpg',''))) as PAgeDetailid into tempdb..jan17 from tempdb..jan


select distinct  * from tempdb..jan17

-----step 2 

select count(1) from TEMPJAPageDetailTable_Jan17 

truncate table tempjapagedetailtable 

insert into tempjapagedetailtable
select * from masteradviewdata..masterpagedetailtable where pagedetailid in (select pagedetailid from mt2asql06.tempdb.dbo.jan17) 

delete from tempjapagedetailtable where pagedetailid in (select pagedetailid from mt2asql06.connection.dbo.pdtprocessedtempmt2aDone)

select count(1) from tempjapagedetailtable

update tempjapagedetailtable set prodimagecreated=0 

Exec mtproc_GetPIToProcessRecsMCAP 0, 0, '', '[MT2ASQL06]', 'MT2ASQL01', 1



select count(1) from mt2asql01.masterclientcoverage.dbo.PIProcessingTableTempMCAP

---------------step 3 

select * from subscription..ScheduleSubsProcessTime

--update subscription..ScheduleSubsProcessTime  set processtime='04:00:00.0000000' where processday in (3)


select * from connection..appparameters where appname = 'ProductImagesMT2A'


select count(*) from masterclientcoverage.dbo.tempjapagedetailtable where prodimagecreated=0
select count(*) from masterclientcoverage.dbo.tempjapagedetailtable t join MasterAdviewData.dbo.adviewmain a on t.flyerid=a.flyerid  where prodimagecreated=0
select * from mt2asql06.Connection.dbo.piprocessinghealthcheck

select * from mt2asql06.Connection.dbo.pdtprocessedtempmt2a order by 3 desc 

select * from mt2asql06.Connection.dbo.arraylocation where array like '%2017%'


select * into pdtprocessedtempmt2aDone2 from mt2asql06.Connection.dbo.pdtprocessedtempmt2a where pagedetailid in (select pagedetailid from tempdb..jan17)

select count(1) from mt2asql06.Connection.dbo.pdtprocessedtempmt2adone2 where pagedetailid in (select * from tempdb..jan17)

