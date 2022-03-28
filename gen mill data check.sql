use DigitalCompareCheck 

select * from DigitalCompareCheck where flyerid =25536580


select dtadded,pagedetailid,pagedetailidint into tempdb..t from masteradviewdata..masterpagedetailtable where flyerid = 25536580

select prodimagecreatedon,count(1) from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in (
select pagedetailid  from tempdb..t )
group by prodimagecreatedon 


select * from FVDataLog..TempJaPageDetailTableLog where PageDetailID in ( select pagedetailid  from tempdb..t ) 
order by pagedetailid,logtimestamp desc 

select dtadded,pagedetailid,pagedetailidint from masteradviewdata..masterpagedetailtable where pagedetailidint=4458712452

select * from FVDataLog..TempFuturePDTLog where PageDetailID in ( select pagedetailid  from tempdb..t ) 
order by pagedetailid,logtimestamp desc 