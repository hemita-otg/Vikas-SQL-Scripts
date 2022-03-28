--select distinct 'insert into #categories(category) values(''' + category + ''')' from masteradviewdata.dbo.tempmanufacturer where category like '%salad%'
--select distinct 'insert into #categories(category) values(''' + Category + ''')' from mt2sql00.entrydata.dbo.jaalldisplaycategory 
--select distinct MerchandiseCategory, CategoryGroup, Category from mt2sql00.entrydata.dbo.jaalldisplaycategory order by merchandiseCategory, categorygroup, category
--select top 1 * from mt2sql00.entrydata.dbo.jaalldisplaycategory order by merchandiseCategory, categorygroup, category
--select 'insert into #retmkts(advertiser, market) values(''' + advertiser + ''',''' + market + ''')' from masterclientcoverage.dbo.retmkt where advertiser like 'super c%' 
--select distinct 'insert into #retmkts(advertiser, market) values(''' +  advertiser + ''',''' + market + ''')' from masterclientcoverage.dbo.retmkt rm join masterclientcoverage.dbo.masterclientcwm mcc on rm.retmktid = mcc.retmktid and mcc.categorycodeid = 100
--select 'insert into #categories(category) values(''' + realcategory + ''')' from mt2sql14.sitecontrol.dbo.vw_merchandisecategory where categorycodeid in (select id from mt2sql14.sitecontrol.dbo.categorycode where sourcecwm like '%EPCANAD%')
--select distinct 'insert into #retmkts(advertiser, market) values(''' +  advertiser + ''',''' + market + ''')' from mt2sql00.entrydata.dbo.fsientrychildwebmain


set nocount on
declare @startdt datetime
declare @enddt datetime
declare @email varchar(255)
Declare @cc varchar (255)
declare @client varchar(255)
--set @email = 'suchida@markettrack.com;cwhite@markettrack.com;MLaraway@markettrack.com;ssaunders@markettrack.com;aaolsen@markettrack.com;kbirdsall@markettrack.com;'
set @email = 'SQLSalesEstimates@markettrack.com;'
--set @email = 'vkantawala@markettrack.com;'
--set @cc = 'pjohnson@markettrack.com;halapati@markettrack.com'
set @client =  'Bolthouse'
set @startdt = '1/1/2014'
set @enddt = '12/31/2014'

if object_id('tempdb.dbo.#categories') is not null
drop table #categories
create table #categories (
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



insert into #categories(category) values('Beverage - Other')
insert into #categories(category) values('Chilled Drinks')
insert into #categories(category) values('Energy Drinks')
insert into #categories(category) values('Fr. Drinks')
insert into #categories(category) values('Iced Tea - Indv')
insert into #categories(category) values('Juice Drinks - SS Bulk')
insert into #categories(category) values('Juice Drinks - SS Indv')
insert into #categories(category) values('Juices - Chilled')
insert into #categories(category) values('Nutrition - Ready To Drink')
insert into #categories(category) values('Tea')
insert into #categories(category) values('Veg - Carrots')
insert into #categories(category) values('Z - Brand Promotion')







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



insert into #retmkts(advertiser, market) values('Atlantic Superstore','Halifax, Nova Scotia')
insert into #retmkts(advertiser, market) values('Calgary Co-op','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Extra Foods','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Extra Foods','Saskatoon, Saskatchewan')
insert into #retmkts(advertiser, market) values('Extra Foods','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Extra Foods','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Food Basics','Ottawa, Ontario')
insert into #retmkts(advertiser, market) values('Food Basics','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Foodland (CAN)','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Fortinos','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('FreshCo (Sobeys)','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('IGA','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('IGA','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('IGA','Vancouver, BC')
insert into #retmkts(advertiser, market) values('IGA','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Loblaws','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Loblaws','Ottawa, Ontario')
insert into #retmkts(advertiser, market) values('Loblaws','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Halifax, Nova Scotia')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Ottawa, Ontario')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Various (CAN)')
insert into #retmkts(advertiser, market) values('Loblaws Corporate','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Longos','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Maxi','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Maxi & Cie','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Metro (CAN)','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Metro (CAN)','Ottawa, Ontario')
insert into #retmkts(advertiser, market) values('Metro (CAN)','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('No Frills','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Overwaitea Food Group','Kamloops, BC')
insert into #retmkts(advertiser, market) values('Price Smart Foods','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Provigo','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('RCSS','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('RCSS','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('RCSS','Saskatoon, Saskatchewan')
insert into #retmkts(advertiser, market) values('RCSS','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('RCSS','Vancouver, BC')
insert into #retmkts(advertiser, market) values('RCSS','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Safeway','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Safeway','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('Safeway','Saskatoon, Saskatchewan')
insert into #retmkts(advertiser, market) values('Safeway','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Safeway','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Save On Foods','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('Save On Foods','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Sobeys','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Sobeys','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('Sobeys','Halifax, Nova Scotia')
insert into #retmkts(advertiser, market) values('Sobeys','Saskatoon, Saskatchewan')
insert into #retmkts(advertiser, market) values('Sobeys','St. Johns, Newfoundland')
insert into #retmkts(advertiser, market) values('Sobeys','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Sobeys','Winnipeg, Manitoba')
insert into #retmkts(advertiser, market) values('Super C (CAN)','Montreal, Quebec')
insert into #retmkts(advertiser, market) values('Thrifty Foods','Vancouver, BC')
insert into #retmkts(advertiser, market) values('Valu-Mart','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Walmart Supercentre','Calgary, Alberta')
insert into #retmkts(advertiser, market) values('Walmart Supercentre','Edmonton, Alberta')
insert into #retmkts(advertiser, market) values('Walmart Supercentre','Ottawa, Ontario')
insert into #retmkts(advertiser, market) values('Walmart Supercentre','Toronto, Ontario')
insert into #retmkts(advertiser, market) values('Zehrs','Toronto, Ontario')




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

select cwm.advertiser, cwm.market, pdt.category, pdt.Brand, count(pdt.pagedetailid) EnteredYTD, Cast(0 as int) ArchiveYTD
into tempdb.dbo.EntryCounts
from masteradviewdata.dbo.MasterPageDetailTable pdt with (nolock) 
join #categories c on pdt.category = c.category 
--and pdt.Brand in ('Abbott Nutrition')
join masteradviewdata.dbo.adviewmain cwm with (nolock) on pdt.flyerid = cwm.flyerid
join #retmkts rm on cwm.advertiser = rm.advertiser and cwm.market = rm.market
where cwm.Addate between @startdt and @enddt
and cwm.flyerid not in (select flyerid from mt2sql00.triggercwm.dbo.digitalfilter)
group by cwm.advertiser, cwm.market, pdt.category, pdt.brand
option(maxdop 1)

if object_id('tempdb.dbo.EntryCountsArchive') is not null
drop Table tempdb.dbo.EntryCountsArchive

select cwm.advertiser, cwm.market, ca.category, ca.brand, count(*) ArchiveYTD
into tempdb.dbo.EntryCountsArchive
from MasterAdviewData.dbo.masterArchiveCategory ca with (nolock) 
join #categories c on ca.category = c.category
--and ca.Brand in ('Jose Cuervo especial','Jack Daniels','Fireball','Red Stag by Jim Beam','Jameson','Jim Beam','Crown Royal','Captain Morgan','Absolut','Grey Goose','Bacardi Superior Light','Jagermeister')
join masteradviewdata.dbo.adviewmain cwm with (nolock) on ca.flyerid = cwm.flyerid
join #retmkts rm on cwm.advertiser = rm.advertiser and cwm.market = rm.market
where cwm.Addate between @startdt and @enddt
and cwm.flyerid not in (select flyerid from mt2sql00.triggercwm.dbo.digitalfilter)
group by cwm.advertiser, cwm.market, ca.category, ca.Brand 
option(maxdop 1)
--select top 1 * from tempdb.dbo.EntryCountsArchive
--select top 1 * from  tempdb.dbo.EntryCounts
--return

Update a
set a.ArchiveYTD = B.ArchiveYTD 
From tempdb.dbo.EntryCounts A 
Join tempdb.dbo.EntryCountsArchive B On A.Advertiser = b.Advertiser and A.market = b.market and A.category = b.category

Insert Into tempdb.dbo.EntryCounts
select advertiser, market, category, brand, 0, ArchiveYTD 
from tempdb.dbo.EntryCountsArchive 
where advertiser + market+Category not in (select advertiser+market+Category from  tempdb.dbo.EntryCounts)

if object_id('tempdb.dbo.EntryCountsAll') is not null
drop table tempdb.dbo.EntryCountsAll

select rmc.advertiser, rmc.market, rmc.category, ec.brand,
IsNull(cast(ec.EnteredYTD as varchar),'N/A') as EnteredYTD, 
IsNull(cast(ec.ArchiveYTD as varchar),'N/A') as ArchiveYTD
into tempdb.dbo.EntryCountsAll
from (select rm.advertiser, rm.market, c.category
from #retmkts rm, #categories c) rmc
left outer join tempdb.dbo.EntryCounts ec on rmc.advertiser = ec.advertiser and rmc.market = ec.market and rmc.category = ec.category
order by rmc.advertiser, rmc.market, rmc.category, ec.brand

exec master.dbo.mt_proc_send_cdosysmail
@from = 'sql@markettrack.com'
      , @to = @email
      , @cc = @cc
      , @subject= @subj
      , @body = @msg
      , @bodytype = 'html'
      , @query = 'select Advertiser, Market, Category, Brand, EnteredYTD [In-the-box], ArchiveYTD Parked from tempdb.dbo.EntryCountsAll'
      , @queryoutput = 'attachment'
      , @queryattachmentname = @filename

print 'email sent on ' + dbo.fnFormatDateTime(getdate(),'%x %X')




