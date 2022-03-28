select distinct addate from svlchildwebmain where weekof='03/06/2011'

Update svlChildWEbMain Set WeekOf = dateadd(day,-(datepart(dw,AdDate)-1), AdDate),
WeekOfi = Dateadd(day, 8 - DatePart(weekday,Addate), Addate), 
WeekOfn =  Dateadd(day, -1, Dateadd(day, 8 - DatePart(weekday,Addate), Addate)) ,
AdDay = DatePart(dw, AdDate), AdMonth = dateadd(dd,-(day(AdDate)-1),AdDate)				
GO

drop table svldisdateranges
GO

SELECT DISTINCT AdDate, Weekof, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip, weekofi, weekofn  into svldisdateranges FROM svlChildWebMain OPTION (MAXDOP 1)
GO