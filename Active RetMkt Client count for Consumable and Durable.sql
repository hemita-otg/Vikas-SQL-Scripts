
--Consumable

WITH 
CWM AS (SELECT * FROM MASTERCLIENTCOVERAGE..MasterClientCWM ),
M AS (sELECT * FROM MASTERCLIENTCOVERAGE..RETMKT )
SELECT M.ADVERTISER,M.MARKET, M.RETMKTID,COUNT(DISTINCT CLIENTID ) CLIENTCNT  INTO TEMPDB..REPORT FROM CWM JOIN M ON  
cwm.RetMktID=m.RetMktID  OR CWM.TCID=m.TCID 
OR (CWM.RetID=M.RetID AND M.RetMktID IS NULL AND M.TCID IS NULL AND M.MktID IS NULL) 
OR (CWM.MktID=M.MktID AND M.RetMktID IS NULL AND M.TCID IS NULL AND M.RetID IS NULL)
GROUP BY M.ADVERTISER,M.MARKET,M.RETMKTID 


--Durable 


WITH 
CWM AS (SELECT * FROM MASTERCLIENTCOVERAGE..MasterClientCWMDur ),
M AS (sELECT * FROM MASTERCLIENTCOVERAGE..RETMKT )
SELECT M.ADVERTISER,M.MARKET, M.RETMKTID,COUNT(DISTINCT CLIENTID ) CLIENTCNT  INTO TEMPDB..REPORTDur FROM CWM JOIN M ON  
cwm.RetMktID=m.RetMktID  OR CWM.TCID=m.TCID 
OR (CWM.RetID=M.RetID AND M.RetMktID IS NULL AND M.TCID IS NULL AND M.MktID IS NULL) 
OR (CWM.MktID=M.MktID AND M.RetMktID IS NULL AND M.TCID IS NULL AND M.RetID IS NULL)
GROUP BY M.ADVERTISER,M.MARKET,M.RETMKTID 



SELECT * FROM TEMPDB..REPORT ORDER BY 1,2
SELECT * FROM TEMPDB..REPORTdur ORDER BY 1,2

--ACTIVE RetMkt step 3 


Declare @subjectLine as varchar(100)
set @subjectLine = 'Active RetMkt List ' + cast(getdate() as varchar(20)) 
Declare @result integer
Declare @SQL as varchar(200)
set @SQL=''

set @SQL='select * from tempdb..rr'
Exec master.dbo.sp_ProcExportData 
--@recipients='kturon@markettrack.com;lgrant@markettrack.com; dfarquharson@markettrack.com; jgunter@markettrack.com;aodunbaku@competitrack.com;kbirdsall@markettrack.com;npeters@competitrack.com;nsorensen@markettrack.com;aprovost@markettrack.com;dwojdyla@markettrack.com;nickn@adcomparisons.com; tmoodie@markettrack.com',
--@cc_recipients='AdOpsAll@markettrack.com; rhamada@markettrack.com; epablo@markettrack.com;halapati@markettrack.com;aaolsen@markettrack.com',
@recipients='halapati@markettrack.com;vkantawala@markettrack.com;vipuld@markettrack.com',
--@recipients='vkantawala@markettrack.com',
@subject=@subjectLine,
@query=@SQL
,@exporttype='csv'
,@tabname='Active RetMkt List'
,@servername='mt2sql00'
,@dbname='master'


--Club Consumable client cnt to active retmkt list 
select t.*,isnull(r.clientcnt,0) as ClientCntConsumable into tempdb..R from tempdb..tmpactiveretmkt t left join tempdb..report  r on t.retmktid=r.retmktid  order by 1,2
--Club durable client cnt to active retmkt list 
select t.*,isnull(r.clientcnt,0) as ClientCntDurable into tempdb..RR from tempdb..R t left join tempdb..reportDur  r on t.retmktid=r.retmktid  order by 1,2
--final result 
select * from tempdb..rr