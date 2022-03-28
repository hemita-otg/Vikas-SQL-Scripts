--1. Collect PagedetailID, FlyerID, Category, Brand, EntryComments1, Variety, SourcePagedetailID null the xxxMT records from MasterPDT where Category in ('Beer', ' Beer Alternatives')
--2. Update the SourcePagedetailID from mt2sql00.masteradviewdata.dbo.mt360pdtmap table based on the PagedetailID above step and add to the temp table
--3. Collect MPV values, SourcePagedetailID null from MasterMPV into a tempVMPV table for above PagedetailID 
--4. Update the SourcePagedetailID in step3 where there is a matching MPV value for the PagedetailID in above temp table
--5. The records that do not have a SourcePagedetailID in the tempVMPV table



/*
select  PagedetailID, FlyerID, Category, Brand, EntryComments1, Variety, null SourcePagedetailID
into MT_Records
 from MasterAdviewData..MasterPageDetailTable where Category in ('Beer', 'Beer Alternatives')
 and RIGHT(pagedetailid,2)='mt'
 */
 --303711
 
 
 select top 5 * from MT_Records 
 select top 5 * from mt2sql00.masteradviewdata.dbo.mt360pdtmap 

-- alter table MT_Records alter column sourcepagedetailid varchar(11)
 /*
 Update M
 set SourcePagedetailID =mt.sourcepagedetailid
 from MT_Records M join mt2sql00.masteradviewdata.dbo.mt360pdtmap MT
 on M.PageDetailID =MT.DestPageDetailID 
 */
 
 select  * from MT_Records where sourcepagedetailid is null 
 /*
 select pagedetailid,fieldname,fieldvalue 
 into tempVMPV
 from masteradviewdata..masterMultiplePageValues 
 where pagedetailid in (select  pagedetailid from  MT_records)
 */
 
 --Alter table tempvMPV add SourcePageDetailId varchar(11)
 
  select * from tempvMPV 
  select top 10 * from mt2sql00.masteradviewdata.dbo.mt360pdtmap 
--  update tempvMPV set sourcepagedetailid =null 

Select M.* ,mmpv.* 
--select m.* into Recordstobedeleted
-- Update M set SourcePagedetailID =mt.sourcepagedetailid
 from tempvMPV M 
 join  mt2sql00.masteradviewdata.dbo.mt360pdtmap MT on M.PageDetailID =MT.DestPageDetailID 
 Left outer join masteradviewdata..mastermultiplepagevalues mmpv on MT.Sourcepagedetailid=mmpv.pagedetailid and m.fieldname=mmpv.fieldname and m.fieldvalue=mmpv.fieldvalue 
 --where mmpv.pagedetailid is not null and mt.sourcepagedetailid in ('0685264D225')
 where m.fieldname='variety' and mmpv.pagedetailid is null and mt.sourcepagedetailid in ('0685264D225')
 
  
 /*
 Update M
 set SourcePagedetailID =mt.sourcepagedetailid
 from tempvMPV M join mt2sql00.masteradviewdata.dbo.mt360pdtmap MT
 on M.PageDetailID =MT.DestPageDetailID 

 Update M
 set SourcePagedetailID =mt.sourcepagedetailid
 from tempvMPV M join masteradviewdata..mastermultiplepagevalues mmpv 
 on m.pagedetailid=mmpv.pagedetailid and m.fieldname=mmpv.fieldname and m.fieldvalue=mmpv.fieldvalue 
 join  mt2sql00.masteradviewdata.dbo.mt360pdtmap MT
 on mmpv.PageDetailID =MT.DestPageDetailID 


 */

  select * from tempvMPV where sourcepagedetailid is null and fieldname = 'variety' and pagedetailid in ('14630425MT')
  select * from tempvMPV where fieldname = 'variety' and pagedetailid in ('14630425MT')
  
  --Replace Spiced in DetailReports MPVVatiety field for 14630425MT and if it has an 14630425MTAA with a blank string ''
  --Delete 14630425MT and if it has an 14630425MTAA record from MPVVariety
  
  

select left(right(originalpagedetailid,4),2),pagedetailid,left(originalpagedetailid,len(originalpagedetailid) - 2 ),* from mil50detailreports 
where  left(right(originalpagedetailid,4),2)='MT'
/*
insert into [MIL50DetailReports_blank_Variety_032414]
select * from mil50detailreports 
where  left(right(originalpagedetailid,4),2)='MT' and left(originalpagedetailid,len(originalpagedetailid) - 2 ) not in 
(select OriginalPageDetailID from mil50DetailReports)


select * from mil50MPVVariety where pagedetailid not in 
(select pagedetailid from mil50DetailReports )

insert into mil50MPVVariety_deleted 
delete from mil50MPVVariety where pagedetailid not in 
(select pagedetailid from mil50DetailReports )


*/


			  
  

select * into mil50deletedtoday
--delete from mil50DetailReports 
from mil50detailreports where left(originalpagedetailid,len(originalpagedetailid) - 2 ) in 
(select originalpagedetailid from mil50detailreports where originalpagedetailid in (select pagedetailid from Recordstobedeleted))
--and mpvvariety in ('Shock Top Ale','Spiced')

delete 
--select * into mil50deletedtodayMPV 
from mil50mpvvariety where pagedetailid not in (select pagedetailid from mil50detailreports)

select * from masteradviewdata..mastermultiplepagevalues where pagedetailid in (
select sourcepagedetailid from mt2sql00.masteradviewdata.dbo.mt360pdtmap where destpagedetailid in (
select originalpagedetailid from mil50detailreports where originalpagedetailid in (select pagedetailid from Recordstobedeleted)
)
) and fieldname='variety' and fieldvalue in ('Shock Top Ale','Spiced')


select * from  MT2SQL08.SQL08.dbo.Recordstobedeleted







