--Select * from mt2sql04.sitecontrol.dbo.categorycode where category like 'galx%'

Declare @SrcCode as int
Declare @NewCode as int
Declare @SQL as varchar(5000)
Set @SQL=''
Set @SrcCode=875
Set @NewCode=1777

--CWM--
Set @SQL='insert into MT2SQL00.MasterclientCoverage.dbo.MasterClientCWM 
		select ClientId, ' + Cast(@NewCode as varchar(10)) + ',EntryProjectID,RetMktID,RetID,MktID,TCID,StartDate,EndDate,IsHSP
		from MT2SQL00.MasterclientCoverage.dbo.MasterClientCWM where categorycodeid=' + Cast(@SrcCode as varchar(10)) 
--print @SQL 
Exec (@SQL)

--ST--
--select * into dbo.CGR50AdvertiserSalesTerritory from CGRAdvertiserSalesTerritory

--MC--
Set @SQL='update Mt2SQL04.sitecontrol.dbo.merchandisecategorycontrol 
set mctemplateid =(select Mctemplateid from Mt2SQL04.sitecontrol.dbo.merchandisecategorycontrol where categorycodeid= ' + Cast(@SrcCode as varchar(10)) + ' ) 
 where categorycodeid= ' + Cast(@NewCode as varchar(10))
--print @SQL 
Exec (@SQL)

--CBE--
Set @SQL='insert into Mt2SQL04.sitecontrol.dbo.clientbrandexception
select ClientID,MerchandiseCategory,MerchandiseSubCat,Category,RealCategory,Brand,RealBrand,BrandSet,
CategorySet,Exclude, ' + Cast(@NewCode as varchar(10)) +' from Mt2SQL04.sitecontrol.dbo.clientbrandexception where categorycodeid=' + Cast(@SrcCode as varchar(10))
--print @SQL 
Exec (@SQL)

--ClientCWMChanges--
Set @SQL='insert into MT2SQL00.MasterclientCoverage.dbo.clientcwmchanges
select ClientID, ' + Cast(@NewCode as varchar(10)) +  ',CodeID,ExistingValue,NewValue from MT2SQL00.MasterclientCoverage.dbo.clientcwmchanges
 where categorycodeid= ' + Cast(@SrcCode as varchar(10))
--print @SQL 
Exec (@SQL)

--clientcwmexception--
Set @SQL='insert into MT2SQL00.MasterclientCoverage.dbo.clientcwmexception
select ' + Cast(@NewCode as varchar(10)) +  ',Fieldid,FieldValue,StartDate,EndDate 
 from MT2SQL00.MasterclientCoverage.dbo.clientcwmexception where categorycodeid=' + Cast(@SrcCode as varchar(10))
--print @SQL 
Exec (@SQL)



-- Check for MfrUpdate - if Exists set in tablenames