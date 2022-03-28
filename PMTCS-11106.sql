Select Distinct DisplayName, FieldName, FieldId, Count(Distinct A.CategoryCodeID) 
from SiteControl..vw_QvfcFields  A
Join SiteControl..vw_catinfo C
On A.CategoryCodeId = C.CategoryCodeId 
Where DisplayName in ('Ad Date','Ad Grade','Ad Price','Ad Type','AdBlockID','AdId','Attributes','Bonus Card','Brand','Brand Equity Ad','Brand Family','Category','Category Group','Channel','Circular Type','Coupon','Coupon Book Same Week','COVID-19','Department','Digital Offer Same Week','Effective Ad Block Count','Event','FSI Same Week','Incentives','Limited Time','Liner','Manufacturer','Market','Meal Deal','Media Type','Month','Multi MFG','Multi Prd','Net Price After Incentive','Net Unit Price','New Item','Nielsen Week Ending','Offer','Offer Summary','Offer Type','Page # In Ad','Page Position','PageID','Parent Retailer','Prod. & Page Images','Product Description','Product Size','PromotedProductID','Rebate','Regular Price','Regular Price - High','Retailer','Retailer Coupon Value','Sale End Date','Sale Start Date','Savings Amount','Segment','Show the Math','Unit Price','Unit Price - Reg','# of Pgs')
and Status=1 
Group By DisplayName, FieldName, FieldId
Order by 1 


Select ClientID,CategoryCodeID,SessionIDName,[Year],[Month],Sum([#ofQueries])[#ofQueries]
into tempdb..MadLibQueryLog
from (
Select ClientID,CategoryCodeID,SessionIDName,Year(starttime) [Year],Month(starttime) [Month],Count(Distinct A.QuerylogID) [#ofQueries]
from SiteLog..queryexecutionlog A
Join SiteLog..queryexecutionlogdetail B
On A.querylogid = B.querylogid    
Where SessionIDName in ('display1','display10','display11','display110','display119','display12','display126','display128','display129','display13','display130','display139','display14','display142','display15','display161','display170','display177','display178','display20','display21','display218','display219','display220','display24','display268','display271','display289','display290','display291','display292','display293','display294','display295','display296','display297','display32','display34','display35','display36','display4','display40','display42','display46','display5','display55','display56','display6','display73','display76','display77','display79','display81','display82','display88','display89','display93','display94','display95','display96','display97','display98')
Group By ClientID,CategoryCodeID,SessionIDName,Year(starttime),Month(starttime)
Union
Select ClientID,CategoryCodeID,SessionIDName,Year(starttime) [Year],Month(starttime) [Month],Count(Distinct A.QuerylogID) [#ofQueries]
from ArchiveSiteLog2020..queryexecutionlog A
Join ArchiveSiteLog2020..queryexecutionlogdetail B
On A.querylogid = B.querylogid    
Where SessionIDName in ('display1','display10','display11','display110','display119','display12','display126','display128','display129','display13','display130','display139','display14','display142','display15','display161','display170','display177','display178','display20','display21','display218','display219','display220','display24','display268','display271','display289','display290','display291','display292','display293','display294','display295','display296','display297','display32','display34','display35','display36','display4','display40','display42','display46','display5','display55','display56','display6','display73','display76','display77','display79','display81','display82','display88','display89','display93','display94','display95','display96','display97','display98')
Group By ClientID,CategoryCodeID,SessionIDName,Year(starttime),Month(starttime)
Union
Select ClientID,CategoryCodeID,SessionIDName,Year(starttime) [Year],Month(starttime) [Month],Count(Distinct A.QuerylogID) [#ofQueries]
from ArchiveSiteLog2019..queryexecutionlog A
Join ArchiveSiteLog2019..queryexecutionlogdetail B
On A.querylogid = B.querylogid    
Where SessionIDName in ('display1','display10','display11','display110','display119','display12','display126','display128','display129','display13','display130','display139','display14','display142','display15','display161','display170','display177','display178','display20','display21','display218','display219','display220','display24','display268','display271','display289','display290','display291','display292','display293','display294','display295','display296','display297','display32','display34','display35','display36','display4','display40','display42','display46','display5','display55','display56','display6','display73','display76','display77','display79','display81','display82','display88','display89','display93','display94','display95','display96','display97','display98')
Group By ClientID,CategoryCodeID,SessionIDName,Year(starttime),Month(starttime)
Union
Select ClientID,CategoryCodeID,SessionIDName,Year(starttime) [Year],Month(starttime) [Month],Count(Distinct A.QuerylogID) [#ofQueries]
from ArchiveSiteLog2018..queryexecutionlog A
Join ArchiveSiteLog2018..queryexecutionlogdetail B
On A.querylogid = B.querylogid    
Where SessionIDName in ('display1','display10','display11','display110','display119','display12','display126','display128','display129','display13','display130','display139','display14','display142','display15','display161','display170','display177','display178','display20','display21','display218','display219','display220','display24','display268','display271','display289','display290','display291','display292','display293','display294','display295','display296','display297','display32','display34','display35','display36','display4','display40','display42','display46','display5','display55','display56','display6','display73','display76','display77','display79','display81','display82','display88','display89','display93','display94','display95','display96','display97','display98')
Group By ClientID,CategoryCodeID,SessionIDName,Year(starttime),Month(starttime) ) X
Group By ClientID,CategoryCodeID,SessionIDName,[Year],[Month]




Select Distinct ClientName, HomePageLink, DisplayName, FieldName, [Year], [Month], [#ofQueries] 
into tempdb..FinalMadlibResult
from tempdb..MadLibQueryLog A
Join SiteControl..vw_QvfcFields F
On A.CategoryCodeId = F.CategoryCodeId 
And Cast(Replace(A.SessionIDName,'display','') as Int) = F.FieldId 
Join SiteControl..vw_catinfo C
On A.clientid = C.ClientID and A.CategoryCodeId = C.CategoryCodeId 
Where Status=1 



