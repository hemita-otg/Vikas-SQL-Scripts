--on MT2SQL00a Server
use ClientHist
select * from sysobjects where xtype='u' and name like 'PGJP%'


truncate table PGJPDetailReports
truncate table PGJPFlyerReports
truncate table PGJPMedia
truncate table PGJPMPVOrigin
truncate table PGJPMPVPageEvent
truncate table PGJPMPVPageTheme
truncate table PGJPMPVVariety
truncate table PGJPPageReports



insert into PGJPFlyerReports
select * from PGhist50FlyerReports where AdDate between '1/1/2009' and '3/31/2009'


insert into PGJPDetailReports
select * from PGhist50DetailReports  where AdDate between '1/1/2009' and '3/31/2009'


insert into PGJPPAgeReports
select * from PGhist50PageReports  where AdDate between '1/1/2009' and '3/31/2009'

insert into PGJPMedia
select * from PGhist50Media 


insert into PGJPMPVOrigin
select * from PGhist50MPVOrigin where PageDetailId in (
select PageDetailId from PGJPDetailReports )


insert into PGJPMPVPageEvent
select * from PGhist50MPVPageevent where PageDetailId in (
select PageDetailId from PGJPDetailReports )


insert into PGJPMPVPageTheme
select * from PGhist50MPVPageTheme where PageDetailId in (
select PageDetailId from PGJPDetailReports )

insert into PGJPMPVVariety
select * from PGhist50MPVVariety where PageDetailId in (
select PageDetailId from PGJPDetailReports )


---Export tables from MT2SQL00a to MT2SQL15
--Rename below tables 
/*

exec sp_rename 'PGJPDetailReports', 'PG09DetailReports'
exec sp_rename 'PGJPFlyerReports','PG09FlyerReports'
exec sp_rename 'PGJPMPVOrigin','PG09MPVOrigin'
exec sp_rename 'PGJPMPVPageEvent','PG09MPVPageEvent'
exec sp_rename 'PGJPMPVPageTheme','PG09MPVPageTheme'
exec sp_rename 'PGJPMPVVariety','PG09MPVVariety'
exec sp_rename 'PGJPPageReports','PG09PageReports'

 
*/


--Create View
--Create PGJPDisDateRanges table


CREATE  VIEW [dbo].[PGJPFlyerReports]
AS
	SELECT * FROM PgCorp50FlyerReports
	UNION
	SELECT * FROM PG09FlyerReports

GO


CREATE  VIEW [dbo].[PGJPDetailReports]
AS
	SELECT * FROM PGCORP50DetailReports
	UNION
	SELECT * FROM PG09DetailReports

GO

CREATE  VIEW [dbo].[PGJPPageReports]
AS
	SELECT * FROM PGCORP50PageReports
	UNION
	SELECT * FROM PG09PageReports

GO

CREATE   VIEW [dbo].[PGJPMPVOrigin]
AS
	select * from PGCORP50MPVOrigin 	
	UNION
	select * from PG09MPVOrigin

Go


CREATE   VIEW [dbo].[PGJPMPVPageEvent]
AS
	select * from PGCORP50MPVPageEvent
	UNION
	select * from PG09MPVPageEvent

Go


CREATE   VIEW [dbo].[PGJPMPVPageTheme]
AS
	select * from PGCORP50MPVPageTheme
	UNION
	select * from PG09MPVPageTheme

Go


CREATE   VIEW [dbo].[PGJPMPVVariety]
AS
	select * from PGCORP50MPVVariety
	UNION
	select * from PG09MPVVariety

Go

CREATE   VIEW [dbo].[PGJPDisDateRanges]
AS
	SELECT distinct [AdDate], [WeekOf], 
dateadd(dd, (-1 * datepart(dd, AdDate)) + 1, AdDate) as [AdMonthId]
, DateName(mm, AdDate) + ' - ' + DateName(yyyy,AdDate) As [AdMonth]
, [WeekOfi], [WeekOfn] 
FROM [dbo].PGJPFlyerreports

Go
