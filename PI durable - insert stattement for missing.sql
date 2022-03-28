select * from categorycode where id in
(2827
,2353
,2353
,3403
,3403
,3404
,3404
,2501
) 


select 'insert into #adsids(trackno,madcode,page) values('+ cast(trackno as varchar)+','+ cast(madcode as varchar)+','''+ cast(page as varchar)+''')' from MT2SQL05.sql05.dbo.whfdetailreports	   where trackno < 500000000 and flyerid in (select flyerid from mt2sql05.sql05.dbo.whfflyerreports where year(addate) = '2017' and month(addate) in (03,04,05)) --217326     
select 'insert into #adsids(trackno,madcode,page) values('+ cast(trackno as varchar)+','+ cast(madcode as varchar)+','''+ cast(page as varchar)+''')' from MT2SQL05.sql05.dbo.GEA50detailreports   where trackno < 500000000 and flyerid in (select flyerid from mt2sql05.sql05.dbo.GEA50flyerreports where year(addate) = '2017' and month(addate) in (03,04,05)) --980747 --876404
select 'insert into #adsids(trackno,madcode,page) values('+ cast(trackno as varchar)+','+ cast(madcode as varchar)+','''+ cast(page as varchar)+''')' from MT2SQL01.sql01.dbo.wcl50detailreports   where trackno < 500000000 and flyerid in (select flyerid from mt2sql05.sql05.dbo.wcl50flyerreports where year(addate) = '2017' and month(addate) in (03,04,05)) --19865 --
select 'insert into #adsids(trackno,madcode,page) values('+ cast(trackno as varchar)+','+ cast(madcode as varchar)+','''+ cast(page as varchar)+''')' from MT2SQL05.sql05.dbo.pebADLdetailreports  where trackno < 500000000 and flyerid in (select flyerid from mt2sql05.sql05.dbo.pebADLflyerreports where year(addate) = '2017' and month(addate) in (03,04,05)) 	--183311
select 'insert into #adsids(trackno,madcode,page) values('+ cast(trackno as varchar)+','+ cast(madcode as varchar)+','''+ cast(page as varchar)+''')' from MT2SQL05.sql05.dbo.pebcadetailreports   where trackno < 500000000 and flyerid in (select flyerid from mt2sql05.sql05.dbo.pebcaflyerreports where year(addate) = '2017' and month(addate) in (03,04,05)) --128690