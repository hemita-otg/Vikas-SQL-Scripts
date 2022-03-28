CVS	Boston, MA	Insert-Paper



select * into tempdb..flyerreports from mt2asql01.tempdb.dbo.f
select * into tempdb..flyerreports from mt2asql01.tempdb.dbo.flyerreports

select * from tempdb..flyerreports 
--select * into tempdb..flyerreports from mt2asql01.tempdb.dbo.f


select top 100 trackno,* from mt2sql05.sql05.dbo.mwv50flyerreports 

with 
live as (select * from mt2sql05.sql05.dbo.mwv50flyerreports ),
bkup as (select trackno from tempdb.dbo.t )
select distinct advertiser,market,media,count(flyerid) from live left join bkup on live.trackno = bkup.trackno 
where bkup.trackno is null 
group by advertiser,market,media
order by count(flyerid) desc 


GO


with 
live as (select * from mt2sql05.sql05.dbo.mwv50flyerreports ),
bkup as (select * from tempdb.dbo.tr )
select distinct bkup.advertiser,bkup.market,bkup.media,count(bkup.flyerid) from live right join bkup on live.trackno = bkup.trackno 
where live.trackno is null 
group by bkup.advertiser,bkup.market,bkup.media
order by count(bkup.flyerid) desc 


select * from mt2sql00.tempdb.dbo.flyerreports 

select count(1) from masterdurdata..MasterDurFlyerReports --
--MT2a - 2948033
--MT2 - 2954517

select count(1) from masterdurdata..tempAdviewMainDur
where flyerid in( select cast(flyerid as varchar(15)) from  mt2sql00.tempdb.dbo.flyerreports )



select distinct * into tempdb..t  from masterdurdata..MasterDurFlyerReports
where flyerid in( select cast(flyerid as varchar(15)) from  mt2sql00.tempdb.dbo.flyerreports ) -- 41966



select * from masterdurdata..MasterDurFlyerReports
where flyerid in( select cast(flyerid as varchar(15)) from  mt2sql00.tempdb.dbo.flyerreports ) -- 41966


Exec MasterClientCoverage.dbo.[CreateEntryPoolFlyerReportsDur] 'USAll',0

select count(1) from masterclientcoverage..USAllFlyerReports

--mt2a -- 2122926
--mt2 --  2131502

select 235 - 120 

with
l as (select * from mt2sql05.sql05.dbo.mwv50flyerreports where advertiser='Walmart' and market='Atlanta' and media='ROP'),
s as (select * from masterclientcoverage..USAllFlyerReports where advertiser='Walmart' and market='Atlanta, ga' and media='ROP')
select l.* from l left join s on l.trackno = s.trackno 
where s.trackno is null 

		
select * from mt2sql05.sql05.dbo.mwv50flyerreports where trackno in ('617130452','516276785')
select * from masteradviewdata..mcapvehiclepages where vehicleid in ('617130452','516276785')
select * from masteradviewdata..mcapvehiclepages where flyerid in (12027452,12032600)
select entryprojectid,active,* from masteradviewdata..adviewmain where flyerid in ('12027452','12032600')


select year(addate),month(addate),count(flyerid) from tempdb..flyerreports  where advertiser='CVS' and market='Boston, MA' and media='Insert-Paper'
group by year(addate),month(addate) order by 1,2
 
select year(addate),month(addate),count(flyerid) from mt2sql05.sql05.dbo.mwv50flyerreports  where advertiser='CVS' and market='Boston' and media='Insert-Paper'
group by year(addate),month(addate)	order by 1,2	


select  * from tempdb..flyerreports  where advertiser='CVS' and market='Boston, MA' and media='Insert-Paper'
and  year(addate)='2015' and month(addate)=11
 
select * from mt2sql05.sql05.dbo.mwv50flyerreports  where advertiser='CVS' and market='Boston' and media='Insert-Paper'
and  year(addate)='2015' and month(addate)=11



select active,entryprojectid,* from masteradviewdata..adviewmain where flyerid in ('6954209','6963258')

select * from masteradviewdata..MCAPVehiclePages where flyerid in ('6954209','6963258')


select year(addate),month(addate),count(flyerid) from tempdb..flyerreports  where advertiser='staples' and market='Boston, MA' and media='Insert-Paper'
group by year(addate),month(addate) order by 1,2
 
select year(addate),month(addate),count(flyerid) from mt2sql05.sql05.dbo.mwv50flyerreports  where advertiser='staples' and market='Boston' and media='Insert-Paper'
group by year(addate),month(addate)	order by 1,2	


select  * from tempdb..flyerreports  where advertiser='staples' and market='Boston, MA' and media='Insert-Paper'
and  year(addate)='2015' and month(addate)=8
 
select * from mt2sql05.sql05.dbo.mwv50flyerreports  where advertiser='staples' and market='Boston' and media='Insert-Paper'
and  year(addate)='2015' and month(addate)=8


select * from ('6705749','6723529')