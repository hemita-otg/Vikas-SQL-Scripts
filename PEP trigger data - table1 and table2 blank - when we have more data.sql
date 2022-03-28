EXEC sp_rename 'dbo.Tempacfvdetailreports_1', 'Tempacfvdetailreports_1bkp'
select * into Tempacfvdetailreports_1 from Tempacfvdetailreports_1bkp where 1=2
--Truncate table Tempacfvdetailreports

Delete a
--select distinct a.OriginalPagedetailid
from TempACFVPDTDelete a
join ACDetailReports_2 b on a.OriginalPagedetailid = b.adc_i 

Delete a
from TempACFVDetailReports a
join Tempacfvdetailreports_1bkp b on a.Pagedetailid = b.Pagedetailid

--================================================================================================================

EXEC sp_rename 'dbo.Tempacfvdetailreports_2', 'Tempacfvdetailreports_2bkp'
select * into Tempacfvdetailreports_2 from Tempacfvdetailreports_2bkp where 1=2
--Truncate table Tempacfvdetailreports

Delete a
--select distinct a.OriginalPagedetailid
from TempACFVPDTDelete a
join Tempacfvdetailreports_2bkp b on a.OriginalPagedetailid = b.OriginalPagedetailid

Delete a
from TempACFVDetailReports a
join Tempacfvdetailreports_2bkp b on a.Pagedetailid = b.Pagedetailid


select * from masteracfv..MasterTableList where TableType ='detail' 

select count(1) from acfvincr..ACDetailReports_1 

select count(1) from acfvincr..ACDetailReports_2

select count(1) from acfvincr..TempACFVPDTDelete a join acfvincr..ACDetailReports_1 b on a.OriginalPagedetailid =b.adc_i  
select count(1) from acfvincr..TempACFVPDTDelete a join acfvincr..ACDetailReports_2 b on a.OriginalPagedetailid =b.adc_i 
--update masteracfv..MasterTableList set isprocessed=1  where TableType ='detail' and AC_Tablename in ('ACDetailReports_1','ACDetailReports_2')


select count(1) from acfvincr..TempACFVPDTDelete a join acfvincr..ACDetailReports_3 b on a.OriginalPagedetailid =b.adc_i  
select count(1) from acfvincr..TempACFVPDTDelete a join acfvincr..ACDetailReports_4 b on a.OriginalPagedetailid =b.adc_i 