--Run on MT2SQL13

use MasterClientCoverage 

WITH 
R AS (SELECT * FROM RetMktPEP),
M  AS (SELECT DISTINCT ACAdvertiserId ,ACCityId,Advertiser,MARKET  FROM MASTERACFV..RETMKT_PEP),
MA AS (SELECT * FROM MasterMappingTables..REtMKTpep )
--INSERT INTO RETMKTPEP(ADVERTISER,MARKET,RETID,MKTID,RETMKTID ) 
SELECT Advertiser ,MA.Market ,ACAdvertiserId ,ACCityId ,Retmktid  FROM MA JOIN (
SELECT DISTINCT ACAdvertiserId,ACCityId,M.Advertiser ,M.MARKET     FROM R RIGHT JOIN M ON R.RetID =M.ACAdvertiserId AND R.MktID = M.ACCityId 
WHERE R.RETID IS NULL ) X ON MA.Retailer =X.Advertiser AND MA.Market =X.Market 

