select * from retmkt

--Alter Table RetMkt add DMA varchar(10)

create table mktdma
(
Market varchar(50),
DMA varchar(10)
)

update a
set dma=b.dma
from retmkt a join mktdma b 
on a.market=b.market
