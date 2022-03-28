use subscription



SET IDENTITY_INSERT UserSavedTemplate ON
insert into UserSavedTemplate (ClientId,TemplateName,TemplateType,ShareFlag,DisplayFlag,CategoryCodeId,UserID,CreatedDate )
select ClientId,TemplateName,TemplateType,ShareFlag,DisplayFlag,1891,UserID,CreatedDate 
 from UserSavedTemplate where TemplateType = 13 and userid=51243 and templateid in (7500,7498)
SET IDENTITY_INSERT UserSavedTemplate OFF


select templateid,ClientId,TemplateName,TemplateType,ShareFlag,DisplayFlag,categorycodeid,UserID,CreatedDate 
 from UserSavedTemplate where TemplateType = 13 and userid=51243 and templateid in (7500,7498)

insert into UserSavedtemplatedetail
select 7632,FieldName,FieldValue 
 from UserSavedtemplatedetail where templateid in (7498) ,7498)
