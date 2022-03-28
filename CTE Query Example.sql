WITH 
PDT AS (SELECT Flyerid,Pagedetailid FROM MasterPageDetailTable),
CWM AS (SELECT Flyerid FROM AdviewMain),
CNT AS (SELECT cwm.flyerid,count(pdt.pagedetailid) as maxPDT FROM  pdt join cwm on pdt.flyerid=cwm.flyerid group by cwm.flyerid )
select top 10 FlyerID, maxPDT  from cnt
order by maxPDT desc 


GO 

WITH 
PDT AS (SELECT Flyerid,Pagedetailid,Category  FROM MasterPageDetailTable),
CWM AS (SELECT Flyerid,advertiser,market FROM AdviewMain)
--CNT AS (SELECT cwm.flyerid,count(pdt.pagedetailid) as maxPDT FROM  pdt join cwm on pdt.flyerid=cwm.flyerid group by cwm.flyerid )
select  cwm.advertiser,cwm.market,pdt.category from CWM join PDT on cwm.FlyerID=pdt.FlyerId 

