/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [SiteControl].[dbo].[tbl_lookup]
  where categoryvalue='adtype'


  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [dbo].[tbl_lookup]
  where categoryvalue='persona'

  insert into tbl_lookup (categorytype,CategoryValue,CreatedOn)
  
  select categorytype ,'AdType',getdate() from [tbl_lookup]
  where categoryvalue='addist' and categorytype not in ('ClientTable','ClientTableInsert')


--  drop table [tbl_lookup]

CREATE TABLE [dbo].[tbl_lookup](
 [ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 [CategoryType] [varchar](100) NOT NULL,
 [CategoryValue] [varchar](350) NOT NULL,
 [CreatedOn] [datetime] NULL
 
) ON [PRIMARY]

GO

  insert into tbl_lookup (categorytype,CategoryValue,CreatedOn)
   select categorytype,CategoryValue,CreatedOn from mt2asql06.sitecontrol.dbo.[tbl_lookup]
  
select * from tbl_lookup where categoryvalue like '%addist%'
select * from tbl_lookup where categoryvalue like '%adtype%'


--update tbl_lookup set categoryvalue='AdType' where  id=477
  insert into tbl_lookup (categorytype,CategoryValue,CreatedOn)
  select categorytype ,'AdType',getdate() from [tbl_lookup]
  where categoryvalue='addist' and categorytype not in ('ClientTable','ClientTableInsert')


  insert into tbl_lookup (categorytype,CategoryValue,CreatedOn)
  select categorytype ,'AdTypeID',getdate() from [tbl_lookup]
  where categoryvalue='adtype' 


insert into tbl_lookup (categorytype,CategoryValue,CreatedOn)
  select categorytype ,'AdDistID',getdate() from [tbl_lookup]
  where categoryvalue='adtype' 


  use sql10

  update categorycodetable set isfull=0 where category='hal50'


Exec CreateClientCWMtable_50 'hal50', '', 0
select top 10 * from hal50flyerreports
select top 10 * from hal50pagereports

Exec CreateClienttables_50_PdtIdInt 'hal50', '', 0


select top 10 * from hal50detailreports

Exec CreateClientCWMtable_50 'imp', '', 0
select top 10 * from impflyerreports
select top 10 * from imppagereports

Exec CreateClienttables_50_PdtIdInt 'imp', '', 0
select top 10 * from impdetailreports

alter table impdetailreports drop column Adtype


ALTER TABLE impdetailreports ADD AdType varchar(100)
ALTER TABLE impdetailreports ADD AdTypeID Int
ALTER TABLE impdetailreports ADD AdDistID Int
