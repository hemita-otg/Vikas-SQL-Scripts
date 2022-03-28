
Select Advertiser,Market,Count(Distinct FlyerID)
From SQL07..ymktDetailReports 
where Advertiser like 'Ralphs%'
and Category='Beer'
group by Advertiser,Market
order by 1,2

Select Advertiser,Market,Count(Distinct A.FlyerID)
From MasterBevAL..MasterBevALDetailReports A
Join MasterAdviewData..AdviewMain C
on A.OriginalFlyerID = C.FlyerID 
where Advertiser like 'Ralphs%'
and Category='Beer'
group by Advertiser,Market
order by 1,2

Select Advertiser,Market,Count(Distinct A.FlyerID)
From MasterAdviewData..MasterPageDetailTable A
Join MasterAdviewData..AdviewMain C
on A.FlyerID = C.FlyerID 
where Advertiser like 'Ralphs%'
and Category='Beer'
group by Advertiser,Market
order by 1,2


Select Advertiser,Market,Category,Count(Distinct FlyerID)
From SQL07..ymktDetailReports 
where Category Like 'Vodka%'
and Advertiser='Albertsons' and MArket='Bakersfield, CA'
group by Advertiser,Market,Category
order by 1,2

Select Advertiser,Market,Category,Count(Distinct A.FlyerID)
From MasterBevAL..MasterBevALDetailReports A
Join MasterAdviewData..AdviewMain C
on A.OriginalFlyerID = C.FlyerID 
where Category Like 'Vodka%'
and Advertiser='Albertsons' and MArket='Bakersfield, CA'
group by Advertiser,Market,Category
order by 1,2

Select Advertiser,Market,Category,Count(Distinct A.FlyerID)
From MasterAdviewData..MasterPageDetailTable A
Join MasterAdviewData..AdviewMain C
on A.FlyerID = C.FlyerID 
where Category Like 'Vodka%'
and Advertiser='Albertsons' and MArket='Bakersfield, CA'
group by Advertiser,Market,Category
order by 1,2