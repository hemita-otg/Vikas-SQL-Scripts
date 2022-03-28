select distinct advertiser,market,adretid,admktid,weight   from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is not null and YEAR(addate) > '2011' and advertiser like 'sears home%'
select distinct advertiser,market,adretid,admktid,weight  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is  null and YEAR(addate) > '2011' and advertiser like 'sears home%'

select count(1)  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is not null and YEAR(addate) > '2011' and advertiser like 'sears home%'
select count(1)  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is  null and YEAR(addate) > '2011' and advertiser like 'sears home%'

--update MT2SQL05.SQL05.dbo.whlpDetailReports set Weight='C' where weight is  null and YEAR(addate) > '2011' and advertiser like 'sears home%'


select count(1) from whlpDetailReports


select count(1)  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is  null and YEAR(addate) > '2011' and advertiser like 'Sears Home Appliance Showroom%' and flyerid in ('11414997','11411657','11415028','11411692')
select distinct advertiser,market,adretid,admktid,weight  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is not  null and YEAR(addate) > '2011' and advertiser like 'Sears Home Appliance Showroom%'



--update MT2SQL05.SQL05.dbo.whlpDetailReports set Weight='0.450000' where weight is  null and YEAR(addate) > '2011' and advertiser like 'Sears Home Appliance Showroom%' 
and flyerid in ('11414997','11411657','11415028','11411692')






select count(1)  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is  null and YEAR(addate) > '2011' and advertiser like 'Sears Hometown Store%' and flyerid in ('11411661','11415414')
select distinct advertiser,market,adretid,admktid,weight  from MT2SQL05.SQL05.dbo.whlpDetailReports pdt  where pdt.weight is not  null and YEAR(addate) > '2011' and advertiser like 'Sears Hometown Store%'



--update MT2SQL05.SQL05.dbo.whlpDetailReports set Weight='0.112500' where weight is  null and YEAR(addate) > '2011' and advertiser like 'Sears Hometown Store%' 
and flyerid in ('11411661','11415414')
