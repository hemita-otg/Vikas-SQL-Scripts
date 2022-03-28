use MasterClientCoverage 

select * from tempjapagedetailtable where flyerid in (
22156201
,22156202
,22156203
,22156204
,22156205
,22156206
,22156207
,22156208
)

select * from masteradviewdata..adviewmain where advertiser like '%Shoppers Drug Mart%' order by addate desc 


select * from DigitalCompareCheck..DigitalCompareCheck  where flyerid in (
22156201
,22156202
,22156203
,22156204
,22156205
,22156206
,22156207
,22156208
)


select * from FVDataLog..TempJaPageDetailTableLog where flyerid in (
22156208
) order by 1 desc 


select count(1) from masteradviewdata..masterpagedetailtable where flyerid =22156208