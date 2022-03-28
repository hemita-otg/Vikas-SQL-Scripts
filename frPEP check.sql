Select a.DisplayName,isnull(b.DisplayAdvertiser,a.TradeClassAdvertiser) AdverTiser,isnull([Group],'''') TradeClassGroup 
    From 
        (
            SELECT TC.Displayname,TTC.Advertiser as TradeClassAdvertiser,Tc.Seq FROM TradeClassesPEP  TC 
            INNER JOIN (
                        select distinct advertiser, tradeclass 
	from FlashAdsPep ads, frretmktpep mkt
	where ads.retmktid = mkt.retmktid and clientid = 8  and weekof = '06/24/2018'
                   ) TTC 
            ON TC.TradeClass = TTC.TradeClass WHERE ClientID = 8
            And TTC.Advertiser Not In(Select Advertiser FROM ClientAdvertiserTradeclassPEP  Where ClientID = 8)
            Union
 
            Select Distinct ClientTradeclass, CAT.Advertiser, TC.Seq FROM ClientAdvertiserTradeclassPEP CAT 
            INNER JOIN TradeClassesPEP  TC
            on CAT.ClientTradeclass = TC.DisplayName And TC.ClientID = CAT.ClientID
            INNER JOIN (select distinct advertiser, tradeclass 
	from FlashAdsPep ads, frretmktpep mkt
	where ads.retmktid = mkt.retmktid and clientid = 8  and weekof = '06/24/2018') TTC 
            on TTC.Advertiser = CAT.Advertiser
            Where CAT.ClientID = 8
    ) a
    LEFT OUTER JOIN AdvertisersGroupPEP  b ON a.TradeClassAdvertiser = b.Advertiser 
    ORDER BY 2