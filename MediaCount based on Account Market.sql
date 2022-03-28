--select * from mediacount


select a.tradeclass, a.advertiser, a.Market, 
count(Flyerid) [CWM], 
sum(pages) [Pages], 
Sum(case when media in ('Insert', 'In-store', 'Mailer') then 1 end) [PrePrints],
Sum(case when media in ('Insert', 'In-store', 'Mailer') then pages end) [PrePrintPages],
Sum(case when media in ('ROP') then 1 end) [ROPCWM],
Sum(case when media in ('ROP') then pages end) [ROPPages],
Sum(case when media in ('Online') then 1 end) [OnlineCWM],
Sum(case when media in ('Online') then pages end) [OnlinePages],
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') then 1 end) [OtherCWM],
Sum(case when media not in ('Insert', 'In-store', 'Mailer', 'ROP') then pages end) [OtherPages]
from masteradviewdata..adviewmain a
join tempdb..mediacount b on a.advertiser = b.retailer and a.market=b.market 
where addate between '1/1/2010' and '12/31/2010'
group by tradeclass, a.advertiser, a.Market
order by 2,3
option (maxdop 1)




select count(flyerid) as totalcwmcount ,sum(pages) as pages  from masteradviewdata..adviewmain where 
advertiser='14 Carrot Whole Foods' and market='Columbia, SC'
and addate between '1/1/2010' and '12/31/2010'
14 Carrot Whole Foods	Columbia, SC
