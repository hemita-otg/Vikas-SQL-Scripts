use sql09

drop table tempdb..PERUpdateCWM
Select FlyerID, AdDate, SaleStartDate, SaleEndDate, WeekOf, Weekofn, Weekofi Into Tempdb..PERUpdateCWM From PERChildWebMain 
Where AdDate < SaleStartDate 


Update PERChildWebMain Set AdDate = SaleStartDate Where FlyerID In (select flyerid from  Tempdb..PERUpdateCWM )

Update PERChildWebMain Set WeekOf = dateadd(day,-(datepart(dw,AdDate)-1), AdDate),
WeekOfi = Dateadd(day, 8 - DatePart(weekday,Addate), Addate), 
WeekOfn =  Dateadd(day, -1, Dateadd(day, 8 - DatePart(weekday,Addate), Addate)) 
Where FlyerID In (select flyerid from  Tempdb..PERUpdateCWM )
OPTION (MAXDOP 1)




