select * from EntryDataDur.dbo.MasterEntryProject
 select * from tempdb.dbo.DurConsProjectsPDTTriggers

 ---

select top 10 *  from entrydatadur..ACFVDPageDetailTable
select count(1) from entrydatadur..ACFVDPageDetailTable 			where pagedetailid in ('0000606E801','174685065AC')
--select count(1) from entrydatadur..ACFVDMissingPageDetailTable 		where pagedetailid in (select pagedetailid from tempdb..tdc)
select count(1) from entrydatadur..MT360DurPageDetailTable			where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..MT360DurMissingPageDetailTable 	where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..USACMDPageDetailTable			where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..USACVDPageDetailTable			where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..USCTCMDPageDetailTable 			where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..USCTCVDPageDetailTable 		where pagedetailid in ('0000606E801','174685065AC')
select count(1) from entrydatadur..USWebDPageDetailTable 			where pagedetailid in ('0000606E801','174685065AC')



select pagedetailid,durpagedetailid from tempdb..tdc

update t set t.durpagedetailid =m.durpagedetailid 
from masterdurdata.dbo.DurPDTMapCons m join tempdb..tdc t on
m.CONSPageDetailId = t.pagedetailid


select durpagedetailid,* from tempdb..tdc where pagedetailid in ('012729867DC','012729868DC')




select *  from entrydatadur..USACMDPageDetailTable			where pagedetailid in ('0000606E801','174685065AC')

select *  from MasterClientCoverage..TEMPJAPageDetailTable 			where pagedetailid in ('012729867DC','012729868DC')


select * from masterdurdata.dbo.DurPDTMapCons where conspagedetailid in ('012729867DC','012729868DC')

select topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, count(*) as cnt
from MasterClientCoverage..TEMPJAPageDetailTable  pdt
where category='Sheets/Pillowcases' and brand='Sealy' and comments1='std' and flyerid='13617413' and page=19
group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page
having count(*) > 1
---




select * from masterdurdata.dbo.DurPDTMapCons where conspagedetailid in (select pagedetailid from tempdb..p)
select * from entrydata.dbo.durconspagedetailtable  where pagedetailid in (select pagedetailid from tempdb..p)


select * from entrydata..USACMcPageDetailTable

select * from MasterDurData..DurPDTMapConsLog l join Entrydata_Archive..DurConsPageDetailTable_Dupes p 
on l.CONSPageDetailId =p.pagedetailid 


select * into tempdb..tdc from MasterClientCoverage..TEMPJAPageDetailTable where pagedetailid not in (select pagedetailid from tempdb..p)
and pagedetailid in (select pagedetailid from tempdb..pt)

select * from entrydata.dbo.durconspagedetailtable  where pagedetailid in (select pagedetailid from tempdb..tdc)
select * from tempdb..tdc

select topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page, count(*) as cnt
from tempdb..tdc pdt
--where pdt.flyerid = '8706747'
group by topleftx, toplefty, bottomrightx, bottomrighty, category, brand, comments1, flyerid, page
having count(*) > 1

select * from triggerdb.dbo.DurConspagedetailtableUpdate where pagedetailid in (select pagedetailid from tempdb..tdc)


---------------------------------

