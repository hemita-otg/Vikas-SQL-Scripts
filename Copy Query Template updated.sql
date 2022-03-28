
Declare @clientid int
Declare @basedonlinkseq int
Declare @dispseq int
Declare @numdispseq int 
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
Declare @Dcategory varchar(15)
DECLARE qptemplate CURSOR
READ_ONLY
FOR Select SQueryTemplateID, DQueryTemplateID, Dcategory from xferqptemplate where dcategory <> 'FSI' order by SCategory

OPEN qptemplate
FETCH NEXT FROM qptemplate INTO @STemplateID, @DTemplateID, @Dcategory
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		delete from queryviewtemplatesdetail where querytemplateid = @DTemplateID
		insert into queryviewtemplatesdetail 
		select @DTemplateID, FieldId, DisplaySeq, DisplayName, SelectionPage, HelpMeSelect, SortTableOrder, SortSeq, SortType, NumericTableSeq, ComparisionSeq, ConditionSeq, BasedOnLinkSeq, ExpressionSeq, AdvConditionSeq
		from mt2dev1.sitecontrol.dbo.queryviewtemplatesdetail where querytemplateid = @STemplateID

	END
	

	update queryviewtemplatesdetail set selectionpage=1 where displayseq is not null and basedonlinkseq is null and querytemplateid = @DTemplateID
	update queryviewtemplatesdetail set DisplayName = 'Product Description' Where FieldID = 58 and querytemplateid = @DTemplateID
	update queryviewtemplatesdetail set DisplayName = 'Unit Price - Sale' Where FieldID = 40 and querytemplateid = @DTemplateID
	update queryviewtemplatesdetail set DisplayName = 'Unit Price - Reg.' Where FieldID = 35 and querytemplateid = @DTemplateID

	if not exists(select * from queryviewtemplatesdetail where fieldid = 35 
			and querytemplateid = @DTemplateID)
	begin
		
		insert into queryviewtemplatesdetail
		select @DTemplateID, 35, null, 'Unit Price - Reg.',1,null,null,null,null,null,null,null,null ,null,null

		select @numdispseq = numerictableseq from queryviewtemplatesdetail where fieldid = 40 
			and querytemplateid = @DTemplateID and numerictableseq is not null

		update 	queryviewtemplatesdetail set numerictableseq = numerictableseq + 1 where
		querytemplateid = @DTemplateID and numerictableseq > @numdispseq

		update 	queryviewtemplatesdetail set numerictableseq = @numdispseq + 1 where
		querytemplateid = @DTemplateID and FieldiD = 35
	end

	if exists(select * from queryviewtemplatesdetail where querytemplateid = @DTemplateID
			and ((displayseq is not null) and basedonlinkseq is not null) and count(displayseq) > 8)
--	if exists(select * from categorycode cc where (cc.ispdt=1 or cc.clientpdt=1) and category = @Dcategory )
	begin
		delete from queryviewtemplatesdetail where fieldid=137 and querytemplateid = @DTemplateID
		
		select @basedonlinkseq = max(basedonlinkseq) from queryviewtemplatesdetail where 
					querytemplateid = @DTemplateID 
		
		select @dispseq = max(DisplaySeq) from queryviewtemplatesdetail where 
					querytemplateid = @DTemplateID 

		if not exists(select * from queryviewtemplatesdetail where fieldid = 182 
				and querytemplateid = @DTemplateID)
		begin
			insert into queryviewtemplatesdetail
			select @DTemplateID, 182, @dispseq + 1, 'Alternate Condition',0,0,0,0,null,null,null,null,@basedonlinkseq+1,null,null
		end
		
		if not exists(select * from queryviewtemplatesdetail where fieldid = 170 
				and querytemplateid = @DTemplateID)
		begin
			insert into queryviewtemplatesdetail
			select @DTemplateID, 170, @dispseq + 2, 'Expression Builder',0,0,0,0,null,null,null,null,@basedonlinkseq + 2 ,null,null
		end
			
	end




	FETCH NEXT FROM qptemplate INTO @STemplateID, @DTemplateID, @Dcategory
END

CLOSE qptemplate
DEALLOCATE qptemplate
GO



