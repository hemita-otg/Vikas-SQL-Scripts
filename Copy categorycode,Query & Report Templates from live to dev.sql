1489	357	dga	MT2SQL11
1544	446	colca


select * from mt2sql04.sitecontrol.dbo.categorycode where clientid=446 and category in ('colca')
 
select * from sitecontrol..categorycode where  category in ('dga')
 
select * from sitecontrol..categorycode where id=1489

select * from mt2sql04.sitecontrol.dbo.queryviewcontrol where categorycodeid=1544
select * from queryviewtemplates where querytemplateid=1281
select * from queryviewtemplatesdetail

select * from mt2sql04.sitecontrol.dbo.reportformatcontrol where categorycodeid=1544
select * from reportformattemplates where rpttemplateid in (2179,2180)
select * from reportformattemplatesdetail

select * from tablenames where categorycodeid=1489 order by 3
select * from mt2sql04.subscription.dbo.clientdatabases where clientid in (357) and categorycodeid=1489

/*


insert into tablenames 
select * from mt2sql04.sitecontrol.dbo.tablenames where categorycodeid =1544







*/

/*
insert into subscription..clientdatabases
values(9986, ' - Detail Data' ,null,null,1,0,'#000000','Tahoma',1,'#FFFFFF',null,1489,0)

insert into queryviewcontrol values(981,1105,647)
insert into reportformatcontrol values(981,1105,947,0,'CEFFCE',1,15,1)
insert into reportformatcontrol values(981,1105,948,1,'CEFFCE',1,15,1)
*/

/*
SET IDENTITY_INSERT categorycode ON
insert into sitecontrol..categorycode
([ID],ClientID,Category,ClientServer,IsPDT,ClientPDT,IsFSI,IsAdlert,IsMaster,CWMFull,SourceCWM,ExceptionCWMFullSourceCode,IsFull,FullSourceCode,PartialSourceCode,Index_Type,MasterIndex,IsConcat,CatOnly,BUMfr,BUPT,BUPTG,BUPTSG,BUDt,BURn,BUST,BUSTG,BUSTSG,IsWeekOf,IsEvent,IsTheme,IsPublication,ProcessOrder,Run,ClientRun,Error,PartialRunDate,FullRunDate,ClientFullRundate,ClientPartialRundate,CWMFullRunDate,CWMPartialRunDate,ClientCWMFullRunDate,ClientCWMPartialRunDate,IsOD,IsNORUnit)
select
[ID],ClientID,Category,ClientServer,IsPDT,ClientPDT,IsFSI,IsAdlert,IsMaster,CWMFull,SourceCWM,ExceptionCWMFullSourceCode,IsFull,FullSourceCode,PartialSourceCode,Index_Type,MasterIndex,IsConcat,CatOnly,BUMfr,BUPT,BUPTG,BUPTSG,BUDt,BURn,BUST,BUSTG,BUSTSG,IsWeekOf,IsEvent,IsTheme,IsPublication,ProcessOrder,Run,ClientRun,Error,PartialRunDate,FullRunDate,ClientFullRundate,ClientPartialRundate,CWMFullRunDate,CWMPartialRunDate,ClientCWMFullRunDate,ClientCWMPartialRunDate,IsOD,IsNORUnit
from mt2sql04.sitecontrol.dbo.categorycode where clientid=446 and category in ('colca')
SET IDENTITY_INSERT  categorycode OFF
*/

/*
SET IDENTITY_INSERT QUERYVIEWTEMPLATES ON
INSERT INTO QUERYVIEWTEMPLATES
(QueryTemplateID,TemplateName)
SELECT QueryTemplateID,TemplateName
 FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWTEMPLATES WHERE QUERYTEMPLATEID IN (1281)
SET IDENTITY_INSERT  QUERYVIEWTEMPLATES OFF
*/

/*
INSERT INTO QUERYVIEWTEMPLATESDETAIL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWTEMPLATESDETAIL WHERE QUERYTEMPLATEID IN (1281)

INSERT INTO QUERYVIEWCONTROL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWCONTROL WHERE QUERYTEMPLATEID IN (1281) and clientid=446
*/

/*
SET IDENTITY_INSERT REPORTFORMATTEMPLATES ON
INSERT INTO REPORTFORMATTEMPLATES
(RptTemplateID,TemplateName)
SELECT RptTemplateID,TemplateName
 FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATTEMPLATES WHERE RPTTEMPLATEID IN (2296,2297) 
SET IDENTITY_INSERT  REPORTFORMATTEMPLATES OFF
*/
/*
INSERT INTO REPORTFORMATTEMPLATESDETAIL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATTEMPLATESDETAIL WHERE RPTTEMPLATEID IN (2296,2297) 
*/
/*
INSERT INTO REPORTFORMATCONTROL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATCONTROL WHERE RPTTEMPLATEID IN (2296,2297)  and clientid=446
*/


insert into subscription..clientdatabases
select ClientID,YourWeb,ClientCode,AllSequence,AllRow,AllBold,AllColor,AllFont,AllFontSize,AllBackGround,HomePageLink,CategoryCodeID,Status
 from mt2sql04.subscription.dbo.clientdatabases where clientid in (446) and categorycodeid=1544

/*
select * from subscription..clientprofile where clientcode='colca'
select * from vwclient where clientid=446

insert into subscription..clientprofile
select ClientID,ClientName,SubscriptionEndDate,ProcessingPriority,LimitToRegisteredEmails,FiscalYear,ClientCode,TermsPage,Trusted,IsPopupBlocked,StartPage,Licenses,SendUserName,MasterCategoryCodeId,TOUPage,FAQPage,IsActiveClient,ClientFolder,RolloutToAllUsers,RevenueBand,ClientIndustryType,ClientWeight,CSRepresentative,Comments,LastUpdatedOn,LastUpdatedBy,RequiredFields,DisplayHPAnnouncement,ContactName,ContactPhone,ContactEmailAddress,ClientHomeTitle,TermsText,FV40
 from mt2sql04.subscription.dbo.clientprofile where clientcode='colca'


insert into clientcontrol
select * from MT2SQL04.subscription.DBO.clientcontrol where clientid=446

*/




