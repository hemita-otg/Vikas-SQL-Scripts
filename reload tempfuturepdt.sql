select * from sysobjects where xtype='u' and name like 'temp%'
/*
select * into dbo.TempFutureMPV062212 from TempFutureMPV
select * into dbo.TempFuturePDT062212 from TempFuturePDT
*/


TempFutureMPV062212 

select pagedetailid from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from mt2sql00.tempdb.dbo.canflyerids)


select * from tempfuturepdt where pagedetailid 
not in (select pagedetailid from tempfuturepdt062212)



select * from tempfuturepdt062212 where pagedetailid 
not in (select pagedetailid from tempfuturepdt)


select * from TempFutureMPV062212
select * from tempfuturepdt062212