select distinct advertiser,market,a.retmktid,a.clientid,b.clientname 
from FRRetMkt a join sitecontrol..vw_catinfo b 
on a.clientid=b.clientid 
join mt2sql00.masterclientcoverage.dbo.retmkt c 
on a.retmktid=c.retmktid 
join Subscription..clientprofile d 
on b.clientid=d.clientid
where d.IsActiveClient =1 and a.clientid in (
402,434,706,94,408,554,700,311,157,623,183,863,663,329,351,782,586,666,829,338,701,309,762,869,179,558,616,412,830,323,1079,135,556,300,375,1367,825,1351,353,896,886,724,646,417,206,794,839,727,669,410,888,798,862,1042,1234,404,429,767,176,130,1371,123,310,354,305,681,325,400,1352,406,303,1075,1306,340,806,440,190,87,357,112,343,828,81,807,13
)

