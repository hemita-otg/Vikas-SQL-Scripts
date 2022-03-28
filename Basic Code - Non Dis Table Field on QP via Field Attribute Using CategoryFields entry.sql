select * from SiteControl..vw_QvfcFields a
join SiteControl..vw_catinfo b 
on a.CategoryCodeId=b.CategoryCodeId
where FVCCType =2 
and FieldName ='promotions'
and a.CategoryCodeId in (4672,5858,5982)

Select * from SiteControl..CategoryFields 
Where FieldID=21 and CategoryCodeID=7148 

Select * from SiteControl..FieldAttribute  

  