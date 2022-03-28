select distinct pdt.flyerid,addate from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from Masterbeval..BevAlFlyers)
and pdt.category in (select realcategory from masterbeval..BevAlCategoryCoverage)
order by addate desc


select * from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable

select * from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP
where flyerid   in (
select distinct pdt.flyerid from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from Masterbeval..BevAlFlyers)
and pdt.category in (select realcategory from masterbeval..BevAlCategoryCoverage))
and prodimagecreated=0


--delete from  mt2sql00.masterclientcoverage.dbo.PIMultipleServerDistMCAP



select distinct vehicleid from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP
where flyerid  in (
select distinct pdt.flyerid from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from Masterbeval..BevAlFlyers)
and pdt.category in (select realcategory from masterbeval..BevAlCategoryCoverage))










--Delete non beval records and keep beval only for which PIs to be created - Run PI Exe on non MT2SQL00 server

Delete from mt2sql00.masterclientcoverage.dbo.PIProcessingTableTempMCAP
where flyerid  not  in (
select distinct pdt.flyerid from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable pdt 
join mt2sql00.masteradviewdata.dbo.adviewmain cwm on cwm.flyerid = pdt.flyerid where prodimagecreated=0
and pdt.flyerid in (select flyerid from Masterbeval..BevAlFlyers)
and pdt.category in (select realcategory from masterbeval..BevAlCategoryCoverage))
