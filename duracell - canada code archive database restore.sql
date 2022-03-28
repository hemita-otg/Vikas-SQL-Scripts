Use SiteControl

Select * from archivesub.dbo.categorycode where ID=4507

SET IDENTITY_INSERT categorycode ON
Insert Into categorycode ([ID],[ClientID],[Category],[ClientServer],[IsPDT],[ClientPDT],[IsFSI],[IsAdlert],[IsMaster],[CWMFull],[SourceCWM],[ExceptionCWMFullSourceCode],[IsFull],[FullSourceCode],[PartialSourceCode],[Index_Type],[MasterIndex],[IsConcat],[CatOnly],[BUMfr],[BUPT],[BUPTG],[BUPTSG],[BUDt],[BURn],[BUST],[BUSTG],[BUSTSG],[IsWeekOf],[IsEvent],[IsTheme],[IsPublication],[ProcessOrder],[Run],[ClientRun],[Error],[PartialRunDate],[FullRunDate],[ClientFullRundate],[ClientPartialRundate],[CWMFullRunDate],[CWMPartialRunDate],[ClientCWMFullRunDate],[ClientCWMPartialRunDate],[IsOD],[IsNORUnit],[IsOffer],[BuPC],[mt2aClientServer],[ShowEntryBrand],[ShowEntryTaggedCompany],[ShowAdType],[ShowWeight],[IsDAA],[IsIntegerID],[IsEmail],[BUCh],[IsSSD],[incrAdRun],[IsCT],[FV60],[FVVer],[ClientBuildVer],[customstep],[IsCLD],[FD],[FDTime],[IsShared],[FVCCType])
Select Distinct [ID],[ClientID],[Category],[ClientServer],[IsPDT],[ClientPDT],[IsFSI],[IsAdlert],[IsMaster],[CWMFull],[SourceCWM],[ExceptionCWMFullSourceCode],[IsFull],[FullSourceCode],[PartialSourceCode],[Index_Type],[MasterIndex],[IsConcat],[CatOnly],[BUMfr],[BUPT],[BUPTG],[BUPTSG],[BUDt],[BURn],[BUST],[BUSTG],[BUSTSG],[IsWeekOf],[IsEvent],[IsTheme],[IsPublication],[ProcessOrder],[Run],[ClientRun],[Error],[PartialRunDate],[FullRunDate],[ClientFullRundate],[ClientPartialRundate],[CWMFullRunDate],[CWMPartialRunDate],[ClientCWMFullRunDate],[ClientCWMPartialRunDate],[IsOD],[IsNORUnit],[IsOffer],[BuPC],[mt2aClientServer],[ShowEntryBrand],[ShowEntryTaggedCompany],[ShowAdType],[ShowWeight],[IsDAA],[IsIntegerID],[IsEmail],[BUCh],[IsSSD],[incrAdRun],[IsCT],[FV60],[FVVer],[ClientBuildVer],[customstep],[IsCLD],[FD],[FDTime],[IsShared],[FVCCType] from archivesub.dbo.categorycode where category in ('dcelca')
SET IDENTITY_INSERT categorycode OFF

--Select * from sysobjects where xtype='u' and name like '%dmf50%'

Select * from sitecontrol.dbo.categorycode where category in ('dmf50')

--Update CategoryCode Set DBCreatedOn='2011-12-16 05:27:32.343' where category in ('dmf50')

--Insert Into TableNames ([MasterTableName],[ClientTableName],[TableID],[CategoryCodeID])
Select Distinct [MasterTableName],[ClientTableName],[TableID],[CategoryCodeID] from archivesub.dbo.tablenames where categorycodeid in (4507) order by tableid

Select * from tablenames where categorycodeid in (4507)

Select * from archivesub.dbo.ClientBrandException where categorycodeid in (4507)

Select * from ClientBrandException where categorycodeid in (4507)

SET IDENTITY_INSERT MerchandiseCategoryTemplates ON
Insert Into MerchandiseCategoryTemplates ([MCTemplateID],[TemplateName])
Select Distinct [MCTemplateID],[TemplateName] from archivesub.dbo.MerchandiseCategoryTemplates where MCTemplateID in (3105)
SET IDENTITY_INSERT MerchandiseCategoryTemplates OFF

Select * from MerchandiseCategoryTemplates where MCTemplateID in (3105)

--Insert Into MerchandiseCategoryControl ([MCTemplateID],[CategoryCodeID])
Select Distinct [MCTemplateID],[CategoryCodeID] from archivesub.dbo.MerchandiseCategoryControl where categorycodeid in (4507)

Select * from MerchandiseCategoryControl where categorycodeid in (4507)

--Insert Into MerchandiseCategoryTemplatesDetail ([MCTemplateID],[MerchandiseCategory],[MerchandiseSubCat],[Category],[RealCategory],[Set],[Exclude],[startdt],[enddt],[EntryStartDate],[EntryEndDate])
Select Distinct [MCTemplateID],[MerchandiseCategory],[MerchandiseSubCat],[Category],[RealCategory],[Set],[Exclude],[startdt],[enddt],[EntryStartDate],[EntryEndDate] from archivesub.dbo.MerchandiseCategoryTemplatesDetail where MCTemplateID in (3105)

Select * from MerchandiseCategoryTemplatesDetail where MCTemplateID in (3105)

SET IDENTITY_INSERT QueryViewTemplates ON
Insert Into QueryViewTemplates ([QueryTemplateID],[TemplateName])
Select Distinct [QueryTemplateID],[TemplateName] from archivesub.dbo.QueryViewTemplates where QueryTemplateID in (3365)
SET IDENTITY_INSERT QueryViewTemplates OFF

Select * from QueryViewTemplates where QueryTemplateID in (3365)

--Insert Into QueryViewControl ([ClientID],[CategoryCodeID],[QueryTemplateID])
Select Distinct [ClientID],[CategoryCodeID],[QueryTemplateID] from archivesub.dbo.QueryViewControl where categorycodeid in (4507)

Select * from QueryViewControl where categorycodeid in (4507)

--Insert Into QueryViewTemplatesDetail ([QueryTemplateID],[FieldId],[DisplaySeq],[DisplayName],[SelectionPage],[HelpMeSelect],[SortTableOrder],[SortSeq],[SortType],[NumericTableSeq],[ComparisionSeq],[ConditionSeq],[BasedOnLinkSeq],[ExpressionSeq],[AdvConditionSeq],[AdvQPDisplaySeq],[IsPage])
Select Distinct [QueryTemplateID],[FieldId],[DisplaySeq],[DisplayName],[SelectionPage],[HelpMeSelect],[SortTableOrder],[SortSeq],[SortType],[NumericTableSeq],[ComparisionSeq],[ConditionSeq],[BasedOnLinkSeq],[ExpressionSeq],[AdvConditionSeq],[AdvQPDisplaySeq],[IsPage] from archivesub.dbo.QueryViewTemplatesDetail where QueryTemplateID in (3365)

Select * from QueryViewTemplatesDetail where QueryTemplateID in (3365)

SET IDENTITY_INSERT ReportFormatTemplates ON
Insert Into ReportFormatTemplates ([RptTemplateID],[TemplateName])
Select Distinct [RptTemplateID],[TemplateName] from archivesub.dbo.ReportFormatTemplates where [RptTemplateID] in (6203,6204)
SET IDENTITY_INSERT ReportFormatTemplates OFF

Select * from ReportFormatTemplates where [RptTemplateID] in (6203,6204)

--Insert Into ReportFormatControl ([ClientID],[CategoryCodeID],[RptTemplateID],[IsPDTTemplate],[AlternateColors],[FreezePane],[FreezePaneFieldID],[FreezeHeader])
Select Distinct [ClientID],[CategoryCodeID],[RptTemplateID],[IsPDTTemplate],[AlternateColors],[FreezePane],[FreezePaneFieldID],[FreezeHeader] from archivesub.dbo.ReportFormatControl where categorycodeid in (4507)

Select * from ReportFormatControl where categorycodeid in (4507)

--Insert Into ReportFormatTemplatesDetail ([RptTemplateID],[FieldID],[DisplaySeq],[DisplayName],[Filter],[Link],[AdsDisplaySeq],[IsPage])
Select Distinct [RptTemplateID],[FieldID],[DisplaySeq],[DisplayName],[Filter],[Link],[AdsDisplaySeq],[IsPage] from archivesub.dbo.ReportFormatTemplatesDetail where [RptTemplateID] in (6203,6204)

Select * from ReportFormatTemplatesDetail where [RptTemplateID] in (6203,6204)

Use Subscription

SET IDENTITY_INSERT ClientDatabases ON
Insert Into ClientDatabases ([ClientID],[YourWeb],[ClientCode],[AllSequence],[AllRow],[AllBold],[AllColor],[AllFont],[AllFontSize],[AllBackGround],[HomePageLink],[CategoryCodeID],[RowId],[Status])
Select Distinct [ClientID],[YourWeb],[ClientCode],[AllSequence],[AllRow],[AllBold],[AllColor],[AllFont],[AllFontSize],[AllBackGround],[HomePageLink],[CategoryCodeID],[RowId],0 as [Status] from archivesub.dbo.ClientDatabases where categorycodeid in (4507)
SET IDENTITY_INSERT ClientDatabases OFF

Select * from ClientDatabases where categorycodeid in (4507)

--Insert Into ClientExceptionalCatCode ([ClientID],[IsSummaryOnly],[IsPageViewEnabled],[AllowProductImageView],[AllowBDMReport],[CategoryCodeId],[AllowFSISummary],[AllowOneClickSummary],[IsWebElementDB],[MCAPFeatures],[DisableBrandAllSelection],[DisableThumbnailAndAdjView],[AllowDefineCustUpdt],[IsNonAlphaId])
Select Distinct [ClientID],[IsSummaryOnly],[IsPageViewEnabled],[AllowProductImageView],[AllowBDMReport],[CategoryCodeId],[AllowFSISummary],[AllowOneClickSummary],[IsWebElementDB],[MCAPFeatures],[DisableBrandAllSelection],[DisableThumbnailAndAdjView],[AllowDefineCustUpdt],[IsNonAlphaId] from archivesub.dbo.ClientExceptionalCatCode where categorycodeid in (4507)

Select * from ClientExceptionalCatCode where categorycodeid in (4507)

--Insert Into CategoryFieldValueGroupForVisualization ([ClientId],[CategoryCodeId],[FieldId],[FieldGroupName],[FieldValueId])
Select Distinct [ClientId],[CategoryCodeId],[FieldId],[FieldGroupName],[FieldValueId] from archivesub.dbo.CategoryFieldValueGroupForVisualization where categorycodeid in (4507)

Select * from CategoryFieldValueGroupForVisualization where categorycodeid in (4507)

--CWM Coverage

Select * from MasterClientCWM  where CategoryCodeID=4507

Insert Into MasterClientCWM
Select * from MT2SQL14.ArchiveSub.dbo.MasterClientCWM where CategoryCodeID=4507

Select * from ClientCWMChanges  where CategoryCodeID=4507

--Insert Into ClientCWMChanges
--Select * from MT2SQL14.ArchiveSub.dbo.ClientCWMChanges where CategoryCodeID=4507

Select * from ClientCWMException  where CategoryCodeID=4507

--Insert Into ClientCWMException
--Select * from MT2SQL14.ArchiveSub.dbo.ClientCWMException where CategoryCodeID=4507

--CWM Coverage

--Custom Update Start

--Insert INto MasterCustomUpdate
Select * from archivesub.dbo.MasterCustomUpdate where CategoryID=4507

--SET IDENTITY_INSERT MasterCustomStep ON
--Insert Into MasterCustomStep (CSID,CategoryCodeID,CustomStepArchive)
--Select CSID,CategoryCodeID,CustomStepArchive from archivesub.dbo.MasterCustomStep where CSID=67
--SET IDENTITY_INSERT MasterCustomStep OFF

--SET IDENTITY_INSERT MasterCustomStepDetail ON
--Insert Into MasterCustomStepDetail (CSDID,CSID,FieldId,SQLTaskId,SPID,processOrder)
--Select CSDID,CSID,FieldId,SQLTaskId,SPID,processOrder from archivesub.dbo.MasterCustomStepDetail where SPID=38 and CSDID=251
--SET IDENTITY_INSERT MasterCustomStepDetail OFF

Select * from archivesub.dbo.MasterCustomStepSPDetail where SPID=38

Select * from archivesub.dbo.vw_MasterCustomStep where ID=4507

Select * from archivesub.dbo.code

Select * from archivesub.dbo.codetype

Select * from MasterCustomUpdate where CategoryID=4507

Select * from MasterCustomStep where CSID=67

--Update MasterCustomStep Set CustomStepArchive=0 where CSID=67
--Select * from vw_MasterCustomStep where ID=4507

Select * from mastercustomstep where CSID=68

Select * from categorycode where ID=2119

Select * from MasterCustomStepDetail where SPID=38

Select * from MasterCustomStepDetail where CSID=68

Select * from MasterCustomStepSPDetail where SPID=38
Select * from Code where CodeID in (Select SQLTaskID from Sitecontrol.dbo.MasterCustomStepDetail where CSID=67)

Select * from codetype 
Select * from sitecontrol.dbo.vw_MasterCustomStep where category='dmf50'


--Custom Update End

--Segmentation Start

--SET IDENTITY_INSERT mastercustomdataupdategroup ON
--Insert Into mastercustomdataupdategroup (CustomDataUpdateGroupId,FieldId,DisplaySeq,ClientId,CategoryCodeId,CreateDt,IsFull,HasExpansion,IsDependentField,LastExecutedOn,RebuildIndex,UnassignedRecText)
--Select CustomDataUpdateGroupId,FieldId,DisplaySeq,ClientId,CategoryCodeId,CreateDt,IsFull,HasExpansion,IsDependentField,LastExecutedOn,RebuildIndex,UnassignedRecText from archivesub.dbo.mastercustomdataupdategroup where categorycodeid=4507
--SET IDENTITY_INSERT mastercustomdataupdategroup OFF

--Insert Into CustomDataUpdateControl
--Select * from MT2STG0.SubscriptionMerged.dbo.CustomDataUpdateControl where CustomDataUpdateGroupId=212

--SET IDENTITY_INSERT SavedCustomDataUpdates ON
--Insert Into SavedCustomDataUpdates (CustomDataUpdateId,UpdateValue,SequenceNo,ActiveFlag,ClientId,CategoryCodeId,UserId,CreateDt,CustomDataUpdateGroupId,ControlValueFlag)
--Select CustomDataUpdateId,UpdateValue,SequenceNo,ActiveFlag,ClientId,CategoryCodeId,UserId,CreateDt,CustomDataUpdateGroupId,ControlValueFlag from archivesub.dbo.SavedCustomDataUpdates where CustomDataUpdateGroupId=212
--SET IDENTITY_INSERT SavedCustomDataUpdates OFF

--Insert Into SavedCustomDataUpdatesDetail
--Select * from MT2STG0.SubscriptionMerged.dbo.SavedCustomDataUpdatesDetail where CustomDataUpdateId in (4289,7215)

Select * from Subscription.dbo.CustomDataUpdateControl where CustomDataUpdateGroupId=212

Select * from subscription.dbo.mastercustomdataupdategroup where categorycodeid=4507

Select * from Subscription.dbo.SavedCustomDataUpdates where CustomDataUpdateGroupId=212

Select * from Subscription.dbo.SavedCustomDataUpdatesDetail where CustomDataUpdateId in (4289,7215)

Select * from sitecontrol.dbo.vw_MasterSegmentation where category in ('dmf50','dmfcan50')

Select * from sitecontrol.dbo.vw_MasterSegmentationDetail where category in ('dmf50','dmfcan50')

--Segmentation End

Select * from categorycode where category='dcelca'
--Update categorycode Set IsPDT=1,ClientPDT=1,CWMFull=1,IsFull=1 where category='dmf50'

--Code Processing Start--

--Exec CreateClientCWMtable_50 'dmf50', '', 0

--Exec CustomStepSP_Dmf 'dmf50', 2, 0

--Big Int

--Exec CreateClientTables_50_PDTIdInt 'dmf50', '', 0

--Exec CustomStepSP_Dmf 'dmf50', 1, 0

--Exec CustomStepSP_Dmf 'dmf50', 3, 0

--Exec MasterSegmentation 'dmf50',0

--EXEC DataSP50Int.dbo.fv_FillHomePageTableData  '286','4507','MT2SQL14.SiteControl.dbo.','MT2SQL14.Subscription.dbo.','MT2SQL04.SQL04.dbo.'

--insert into mt2sql14.subscription.dbo.HTMLQueryPageChange values('dmf50')

--Code Processing End

Select * from vwcubecategory where category='dmf50'

Select * from cubecategory where categorycodeid=4507

Select * from connection.dbo.CategoryAppParameters where categorycodeid=4507

Select * from connection.dbo.vwDBParameters where activesql like '%sql04%'

---Not done--

--SET IDENTITY_INSERT SavedQueries ON
--Insert Into SavedQueries ([QueryID],[QueryName],[LastUpdated],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[CWMOnly],[SavedQueryType],[NumberQueryPasses],[LastExecuted],[SavedBy],[DisplayOption],[TemplateID],[DdrQuery],[CategoryCodeId],[UserID],[IsPageQuery],[AdvanceQuery],[NewDataCustomPeriod],[NewDataCustomPeriodUnit])
--Select Distinct [QueryID],[QueryName],[LastUpdated],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[CWMOnly],[SavedQueryType],[NumberQueryPasses],[LastExecuted],[SavedBy],[DisplayOption],[TemplateID],[DdrQuery],[CategoryCodeId],[UserID],[IsPageQuery],[AdvanceQuery],[NewDataCustomPeriod],[NewDataCustomPeriodUnit] from archivesub.dbo.SavedQueries where categorycodeid in (4507)
--SET IDENTITY_INSERT SavedQueries OFF

Select * from SavedQueries where categorycodeid in (4507)

--Insert Into SavedQueriesDetail ([QueryID],[SessionIDName],[SessionIDValue],[SequenceNo])
Select Distinct [QueryID],[SessionIDName],[SessionIDValue],[SequenceNo] from archivesub.dbo.SavedQueriesDetail where QueryID in (Select QueryID from archivesub.dbo.SavedQueries where categorycodeid in (4507))

Select * from SavedQueriesDetail where QueryID in (Select QueryID from SavedQueries where categorycodeid in (4507))

--SET IDENTITY_INSERT Subscription ON
--Insert Into Subscription ([SubscriptionID],[SubscriptionName],[DateTimeSaved],[DataType],[SingleSavedQuery],[DateTimeExecuted],[CategoryCodeId],[UserID],[IsPageQuery])
--Select Distinct [SubscriptionID],[SubscriptionName],[DateTimeSaved],[DataType],[SingleSavedQuery],[DateTimeExecuted],[CategoryCodeId],[UserID],[IsPageQuery] from archivesub.dbo.subscription where categorycodeid in (4507)
--SET IDENTITY_INSERT Subscription OFF

Select * from Subscription where categorycodeid in (4507)

--Insert Into SubscriptionSavedQuery ([SubscriptionID],[SQID])
Select Distinct [SubscriptionID],[SQID] from archivesub.dbo.SubscriptionSavedQuery where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionSavedQuery where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--Insert Into SubscriptionEmail ([SubscriptionID],[EmailAddresses])
Select Distinct [SubscriptionID],[EmailAddresses] from archivesub.dbo.SubscriptionEmail where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionEmail where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--Insert Into SubscriptionEmailGroups ([SubscriptionID],[EmailGroupName],[EmailAddresses])
Select Distinct [SubscriptionID],[EmailGroupName],[EmailAddresses] from archivesub.dbo.SubscriptionEmailGroups where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionEmailGroups where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--Insert Into SubscriptionFormatting ([SubscriptionID],[FormattingOption#],[TabFileName],[EmailSubject],[EmailBody],[ShowRecipients],[ExcelTemplate],[Macro],[SendReportsAll],[SendReportsUser],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[ZipFile],[SaveClientRecSet],[PDTFilterLinks],[SummaryDrillLinks],[sendExcelLink],[sendPPTLink],[SendProductImage],[PageTemplate],[ProductImageTempalte],[DeleteDuplicate],[HyperlinksInReports],[SendAdListExcel],[AdPPTTemplate],[EventId],[SummaryDtdRecordSet],[QueryParametersInXLS],[PDFReport],[IncludeProductImage],[GroupDetailReportBy],[IncludeGraph],[IncludeFullSizePageImage],[CalendarBy],[CalendarBasedOn],[IncludePageCounts],[ProductInfo],[IncludeProductPageImage])
Select Distinct [SubscriptionID],[FormattingOption#],[TabFileName],[EmailSubject],[EmailBody],[ShowRecipients],[ExcelTemplate],[Macro],[SendReportsAll],[SendReportsUser],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[ZipFile],[SaveClientRecSet],[PDTFilterLinks],[SummaryDrillLinks],[sendExcelLink],[sendPPTLink],[SendProductImage],[PageTemplate],[ProductImageTempalte],[DeleteDuplicate],[HyperlinksInReports],[SendAdListExcel],[AdPPTTemplate],[EventId],[SummaryDtdRecordSet],[QueryParametersInXLS],[PDFReport],[IncludeProductImage],[GroupDetailReportBy],[IncludeGraph],[IncludeFullSizePageImage],[CalendarBy],[CalendarBasedOn],[IncludePageCounts],[ProductInfo],[IncludeProductPageImage] from archivesub.dbo.SubscriptionFormatting where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionFormatting where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--Insert Into SubscriptionSchedule ([SubscriptionID],[StartDate],[EndDate],[Interval],[TimePeriod])
Select Distinct [SubscriptionID],[StartDate],[EndDate],[Interval],[TimePeriod] from archivesub.dbo.SubscriptionSchedule where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionSchedule where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--Insert Into SubscriptionSummaryTemplate ([subscriptionid],[TemplateID],[ReportLevel])
Select Distinct [subscriptionid],[TemplateID],[ReportLevel] from archivesub.dbo.SubscriptionSummaryTemplate where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507))

Select * from SubscriptionSummaryTemplate where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4507))

--SET IDENTITY_INSERT UserSavedSummaryFormats ON
--Insert Into UserSavedSummaryFormats ([TemplateID],[Type],[ReportTemplateName],[SummaryTableFormatId],[SummaryDisplayOption],[ShowLinksOn],[TopX],[DisplayOnQuery],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[DisplayOnQuery1],[displayon],[IsWeighted],[EventFormatTypeId],[CategoryCodeId],[UserID],[AllSummarySubTotals],[CreatedDate],[IncludeDependentCols],[IsStandard],[TemplateSel],[TemplateText],[TemplateType],[isPreDefined])
--Select Distinct [TemplateID],[Type],[ReportTemplateName],[SummaryTableFormatId],[SummaryDisplayOption],[ShowLinksOn],[TopX],[DisplayOnQuery],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[DisplayOnQuery1],[displayon],[IsWeighted],[EventFormatTypeId],[CategoryCodeId],[UserID],[AllSummarySubTotals],[CreatedDate],[IncludeDependentCols],[IsStandard],[TemplateSel],[TemplateText],[TemplateType],[isPreDefined] from archivesub.dbo.UserSavedSummaryFormats where categorycodeid in (4507)
--SET IDENTITY_INSERT UserSavedSummaryFormats OFF

Select * from UserSavedSummaryFormats where categorycodeid in (4507)

--Insert Into UserSavedSummaryFormatDetails ([TemplateID],[ParamName],[ParamValue])
Select Distinct [TemplateID],[ParamName],[ParamValue] from archivesub.dbo.UserSavedSummaryFormatDetails where TemplateID in (Select TemplateID from archivesub.dbo.UserSavedSummaryFormats where categorycodeid in (4507))

Select * from UserSavedSummaryFormatDetails where TemplateID in (Select TemplateID from UserSavedSummaryFormats where categorycodeid in (4507))

--SET IDENTITY_INSERT UserSavedEventFormats ON
--Insert Into UserSavedEventFormats ([EventFormatId],[EventName],[Type],[CreatedDate],[EventCombination],[EventExistingWithin],[CategoryCodeId],[UserID],[IsStandard])
--Select Distinct [EventFormatId],[EventName],[Type],[CreatedDate],[EventCombination],[EventExistingWithin],[CategoryCodeId],[UserID],[IsStandard] from archivesub.dbo.UserSavedEventFormats where categorycodeid in (4507)
--SET IDENTITY_INSERT UserSavedEventFormats OFF

Select * from UserSavedEventFormats where categorycodeid in (4507)

--SET IDENTITY_INSERT UserSavedTemplate ON
--Insert Into UserSavedTemplate ([TemplateId],[ClientId],[TemplateName],[TemplateType],[ShareFlag],[DisplayFlag],[CategoryCodeId],[UserID],[CreatedDate])
--Select Distinct [TemplateId],[ClientId],[TemplateName],[TemplateType],[ShareFlag],[DisplayFlag],[CategoryCodeId],[UserID],[CreatedDate] from archivesub.dbo.UserSavedTemplate where categorycodeid in (4507)
--SET IDENTITY_INSERT UserSavedTemplate OFF

Select * from UserSavedTemplate where categorycodeid in (4507)

--Insert Into UserSavedTemplateDetail ([TemplateId],[FieldName],[FieldValue])
Select Distinct [TemplateId],[FieldName],[FieldValue] from archivesub.dbo.UserSavedTemplateDetail where TemplateId in (Select TemplateId from archivesub.dbo.UserSavedTemplate where categorycodeid in (4507))

Select * from UserSavedTemplateDetail where TemplateId in (Select TemplateId from UserSavedTemplate where categorycodeid in (4507))

Use Connection

Select * from ClientGroup where ClientID=699

Select * from CategoryAppParameters where categorycodeid=4507

Select * from sitecontrol.dbo.cubecategory where categorycodeid=4507

--Update sitecontrol.dbo.cubecategory set EndDt=null where categorycodeid=4507

Select * from sitecontrol.dbo.categorycode where category in ('kyf')

--Update sitecontrol.dbo.categorycode set Isfull=1,FD=1,FDTime=getdate() where category in ('kyf')

Select * from MT2SQL14.SITECONTROL.DBO.vwCubeCategory where category='kyf'

--Update sitecontrol.dbo.categorycode Set IsPDT=1,ClientPDT=1,IsFull=1,CWMFull=1,ClientRun=1 where category='kyf'

--to be done once code processsed

--Insert Into PendingSubscriptions ([SubscriptionID],[DeliveryDate],[OnHold])
Select Distinct [SubscriptionID],[DeliveryDate],[OnHold] from archivesub.dbo.PendingSubscriptions where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4507)) 
and DeliveryDate >= getdate()-1
order by DeliveryDate 

Select * from Subscription.dbo.PendingSubscriptions where SubscriptionId in (Select SubscriptionID from Subscription.dbo.Subscription where categorycodeid in (4507))

--to be done once code processsed

--Insert Into CategoryDefaultQuery ([ClientId],[CategoryCodeId],[QueryId])
Select Distinct [ClientId],[CategoryCodeId],[QueryId] from archivesub.dbo.CategoryDefaultQuery where categorycodeid in (4507)

Select * from Subscription.dbo.CategoryDefaultQuery where categorycodeid in (4507)

--SET IDENTITY_INSERT DashboardReport ON
--Insert Into DashboardReport ([ReportId],[ClientId],[RoleId],[Seq],[Title],[CategoryCodeId],[QueryId],[ReportType],[SummaryTemplateId],[ConfigurableFields],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[HTMLReportPath],[ExcelReportPath],[QueryResultCount],[SummaryResultCount])
--Select Distinct [ReportId],[ClientId],[RoleId],[Seq],[Title],[CategoryCodeId],[QueryId],[ReportType],[SummaryTemplateId],[ConfigurableFields],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[HTMLReportPath],[ExcelReportPath],[QueryResultCount],[SummaryResultCount] from archivesub.dbo.DashboardReport where categorycodeid in (4507)
--SET IDENTITY_INSERT DashboardReport OFF

Select * from Subscription.dbo.DashboardReport where categorycodeid in (4507)

--SET IDENTITY_INSERT DashboardChart ON
--Insert Into DashboardChart ([ChartId],[ClientId],[Title],[Section],[Seq],[CategoryCodeId],[QueryId],[SummaryTemplateId],[ChartType],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[ChartDataFilePath],[RoleId],[ExcelReportPath],[QueryResultCount],[SummaryResultCount])
--Select Distinct [ChartId],[ClientId],[Title],[Section],[Seq],[CategoryCodeId],[QueryId],[SummaryTemplateId],[ChartType],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[ChartDataFilePath],[RoleId],[ExcelReportPath],[QueryResultCount],[SummaryResultCount] from archivesub.dbo.DashboardChart where categorycodeid in (4507)
--SET IDENTITY_INSERT DashboardChart OFF

Select * from Subscription.dbo.DashboardChart where categorycodeid in (4507)

--Insert Into MasterClientCWM
Select * from MT2SQL14.archivesub.dbo.MasterClientCWM where categorycodeid in (4507)

Select * from MT2SQL00.MasterClientCoverage.dbo.MasterClientCWM where categorycodeid in (4507)

--Insert Into ClientCWMChanges
Select * from MT2SQL14.archivesub.dbo.ClientCWMChanges where categorycodeid in (4507)

Select * from MT2SQL00.MasterClientCoverage.dbo.ClientCWMChanges where categorycodeid in (4507)


--Insert Into ClientCWMChanges
Select * from MT2SQL14.archivesub.dbo.ClientCWMException where categorycodeid in (4507)

Select * from MT2SQL00.MasterClientCoverage.dbo.ClientCWMException where categorycodeid in (4507)

--Record Set
Select * from sitecontrol.dbo.categorycode where ID = 4507


Use ClientRecordset

--SET IDENTITY_INSERT recordset ON
--Insert Into recordset ([ReportID],[ReportDownloadDT],[ClientID],[TotalNoOfRecords],[SavedAs],[Type],[FirstDisplayPage],[CompareAdMode],[CWMOnly],[LastAccessedDt],[CategoryCodeId],[UserID],[IsTempRecordset])
--Select distinct [ReportID],[ReportDownloadDT],[ClientID],[TotalNoOfRecords],[SavedAs],[Type],[FirstDisplayPage],[CompareAdMode],[CWMOnly],[LastAccessedDt],[CategoryCodeId],[UserID],[IsTempRecordset] from ArchiveCRS.dbo.recordset where categorycodeid in (4507)
--SET IDENTITY_INSERT recordset OFF

Select * from recordset where categorycodeid in (4507) 

--Insert Into RecordSetDetail ([ReportID],[PageDetailID])
Select Distinct [ReportID],[PageDetailID] from ArchiveCRS.dbo.RecordSetDetail where ReportID in (Select ReportID from ArchiveCRS.dbo.recordset where categorycodeid in (4507))

Select * from RecordSetDetail where ReportID in (Select ReportID from recordset where categorycodeid in (4507))

--Select * from archivesub.dbo.categorycode where ClientID = 699

--Select * from archivesub.dbo.clientprofile where clientname = 'Key Food'

Select * from FlashReport.dbo.FRRetMkt where clientid=699

Select * from FlashReport.dbo.clientvalues where clientid not in (Select ClientID from FlashReport.dbo.ClientDeliverables)

--Update FlashReport.dbo.clientvalues set [LastEditedBY]='markh' where clientid=699

--Insert Into ClientValues ([ClientID],[Company],[HTML],[FSI],[NOFSIRS],[FSIPPT],[Detail],[DetailPPT],[XLSzip],[XLSattach],[PPTzip],[PPTattach],[ExcelInstructions],[Sendername],[SenderReturnAddress],[EmailSubject],[CompanyContact],[CompanyContactPhone],[CompanyContactEmail],[Signature],[CRSImageReportNameDetail],[ShowCRSImageReportDetail],[CRSImageReportNameFSI],[ShowCRSImageReportFSI],[PPTNameDetail],[PPTNameFSI],[XLSName],[EmailBodyRS],[EmailBody],[PPTBodyRS],[PPTBody],[PPTFSIBodyRS],[PPTFSIBody],[Adview2],[Active],[Locked],[LastEditedBY],[LastEditedOn],[ExcludedTradeClasses],[ExcludeAdvertiserMarket],[LogoName],[SignatureLogoFileName],[EmailBodyMW],[EmailSubjectMW])
Select [ClientID],[Company],[HTML],[FSI],[NOFSIRS],[FSIPPT],[Detail],[DetailPPT],[XLSzip],[XLSattach],[PPTzip],[PPTattach],[ExcelInstructions],[Sendername],[SenderReturnAddress],[EmailSubject],[CompanyContact],[CompanyContactPhone],[CompanyContactEmail],[Signature],[CRSImageReportNameDetail],[ShowCRSImageReportDetail],[CRSImageReportNameFSI],[ShowCRSImageReportFSI],[PPTNameDetail],[PPTNameFSI],[XLSName],[EmailBodyRS],[EmailBody],[PPTBodyRS],[PPTBody],[PPTFSIBodyRS],[PPTFSIBody],[Adview2],[Active],[Locked],'ramt' as [LastEditedBY],getdate() as [LastEditedOn],[ExcludedTradeClasses],[ExcludeAdvertiserMarket],[LogoName],'SignatureLogo.jpg' as [SignatureLogoFileName],NULL as [EmailBodyMW],NULL as [EmailSubjectMW] from FlashReport.dbo.deletedclientvalues where clientid=699

Select * from FlashReport.dbo.ClientValues where clientid=699

--Delete from FlashReport.dbo.DeletedClientValues where clientid=699

--Select * from FlashReport.dbo.DeletedClientValues where clientid=699

--Select * from FlashReport.dbo.ClientDeliverables where clientid=699

--Select * from FlashReport.dbo.DeletedClientDeliverables where clientid=699

--Record Set

