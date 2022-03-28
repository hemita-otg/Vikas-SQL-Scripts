use masterclientcoverage 
GO

truncate table tempjapagedetailtable
truncate table tempjamultiplepagevalues
truncate table tempjapdtdelete

insert into masterclientcoverage..tempjapagedetailtable 
select * from  mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable 


insert into masterclientcoverage..tempjamultiplepagevalues
select * from mt2sql00.masterclientcoverage.dbo.tempjamultiplepagevalues 


insert into masterclientcoverage..tempjapdtdelete
select * from mt2sql00.masterclientcoverage.dbo.tempjapdtdelete 