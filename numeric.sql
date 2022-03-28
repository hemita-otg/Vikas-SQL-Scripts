use Subscription50 

select * from MasterSpecialSummaryFormats where IsNumeric  = 1
order by 4-- NumericDisplayName 

select * from SummaryTableFormatsGroup

Insert Into MasterSpecialSummaryFormats (ReportFormatName, [IsNumeric], NumericDisplayName, NumericSeq, NumericDefaultDisplay, IsAdCalendar, AdCalendarDefaultDisplay, CustomDefaultDisplay)
values ('productterritory/Comments3', Cast(1 as bit), '[productterritory]/[Comments3]', 91, 0, 0, 0,0)


select * from CategorySpecialSummaryFormats where CategoryCodeId = 2180 and IsNumeric = 1