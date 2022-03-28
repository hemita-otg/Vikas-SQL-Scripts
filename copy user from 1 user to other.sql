--select * from vwuser where clientid=999 and firstname like '%debra%'
--select max(userrefid) from userprofile where  firstname like '%debra%' order by userrefid desc

Declare @Source_userRefID numeric
Declare @uid as int
Declare @userrefid numeric
Declare @ClientID as int

Set @Source_userRefID = 2024620


--UserProfile---
INSERT INTO userprofile(UserName,[Password],Type,FirstName,
LastName,DefaultEmailAddress,UserFax,UserPhone,Vendor,
SiteAccess,ProcessingPriority,LastAccessed,IsPopupBlocked,Terms,
Trusted,Title,DateCreated,DateSigned,TipList,Office,Department,
Region,Division,LastTraining,GUID,LinkID,Comments,FRAccess,LastUpdatedOn,
LastUpdatedBy,SiteAccessStart,FRAccessStart,TitleGroups,SystemComments,
IsImageOnlyUser,FVMonitorUser,RoleID,FV40) 
select replace(UserName,'prd','bfc'),[Password],Type,FirstName,
LastName,DefaultEmailAddress,UserFax,UserPhone,Vendor,
SiteAccess,ProcessingPriority,LastAccessed,IsPopupBlocked,Terms,
Trusted,Title,DateCreated,DateSigned,TipList,Office,Department,
Region,Division,LastTraining,GUID,LinkID,Comments,FRAccess,LastUpdatedOn,
LastUpdatedBy,SiteAccessStart,FRAccessStart,TitleGroups,SystemComments,
IsImageOnlyUser,FVMonitorUser,RoleID,FV40
from userprofile where userrefid=@Source_userRefID
--UserProfile---

--usercontrol--



select @uid=max(userid)+1 from usercontrol
select @userrefid=  max(userrefid) from userprofile where  firstname like '%debra%'

select @ClientID=clientid from mt2sql04.sitecontrol.dbo.categorycode  where category ='BFC'

insert into usercontrol
select 
@uid,@userrefid,@ClientID,'ClientHome.Asp' as DefaultAsp,Subscription,PDTExcelDownload,ZipFile,ControlSubscriptionPage,MaxAllowedPPT,TotalNumberPPT,MaxFullSizeImagesSinglePPT,
MaxIntermediateImagesSinglePPT,MaxThumbnailsImagesSinglePPT,MaximumAllowedPDTRecords,MaximumAllowedCWMRecords,PPTQueryPage,PreventCWMQueries,AllowPPTProductImage,
ClientRecSet,AllowSummaryView,MaxAllowedSumPDTRecords,TotalXLSSumPDTRecords,TotalXLSPDTRecords,AllowSavePDTOnSite,AllowProductImageView,AllowAdvanceQuery
,AllowGuidedTour,AllowHelp,MaxProductThumbnailImageSinglePPT,MaxProductImageSinglePPT,MaxFileSizeEmail,MaxFileSizeLink,EnableSaveDialogue,ShareSavedQuery,
allowfreezpan,allowfilterlink,TotalXLSCWMRecords,ShareSavedReport,ShareSavedSummary,RemoveZip,useropt_freezheader,useropt_freezpan,useropt_freezpanfield,
useropt_showfilterarrow,useropt_showfilterlink,useropt_alternetcolor,AllowPage5TextSearch,RtlFilterLink,PDTDisplayControl,AllowSaveCWMOnSite,HyperlinksInReports,
DTDDataLinks,DTDNonDataLinks,AllowPageResultsView,AllowImageOptions,AllowAdComparisonOption,AllowAdResult2,AllowEmailAdLevel,AllowEmailPDTLevel,AllowEmailQueryPage,
CWMExcelDownload,PPTAdLevel,PPTPDTlevel,PPTSubscription,QueryPageExcelDownload,AllowPPTEmail,MaximumAllowedXLSSumRecords,MaxSingleFileXlsRecordsEmail,
MaxSingleFileXlsRecordsDownload,AllowBatchPrint,MaximumBatchPrintImages,TotalBatchPrintImages,MaximumAllowedBatchPrintImages,HyperlinksOptionDefault,AllowPDFReport,
MaximumPDFReportImages,TotalPDFReportImages,MaximumAllowedPDFReportImages,AllowWeightedSummary,WeightedDisplayName,AllowEventSummary,CustomEventSec1Title,
CustomEventSec2Title,AllowPPTProductImageInfo,QueryParametersInXLS,EnableMultipassUpdate,ADReportsSubscriptions,AllowAdCalendar,CustomPeriodCompare,
SubscriptionHeaderMessage,QueryPageAsASPVersion,LiveSup,ProfileCheck,AllowUserReportTemplates,AllowSummarySubTotals,AllowTOUIcon,AllowDBFIcon,AllowFAQIcon,
MaxAllowedADRecordsXLS,TotalADRecordsXLS,DetailQueryLimit,AllowTrendTotals,EnableUniqueProductFeatureCondition,AllowAdSummaryView,AllowErrorReport,
AllowExpressionBuilder,AllowOneClickSummary,AllowNumericDataPointSummary,AllowExportLargeData,AllowCustomDB,AllowAdTypePageSummarizeBy,AllowMultiTimePeriodSummary,
TotalXLSAdPageRecords,MaximumAllowedAdPageRecords
from usercontrol where userrefid=@Source_userRefID
--usercontrol--

--select * from usercontrol where  userrefid=2043477
