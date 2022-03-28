select top 100 adblockid,mpvorigin ,mpvvariety,*  from chrpepdetailreports where originalpagedetailid in (
221223267,
252897891,
252897992,
252897999
) 

SELECT ACADCOMPBRANDID,CATEGORY,adblockid,mpvorigin ,mpvvariety, DTADDED, * FROM chrpepdetailreports where ACADCOMPBRANDID IN (431849548 , 431849549)
SELECT ACADCOMPBRANDID,CATEGORY,adblockid,mpvorigin ,mpvvariety, DTADDED, * FROM acfvincr..TempACFVDetailReports  where ACADCOMPBRANDID IN (431849548 , 431849549)


---------------------


SELECT * FROM Variety_Link A JOIN  adcentry.dbo.Varieties B ON A.variety_i =B.variety_i
JOIN adcompbrand C ON C.adcompbrand_i =A.adcompbrand_i 
 WHERE ADC_I IN (
 --221223267,
252897891
--252897992,
--252897999
)


SELECT * FROM Origin_Link A JOIN  adcentry.dbo.Origins B ON A.ORIGIN_I =B.ORIGIN_I
JOIN adcompbrand C ON C.adcompbrand_i =A.adcompbrand_i 
 WHERE ADC_I IN (
 --221223267,
252897891
--252897992,
--252897999
)


SELECT * FROM Variety_Link WHERE adcompbrand_i  IN (431849548 , 431849549)
SELECT * FROM adCompare  WHERE ADC_I= 252897891
SELECT * FROM adcompbrand   WHERE ADC_I= 252897891

431849549
431849548