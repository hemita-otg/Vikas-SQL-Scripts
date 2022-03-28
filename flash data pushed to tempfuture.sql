select * from tempdb.dbo.USACMCPDTFR 

insert into masterclientcoverage.dbo.TempFuturePDT 
select * from masteradviewdata..masterpagedetailtable where pagedetailid in (
select pagedetailid  from tempdb.dbo.USACMCPDTFR )


insert into masterclientcoverage.dbo.TempFuturempv 
select * from masteradviewdata..mastermultiplepagevalues where pagedetailid in (
select pagedetailid  from tempdb.dbo.USACMCPDTFR )