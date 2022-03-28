select * from waldetailreports where originalpagedetailid in ('013180344DC','013320224DC')

select * from MasterClientCoverage..tempjapagedetailtable where originalpagedetailid in ('013180344DC','013320224DC')
select * from masteradviewdata..masterpagedetailtable where pagedetailid in ('013180344DC','013320224DC','175105787AC')
select * from mt2sql00.entrydatadur.dbo.usacmdpagedetailtable where pagedetailid in ('013180344DC','013320224DC','175105787AC')

select * from masteradviewdata..adviewmain where flyerid = '13725239'

select top 1 * from mt2sql00.masterdurdata.dbo.DurPDTMapCons where conspagedetailid in ('013180344DC','013320224DC')
select count(1) from mt2sql00.masterdurdata.dbo.DurPDTMapCons where durpagedetailid like '%ndc'

00134962NDC
023066968EC


select * from mt2sql00.masterdurdata.dbo.DurPDTMapCons where conspagedetailid in ('013180344DC','013320224DC') 

select * from mt2sql00.masterdurdata.dbo.DurPDTMapNational where nationalpagedetailid in ('00134962NDC') 

select * from mt2sql00.masteradviewdata.dbo.ACFVCdetailmap where DestPageDetailId in ('023066968EC')  


Select Distinct A.CONSPageDetailId,B.CONSPageDetailId,marketpagedetailid,SourcePageDetailId from
(select * from mt2sql00.masterdurdata.dbo.DurPDTMapCons A JOIN  mt2sql00.masterdurdata.dbo.DurPDTMapNational B ON A.DURPageDetailId=B.nationalpagedetailid) A
JOIN
(select * from mt2sql00.masterdurdata.dbo.DurPDTMapCons A JOIN   mt2sql00.masteradviewdata.dbo.ACFVCdetailmap B ON A.DURPageDetailId=B.DestPageDetailId) B
On A.marketpagedetailid=B.SourcePageDetailId AND A.CONSPageDetailId<>B.CONSPageDetailId 