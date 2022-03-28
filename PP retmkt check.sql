with 
m as (select distinct retailer,market  from MasterMappingTables..retmktpep), 
l as (select distinct  retailer,city + ', ' + state as market,yn  from master..pp)
select l.* into tempdb..ppy  from m join l on m.retailer =l.retailer and m.market=l.market 

update master..pp set yn=1 from master..pp a join tempdb..ppy b on a.retailer=b.retailer and a.city + ', ' + a.state=b.market 

select * from master..pp



select distinct retailer,market  from MasterMappingTables..retmktpep
select distinct advertiser,market  from MasterClientCoverage..retmktpep