Declare @sd as datetime
Declare @ed as datetime

set @sd='06/23/2009'
set @ed='12/31/2015'

WHILE  (@sd <> @ed)
	BEGIN
	insert into UserActivityDates(ActivityDate,AdYear,WeekOf,WeekRange,mmyy,AdMonth,QuaterRange,QuaterRangeID,StartDisplayColumn,EndDisplayColumn)
	select 
	@sd as Activitydate,
	year(@sd) as adyear,
	dateadd(day,-(datepart(dw,@sd)-1) , @sd) as Weekof,
	convert(varchar,dateadd(day,-(datepart(dw,@sd)-1), @sd),1) + '-' + convert(varchar,dateadd(day,-(datepart(dw,@sd)-1) + 6, @sd),1)   as WeekRange,
	left(cast(@sd as varchar), 3) + ' ' + cast(year(@sd) as varchar) as mmyy,
	month(@sd)as AdMonth,
	case when month(@sd) =1 or month(@sd)=2 or month(@sd)=3 
		then  cast('Q1' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =4 or month(@sd)=5 or month(@sd)=6 
		then  cast('Q2' as varchar)  +' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =7 or month(@sd)=8 or month(@sd)=9 
		then  cast('Q3' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =10 or month(@sd)=11 or month(@sd)=12 
		then  cast('Q4' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     end as QuaterRange,
	case when month(@sd) =1 or month(@sd)=2 or month(@sd)=3 
		then  cast('1' as varchar) 
	     when month(@sd) =4 or month(@sd)=5 or month(@sd)=6 
		then  cast('2' as varchar) 
	     when month(@sd) =7 or month(@sd)=8 or month(@sd)=9 
		then  cast('3' as varchar) 
	     when month(@sd) =10 or month(@sd)=11 or month(@sd)=12 
		then  cast('4' as varchar) 
	     end as QuaterRangeID,
	case when month(@sd) =1 or month(@sd)=2 or month(@sd)=3 
		then  cast('Q1' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =4 or month(@sd)=5 or month(@sd)=6 
		then  cast('Q2' as varchar)  +' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =7 or month(@sd)=8 or month(@sd)=9 
		then  cast('Q3' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     when month(@sd) =10 or month(@sd)=11 or month(@sd)=12 
		then  cast('Q4' as varchar) + ' ' + cast(year(@sd) as varchar) 
	     end as StartDisplayColumn,
	case when month(@sd) =1 then cast('Jan ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =2 then cast('Jan - Feb ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =3 then cast('Jan - Mar ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =4 then cast('Apr ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =5 then cast('Apr - May ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =6 then cast('Apr - Jun ' as varchar) + cast(year(@sd) as varchar) 
		
		 when month(@sd) =7 then cast('Jul ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =8 then cast('Jul - Aug ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =9 then cast('Jul - Sep ' as varchar) + cast(year(@sd) as varchar) 
		
		 when month(@sd) =10 then cast('Oct ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =11 then cast('Oct - Nov ' as varchar) + cast(year(@sd) as varchar) 
		 when month(@sd) =12 then cast('Oct - Dec ' as varchar) + cast(year(@sd) as varchar) 
		end as EndDisplayColumn
		


	set @sd=@sd +1 
END

/*
select * from UserActivityDates order by 1 desc
delete from UserActivityDates
*/