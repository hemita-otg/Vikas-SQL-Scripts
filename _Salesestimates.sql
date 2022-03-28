-- Run on MT2SQL03

--Categories lookup by category name with Insert
--select distinct 'insert into #categoriestemp(category) values(''' + category + ''')' from masteradviewdata.dbo.tempmanufacturer where category like '%Wine%' 
--SELECT * FROM masteradviewdata.dbo.tempmanufacturer where category = ('Prepared Meals - Dry')order by brand

--Fr. Single Serve Entrée

--All Categories With Insert
--select distinct 'insert into #categoriestemp(category) values(''' + Category + ''')' from mt2sql00.entrydata.dbo.jaalldisplaycategory 
--select distinct * from mt2sql00.entrydata.dbo.jaalldisplaycategory 
--All Categories
--select distinct MerchandiseCategory, CategoryGroup, Category from mt2sql00.entrydata.dbo.jaalldisplaycategory where categorygroup = 'corn' order by merchandiseCategory, categorygroup, category

--Advertiser/Market Combos with Insert by retailer
--select 'insert into #retmktstemp(advertiser, market) values(''' + advertiser + ''',''' + market + ''')' from masterclientcoverage.dbo.retmkt where advertiser like '%Frys food%' and active = '1' and (priority = '1')
--
--Advertiser/Market Combos with Insert by Market
--select 'insert into #retmktstemp(advertiser, market) values(''' + advertiser + ''',''' + market + ''')' from masterclientcoverage.dbo.retmkt where market like '%Denver, CO%' and active = '1' and (priority = '1')

--Advertiser/Market Combos with Insert by Client
--select distinct 'insert into #retmktstemp(advertiser, market) values(''' +  advertiser + ''',''' + market + ''')' from masterclientcoverage.dbo.retmkt rm join masterclientcoverage.dbo.masterclientcwm mcc on rm.retmktid = mcc.retmktid and mcc.categorycodeid in (1893)

--Select Categories by Client
--select 'insert into #categories(category) values(''' + realcategory + ''')' from mt2sql14.sitecontrol.dbo.vw_merchandisecategory where categorycodeid in (267)


--select * from mt2sql14.subscription.dbo.ClientProfile where ClientName like '%Hersheys%'
--select * from mt2sql14.subscription.dbo.ClientProfile where Clientid like '%301%'
--select * from mt2sql14.sitecontrol.dbo.categorycode where Clientid = 267
--select * from mt2sql14.subscription.dbo.ClientProfile where Clientcode = 'cp'
--select * from mt2sql14.sitecontrol.dbo.categorycode where category = 'Hersheys'  --if no Cats

Use SQL03 

set nocount on
declare @startdt datetime
declare @enddt datetime
declare @email varchar(255)
Declare @cc varchar (255)
declare @client varchar(255)
--set @email = 'suchida@markettrack.com;cwhite@markettrack.com;MLaraway@markettrack.com;ssaunders@markettrack.com;aaolsen@markettrack.com;kbirdsall@markettrack.com;'
set @email = 'SQLSalesEstimates@markettrack.com;'
--set @email = 'pmakwana@markettrack.com;'
--set @email = 'pjohnson@markettrack.com;halapati@markettrack.com'
set @client =  'Kraft PR'
set @startdt = '01/01/2015'
set @enddt = '12/31/2015'





if object_id('tempdb.dbo.#categories') is not null
drop table #categories
create table #categories (
categorygroup varchar(50),
category varchar(50)
)
if object_id('tempdb.dbo.#categoriestemp') is not null
drop table #categoriestemp
create table #categoriestemp (
categorygroup varchar(50),
category varchar(50)
)
if object_id('tempdb.dbo.#retmkts') is not null
drop table #retmkts
create table #retmkts (
tradeclass varchar(50),
advertiser varchar(50),
market varchar(50)
)
if object_id('tempdb.dbo.#retmktstemp') is not null
drop table #retmktstemp
create table #retmktstemp (
tradeclass varchar(50),
advertiser varchar(50),
market varchar(50)


)


insert into #categoriestemp(category) values('Pasta Sauces')
insert into #categoriestemp(category) values('Salad/Cooking Oil')
insert into #categoriestemp(category) values('Spices & Seasonings')
insert into #categoriestemp(category) values('Vinegar')














insert into #categories 
Select distinct * from #categoriestemp

--select * from #categories


update c
set c.categorygroup = dc.categorygroup
from #categories c
join mt2sql00.entrydata.dbo.jaalldisplaycategory dc with (nolock) on c.category = dc.category

if exists (select top 1 * from #categories where categorygroup is null)
begin
select 'Category not found.' as msg
select *
from #categories
where categorygroup is null

exec mt2sql00.master.dbo.sp_procExportData
 @subject= 'Categories Not Matching Entry Categories'
 , @message = 'Below are the Categories provided that are not matching with what is available in entry'
 , @recipients = @email
 , @tabname='Missing Categories'
 , @servername = 'MT2SQL03'
 , @dbname = 'tempdb'
 , @query = 'select * from #categories where categorygroup is null'
 , @exporttype = 'table'


return
end


insert into #retmktstemp(advertiser, market) values('Amigo','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Capri','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Casablanca (Supermercados)','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Comercio Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Coopharma','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Costco','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('CVS','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Del Este (Supermercados)','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Econo','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Botiquin','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Farmacias Aliadas','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Gigante (Supermercados)','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Good Neighbor Pharmacy','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Hatillo Kash & Karry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Hermanos Santiago Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('JF Montalvo Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Kmart','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Mr. Special','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Oscar Super Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Perez Hermanos (Supermercados)','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Pitusa','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Plaza Loiza Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Ponce Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Progreso Cash & Carry','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Pueblo','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Ralphs Food Warehouse','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Sams Club','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Selectos (Supermercados)','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Supermax','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Topeka','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Union','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Walgreens','Puerto Rico')
insert into #retmktstemp(advertiser, market) values('Walmart','Puerto Rico')







insert into #retmkts
select distinct * from #retmktstemp

--select * from #retmkts

update r
set r.tradeclass = rm.tradeclass
from #retmkts r
join masterclientcoverage.dbo.retmkt rm on r.advertiser = rm.advertiser and r.market = rm.market


if exists (select top 1 * from #retmkts where tradeclass is null)
begin
select 'RetMkt not found.' as msg
select *
from #retmkts
where tradeclass is null

exec mt2sql00.master.dbo.sp_procExportData
 @subject= 'Retailer Markets Not Matching Entry RetMkts'
 , @message = 'Below are the Retailer Markets combinations provided that are not matching with what is available in entry'
 , @recipients = @email
 , @tabname='Missing Retatiler Markets'
 , @servername = 'MT2SQL03'
 , @dbname = 'tempdb'
 , @query = 'select * from #retmkts where categorygroup is null'
 , @exporttype = 'table'

return
end


declare @subj varchar(255)
declare @msg varchar(8000)
declare @filename varchar(255)
declare @daterange varchar(255)
declare @line varchar(255)
declare @crlf varchar(2)
set @crlf = char(13)+char(10)
set @daterange = case 
when year(@startdt) = year(@enddt) and datediff(d,@startdt,@enddt) between 364 and 365 then datename(yyyy,@startdt)
else dbo.fnFormatDateTime(@startdt,'%m/%d/%Y')+'-'+ dbo.fnFormatDateTime(@enddt,'%m/%d/%Y')
end

set @subj = @client + ' Category Counts by Ret/Mkt for ' + @daterange
set @filename = @client + ' Category Counts by RetMkt for ' + replace(@daterange,'/','-')+'.xls'
set @msg = @subj + '<br>'+@crlf+
 'Categories included:<br>'+@crlf
declare lines cursor for
select category+'<br>'+@crlf
from #categories
open lines
fetch next from lines into @line
while @@fetch_status = 0
begin
set @msg = @msg + @line
fetch next from lines into @line
end
close lines
deallocate lines
set @msg = @msg + '<br>'+@crlf+
 'Ret/Mkts included:'+@crlf+
 '<table>'+@crlf
declare lines cursor for
select '<tr><td>'+advertiser+'</td><td>'+market+'</td></tr>'+@crlf
from #retmkts
open lines
fetch next from lines into @line
while @@fetch_status = 0
begin
set @msg = @msg + @line
fetch next from lines into @line
end
close lines
deallocate lines
set @msg = @msg+'</table>'+@crlf

if object_id('tempdb.dbo.EntryCounts') is not null
drop table tempdb.dbo.EntryCounts


select cwm.advertiser, cwm.market, pdt.category, 
count(pdt.pagedetailid) as EnteredYTD, 
Cast(0 as int) as ArchiveYTD
into tempdb.dbo.EntryCounts
from masteradviewdata.dbo.MasterPageDetailTable pdt with (nolock) 
join #categories c on pdt.category = c.category
join masteradviewdata.dbo.adviewmain cwm with (nolock) on pdt.flyerid = cwm.flyerid
join #retmkts rm on cwm.advertiser = rm.advertiser and cwm.market = rm.market
where cwm.Addate  between @startdt and @enddt
group by cwm.advertiser, cwm.market, pdt.category
option(maxdop 1)

if object_id('tempdb.dbo.EntryCountsArchive') is not null
drop Table tempdb.dbo.EntryCountsArchive


select cwm.advertiser, cwm.market, ca.category, count(*) as  ArchiveYTD
into tempdb.dbo.EntryCountsArchive
from masteradviewdata.dbo.MasterArchiveCategory ca with (nolock) 
join #categories c on ca.category = c.category
join masteradviewdata.dbo.adviewmain cwm with (nolock) on ca.flyerid = cwm.flyerid
join #retmkts rm on cwm.advertiser = rm.advertiser and cwm.market = rm.market
where cwm.Addate between @startdt and @enddt
and cwm.flyerid not in (select flyerid from mt2sql00.triggercwm.dbo.digitalfilter)
group by cwm.advertiser, cwm.market, ca.category
option(maxdop 1)

Update a
set a.ArchiveYTD = B.ArchiveYTD 
From tempdb.dbo.EntryCounts A 
Join tempdb.dbo.EntryCountsArchive B On A.Advertiser = b.Advertiser and A.market = b.market and A.category = b.category

Insert Into tempdb.dbo.EntryCounts
select advertiser, market, category, 0, ArchiveYTD 
from tempdb.dbo.EntryCountsArchive 
where advertiser + market+Category not in (select advertiser+market+Category from  tempdb.dbo.EntryCounts)

if object_id('tempdb.dbo.EntryCountsAll') is not null
drop table tempdb.dbo.EntryCountsAll


select rmc.advertiser, rmc.market, rmc.category, 
IsNull(cast(ec.EnteredYTD as varchar),'N/A') as EnteredYTD, 
IsNull(cast(ec.ArchiveYTD as varchar),'N/A') as ArchiveYTD
into tempdb.dbo.EntryCountsAll
from (select rm.advertiser, rm.market, c.category
from #retmkts rm, #categories c) rmc
left outer join tempdb.dbo.EntryCounts ec on rmc.advertiser = ec.advertiser and rmc.market = ec.market and rmc.category = ec.category
order by rmc.advertiser, rmc.market, rmc.category

--Alter table tempdb.dbo.EntryCountsAll add CategoryGroup Varchar(50)
--Update t set CategoryGroup = c.categorygroup
--from tempdb.dbo.EntryCountsAll t
--join mt2sql00.entrydata.dbo.jaalldisplaycategory c on t.category = c.category

exec master.dbo.mt_proc_send_cdosysmail
@from = 'sql@markettrack.com'
  , @to = @email
  , @cc = @cc
  , @subject= @subj
  , @body = @msg
  , @bodytype = 'html'
  , @query = 'select Advertiser, Market, Category, EnteredYTD [In-the-box], ArchiveYTD Parked from tempdb.dbo.EntryCountsAll'
  , @queryoutput = 'attachment'
  , @queryattachmentname = @filename

print 'email sent on ' + dbo.fnFormatDateTime(getdate(),'%x %X')




--------Check Category exists-------

--Select distinct Category from mt2sql00.entrydata.dbo.jaalldisplaycategory
--Where category='Drinks - Soy/Rice'

--Select distinct Category from mt2sql00.MasterAdviewData.dbo.MasterPageDetailTable
--Where category like '%Soy/Rice%'

--------Check Category exists-------