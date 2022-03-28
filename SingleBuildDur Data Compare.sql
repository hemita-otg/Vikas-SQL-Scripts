

--Manually create TEST TABLE on MT2aSQL12.Tempdb

	SELECT CATEGORY, BRAND, MANUFACTURER, COUNT(PAGEDETAILID) AS CNT
	INTO TEMPDB..vtc50DETAILREPORTS_TEST
	FROM MT2aSQL12.SQL12.DBO.vtc50detailreports
	group by  CATEGORY, BRAND, MANUFACTURER

	SELECT ADVERTISER, MARKET, ADDATE, PAGES, count(FLYERID) as CNT
	INTO TEMPDB..vtc50FLYERREPORTS_TEST
	FROM MT2aSQL12.SQL12.DBO.vtc50flyerreports
	group by  advertiser, market, addate, pages

--Move test table from mt2asql12 to mt2asql01
	select * into tempdb..vtc50FLYERREPORTS_TEST from mt2asql12.TEMPDB.dbo.vtc50FLYERREPORTS_TEST
	select * into tempdb..vtc50DetailREPORTS_TEST from mt2asql12.TEMPDB.dbo.vtc50DetailREPORTS_TEST

	('kgmADL','vtc50','gosADL','dbag','pel50')


exec [dbo].[Data_Load] 'cwm', 'pel50'
EXEC [Compare_Data] 'cwm','pel50'

exec [dbo].[Data_Load] 'pdt', 'pel50'
EXEC [Compare_Data] 'pdt','pel50'

SELECT * FROM TEMPDB.DBO.gosADLFLYERREPORTS_REPORT  ORDER BY 1,2,3,4
SELECT * FROM TEMPDB.DBO.gosADLDETAILREPORTS_REPORT ORDER BY 1,2,3 

--DATA QC 
/*


SELECT count(1) FROM TEMPDB.DBO.vtc50FLYERREPORTS_Live
SELECT count(1) FROM TEMPDB.DBO.vtc50FLYERREPORTS_test
SELECT count(1) FROM TEMPDB.DBO.vtc50FLYERREPORTS_REPORT



SELECT * FROM TEMPDB.DBO.vtc50FLYERREPORTS_Live     where advertiser='best buy' and market='atlanta, ga' and addate='2014-11-02' and pages=39
SELECT * FROM TEMPDB.DBO.vtc50FLYERREPORTS_test		where advertiser='best buy' and market='atlanta, ga' and addate='2014-11-02' and pages=39
SELECT * FROM TEMPDB.DBO.vtc50FLYERREPORTS_REPORT	where advertiser='best buy' and market='atlanta, ga' and addate='2014-11-02' and pages=39
	   

SELECT count(1) FROM TEMPDB.DBO.vtc50DETAILREPORTS_Live
SELECT count(1) FROM TEMPDB.DBO.vtc50DETAILREPORTS_test
SELECT count(1) FROM TEMPDB.DBO.vtc50DETAILREPORTS_REPORT

SELECT * FROM TEMPDB.DBO.vtc50DETAILREPORTS_Live   where category='NETWORKING' and brand='Vonage' and manufacturer='Vonage'
SELECT * FROM TEMPDB.DBO.vtc50DETAILREPORTS_test   where category='NETWORKING' and brand='Vonage' and manufacturer='Vonage'
SELECT * FROM TEMPDB.DBO.vtc50DETAILREPORTS_REPORT where category='NETWORKING' and brand='Vonage' and manufacturer='Vonage'

*/