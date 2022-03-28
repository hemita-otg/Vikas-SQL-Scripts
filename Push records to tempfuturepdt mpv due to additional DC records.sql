

------------------------------------------------
--for PageDetailID based records
------------------------------------------------
use masterclientcoverage

select * into tempdb..p from mt2sql04.masterclientcoverage.dbo.TempJAPageDetailTable where   prodimagecreated=0 and PageDetailID not LIKE '%DC' 


select * into tempdb..m from masteradviewdata..mastermultiplepagevalues where pagedetailid in (select pagedetailid from tempdb..p)


insert into masterclientcoverage..TempFuturePDT 
select * from tempdb..p where pagedetailid not in (select pagedetailid from masterclientcoverage..TempFuturePDT )


insert into masterclientcoverage..TempFuturempv 
select * from tempdb..m
 
 update p set prodimagecreated=0 from  masterclientcoverage..TempFuturePDT p  where pagedetailid in ( select pagedetailid  from tempdb..p)