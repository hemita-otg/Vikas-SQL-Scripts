use fvdatalog 

drop table tempdb..a
drop table tempdb..b
select  * into tempdb..a  from adviewmainlog where CONVERT(date, LogTimeStamp ) = '2016-08-06' and entryprojectid is null
select  * into tempdb..b  from adviewmainlog where CONVERT(date, LogTimeStamp ) = '2016-08-07' and LogDMLOperation ='u' and  entryprojectid is not null

select * from tempdb..a a join tempdb..b b on a.flyerid =b.flyerid 



with 
n as  (select entryprojectid,flyerid,active from tempdb..a where LogDMLOperation <> 'u'),
nn as (select entryprojectid,flyerid,active  from tempdb..b  where LogDMLOperation = 'u' )
select *into tempdb..pp  from MasterAdviewData..masterpagedetailtable where flyerid in (
select flyerid from masteradviewdata..adviewmain where flyerid in (
select distinct n.flyerid  from n join nn on n.flyerid=nn.flyerid where n.active=1 )
and EntryProjectID is not null and month(addate) in (7,8))
order by addate desc 



select * from adviewmainlog where flyerid in ('9886763') order by 1 desc 


select distinct ProdImageCreated,count(1)  from tempdb..pp
group by ProdImageCreated
with rollup  

update tempdb..pp set ProdImageCreated =1 


insert into masterclientcoverage..tempfuturepdt 
select * from tempdb..pp 

insert into masterclientcoverage..tempfuturempv
select * from masteradviewdata..MasterMultiplePageValues where pagedetailid in (
select pagedetailid  from tempdb..pp )

select count(1) from tempdb..pp
TempFuturePDT = 181522
TempFutureMPV = 252211