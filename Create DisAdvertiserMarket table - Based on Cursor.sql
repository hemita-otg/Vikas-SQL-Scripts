declare @CatCode varchar(35)
declare @SQL varchar(5000)

set @CatCode = ''
set @SQL = ''

declare curRMC cursor for
select Category from Mt2SQL04.sitecontrol.dbo.categorycode where clientserver='mt2sql13'
open curRMC
fetch next from curRMC
into @CatCode

while @@fetch_Status = 0
begin

Set @SQL='DROP TABLE ' + @CatCode + 'DisAdvertiserMarket'
Exec(@SQL)

Set @SQL='SELECT DISTINCT Tradeclass,Advertiser,Market, CASE WHEN Region = '''' THEN NULL ELSE Region END AS Region, 
						CASE WHEN SalesTerritory = '''' THEN NULL ELSE SalesTerritory END AS SalesTerritory, 
						CASE WHEN District = '''' THEN NULL ELSE District END AS District,RetMktId,RetId,MktId into ' + @CatCode + 'DisAdvertiserMarket FROM ' + @CatCode + 'ChildWebMain OPTION (MAXDOP 1)'

Exec(@SQL)	
	
fetch next from curRMC
into @CatCode

END                       
close curRMC
deallocate curRMC
