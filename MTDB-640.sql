



Select Distinct Category,Brand,Manufacturer,MPV.Origin, Count(Distinct PDT.PageDetailID) Occurances
From MasterAdviewData..MasterPageDetailTable PDT with (nolock)
Left Join tempdb..testingOrigin MPV  with (nolock)
On PDT.PageDetailID = MPV.pagedetailid  
Where Category in ('Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Drink Mixes/Garnish','Gin','Non-Alcoholic Wines','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')
Group by Category,Brand,Manufacturer,MPV.Origin


--Select * into tempdb..testingOrigin from (
--Select Distinct PDT.PageDetailID, PDT.Origin From MasterAdviewData..MasterPageDetailTable PDT with (nolock) 
--Where Category in ('Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Drink Mixes/Garnish','Gin','Non-Alcoholic Wines','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')
--union
--Select Distinct PageDetailID, fieldvalue from MasterAdviewData..MasterMultiplePageValues MPV  with (nolock) where Fieldname='Origin'
--) X


Select * from (
Select Distinct Category,Brand,Manufacturer,MPV.Origin, PDT.PageDetailID,
ROW_NUMBER () OVER (PARTITION BY Category,Brand,Manufacturer,MPV.Origin Order by Category,Brand,Manufacturer,MPV.Origin) RN
From MasterAdviewData..MasterPageDetailTable PDT with (nolock)
Left Join tempdb..testingOrigin MPV  with (nolock)
On PDT.PageDetailID = MPV.pagedetailid  
Where Category in ('Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Drink Mixes/Garnish','Gin','Non-Alcoholic Wines','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')
) X Where Rn=1

Select * into tempdb..testingOrigin from (
Select Distinct Category,Brand,Manufacturer,MPV.Origin, PDT.PageDetailID,
ROW_NUMBER () OVER (PARTITION BY Category,Brand,Manufacturer,MPV.Origin Order by Category,Brand,Manufacturer,MPV.Origin) RN
From MT2SQL00.MasterAdviewData.dbo.MasterPageDetailTable PDT with (nolock)
Left Join MT2SQL00.tempdb.dbo.testingOrigin MPV  with (nolock)
On PDT.PageDetailID = MPV.pagedetailid  
Where Category in ('Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Drink Mixes/Garnish','Gin','Non-Alcoholic Wines','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine')
) X Where Rn=1

Select Distinct *,'https://60.featurevision.com' + dbo.[AV_GetProductImagePathMCAP] (PageDetailID,'PrF','ActiveLocation','Website')
From tempdb..testingOrigin