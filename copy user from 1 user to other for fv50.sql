--select * from vwuser where clientid=3 and firstname like '%vikrant%'
--select * from userprofile where  firstname like '%vikrant%'
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
LastUpdatedBy,SiteAccessStart,FRAccessStart,TitleGroups,SystemComments) 
select username,[Password],Type,FirstName,
LastName,'vroy1@markettrack.com' as DefaultEmailAddress,UserFax,UserPhone,Vendor,
SiteAccess,ProcessingPriority,LastAccessed,IsPopupBlocked,Terms,
Trusted,Title,DateCreated,DateSigned,TipList,Office,Department,
Region,Division,LastTraining,GUID,LinkID,Comments,FRAccess,LastUpdatedOn,
LastUpdatedBy,SiteAccessStart,FRAccessStart,TitleGroups,SystemComments
from userprofile where userrefid=2041644

--UserProfile---

--usercontrol--



select max(userid)+1 from usercontrol
select @userrefid=  max(userrefid) from userprofile where  firstname like '%debra%'

select @ClientID=clientid from mt2sql04.sitecontrol.dbo.categorycode  where category ='BFC'

insert into usercontrol
select 
'2006831' as userid,'2042314' as userrefid,3 as ClientID,'ClientHome.Asp' as DefaultAsp,
Subscription,PDTExcelDownload,ZipFile,ControlSubscriptionPage,MaxAllowedPPT,TotalNumberPPT,MaxFullSizeImagesSinglePPT,
MaxIntermediateImagesSinglePPT,MaxThumbnailsImagesSinglePPT,MaximumAllowedPDTRecords,MaximumAllowedCWMRecords,PPTQueryPage,
PreventCWMQueries,AllowPPTProductImage,ClientRecSet,AllowSummaryView,MaxAllowedSumPDTRecords,TotalXLSSumPDTRecords,
TotalXLSPDTRecords,AllowSavePDTOnSite,AllowProductImageView,AllowAdvanceQuery,AllowGuidedTour,AllowHelp,MaxProductThumbnailImageSinglePPT,
MaxProductImageSinglePPT,MaxFileSizeEmail,MaxFileSizeLink,EnableSaveDialogue,ShareSavedQuery,allowfreezpan,allowfilterlink,
TotalXLSCWMRecords,ShareSavedReport,ShareSavedSummary,RemoveZip,useropt_freezheader,useropt_freezpan,useropt_freezpanfield,
useropt_showfilterarrow,useropt_showfilterlink,useropt_alternetcolor,AllowPage5TextSearch,RtlFilterLink,PDTDisplayControl,
AllowSaveCWMOnSite,HyperlinksInReports,DTDDataLinks,DTDNonDataLinks,AllowPageResultsView,AllowImageOptions,AllowAdComparisonOption,
AllowAdResult2,AllowEmailAdLevel,AllowEmailPDTLevel,AllowEmailQueryPage,CWMExcelDownload,PPTAdLevel,PPTPDTlevel,PPTSubscription,
QueryPageExcelDownload,AllowPPTEmail,MaximumAllowedXLSSumRecords,MaxSingleFileXlsRecordsEmail,MaxSingleFileXlsRecordsDownload,
AllowBatchPrint,MaximumBatchPrintImages,TotalBatchPrintImages,MaximumAllowedBatchPrintImages,HyperlinksOptionDefault,AllowPDFReport,
MaximumPDFReportImages,TotalPDFReportImages,MaximumAllowedPDFReportImages,AllowWeightedSummary,WeightedDisplayName,AllowEventSummary,
CustomEventSec1Title,CustomEventSec2Title,AllowPPTProductImageInfo,QueryParametersInXLS,EnableMultipassUpdate,ADReportsSubscriptions,
AllowAdCalendar,CustomPeriodCompare,SubscriptionHeaderMessage,QueryPageAsASPVersion,LiveSup,ProfileCheck,AllowUserReportTemplates,
AllowSummarySubTotals,AllowTOUIcon,AllowDBFIcon,AllowFAQIcon,MaxAllowedADRecordsXLS,TotalADRecordsXLS,DetailQueryLimit,
EnableUniqueProductFeatureCondition,AllowTrendTotals,AllowAdSummaryView,AllowErrorReport,AllowNumericDataPointSummary,
AllowOneClickSummary,AllowExpressionBuilder,AllowExportLargeData,AllowCustomDB,AllowAdTypePageSummarizeBy,TotalXLSAdPageRecords,
MaximumAllowedAdPageRecords,AllowMultiTimePeriodSummary,PowerOneReport,IsImageOnlyUser,RoleId,FVMonitorUser,FV40
from usercontrol where userrefid=2041644
--usercontrol--

--select * from usercontrol where  userrefid=2043477
