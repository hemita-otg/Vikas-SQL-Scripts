use SQL08

select * into dbo.smdpagedetailtable from mt2sql00.entrydata.dbo.jasocialpagedetailtable
select * into dbo.smdmultiplepagevalues from mt2sql00.entrydata.dbo.jasocialmultiplepagevalues

--Exec CreateClientTables 'pep', 0, 1
--Execute procGenerateDisQueryPage 'smd', 0

Exec CreateClientCWMTable 'smd', '', 1
select * from sysobjects where xtype='u' and name like '%smd%'
select * from smdchildwebmain

select * from smdpagedetailtable
select * from smdmultiplepagevalues
select * from smdDisAdvertiserMarket
select * from smdMedia
select * from smddisdateranges
select * from smdChildWebMain
select * from smdDisQueryPage

--truncate table smdChildWebMain

--insert into  smdChildWebMain 
select * from mt2sql06.sql06.dbo.soc2ChildWebMain
where addate between '8/21/2011' and '9/3/2011'
and Theme='Matches Filter'


--truncate table smdPageDetailTable
--truncate table smdmultiplepagevalues
insert into  dbo.smdpagedetailtable
select *  from mt2sql00.entrydata.dbo.jasocialpagedetailtable
insert into dbo.smdmultiplepagevalues
select *  from mt2sql00.entrydata.dbo.jasocialmultiplepagevalues


UPDATE smdPagedetailtable
SET Manufacturer = MF.Manufacturer
FROM smdPagedetailtable pdt join 
                (SELECT Manufacturer, Category, Case when PL=0 then Brand Else PLBrand end Brand 
                from MasterAdViewData.DBO.[TEMPManufacturer]) MF 
on pdt.category = MF.category and pdt.brand = MF.brand 
option(maxdop 1)

UPDATE smdPagedetailtable SET Manufacturer = 'Other' WHERE Manufacturer is null

--Execute procGenerateDisQueryPage 'smd', 0