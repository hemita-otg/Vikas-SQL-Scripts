Declare @clientid int
Declare @templatetype int
Declare @dispseq int
set @templatetype =1
set @clientid = 981

delete from xferReporttemplate

insert into xferReporttemplate
Select * from 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from categorycode as a join (
Select clientid, categorycodeid from subscription..clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = @templatetype
) x
join 
(select b.clientid, a.ID as categorycodeid, a.category, c.rpttemplateid from mt2dev1.sitecontrol.dbo.categorycode as a join (
Select clientid, categorycodeid from mt2dev1.subscription.dbo.clientdatabases where categorycodeid is not null) b on
a.id = b.categorycodeid
join mt2dev1.sitecontrol.dbo.reportformatcontrol c on b.clientid = c.clientid and b.categorycodeid = c.categorycodeid
where b.clientid = @clientid and c.ispdttemplate = @templatetype) y
on x.clientid = y.clientid and x.category = y.category


--CWM Templates

DECLARE @STemplateID int
Declare @DTemplateID int
DECLARE Reporttemplate CURSOR
READ_ONLY
FOR Select STemplateID, DTemplateID from xferReporttemplate order by SCategory

OPEN Reporttemplate
FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		delete from reportformattemplatesdetail where rpttemplateid = @DTemplateID
		insert into reportformattemplatesdetail 
		select @DTemplateID, FieldID,DisplaySeq,DisplayName,Filter,Link,AdsDisplaySeq
		from mt2dev1.sitecontrol.dbo.reportformattemplatesdetail where rpttemplateid = @STemplateID
	
		if @templatetype = 1
		begin


			update reportformattemplatesdetail set DisplayName = 'Product Description' Where FieldID = 58 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'Offer Description' Where FieldID = 152 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'Unit Price - Sale' Where FieldID = 40 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'Unit Price - Reg.' Where FieldID = 35 and rpttemplateid = @DTemplateID

			if not exists(select * from reportformattemplatesdetail where fieldid = 35 
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 35, null, 'Unit Price - Reg.', 1, 0, null
			end

			if exists(select * from reportformattemplatesdetail where fieldid = 40 
				and rpttemplateid = @DTemplateID and displayseq is not null) 
			  and exists(select * from reportformattemplatesdetail where fieldid = 35 
				and rpttemplateid = @DTemplateID and displayseq is null) 
			begin
				select @dispseq = DisplaySeq from reportformattemplatesdetail where fieldid = 40 
					and rpttemplateid = @DTemplateID and displayseq is not null

				update 	reportformattemplatesdetail set displayseq = displayseq + 1 where
				rpttemplateid = @DTemplateID and displayseq > @dispseq

				update 	reportformattemplatesdetail set displayseq = @dispseq + 1 where
				rpttemplateid = @DTemplateID and FieldiD = 35
			end
			

			if not exists(select * from reportformattemplatesdetail where fieldid = 152 
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 152, null, 'Offer Description', 1, 0, null
			end

			if exists(select * from reportformattemplatesdetail where fieldid = 58 
				and rpttemplateid = @DTemplateID and displayseq is not null) 
			  and exists(select * from reportformattemplatesdetail where fieldid = 152 
				and rpttemplateid = @DTemplateID and displayseq is null) 
			begin
				select @dispseq = DisplaySeq from reportformattemplatesdetail where fieldid = 58 
					and rpttemplateid = @DTemplateID and displayseq is not null

				update 	reportformattemplatesdetail set displayseq = displayseq + 1 where
				rpttemplateid = @DTemplateID and displayseq > @dispseq

				update 	reportformattemplatesdetail set displayseq = @dispseq + 1 where
				rpttemplateid = @DTemplateID and FieldiD = 152
			end
		end
			
			-- month 

			if not exists(select * from reportformattemplatesdetail where fieldid = 161 
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 161, null, 'Month', 1, 0, null
			end



	

			if not exists(select * from reportformattemplatesdetail where fieldid = 160 
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 160, null, 'Day Of Week', 1, 0, null
			end


		-------		
			delete from reportformattemplatesdetail where fieldid=50 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'Ad Size' Where FieldID = 87 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'ACN Week Ending' Where FieldID = 130 and rpttemplateid = @DTemplateID
			update reportformattemplatesdetail set DisplayName = 'IRI Week Ending' Where FieldID = 131 and rpttemplateid = @DTemplateID

			if not exists(select * from reportformattemplatesdetail where fieldid = 87
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 87, null, 'Ad Size', 1, 0, null
			end

			if not exists(select * from reportformattemplatesdetail where fieldid = 130
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 130, null, 'ACN Week Ending', 1, 0, null
			end

			if not exists(select * from reportformattemplatesdetail where fieldid = 131
					and rpttemplateid = @DTemplateID)
			begin
				insert into reportformattemplatesdetail
				select @DTemplateID, 131, null, 'IRI Week Ending', 1, 0, null
			end
		-------
	END
	FETCH NEXT FROM Reporttemplate INTO @STemplateID, @DTemplateID
END

CLOSE Reporttemplate
DEALLOCATE Reporttemplate
GO


