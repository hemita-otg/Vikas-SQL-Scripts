use DigitalCompareCheck
select * from DigitalCompareCheck where entrypdt <> 0 order by addate desc 
select * from DigitalCompareCheck   where flyerid in (select flyerid from tempdb..c21) 

select * from masteradviewdata..masterpagedetailtable a join masteradviewdata..adviewmain b 
on a.flyerid=b.flyerid and year(b.addate) ='2021'


select * from MasterClientCoverage..tempfuturepdt  a join masteradviewdata..adviewmain b 
on a.flyerid=b.flyerid and year(b.addate) ='2021'


select * from masteradviewdata..adviewmain order by addate desc 

select * into tempdb..c21 from mt2sql11.tempdb.dbo.cd 

select * from MasterClientCoverage..tempfuturepdt    where flyerid in ('25165899','25165900','25165940')

select * from MasterClientCoverage..tempfuturepdt  where flyerid in (select flyerid from tempdb..c21) 


select * from MasterClientCoverage..tempjapagedetailtable   where flyerid in (select flyerid from tempdb..c21) 



select count(1) from prdcnen50DetailReports where year(addate)=2021