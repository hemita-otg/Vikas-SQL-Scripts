drop table tempdb..alccounts
drop table tempdb..alccounts2
GO
select  cwm.tradeclass, cwm.advertiser, cwm.market, min(retmktid) RetMktID, min(entryprojectid) EntryProjectID,
sum(case when pdt.category = 'Beer' then 1 else 0 end ) as [#Beer] , 
0 [#BeerArchive] ,
sum(case when pdt.category = 'Beer Alternatives' then 1 else 0 end ) as [#Beer Alternatives] , 
0 [#Beer Alternatives Archive],
sum(case when pdt.category = 'Wine' then 1
when pdt.category = 'Sparkling Wines' then 1 
when pdt.category = 'Dessert Wines' then 1 else 0 end) as [#Wine] , 
0 [#WineArchive],
sum(case when pdt.category = 'Blended Whisky' then 1 
when pdt.category = 'Brandy' then 1 
when pdt.category = 'Canadian Whisky' then 1 
when pdt.category = 'Cordials & Liqueurs' then 1
when pdt.category = 'Gin' then 1
when pdt.category = 'Rum' then 1
when pdt.category = 'Scotch Whisky' then 1
when pdt.category = 'Spirit Cocktails' then 1
when pdt.category = 'Straight Bourbon Whiskey' then 1 
when pdt.category = 'Tequila' then 1
when pdt.category = 'Vodka' then 1 else 0 end) as [#Spirits],
0 [#SpiritsArchive]
into tempdb..alccounts
from adviewmain cwm 
	Join masteradviewdata..masterpagedetailtable pdt 
	on cwm.flyerid = pdt.flyerid 
where cwm.addate between '1/1/2010' and '07/31/2010'
group by cwm.tradeclass, cwm.advertiser, cwm.market
option (maxdop 1)

select * from tempdb..alccounts order by advertiser

select  cwm.tradeclass, cwm.advertiser, cwm.market, min(retmktid) RetMktID, min(entryprojectid) EntryProjectID, 
[#BeerArchive] = sum(case when Arc.category = 'Beer' then 1 else 0 end ) , 
[#Beer Alternatives Archive] = sum(case when arc.category = 'Beer Alternatives' then 1 else 0 end ) , 
[#WineArchive] = sum(case when arc.category = 'Wine' then 1
when arc.category = 'Sparkling Wines' then 1 
when arc.category = 'Dessert Wines' then 1 else 0 end) , 
[#SpiritsArchive] = sum(case when arc.category = 'Blended Whisky' then 1 
when arc.category = 'Brandy' then 1 
when arc.category = 'Canadian Whisky' then 1 
when arc.category = 'Cordials & Liqueurs' then 1
when arc.category = 'Gin' then 1
when arc.category = 'Rum' then 1
when arc.category = 'Scotch Whisky' then 1
when arc.category = 'Spirit Cocktails' then 1
when arc.category = 'Straight Bourbon Whiskey' then 1 
when arc.category = 'Tequila' then 1
when arc.category = 'Vodka' then 1 else 0 end) 
into tempdb..alccounts2
from adviewmain cwm 
	Join masteradviewdata..masterarchivecategory arc 
	on cwm.flyerid = arc.flyerid 
where cwm.addate between '1/1/2010' and '07/31/2010'
group by cwm.tradeclass, cwm.advertiser, cwm.market
option (maxdop 1)


select * from tempdb..alccounts2

Select 
--update A set 
[#BeerArchive] = B.[#BeerArchive],
[#Beer Alternatives Archive] = B.[#Beer Alternatives Archive],
[#WineArchive]=B.[#WineArchive],
[#SpiritsArchive]=B.[#SpiritsArchive]
from tempdb..alccounts A
Join tempdb..alccounts2 B
on a.advertiser=b.advertiser and a.market=b.market

select * from tempdb..alccounts order by 1,2,3






select *  	
from adviewmain cwm 
	Join masteradviewdata..masterpagedetailtable pdt 
	on cwm.flyerid = pdt.flyerid 
where cwm.addate between '1/1/2010' and '07/31/2010' and 
cwm.advertiser='Smiths' and cwm.market='Albuquerque, NM'
and pdt.category='beer alternatives'





select *  	
from adviewmain cwm 
	Join masteradviewdata..masterarchivecategory pdt 
	on cwm.flyerid = pdt.flyerid 
where cwm.addate between '1/1/2010' and '07/31/2010' and 
cwm.advertiser='Smiths' and cwm.market='Albuquerque, NM'
and pdt.category='beer alternatives'