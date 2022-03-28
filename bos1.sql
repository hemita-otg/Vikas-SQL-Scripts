

select distinct flyerid,min(img) img ,min(url) url  --into tempdb..ram1
from cwm$
group by flyerid


select count(*) from tempdb..ram

insert into bos1childwebmain
select distinct 
c.[FlyerID], [Advertiser], [AdDate], [WeekOf], [media], [event], [theme], [market], [publication], [salestartdate], [saleenddate], [pages], [size], [tradeclass], [coupon],c.[img], c.[url], [webcreated], [PublishedOn], [recordenteredby], [datetimerecordentered], [Region], [District], [SalesTerritory], [SalesTerritoryGroup], [SalesTerritorySubGroup], [DateTimeAdded], [TcUpdatedOn], [DistUpdatedOn], [RegionUpdatedOn], [StUpdatedOn], [StgUpdatedOn], [StsgUpdatedOn], [AdMonth], [AdDay], [TrackNo], [WeekNum], [AdRetId], [ThemeId], [NewsId], [AdMktId], [RetChanId], [RetID], [MktID], [RetMktID]
 from cwm$ c join tempdb..ram r  on c.img=r.img and c.url=r.url



insert into bos1pagedetailtable
select * from pdt$


select * into tempdb..bos1childwebmain from bos1childwebmain
select * into tempdb..bos1pagedetailtable from bos1pagedetailtable



bos1disadvertisermarket

drop table bos1disadvertisermarket 

select  distinct TradeClass,
Advertiser,
Market,
Region,
SalesTerritory,
RetID,
MktID,
RetMktID into bos1DisAdvertiserMarket from bos1childwebmain 


bos1disquerypage

drop table bos1Disquerypage
select distinct 
Brand,
Manufacturer,
MerchandiseCategory,
MerchandiseSubCat,
Category,
SKUDescription1,
SKUDescription2,
SKUDescription3 into bos1Disquerypage from bos1pagedetailtable

select * from bos1disdateranges
drop table bos1disdateranges
SELECT DISTINCT Cast(convert(varchar(10), AdDate, 101) as datetime) addate, Cast(convert(varchar(10), Weekof, 101) as datetime) WeekOf, admonth, admonth as month, DATENAME(month, Dateadd(dd,-(day(AdDate)-1),AdDate)) + ' - ' + DATENAME(year, Dateadd(dd,-(day(AdDate)-1),AdDate)) descrip
 into bos1disdateranges 
FROM bos1ChildWebMain OPTION (MAXDOP 1)
GO


select * from bos1ChildWebMain where img not like '/xxxx%'




select * from bos1childwebmain where flyerid='04102011244'



Alter Table bos1ChildWebMain Alter COlumn Media varchar(150)
GO

Update bos1CHildWebMain Set  Media =  '<a href="' + img + '" target="_blank">' + media + '</a>'
where img not like '/xx%'
GO

