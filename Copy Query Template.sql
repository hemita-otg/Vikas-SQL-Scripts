Declare @clientid int
set @clientid = 981

delete from xferqptemplate

insert into xferqptemplate
Select * from 
(select b.clientid, a.ID as categorycodeid, a.category, c.querytemplateid from categorycode as a join (
Select clientid, categorycodeid from subscription..clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join queryviewcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = 981
) x
join 
(select b.clientid, a.ID as categorycodeid, a.category, c.querytemplateid from mt2dev1.sitecontrol.dbo.categorycode as a join (
Select clientid, categorycodeid from mt2dev1.subscription.dbo.clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join mt2dev1.sitecontrol.dbo.queryviewcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = 981) y
on x.clientid = y.clientid and x.category = y.category


-- Copy Templates
DECLARE @STemplateID int
Declare @DTemplateID int
DECLARE qptemplate CURSOR
READ_ONLY
FOR Select SQueryTemplateID, DQueryTemplateID from xferqptemplate where DCategory <> 'FSI' order by SCategory

OPEN qptemplate
FETCH NEXT FROM qptemplate INTO @STemplateID, @DTemplateID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		delete from queryviewtemplatesdetail where querytemplateid = @DTemplateID
		insert into queryviewtemplatesdetail 
		select @DTemplateID, FieldId, DisplaySeq, DisplayName, SelectionPage, HelpMeSelect, SortTableOrder, SortSeq, SortType, NumericTableSeq, ComparisionSeq, ConditionSeq, BasedOnLinkSeq, ExpressionSeq, AdvConditionSeq
		from mt2dev1.sitecontrol.dbo.queryviewtemplatesdetail where querytemplateid = @STemplateID

	END
	FETCH NEXT FROM qptemplate INTO @STemplateID, @DTemplateID
END

CLOSE qptemplate
DEALLOCATE qptemplate
GO


