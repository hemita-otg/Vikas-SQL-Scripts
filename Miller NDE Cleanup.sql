select * from sql08.dbo.mil50detailreports where pagedetailid in (500477295)

select * from mil50mpvvariety where variety='spiced' like '%spice%'

select pagedetailid,originalpagedetailid,* from mil50detailreports where pagedetailid in ('518408032','522443446')

select pagedetailid,variety,* from MasterAdviewData..MasterPageDetailTable  where pagedetailid in ('14630425MT')
select pagedetailid,* from MasterAdviewData..MasterMultiplePageValues   where pagedetailid in ('14630425MT')

select top 100 * from mt2sql00.masteradviewdata.dbo.mt360pdtmap where destpagedetailid in ('14630425MT')

select * from masteradviewdata.dbo.masterpagedetailtable where pagedetailid in ('0685264D225')
select pagedetailid,* from MasterAdviewData..MasterMultiplePageValues   where pagedetailid in ('0685264D225')


--1. Collect PagedetailID, FlyerID, Category, Brand, EntryComments1, Variety, SourcePagedetailID null the xxxMT records from MasterPDT where Category in ('Beer', ' Beer Alternatives')
--2. Update the SourcePagedetailID from mt2sql00.masteradviewdata.dbo.mt360pdtmap table based on the PagedetailID above step and add to the temp table
--3. Collect MPV values, SourcePagedetailID null from MasterMPV into a tempVMPV table for above PagedetailID 
--4. Update the SourcePagedetailID in step3 where there is a matching MPV value for the PagedetailID in above temp table
--5. The records that do not have a SourcePagedetailID in the tempVMPV table



