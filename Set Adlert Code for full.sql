Declare @DatabaseCategory varchar(15)
Declare @OldTypeOfExport int
Declare @NewTypeOfExport int
Declare @SQL varchar(8000) = ''

Set @DatabaseCategory='wlmadl'

Set @OldTypeOfExport =(select TypeOfExport from ADlertToFV where DatabaseCategory=@DatabaseCategory)
Set @NewTypeOfExport =(select ProcedureId from ADlertToFV_Procedures where procedurename in (select replace(procedurename,'increment','') from ADlertToFV_Procedures where procedureid=@OldTypeOfExport))
Print 'Old ExportId-' + cast( @OldTypeOfExport as varchar(10))
Print 'New ExportId-' + cast (@NewTypeOfExport as varchar(10))

Set @SQL='update AdlertToFV set TypeOfExport='+ cast(@NewTypeOfExport as varchar(10))+' where DatabaseCategory= '''+ cast(@DatabaseCategory as varchar(10))+''' '
Print(@SQL)
--Exec (@SQL)