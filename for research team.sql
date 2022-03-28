SELECT DISTINCT  CC.CLIENTID,CLIENTNAME,CATEGORY,CLIENTSERVER,
CASE WHEN FVCCTYPE =4 THEN 'FULL' 
 WHEN FVCCTYPE=2 THEN 'BASIC' 
   WHEN FVCCTYPE=6 THEN 'PRICEPULSE'  END AS CODETYPE
 FROM CATEGORYCODE CC JOIN SUBSCRIPTION..CLIENTPROFILE CP 
ON CC.CLIENTID =CP.ClientID 
 WHERE FVCCTYPE IN (2,4,6)
 ORDER BY 4 



 SELECT FVCCTYPE,*  FROM CATEGORYCODE  WHERE FVCCTYPE IN (2,4,6)

 select 	 *  from sitecontrol..vwSpotfireCategory s join  CATEGORYCODE c on s.categorycodeid =c.id  WHERE FVCCTYPE IN (2,4,6)


 select * from categorycode where category ='kgmADL'
 
 select 	 *  from sitecontrol..vwSpotfireCategory where categorycodeid=4467