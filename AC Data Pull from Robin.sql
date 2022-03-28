
/*
SELECT aac.alt_nm AS [Manufacturer]
FROM adCompBrand acb
INNER JOIN brand b ON acb.brand_i = b.brand_i
INNER JOIN adAltComp aac ON b.alt_i = aac.alt_i;


SELECT * 
FROM ad_circular_log 
WHERE-- circ_i = 1311615 AND
 log_tp_i = 9 --publish
ORDER BY create_dt ASC
select * from acfv..tempacfv
*/


/* Step 1 Generate ACFlyerReports Table */
--select * from Tempdb.dbo.ACFlyerReports
If Exists(select name from Tempdb.dbo.sysobjects where name = 'ACFlyerReports')
	Drop Table Tempdb.dbo.ACFlyerReports
GO

select distinct  
 
	 c.circ_i as FlyerId
	, r.retailer_i as advertiserid
	, r.company_nm as advertiser
	, c.city_i as marketid
	, city.city_nm+', '+city.state_c as market
	, r.retailer_i+c.city_i as retmktid
	, ascii(c.circ_tp_c) as mediaid
	, ct.client_nm as media
	, rop.name as publication
	, f.filter_i as tradeclassid
	, f.filter_nm as tradeclass
	,(select max(create_dt) from  adcentry.dbo.ad_circular_log l where circ_i = c.circ_i  and log_tp_i = 9  ) as Addate
	, c.circ_week_dt as addate_week
	, c.start_dt as salestartdate
	, c.end_dt as saleenddate
	, cp.pages
	, rg.region_i as RegionId
	, rg.region_nm as Region
	, cnt.country_i as CountryID
	, cnt.country_nm as Country
	, (select min(l.create_dt) from adcentry.dbo.ad_circular_log l where l.circ_i = c.circ_i and l.log_tp_i = 9) as PublishedOn
	, c.circ_i as VehicleId
	INTO TEMPDB..ACFlyerReports
from adcentry.dbo.adcircular c
join adcentry.dbo.vwmtdt_CircPages cp on c.circ_i = cp.circ_i
join adcentry.dbo.ad_retailers r on c.retailer_i = r.retailer_i
join adcentry.dbo.city city on c.city_i = city.city_i
join adcentry.dbo.region rg on city.region_i = rg.region_i
join adcentry.dbo.country cnt on city.country_i = cnt.country_i
join adcentry.dbo.ad_circ_tp ct on c.circ_tp_c = ct.circ_tp_c
join adcentry.dbo.adfilter f on r.filter_i = f.filter_i
--join adcentry.dbo.ad_circular_log l on c.circ_i = l.circ_i and l.log_tp_i = 9  
left outer join adcentry.dbo.ad_rop_status rop on c.rop_i = rop.rop_i
--left outer join tempdb.dbo.mtdtFlyerReports e on c.circ_i = e.vehicleid
where c.version_nbr = 1
and c.circ_tp_c in ('B','E')
and year(c.circ_week_dt) =year(Getdate()) and month(c.circ_week_dt) ='9'
--and year(c.circ_week_dt) =year(Getdate()) and month(c.circ_week_dt) =month(Getdate()) and Day(c.circ_week_dt) =Day(Getdate())
--and e.vehicleid is null
GO

/* Step 2 Generate ACPAGEReports Table */

If Exists(select name from Tempdb.dbo.sysobjects where name = 'ACPAGEReports')
	Drop Table Tempdb.dbo.ACPAGEReports
GO

select distinct fr.flyerid
	,fr.vehicleid 
	, pg.pg_nbr as page
	, pg.circ_img_path as img	
	, cast(replace(right(pg.circ_img_path,charindex('/',reverse(pg.circ_img_path))-1),'.jpg','') as varchar(50)) as imagename
	, pg.page_c+cast(pg.pg_nbr as varchar) as pagename
	, pt.page_nm as FVSystemPage
	, pt.page_nm as FVDisplayPage
	, case when pg.pg_nbr = 1 then 1 else 0 end as FrontPageInd
	, case when pg.pg_nbr = fr.pages then 1 else 0 end as BackPageInd
	, pt.page_nm as Features
	into TEMPDB..ACPAGEReports	
from TEMPDB..ACFlyerReports fr
join adcentry.dbo.adCircularPg pg on fr.vehicleid = pg.circ_i
left outer join adcentry.dbo.ad_page_tp pt on pg.page_c = pt.page_c
--left outer join tempdb.dbo.mtdtPageReports e on fr.vehicleid = e.vehicleid and pg.pg_nbr = e.page
--where e.vehicleid is null
GO


/* Step 3 Generate ACDetailReports Table */

If Exists(select name from Tempdb.dbo.sysobjects where name = 'ACDetailReports')
	Drop Table Tempdb.dbo.ACDetailReports
GO

select distinct ab.adcompbrand_i as pagedetailid
	, pr.flyerid
	, pr.page
	, aac.alt_nm as manufacturer
	, mc.level_nm as merchandisecategory
	, msc.level_nm as merchandisesubcat
	, cat.level_nm as category
	, bg.brand_grp_i as brandid
	, bg.brand_grp_nm as brand
	, case when ad.regprice2_d > 0 then ad.regprice2_d else null end as SalePrice2
	, ad.regprice_d as RegularPrice1
	, ad.regprice2_d as RegularPrice2
	, ad.net_unit_price as NorPrice
	, ad.net_unit_price as UnitPrice
	, case when ad.limit_nm > 1 then ad.limit_nm else null end as NumberPackage
	, case when ad.rebate_amnt > 0 then ad.rebate_amnt else ad.coupon_amnt end as OtherDiscountD2
	, ad.create_dt as Optional2
	, ad.user_nm as optional3
	, ad.update_dt as optional4	
	, b.brand_nm as Comments1
	, ad.offer_nm as OfferDes
	, co.topleftx
	, co.toplefty
	, co.bottomrightx
	, co.bottomrighty
	, ab.size_nm as UnitType
	, ad.incentive_nm as MPVPageEvent
into tempdb.dbo.ACDetailReports
from tempdb.dbo.ACPageReports pr with (nolock)
join adcentry.dbo.adcircular c with (nolock) on pr.vehicleid = c.circ_i
join adcentry.dbo.adcircularpg cp with (nolock) on c.circ_i = cp.circ_i and pr.page = cp.pg_nbr
join adcentry.dbo.adCompare ad with (nolock) on cp.circ_pg_i = ad.circ_pg_i
join adcentry.dbo.adcompbrand ab with (nolock) on ad.adc_i = ab.adc_i
join adcentry.dbo.brand b with (nolock) on ab.brand_i = b.brand_i
join adcentry.dbo.brand_grp bg with (nolock) on b.brand_grp_i = bg.brand_grp_i
JOIN adcentry.dbo.adAltComp aac ON b.alt_i = aac.alt_i
join adcentry.dbo.adHierarchy cat with (nolock) on b.sub_cat_i = cat.level_i
join adcentry.dbo.adHierarchy msc with (nolock) on cat.parent_i = msc.level_i
join adcentry.dbo.adHierarchy mc with (nolock) on msc.parent_i = mc.level_i
left outer join adcentry.dbo.vwmtdt_coordinates co with (nolock) on ad.adc_i = co.adc_i


--Consolidated Table

If Exists(select name from acfv.dbo.sysobjects where name = 'TempACFV')
	Drop Table acfv..TempACFV
GO

with 
cwm as (select  * from tempdb..acflyerreports ), 
page as (select  * from tempdb..acpagereports ),
pdt as (select  * from tempdb..acdetailreports )
select distinct
cwm.FlyerId,advertiserid,advertiser,marketid,market,retmktid,mediaid,media,publication,tradeclassid,tradeclass,addate,salestartdate,saleenddate,pages,RegionId,Region,CountryID,Country,page.VehicleId,page.page,img,imagename,pagename,FVSystemPage,FVDisplayPage,FrontPageInd,BackPageInd,Features,pagedetailid,manufacturer,merchandisecategory,merchandisesubcat,category,brandid,brand,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,UnitPrice,NumberPackage,OtherDiscountD2,Optional2,optional3,optional4,Comments1,OfferDes,topleftx,toplefty,bottomrightx,bottomrighty,UnitType,MPVPageEvent
into acfv..TempACFV
from cwm join pdt on cwm.flyerid=pdt.flyerid join page on page.flyerid=pdt.flyerid and page.page=pdt.page


/* Step 4 Generate Log  */


--select PageDetailID,getdate() as DT into master..PDTLOG from tempdb.dbo.ACDetailReports
--select FlyerID,getdate() as DT into master..CWMLOG from tempdb.dbo.ACFlyerReports
 
select Distinct addate,FlyerID,PageDetailID,getdate() as DT into ACFVLOG..ACFVLOG from ACFV.dbo.TempACFV



--Backup at FTP

Declare @dbs table(tname varchar(50))
Declare @SQL varchar(2000)
Declare @DBName varchar(2000)
Declare @backupLoc varchar(2000)

insert into @dbs values('ACFV')
set @backuploc =  '\\mt7ftp0\FTP\ADEntry\ACtoFV\'
--SELECT @backuploc = BackupLocation FROM [MT2SQL14].[Connection].dbo. AdviewBackupLocation WHERE BackupType = 'MasterAdviewData'

declare dnamecur cursor for select tname from @dbs
open dnamecur
fetch next from dnamecur into @dbname
while @@Fetch_Status = 0
begin
	set @SQL = 'BACKUP DATABASE ' + @DBName + ' To Disk = ''' + @backuploc + @dbname + '.bak'' WITH INIT '
	EXEC(@sql)
fetch next from dnamecur into @dbname	
end
CLOSE dnamecur
DEALLOCATE dnamecur



--Restore at MT2SQL00

restore database ACFV
	from Disk ='C:\Temp\ACFV.bak'
	with replace, move 'ACFV' to 'D:\SQLData\ACFV_Data.MDF',
		move 'ACFV_Log' to 'D:\SQLData\ACFV_Log.LDF' 
