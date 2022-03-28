
--select * into sql03..Promotions from acfvincr..Promotions
--select * into sql03..MPVOrigin from acfvincr..MPVOrigin with(nolock)
--select * into sql03..MPVVariety from acfvincr..MPVVariety

--and below are the update statements to update the values 

--Divyang: I started updates on SQL13 masteracfv detail tables over weekend you can take care of SQL16 and SQL17 

--Krunal: Please take care of SQL03 for the same 

update  a set a.Promotions = b.Promotions from sql03..ACFVDetailReports a
join 
sql03..Promotions b
on 
b.adc_i = a.OriginalPagedetailid where b.promotions is not null option (maxdop 1)

GO
update  a set a.MPVOrigin = b.MPVOrigin from sql03..ACFVDetailReports a
join 
sql03..MPVOrigin b
on 
b.adcompbrand_i = a.ACAdCompBrandId where b.MPVOrigin is not null option (maxdop 1)
GO 

update  a set a.MPVVariety = b.MPVVariety from sql03..ACFVDetailReports a
join 
sql03..MPVVariety b
on 
b.adcompbrand_i = a.ACAdCompBrandId where b.MPVVariety is not null option (maxdop 1)
