select [Advertiser],[Market],[AvgDifferenceInDays],[Avg Timing - Cons],[AvgDifferenceInDaysDur],[Avg Timing - Dur],[TradeClass],[FVTradeClass],[Priority],[Active],[StatusID],[Status],
case when isnull([StatusSales],0) = 1 then 'Yes' else 'No' end as [StatusSales] ,
case when isnull([BevAlPanel],0) = 1 then 'Yes' else 'No' end as [BevAlPanel],
case when isnull([FSICoverage],0) = 1 then 'Yes' else 'No' end as [FSICoverage],
case when isnull([ROPCoverage],0) = 1 then 'Yes' else 'No' end as [ROPCoverage],
case when isnull([HispanicPanel],0) = 1 then 'Yes' else 'No' end as [HispanicPanel],
case when isnull([StatusDur],0) = 1 then 'Yes' else 'No' end as [StatusDur],
[CoverageID],[Coverage],[CountryID],[Country],[CT Print],
case when isnull([CUFP],'') = '' then 'No' else 'Yes' end as [CUFP],
case when isnull([US C2C],'') = '' then 'No' else 'Yes' end as [US C2C],
[Comments],[EntryProject],[EPStartDate],[RetMktID],[TDLinxID],[ClientCntConsumable],[CLIENTCNT_IMAGES ONLY (DAA)],[CLIENTCNT_TC],[ClientCntDurable], [ClientCntConsumable] + [ClientCntDurable] [CLIENTCNT_RM (DE)]
from tempdb..ActiveRetMktList_CD

where coverage='test' and market like '%national%' and [ClientCntConsumable]=0