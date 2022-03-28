
select * from TempBevALMultiplePageValues where pagedetailid = '0046953B277'

select * from TempBevALMultiplePageValues A , 
(select Pagedetailid, FieldName, Fieldvalue, NewValue from TempBevALMultiplePageValues) B
where a.pagedetailid=b.pagedetailid and a.fieldname = b.fieldname and a.newvalue = b.newvalue and not a.fieldvalue = b.fieldvalue


Update TempBevALMultiplePageValues Set FieldValue = NewValue Where  NewValue Is Not Null and Not rtrim(ltrim(NewValue)) = ''
GO

Delete From TempBevALMultiplePageValues 
Where Pagedetailid in (Select PageDetailID From BevAlMaster_Multiple )
GO

Insert Into TempBevALMultiplePageValues
Select Distinct PageDetailID + PostFix, 'Variety', Variety, Variety, oVariety from BevAlMaster_Multiple Where ID_Master = 0
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[BevAlMaster_Multiple]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [BevAlMaster_Multiple]
GO
----Split by Category Ends


Delete B From TempBevALPageDetailTable A
Join TempBevALMultiplePageValues B On A.PageDetailID = B.PageDetailID And A.Variety = B.FieldValue 
And B.FieldName = 'Variety'
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[BevAlMasterMVP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [BevAlMasterMVP]
GO

Select Distinct PageDetailID, FieldName, FieldValue Into BevAlMasterMVP from TempBevALMultiplePageValues
GO

Drop table TempBevALMultiplePageValues
GO

exec sp_rename 'BevAlMasterMVP', 'TempBevALMultiplePageValues'
Go

Alter Table TempBevALMultiplePageValues Add CONSTRAINT [PK_TempBevALMultiplePageValues] PRIMARY KEY  CLUSTERED 
	(
		[PageDetailID],
		[FieldName],
		[FieldValue]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 

--Updates for BevAl records End ----Park Unassigned Records End --


--Insert the TempBevAl PDT and MPV into MasterBevAL Start --
Delete from MasterBevAL..BevALMasterPageDetailTable where pagedetailid in (Select distinct pagedetailid from TempBevALPageDetailTable)

Insert into MasterbevAL..BevALMasterPageDetailTable
Select * from TempBevALPageDetailTable

Delete from MasterBevAL..BevALMasterMultiplePageValues where pagedetailid in (Select distinct pagedetailid from TempBevALMultiplePageValues)

Insert into MasterbevAL..BevALMasterMultiplePageValues
Select * from TempBevALMultiplePageValues
--Insert the TempBevAl PDT and MPV into MasterBevAL End --