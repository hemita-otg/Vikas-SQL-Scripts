select distinct convert(varchar(10), addate, 108) from masterclientcoverage..TblOnline
select distinct convert(varchar(10), addate, 108),count(flyerid) from  mt3sql1.fvstaging.dbo.adviewmain
group by convert(varchar(10), addate, 108)

update   mt3sql1.fvstaging.dbo.adviewmain
set addate=cast(convert(char(11), addate, 101) as datetime)  
--select distinct addate,cast(convert(char(11), addate, 101) as datetime)  from  mt3sql1.fvstaging.dbo.adviewmain
 where convert(varchar(12), addate, 108) > '00:00:000'
 option(maxdop 1)
 


 mt3sql1.fvstaging.dbo.adviewmain



 select flyerid,addate, convert(varchar(10), addate, 108),* into from  mt3sql1.fvstaging.dbo.adviewmain
 where convert(varchar(10), addate, 108) <> '00:00:00'


 select flyerid  from  mt3sql1.fvstaging.dbo.adviewmain
 where convert(varchar(10), addate, 108) <> '00:00:00'