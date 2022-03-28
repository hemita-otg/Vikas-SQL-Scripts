


Select * from SiteControl..vw_catinfo Where ClientName Like '%chu%'

Select * from SiteControl..vw_ReportFields Where CategoryCodeId= 4709 and FieldName='Optional1' 
--and DisplayName in ('Size','Format')

Select * from Connection..NightlyProcessing  Order by ProcessID desc



Select * from SiteControl..vw_QvfcFields Where CategoryCodeId=4709 and DisplayName='Optional1' 

--First insert records in to ClientFields
Select * from SiteControl..CategoryFields Where CategoryCodeId=4709  and FieldId=24

Insert into SiteControl..CategoryFields
Select 4709,24,SubWidth,WebWidth,TableId,ColumnFormatID,FieldType,NULL,1,NULL,NULL,6,2     
from SiteControl..CategoryFields Where FieldId=24 and CategoryCOdeID=2146

--Update SiteControl..CategoryFields
--Set IsSummaryField=1 
--Where CategoryCodeId=4709  and FieldId=24
Select * from Subscription..CategorySummaryDisplayControl  Where   CategoryCodeId=4709 

--Insert into Subscription..CategorySummaryDisplayControl
Select GroupLevel,FieldId,GroupDisplaySeq,GroupFieldDisplaySeq,DependentField1,DependentField2,DependentField3,GroupName,TitleTag,ControlType,374,4709 from Subscription..MasterSummaryDisplayControl  

--Insert into Subscription..CategorySummaryDisplayControl
Select 7,FieldID,8,6,NULL,NULL,NULL,'SKU','Ads',1,374,4709 from SiteControl..MasterFields Where FieldId=24