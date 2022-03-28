select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql02' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql03' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql04' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql06' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql07' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql08' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql11' 
and year(cwmstart)='2014' and month(cwmstart)='10' 
union 
select top 10 sqlserver,processingend,backuplocation,backupstart,backupend 
, DATEDIFF(MINUTE,backupstart,backupend) as BackuptimeMin  from [MT2SQL14].[connection].dbo.nightlyprocessing where sqlserver not like 'MT2a%' and sqlserver='sql15' 
and year(cwmstart)='2014' and month(cwmstart)='10' 