use sql01

select distinct advertiser,market,count(1),'ncp' as DB    from mt2sql01.sql01.dbo.ncpflyerreports  group by advertiser,market
 union all
select distinct advertiser,market,count(1),'ncpca' as DB  from mt2sql01.sql01.dbo.ncpcaflyerreports  group by advertiser,market
union all
select distinct advertiser,market,count(1),'ngc' as DB    from mt2sql01.sql01.dbo.ngcflyerreports  group by advertiser,market
 union all
select distinct advertiser,market,count(1),'ngcca' as DB  from mt2sql01.sql01.dbo.ngccaflyerreports  group by advertiser,market
union all
select distinct advertiser,market,count(1),'nrb' as DB    from mt2sql01.sql01.dbo.nrbflyerreports  group by advertiser,market
 union all
select distinct advertiser,market,count(1),'nrbca' as DB  from mt2sql01.sql01.dbo.nrbcaflyerreports  group by advertiser,market
union all
select distinct advertiser,market,count(1),'nrgca' as DB from mt2sql02.sql02.dbo.nrgcaflyerreports  group by advertiser,market
 union all
select distinct advertiser,market,count(1),'nwrca' as DB from mt2sql02.sql02.dbo.nwrcaflyerreports  group by advertiser,market





select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.ncpflyerreports  group by advertiser,market
 union 
select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.ncpcaflyerreports  group by advertiser,market
union 
select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.ngcflyerreports  group by advertiser,market
 union 
select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.ngccaflyerreports  group by advertiser,market
union 
select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.nrbflyerreports  group by advertiser,market
 union 
select distinct advertiser,market,count(1) from mt2sql01.sql01.dbo.nrbcaflyerreports  group by advertiser,market
union
select distinct advertiser,market,count(1) from mt2sql02.sql02.dbo.nrgcaflyerreports  group by advertiser,market
 union 
select distinct advertiser,market,count(1) from mt2sql02.sql02.dbo.nwrcaflyerreports  group by advertiser,market




use sql01

select distinct Category,count(1),'ncp' as DB    from mt2sql01.sql01.dbo.ncpdetailreports  group by Category
 union all
select distinct Category,count(1),'ncpca' as DB  from mt2sql01.sql01.dbo.ncpcadetailreports  group by Category
union all
select distinct Category,count(1),'ngc' as DB    from mt2sql01.sql01.dbo.ngcdetailreports  group by Category
 union all
select distinct Category,count(1),'ngcca' as DB  from mt2sql01.sql01.dbo.ngccadetailreports  group by Category
union all
select distinct Category,count(1),'nrb' as DB    from mt2sql01.sql01.dbo.nrbdetailreports  group by Category
 union all
select distinct Category,count(1),'nrbca' as DB  from mt2sql01.sql01.dbo.nrbcadetailreports  group by Category
union all
select distinct Category,count(1),'nrgca' as DB from mt2sql02.sql02.dbo.nrgcadetailreports  group by Category
 union all
select distinct Category,count(1),'nwrca' as DB from mt2sql02.sql02.dbo.nwrcadetailreports  group by Category




select distinct Category,count(1) from mt2sql01.sql01.dbo.ncpdetailreports  group by Category
 union 
select distinct Category,count(1) from mt2sql01.sql01.dbo.ncpcadetailreports  group by Category
union 
select distinct Category,count(1) from mt2sql01.sql01.dbo.ngcdetailreports  group by Category
 union 
select distinct Category,count(1) from mt2sql01.sql01.dbo.ngccadetailreports  group by Category
union 
select distinct Category,count(1) from mt2sql01.sql01.dbo.nrbdetailreports  group by Category
 union 
select distinct Category,count(1) from mt2sql01.sql01.dbo.nrbcadetailreports  group by Category
union 
select distinct Category,count(1) from mt2sql02.sql02.dbo.nrgcadetailreports  group by Category
 union 
select distinct Category,count(1) from mt2sql02.sql02.dbo.nwrcadetailreports  group by Category
