--CategoryCode Insertion : Start

/*
SET IDENTITY_INSERT categorycode ON
insert into MT2Dev2.sitecontrol50.dbo.categorycode
([ID],ClientID,Category,ClientServer,IsPDT,ClientPDT,IsFSI,IsAdlert,IsMaster,CWMFull,SourceCWM,ExceptionCWMFullSourceCode,IsFull,FullSourceCode,PartialSourceCode,Index_Type,MasterIndex,IsConcat,CatOnly,BUMfr,BUPT,BUPTG,BUPTSG,BUDt,BURn,BUST,BUSTG,BUSTSG,IsWeekOf,IsEvent,IsTheme,IsPublication,ProcessOrder,Run,ClientRun,Error,PartialRunDate,FullRunDate,ClientFullRundate,ClientPartialRundate,CWMFullRunDate,CWMPartialRunDate,ClientCWMFullRunDate,ClientCWMPartialRunDate,IsOD,IsNORUnit)
select
[ID],ClientID,Category,ClientServer,IsPDT,ClientPDT,IsFSI,IsAdlert,IsMaster,CWMFull,SourceCWM,ExceptionCWMFullSourceCode,IsFull,FullSourceCode,PartialSourceCode,Index_Type,MasterIndex,IsConcat,CatOnly,BUMfr,BUPT,BUPTG,BUPTSG,BUDt,BURn,BUST,BUSTG,BUSTSG,IsWeekOf,IsEvent,IsTheme,IsPublication,ProcessOrder,Run,ClientRun,Error,PartialRunDate,FullRunDate,ClientFullRundate,ClientPartialRundate,CWMFullRunDate,CWMPartialRunDate,ClientCWMFullRunDate,ClientCWMPartialRunDate,IsOD,IsNORUnit
from mt2sql04.sitecontrol.dbo.categorycode where category in 
(
'fdmpg50', 'fsigil50', 'FSIPNG50', 'gil50', 'PG1550', 'PGAH50', 'PGAP50', 'PGCVS50', 'PGDE50', 'PGDEC50', 'PGECK50', 'pgFH50', 'pgfr150', 'pgfr50', 'PGFYM50', 'PGGE50',
 'pgHB50', 'pgHEB50', 'PGhist50', 'PGHV50', 'PGIC50', 'pgint50', 'PGKMT50', 'PGKW50', 'PGLNG50', 'PGMEI50', 'PGNBDCon50', 'PGPAT50', 'PGpbrop50', 'pgPG50', 'PGPR50', 
'PGRA50', 'PGSA50', 'PGSHO50', 'PGSKU50', 'PGSVD50', 'PGTAR50', 'pgtest50', 'PGWAK50', 'PGWAL50', 'PGWC50', 'PGWEG50', 'PGWLM50', 'adcgr50', 'adUNI50', 'FSIUNI50', 
'UNI50', 'UNIAH50', 'UNIALB50', 'UNICVS50', 'uniDEO50', 'UNIDRES50', 'UNIFC50', 'uniHAIR50', 'UNIhist50', 'uniice50', 'UNIKR50', 'uniMEAL50', 'UNINDR50', 'uniod50',
 'UNISAF50', 'uniSKIN50', 'UNISO50', 'UNItest50', 'uniVIT50', 'UNIWAG50', 'UNIWLM50', 'mayssi50', 'fsikel50', 'kelONL50', 'XADFDMKEL5', 'adGAL50', 'galUPC50', 'galx50',
 'sea50', 'adsvl50', 'svl50', 'svlACM50', 'svlBIG50', 'svlCUB50', 'svlFAR50', 'svlhist50', 'svlINT50', 'svlJWL50', 'svlNW50', 'svlprod50', 'svlSCA50', 'svlSCApl50', 
'svlSFW50', 'svlSHA50', 'svlSNS50', 'ahld50', 'ahls50'
)
SET IDENTITY_INSERT  categorycode OFF
*/
--CategoryCode Insertion : End

--TableNames Insertion : Start
--cursor start
declare @CatCode varchar(35)
declare @catcodeID integer
declare @SQL varchar(5000)

set @CatCode = ''
set @SQL = ''

declare curRMC cursor for
select Category,[id] from Mt2SQL04.sitecontrol.dbo.categorycode where category in 
(
'fdmpg50', 'fsigil50', 'FSIPNG50', 'gil50', 'PG1550', 'PGAH50', 'PGAP50', 'PGCVS50', 'PGDE50', 'PGDEC50', 'PGECK50', 'pgFH50', 'pgfr150', 'pgfr50', 'PGFYM50', 'PGGE50',
 'pgHB50', 'pgHEB50', 'PGhist50', 'PGHV50', 'PGIC50', 'pgint50', 'PGKMT50', 'PGKW50', 'PGLNG50', 'PGMEI50', 'PGNBDCon50', 'PGPAT50', 'PGpbrop50', 'pgPG50', 'PGPR50', 
'PGRA50', 'PGSA50', 'PGSHO50', 'PGSKU50', 'PGSVD50', 'PGTAR50', 'pgtest50', 'PGWAK50', 'PGWAL50', 'PGWC50', 'PGWEG50', 'PGWLM50', 'adcgr50', 'adUNI50', 'FSIUNI50', 
'UNI50', 'UNIAH50', 'UNIALB50', 'UNICVS50', 'uniDEO50', 'UNIDRES50', 'UNIFC50', 'uniHAIR50', 'UNIhist50', 'uniice50', 'UNIKR50', 'uniMEAL50', 'UNINDR50', 'uniod50',
 'UNISAF50', 'uniSKIN50', 'UNISO50', 'UNItest50', 'uniVIT50', 'UNIWAG50', 'UNIWLM50', 'mayssi50', 'fsikel50', 'kelONL50', 'XADFDMKEL5', 'adGAL50', 'galUPC50', 'galx50',
 'sea50', 'adsvl50', 'svl50', 'svlACM50', 'svlBIG50', 'svlCUB50', 'svlFAR50', 'svlhist50', 'svlINT50', 'svlJWL50', 'svlNW50', 'svlprod50', 'svlSCA50', 'svlSCApl50', 
'svlSFW50', 'svlSHA50', 'svlSNS50', 'ahld50', 'ahls50'
)
open curRMC
fetch next from curRMC
into @CatCode,@catcodeID

while @@fetch_Status = 0
begin

	Set @SQL='insert into tablenames (MasterTableName,ClientTableName,TableID,CategoryCodeID)
	 	values(''' + @CatCode + 'MPVPageEvent'',''' + @CatCode + 'MPVPageEvent'',57,' + cast(@catcodeID as varchar(50) ) + ')'

	Exec (@SQL)

	Set @SQL='insert into tablenames (MasterTableName,ClientTableName,TableID,CategoryCodeID)
	 	values(''' + @CatCode + 'MPVorigin'',''' + @CatCode + 'MPVorigin'',59,' + cast(@catcodeID as varchar(50) ) + ')'

	Exec (@SQL)

	Set @SQL='insert into tablenames (MasterTableName,ClientTableName,TableID,CategoryCodeID)
	 	values(''' + @CatCode + 'MPVvariety'',''' + @CatCode + 'MPVvariety'',58,' + cast(@catcodeID as varchar(50) ) + ')'

	Exec (@SQL)

	Set @SQL='insert into tablenames (MasterTableName,ClientTableName,TableID,CategoryCodeID)
	 	values(''' + @CatCode + 'MPVOffer'',''' + @CatCode + 'MPVOffer'',60,' + cast(@catcodeID as varchar(50) ) + ')'

	Exec (@SQL)

	Set @SQL='insert into tablenames (MasterTableName,ClientTableName,TableID,CategoryCodeID)
	 	values(''' + @CatCode + 'MPVOfferType'',''' + @CatCode + 'MPVOfferType'',61,' + cast(@catcodeID as varchar(50) ) + ')'

	Exec (@SQL)

	
	--Tablename : Update Start
	Set @SQL='Update tablenames set MasterTableName=''' + @CatCode + 'DisPageEvent'',ClientTableName=''' + @CatCode + 'DisPageEvent''
		where tableid=7 and CategoryCodeID =  ' + cast(@catcodeID as varchar(50) )	 	
	Exec  (@SQL)

	Set @SQL='Update tablenames set MasterTableName=''' + @CatCode + 'DisFeatures'',ClientTableName=''' + @CatCode + 'DisFeatures''
		where tableid=8 and CategoryCodeID = ' + cast(@catcodeID as varchar(50) )	 	
	Exec  (@SQL)

	Set @SQL='Update tablenames set MasterTableName=''MasterDynamicDateRangeFV50'',ClientTableName=''MasterDynamicDateRangeFV50''
		where tableid=6 and CategoryCodeID =  ' + cast(@catcodeID as varchar(50) )		 	
	Exec  (@SQL)

	Set @SQL='Update tablenames set MasterTableName=''' + @CatCode + 'DisMedia'',ClientTableName=''' + @CatCode + 'DisMedia''
		where tableid=15 and CategoryCodeID =  ' + cast(@catcodeID as varchar(50) )	 	
	Exec  (@SQL)

	--Tablename : Update End




	
fetch next from curRMC
into @CatCode,@catcodeID

END                       
close curRMC
deallocate curRMC
--cursor end

--TableNames Insertion : End
--Tablename : Update Start



--Tablename : Update End

--QP Templates Insertion : Start 

select QueryTemplateID 
--into tempdb..QPID 
FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWcontrol where categorycodeid in 
(select [id] from mt2sql04.sitecontrol.dbo.categorycode where category in 
(
'fdmpg50', 'fsigil50', 'FSIPNG50', 'gil50', 'PG1550', 'PGAH50', 'PGAP50', 'PGCVS50', 'PGDE50', 'PGDEC50', 'PGECK50', 'pgFH50', 'pgfr150', 'pgfr50', 'PGFYM50', 'PGGE50',
 'pgHB50', 'pgHEB50', 'PGhist50', 'PGHV50', 'PGIC50', 'pgint50', 'PGKMT50', 'PGKW50', 'PGLNG50', 'PGMEI50', 'PGNBDCon50', 'PGPAT50', 'PGpbrop50', 'pgPG50', 'PGPR50', 
'PGRA50', 'PGSA50', 'PGSHO50', 'PGSKU50', 'PGSVD50', 'PGTAR50', 'pgtest50', 'PGWAK50', 'PGWAL50', 'PGWC50', 'PGWEG50', 'PGWLM50', 'adcgr50', 'adUNI50', 'FSIUNI50', 
'UNI50', 'UNIAH50', 'UNIALB50', 'UNICVS50', 'uniDEO50', 'UNIDRES50', 'UNIFC50', 'uniHAIR50', 'UNIhist50', 'uniice50', 'UNIKR50', 'uniMEAL50', 'UNINDR50', 'uniod50',
 'UNISAF50', 'uniSKIN50', 'UNISO50', 'UNItest50', 'uniVIT50', 'UNIWAG50', 'UNIWLM50', 'mayssi50', 'fsikel50', 'kelONL50', 'XADFDMKEL5', 'adGAL50', 'galUPC50', 'galx50',
 'sea50', 'adsvl50', 'svl50', 'svlACM50', 'svlBIG50', 'svlCUB50', 'svlFAR50', 'svlhist50', 'svlINT50', 'svlJWL50', 'svlNW50', 'svlprod50', 'svlSCA50', 'svlSCApl50', 
'svlSFW50', 'svlSHA50', 'svlSNS50', 'ahld50', 'ahls50'
))

/*
SET IDENTITY_INSERT QUERYVIEWTEMPLATES ON
INSERT INTO MT2Dev2.Sitecontrol50.dbo.QUERYVIEWTEMPLATES
(QueryTemplateID,TemplateName)
SELECT QueryTemplateID,TemplateName
 FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWTEMPLATES WHERE QUERYTEMPLATEID IN 
(select querytemplateid from tempdb..QPID)
SET IDENTITY_INSERT  QUERYVIEWTEMPLATES OFF
*/

/*
INSERT INTO mt2dev2.sitecontrol50.dbo.QUERYVIEWTEMPLATESDETAIL
SELECT [QueryTemplateID], [FieldId], [DisplaySeq], [DisplayName], [SelectionPage], [HelpMeSelect], [SortTableOrder], [SortSeq], [SortType], [NumericTableSeq], [ComparisionSeq], [ConditionSeq], [BasedOnLinkSeq], [ExpressionSeq], [AdvConditionSeq], Null
 FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWTEMPLATESDETAIL WHERE QUERYTEMPLATEID IN 
(select querytemplateid from tempdb..QPID where querytemplateid not in 
(select querytemplateid from mt2dev2.sitecontrol50.dbo.QUERYVIEWTEMPLATESDETAIL))

INSERT INTO mt2dev2.sitecontrol50.dbo.QUERYVIEWCONTROL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.QUERYVIEWCONTROL WHERE QUERYTEMPLATEID IN 
(select querytemplateid from tempdb..QPID )
*/

--QP Templates Insertion : End


--Report Templates Insertion : Start 

select RptTemplateID 
into tempdb..RPID 
FROM MT2SQL04.SITECONTROL.DBO.ReportFormatcontrol where categorycodeid in 
(select [id] from mt2sql04.sitecontrol.dbo.categorycode where category in 
(
'fdmpg50', 'fsigil50', 'FSIPNG50', 'gil50', 'PG1550', 'PGAH50', 'PGAP50', 'PGCVS50', 'PGDE50', 'PGDEC50', 'PGECK50', 'pgFH50', 'pgfr150', 'pgfr50', 'PGFYM50', 'PGGE50',
 'pgHB50', 'pgHEB50', 'PGhist50', 'PGHV50', 'PGIC50', 'pgint50', 'PGKMT50', 'PGKW50', 'PGLNG50', 'PGMEI50', 'PGNBDCon50', 'PGPAT50', 'PGpbrop50', 'pgPG50', 'PGPR50', 
'PGRA50', 'PGSA50', 'PGSHO50', 'PGSKU50', 'PGSVD50', 'PGTAR50', 'pgtest50', 'PGWAK50', 'PGWAL50', 'PGWC50', 'PGWEG50', 'PGWLM50', 'adcgr50', 'adUNI50', 'FSIUNI50', 
'UNI50', 'UNIAH50', 'UNIALB50', 'UNICVS50', 'uniDEO50', 'UNIDRES50', 'UNIFC50', 'uniHAIR50', 'UNIhist50', 'uniice50', 'UNIKR50', 'uniMEAL50', 'UNINDR50', 'uniod50',
 'UNISAF50', 'uniSKIN50', 'UNISO50', 'UNItest50', 'uniVIT50', 'UNIWAG50', 'UNIWLM50', 'mayssi50', 'fsikel50', 'kelONL50', 'XADFDMKEL5', 'adGAL50', 'galUPC50', 'galx50',
 'sea50', 'adsvl50', 'svl50', 'svlACM50', 'svlBIG50', 'svlCUB50', 'svlFAR50', 'svlhist50', 'svlINT50', 'svlJWL50', 'svlNW50', 'svlprod50', 'svlSCA50', 'svlSCApl50', 
'svlSFW50', 'svlSHA50', 'svlSNS50', 'ahld50', 'ahls50'
))

/*
SET IDENTITY_INSERT REPORTFORMATTEMPLATES ON
INSERT INTO mt2dev2.sitecontrol50.dbo.REPORTFORMATTEMPLATES
(RptTemplateID,TemplateName)
SELECT RptTemplateID,TemplateName
 FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATTEMPLATES WHERE RPTTEMPLATEID IN (select rpttemplateid from tempdb..RPID) 
SET IDENTITY_INSERT  REPORTFORMATTEMPLATES OFF
*/
/*
INSERT INTO mt2dev2.sitecontrol50.dbo.REPORTFORMATTEMPLATESDETAIL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATTEMPLATESDETAIL WHERE RPTTEMPLATEID IN (
select RPTTEMPLATEID from tempdb..RPID where RPTTEMPLATEID not in 
(select RPTTEMPLATEID from mt2dev2.sitecontrol50.dbo.REPORTFORMATTEMPLATESDETAIL)) 
*/
/*
INSERT INTO mt2dev2.sitecontrol50.dbo.REPORTFORMATCONTROL
SELECT * FROM MT2SQL04.SITECONTROL.DBO.REPORTFORMATCONTROL WHERE RPTTEMPLATEID IN (select rpttemplateid from tempdb..RPID) 
*/


--Report Templates Insertion : END




--FieldID modification for Month(2) to AdMonth(161) in QPTemplates Detail : Start 
update T set FieldId=161 from mt2dev2.sitecontrol50.dbo.QUERYVIEWTEMPLATESDETAIL T where fieldid=2 and displayseq is not null
Select * from mt2dev2.sitecontrol50.dbo.QUERYVIEWTEMPLATESDETAIL where fieldid=2 and displayseq is not null
--FieldID modification for Month(2) to AdMonth(161) in QPTemplates Detail : End

--AdvQPDisplaySeq - setting as per Categorycodeid=320 - QP tempalteid=182 : Start
update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=1
Where Fieldid in (4,6,12,32,89)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)


update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=2
Where Fieldid in (1,13,34,79,161)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=3
Where Fieldid in (3,5,14,40)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=4
Where Fieldid in (11,35)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=5
Where Fieldid in (15,48,58)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=6
Where Fieldid in (36,152)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=7
Where Fieldid in (22,39,55)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=8
Where Fieldid in (20,42,56)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=9
Where Fieldid in (10,43,888)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=10
Where Fieldid in (45)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)


update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=11
Where Fieldid in (46)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=12
Where Fieldid in (60)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=13
Where Fieldid in (77)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)

update QueryviewTemplatesDetail
Set AdvQPDisplaySeq=Null
Where Fieldid in (31,72,132,136,138,153,170,182,190)
and querytemplateid in 
(select querytemplateid from tempdb..QPID)
--AdvQPDisplaySeq - setting as per Categorycodeid=320 - QP tempalteid=182 :End

