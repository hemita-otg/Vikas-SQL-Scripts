







Select Advertiser, Market, RetMktID, CWM.Addate, VehicleId VID, CWM.FlyerID FID, salestartdate, saleenddate, PG.PageNumber Pages, Publication
from MasterAdviewData..AdviewMain CWM
Join MasterAdviewData..MCAPVehiclePages PG
On CWM.FlyerID = PG.FlyerId   
Where CWM.RetMktID in (413,728,745,1267,1268,1615,1662,2072,2073,2140,2211,2635,3120,3587,3590,3967,4305,4306,4477,4558,4724,5081,5982,5984,6482,6612,6762,6842,7124,7172,7257,7259,7454,7526,7874,7889,8065,8219,8334,8533,8951,9042,9487,9613,9686,10434,10450,10464,10726,10727,10739,10907,10910,11159,11173,11286,11472,12155,12227,12335,12888,12972,12975,13730,13731,13732,13733,13734,13735,13736,13737,13739,13740,13741,13742,14326,15178,15294,15421,15527,16909,17073,17140,17149,17702,17730,18131,18434,18763,19110,19160,19476,19518,19592,19594,19661,19724,19738,19794,22135,22146,22152,22164,22175,22202,22234,22236,22242,22252,22267,22278,22283,22528,22532,22542,22544,22554,22559,22569,22579,22582,22583,22592,22602,22615,22619,22647,22662,22670,22709,22711,22712,22719,22793,22795,22797,22802,22812,22824,22838,22839,22845,22856,22890,22899,22921,22923,22953,22978,22985,22994,22995,22996,23007,23008,23014,23022,23056,23063,23163,23201,23248,23255,23386,23440,23492,24794,24861,24872,25652,25681,25685,27102,27103,27124,28126,28845,29015,34833,35018,44263,44264,45397,45398)
and CWM.Addate Between '01/01/2019' and '07/26/2019'
and CWM.Media like '%ROP%' --and CWM.RetMktID=23201
Order by 1,2,3,4

Select Top 10 * from MasterAdviewData..MCAPVehiclePages


Select Distinct Advertiser, Market, RetMktID, Year(CWM.Addate) [Year], count( distinct cast(topleftx as varchar) +'-'+ cast(toplefty as varchar) +'-'+ cast(bottomrightx as varchar) +'-'+ cast(bottomrighty as varchar))
from MasterAdviewData..AdviewMain CWM
Join MasterAdviewData..MasterPageDetailTable PG
On CWM.FlyerID = PG.FlyerId   
Where CWM.RetMktID in (413,728,745,1267,1268,1615,1662,2072,2073,2140,2211,2635,3120,3587,3590,3967,4305,4306,4477,4558,4724,5081,5982,5984,6482,6612,6762,6842,7124,7172,7257,7259,7454,7526,7874,7889,8065,8219,8334,8533,8951,9042,9487,9613,9686,10434,10450,10464,10726,10727,10739,10907,10910,11159,11173,11286,11472,12155,12227,12335,12888,12972,12975,13730,13731,13732,13733,13734,13735,13736,13737,13739,13740,13741,13742,14326,15178,15294,15421,15527,16909,17073,17140,17149,17702,17730,18131,18434,18763,19110,19160,19476,19518,19592,19594,19661,19724,19738,19794,22135,22146,22152,22164,22175,22202,22234,22236,22242,22252,22267,22278,22283,22528,22532,22542,22544,22554,22559,22569,22579,22582,22583,22592,22602,22615,22619,22647,22662,22670,22709,22711,22712,22719,22793,22795,22797,22802,22812,22824,22838,22839,22845,22856,22890,22899,22921,22923,22953,22978,22985,22994,22995,22996,23007,23008,23014,23022,23056,23063,23163,23201,23248,23255,23386,23440,23492,24794,24861,24872,25652,25681,25685,27102,27103,27124,28126,28845,29015,34833,35018,44263,44264,45397,45398)
and CWM.Media like '%ROP%' --and CWM.RetMktID=23201
Group By Advertiser, Market, RetMktID, Year(CWM.Addate)
Order by 1,2,3,4
