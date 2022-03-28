Exec CreateClientCWMTable 'per', '', 0

Exec CreateClientTables 'per', 0, 0


select * into tempdb..perPageDetailTable1 from perPageDetailTable
select * into tempdb..permultiplepagevalues1  from permultiplepagevalues


delete from  perpagedetailtable where category='Cookies' and manufacturer in 
('Kraft','Keebler', 'Pepperidge Farm' ,'Archway & Mothers', 'Kelloggs' ,'Danone Waters Of North America')

--delete from permultiplepageValues where pagedetailid not in (select pagedetailid from perpagedetailtable)

select min(addate) from perchildwebmain