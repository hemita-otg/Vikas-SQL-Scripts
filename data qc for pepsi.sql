PepPepdetailreports where advertiser 

select * from peppepflyerreports where advertiser like '%weis%'

Acme Markets (NAI), Safeway EAS, Shaw’s Supermarket (NAI), Weis Markets 

select year(addate),advertiser,count(1) from peppepflyerreports where advertiserid in (10876744,12042744,10809746,982671)
group by year(addate),advertiser
order by year(addate),advertiser


select year(addate),advertiser,count(1) from peppepdetailreports where advertiserid in (10876744,12042744,10809746,982671)
group by year(addate),advertiser
order by year(addate),advertiser