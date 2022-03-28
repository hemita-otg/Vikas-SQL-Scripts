select distinct media from fmdchildwebmain

--update fmdchildwebmain set media='Insert' where media in ('In-store','Insert-Paper')

select * from fmdmedia

--insert into fmdmedia 
select distinct media from fmdchildwebmain


select  addate,salestartdate,retid,advertiser from fmdchildwebmain 
--update fmdchildwebmain 
set addate=salestartdate
where salestartdate is not null
and addate<>salestartdate
and advertiser='family dollar'


select count(*) from fmdchildwebmain


DROP TABLE fmdDisAdvertiserMarket
Go

SELECT DISTINCT Tradeclass,Advertiser,Market, CASE WHEN Region = '' THEN NULL ELSE Region END AS Region, 
						CASE WHEN SalesTerritory = '' THEN NULL ELSE SalesTerritory END AS SalesTerritory, 
						CASE WHEN District = '' THEN NULL ELSE District END AS District,RetMktId,RetId,MktId into fmdDisAdvertiserMarket FROM fmdChildWebMain OPTION (MAXDOP 1)
Go