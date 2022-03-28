Declare @clientid int
set @clientid = 981

delete from xferqptemplate

insert into xferqptemplate

Select * from 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from categorycode as a join (
Select clientid, categorycodeid from subscription..clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = 0
) x
join 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from mt2dev1.sitecontrol.dbo.categorycode as a join (
Select clientid, categorycodeid from mt2dev1.subscription.dbo.clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join mt2dev1.sitecontrol.dbo.reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = 0) y
on x.clientid = y.clientid and x.category = y.category


--CWM Templates

DECLARE @STemplateID int
Declare @DTemplateID int
DECLARE Reporttemplate CURSOR
READ_ONLY
FOR Select STemplateID, DTemplateID from xferReporttemplate where DCategory <> 'FSI' order by SCategory

OPEN Reporttemplate
FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		delete from reportformattemplatesdetail where rpttemplateid = @DTemplateID
		insert into reportformattemplatesdetail 
		select @DTemplateID,RptTemplateID,FieldID,DisplaySeq,DisplayName,Filter,Link,AdsDisplaySeq
		from mt2dev1.sitecontrol.dbo.reportformattemplatesdetail where rpttemplateid = @STemplateID

	END
	FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
END

CLOSE Reporttemplate
DEALLOCATE Reporttemplate
GO

--PDT template

Declare @clientid int
set @clientid = 981

delete from xferqptemplate

insert into xferqptemplate

Select * from 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from categorycode as a join (
Select clientid, categorycodeid from subscription..clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = 1
) x
join 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from mt2dev1.sitecontrol.dbo.categorycode as a join (
Select clientid, categorycodeid from mt2dev1.subscription.dbo.clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join mt2dev1.sitecontrol.dbo.reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = 1) y
on x.clientid = y.clientid and x.category = y.category


-- Copy Templates
DECLARE @STemplateID int
Declare @DTemplateID int
DECLARE Reporttemplate CURSOR
READ_ONLY
FOR Select STemplateID, DTemplateID from xferReporttemplate where DCategory <> 'FSI' order by SCategory

OPEN Reporttemplate
FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		delete from reportformattemplatesdetail where rpttemplateid = @DTemplateID
		insert into reportformattemplatesdetail 
		select @DTemplateID,RptTemplateID,FieldID,DisplaySeq,DisplayName,Filter,Link,AdsDisplaySeq
		from mt2dev1.sitecontrol.dbo.reportformattemplatesdetail where rpttemplateid = @STemplateID

	END
	FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
END

CLOSE Reporttemplate
DEALLOCATE Reporttemplate
GO








