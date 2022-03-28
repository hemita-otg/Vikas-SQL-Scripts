use sql13

select * from FRDataPEPflyerReports f join mt2sql00.mastermappingtables.dbo.retmktpep m on f.RetMktId =m.retmktid 


sp_RENAME 'FRDataPEPdetailReports.retmktid' , 'ACRetMktID', 'COLUMN'

alter table FRDataPEPdetailReports add RetMktID int

Update b set RetMktid = a.RetMktID from mt2sql00.MasterMappingTables.dbo.REtMKTpep a
join FRDataPEPdetailReports b
on a.ACRetMktID = b.ACRetmktid
