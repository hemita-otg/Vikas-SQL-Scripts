--select * into dbo.dripagedetailtable09062010 from dripagedetailtable


--Step 1

Declare @Category varchar(50)
Declare @PageEvent varchar(50)
Declare @Variety varchar(50)
Declare @ProductTerritory varchar(50)
Declare @ProductTerritorySubGroup varchar(50)
Declare @ProductTerritoryGroup varchar(50)
Declare @UnitType varchar(50)
Declare @PkgSize varchar(50)
Declare @Step varchar(5)

declare @sql varchar(5500)

Set @Category =''
Set @PageEvent =''
Set @Variety =''
Set @ProductTerritory =''
Set @ProductTerritorySubGroup =''
Set @ProductTerritoryGroup =''
Set @UnitType=''

set @sql=''

declare StandartCursur cursor for
select  Category,PageEvent,Variety,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,UnitType,
PkgSize,Step
from mt2sql04.sitecontrol.dbo.driupdates Where Step=1

open StandartCursur

fetch next from StandartCursur
into @Category,@PageEvent,@Variety,
@ProductTerritory,@ProductTerritorySubGroup,@ProductTerritoryGroup,@UnitType,
@PkgSize,@Step

while @@fetch_Status = 0
begin
	set @SQL=''
	SET @SQL=' update dripagedetailtable set productterritory= ''' + @ProductTerritory 
	+ ''', productterritorysubgroup=''' + @ProductTerritorySubGroup 
	+ ''', productterritorygroup=''' + @ProductTerritoryGroup  
	+ ''' from dripagedetailtable PDT join MT2SQl04.siteControl.dbo.DriUpdates U 
	on PDT.category=u.Category and pdt.variety=u.variety  where U.step=1 and pdt.pageevent ' + @PageEvent 
	Exec(@SQL)
	
fetch next from StandartCursur
into @Category,@PageEvent,@Variety,
@ProductTerritory,@ProductTerritorySubGroup,@ProductTerritoryGroup,@UnitType,
@PkgSize,@Step

END                       
close StandartCursur
deallocate StandartCursur

--Step 2 




Set @Category =''
Set @PageEvent =''
Set @Variety =''
Set @ProductTerritory =''
Set @ProductTerritorySubGroup =''
Set @ProductTerritoryGroup =''
Set @UnitType=''

set @sql=''

declare StandartCursur cursor for
select Category,PageEvent,Variety,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,UnitType,
PkgSize,Step
from mt2sql04.sitecontrol.dbo.driupdates where step=2

open StandartCursur

fetch next from StandartCursur
into @Category,@PageEvent,@Variety,
@ProductTerritory,@ProductTerritorySubGroup,@ProductTerritoryGroup,@UnitType,
@PkgSize,@Step

while @@fetch_Status = 0
begin
	set @SQL=''
	SET @SQL=' update dripagedetailtable set productterritory= ''' + @ProductTerritory 
	+ ''', productterritorysubgroup=''' + @ProductTerritorySubGroup 
	+ ''', productterritorygroup=''' + @ProductTerritoryGroup  
	+ ''' from dripagedetailtable PDT join MT2SQl04.siteControl.dbo.DriUpdates U 
	on PDT.category=u.Category and pdt.variety=u.variety  and pdt.unittype = u.unittype and pdt.PkgSize = u.PkgSize  
	Where U.step=2 and pdt.pageevent ' + @PageEvent 
	Exec(@SQL)
	
fetch next from StandartCursur
into @Category,@PageEvent,@Variety,
@ProductTerritory,@ProductTerritorySubGroup,@ProductTerritoryGroup,@UnitType,
@PkgSize,@Step

END                       
close StandartCursur
deallocate StandartCursur


GO

Update MPDT SET 
productterritory=X.productterritory,
productterritorysubgroup=X.productterritorysubgroup,
productterritorygroup=X.productterritorygroup
From dripagedetailtable MPDT Join 
(select PDT.PageDetailID,U.productterritory,U.productterritorysubgroup,U.productterritorygroup
From 
(
select PageDetailID,category,pageevent,productterritory,productterritorysubgroup,productterritorygroup,variety
 from dripagedetailtable  where pagedetailid in 
(select pagedetailid from tempdb..tempMPV)
) PDT join MT2SQl04.siteControl.dbo.DriUpdates U 
on PDT.category=u.Category and pdt.variety=u.variety 
and U.pageevent='like ''%Organic%'''
) X on X.PagedetailId=MPDT.PageDetailID

GO

update dripagedetailtable set productterritory='Strawberries - Under Review' where productterritory is null
update dripagedetailtable set productterritorysubgroup='Strawberries - Under Review' where productterritorysubgroup is null
update dripagedetailtable set productterritorygroup='Strawberries' where productterritorygroup is null
GO
update dripagedetailtable set productterritory='Z - Needs Review' where productterritory='Strawberries - Under Review' and variety=''
update dripagedetailtable set productterritorysubgroup='Z - Needs Review' where productterritorysubgroup = 'Strawberries - Under Review'  and variety=''
update dripagedetailtable set productterritorygroup='Z - Needs Review' where productterritorygroup='Strawberries' and variety=''
GO

Execute procGenerateDisQueryPage 'DRI', 0
