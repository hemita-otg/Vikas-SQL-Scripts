

--select * from dgaTopRets

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'dgaTopRets' AND xtype = 'u') 
drop table dgaTopRets

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Flyer' AND xtype = 'u') 
drop table Flyer

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Detail' AND xtype = 'u') 
drop table Detail
--Flyer Counts
select Advertiser, cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2) as WeekNumber,cast('Flyer' as varchar(15)) as TableName,
       Count(Distinct Market) Cnt
Into dgaTopRets
from dga50FlyerReports
where (ADvertiser in (select Advertiser from RetList where categoryCode='dga50')OR Advertiser in (Select Advertiser From dga50FlyerReports group by Advertiser having count(distinct Market)>2))
--and AdDate >= dateadd(month, -2, getdate())
and WeekOf>=DATEADD(wk,-8,DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6))
and media in (
'Insert-Digital',
'Insert-Paper')
group by  Advertiser,cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2)
order by  Advertiser, cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2) desc

--Detail Counts
Insert Into dgaTopRets
select Advertiser, cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2) as WeekNumber,cast('Detail' as varchar(15)) as TableName,
       Count(Distinct Market) Cnt
from dga50DetailReports
where (ADvertiser in (select Advertiser from RetList where categoryCode='dga50') OR Advertiser in (Select Advertiser From dga50FlyerReports group by Advertiser having count(distinct Market)>2))
--and AdDate >= dateadd(month, -2, getdate())
and WeekOf>=DATEADD(wk,-8,DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6))
and media in (
'Insert-Digital',
'Insert-Paper')
group by  Advertiser,cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2)
order by  Advertiser, cast(datepart(yyyy, Addate) as varchar) +'-'+ right('0' + cast(datepart(wk, AdDate) as varchar), 2) desc

	Declare @ColumnList varchar(max)
			,@ColumnISNULL varchar(max)

       Select @ColumnList = COALESCE(@ColumnList ,'') + LTRIM(RTRIM(WeekNumber)) +'],['  
       From   (select distinct WeekNumber From dgaTopRets) A order by WeekNumber desc
       Set  @ColumnList='['+left(@ColumnList,len(@ColumnList)-2)

	   Select @ColumnISNULL = COALESCE(@ColumnISNULL ,'') + ''+LTRIM(RTRIM(WeekNumber)) +'],0) as ['+ LTRIM(RTRIM(WeekNumber)) +'],ISNULL(['  
       From   (select distinct WeekNumber From dgaTopRets) A order by WeekNumber desc
       Set  @ColumnISNULL='ISNULL(['+left(@ColumnISNULL,len(@ColumnISNULL)-9)

--Counts From FlyerReports
Exec(';With Coverage
As
(
select distinct B.Advertiser,count(distinct market) as MktCoverageCount 
From MasterClientCoverage.dbo.MasterClientCWM A 
JOIN MasterClientCoverage.dbo.RetMkt B ON A.RetMktID=B.RetMktID
Where categorycodeId=1944
AND (B.Advertiser in (select Advertiser from RetList where categoryCode=''dga50'')  OR Advertiser in (Select B.Advertiser From dga50FlyerReports A JOIN MasterClientCoverage.dbo.RetMkt B ON A.RetMktId=B.RetMktId group by A.Advertiser,B.Advertiser having count(distinct A.Market)>2))
group by B.Advertiser
)
, Actual
As
(
SELECT Advertiser, '+ @ColumnList +'
FROM (
select Advertiser,WeekNumber,Cnt 
From dgaTopRets Where TableName=''Flyer''
) up
PIVOT(Sum(cnt) FOR WeekNumber IN ( '+ @ColumnList +')) AS pvt
)
Select Coverage.*,'+ @ColumnISNULL +'--,ISNULL(dga_Comments,'''') as Comments
Into Flyer
From Coverage 
LEFT JOIN Actual ON Coverage.Advertiser=Actual.Advertiser
--LEFT JOIN RetComments ON RetComments.Advertiser=Coverage.Advertiser
Order by Coverage.Advertiser')


--Counts From DetailReports
Exec(';With Coverage
As
(
select distinct B.Advertiser,count(distinct market) as MktCoverageCount 
From MasterClientCoverage.dbo.MasterClientCWM A 
JOIN MasterClientCoverage.dbo.RetMkt B ON A.RetMktID=B.RetMktID
Where categorycodeId=1944
AND (B.Advertiser in (select Advertiser from RetList where categoryCode=''dga50'')  OR Advertiser in (Select B.Advertiser From dga50FlyerReports A JOIN MasterClientCoverage.dbo.RetMkt B ON A.RetMktId=B.RetMktId group by A.Advertiser,B.Advertiser having count(distinct A.Market)>2))
group by B.Advertiser
)
, Actual
As
(
SELECT Advertiser, '+ @ColumnList +'
FROM (
select Advertiser,WeekNumber,Cnt 
From dgaTopRets Where TableName=''Detail''
) up
PIVOT(Sum(cnt) FOR WeekNumber IN ( '+ @ColumnList +')) AS pvt
)
Select Coverage.*,'+ @ColumnISNULL +'--,ISNULL(dga_Comments,'''') as Comments
Into Detail
From Coverage 
LEFT JOIN Actual ON Coverage.Advertiser=Actual.Advertiser
--LEFT JOIN RetComments ON RetComments.Advertiser=Coverage.Advertiser
Order by Coverage.Advertiser')
GO



Exec mt2sql00.master.dbo.sp_procExportData
@recipients='vkantawala@markettrack.com;halapati@markettrack.com;ramt@markettrack.com'
--@recipients='jhetler@markettrack.com;halapati@markettrack.com;ashishp@markettrack.com;ramt@markettrack.com;vipuld@markettrack.com;cpatel@markettrack.com;mkumar@markettrack.com;psolanki@markettrack.com;vshukla@markettrack.com'
,@subject='Diageo Top Retailers Summary'
,@query='select * from Detail;select * from flyer'
,@exporttype='table'
,@tabname= 'Count of distinct market for top advertisers in Diageo(Detail level);Count of distinct market for top advertisers in Diageo(Ad level);'
,@servername='MT2BU1'
,@dbname='sql07'



--select 'Dga50' categorycode,advertiser into RetList from dga50DisAdvertiserMarket 

