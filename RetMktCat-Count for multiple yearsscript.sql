--part 1
create table tempdb..RetMktCat
(
Retailer varchar(100),
Market varchar(50),
Category varchar(50),
Count08 int,
Count09 int,
Count10 int,
Count11 int
)


create table tempdb..tempRetMkt
(
Retailer varchar(100),
Market varchar(50)

)
insert into tempdb..tempRetMkt
select distinct advertiser,market from adviewmain

create table tempdb..tempCat
(

Category varchar(50)

)
insert into tempdb..tempCat
select distinct category from masterpagedetailtable


select * from tempdb..tempretmkt
select * from tempdb..tempcat

select * from tempdb..retmktcat




/*
select distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
into tempdb..MasterRetMktCat from 
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate) >= '2008' and year(cwm.addate) <= '2011'
*/


select * from tempdb..MasterRetMktCat

select min(addate),max(addate) from tempdb..masterretmktcat



/*
insert into tempdb..retmktcat 
select distinct advertiser,m.market,c.category,0,0,0,0 from tempdb..masterretmktcat m join 
tempdb..tempretmkt rm on m.advertiser=rm.retailer and m.market=rm.market join
tempdb..tempcat c on m.category=c.category
*/


select * from tempdb..RetMktCat order by 1,2,3

/*
update rmc 
set count11= m.cnt
from tempdb..retmktcat rmc 
join (select advertiser,market,category,count(pagedetailid) as cnt from tempdb..masterretmktcat where year(addate)='2011'
	group by advertiser,market,category) m on 
rmc.retailer=m.advertiser and rmc.market=m.market and rmc.category=m.category
*/

/*
select * --distinct advertiser,market,category,addate,cwm.flyerid,pdt.pagedetailid
 from 
adviewmain  cwm with (nolock) join 
masterpagedetailtable  pdt with (nolock)
on cwm.flyerid=pdt.flyerid and
year(cwm.addate)='2008' -- >= '2008' and year(cwm.addate) <= '2009'
and advertiser='21st Amendment Wine & Spirits' and market='Indianapolis, IN' and category='Wine'
*/


use masterclientcoverage

select distinct mcc.clientid,advertiser,market into tempdb..ClientRetMktCoverage from masterclientcwm mcc join retmkt rm 
on mcc.retmktid=rm.retmktid

select * from tempdb..ClientRetMktCoverage

select distinct cc.clientid,mc.realcategory into tempdb..ClientCategoryCoverage
from mt2sql14.sitecontrol.dbo.vw_merchandisecategory mc join mt2sql14.sitecontrol.dbo.categorycode cc
on mc.categorycodeid=cc.[id]

select * from  tempdb..ClientCategoryCoverage



select top 100 * from tempdb..masterretmktcat
select * from tempdb..retmktcat

select top 10 rm.clientid,m.advertiser,m.market,m.category,
case when year(m.addate)='2008' then count(pagedetailid) else 0 end as Count2008,
case when year(m.addate)='2009' then count(pagedetailid) else 0 end as Count2009,
case when year(m.addate)='2010' then count(pagedetailid) else 0 end as Count2010,
case when year(m.addate)='2011' then count(pagedetailid) else 0 end as Count2011
into tempdb..final
from tempdb..masterretmktcat m
join tempdb..ClientRetMktCoverage rm on m.advertiser=rm.advertiser and m.market=rm.market 
join tempdb..ClientCategoryCoverage c on m.category=c.realcategory
group by rm.clientid,m.advertiser,m.market,year(m.addate),m.category


-- Part 2
select Advertiser, Market, Category, year(Addate) as Year, count(PageDetailID) as PDTCount
into tempdb..Mastertbl from tempdb..masterretmktcat
group by Advertiser, Market, Category, year(Addate)

select   distinct rm.clientid,m.advertiser,m.market,m.category,cast([year] as int) year,pdtcount
into tempdb..Final
from tempdb..Mastertbl m
join tempdb..ClientRetMktCoverage rm on m.advertiser=rm.advertiser and m.market=rm.market 
join tempdb..ClientCategoryCoverage c on m.category=c.realcategory and rm.clientid=c.clientid
where rm.clientid < 700 
order by 1,2,3,4

---Part 3


select clientName, advertiser, market, category,  year, pdtcount 
into tempdb..final1
from tempdb..final A
inner join mt2sql14.subscription.dbo.clientprofile b on
a.clientid=b.clientid
order by 1,2,3,4,5


select clientName, advertiser, market, category, [2008],[2009],[2010],[2011]
 into tempdb..FinalReport
 from 
 (select clientName, advertiser, market, category,[year],pdtcount from tempdb..final1)up
 pivot (sum(pdtcount) For [YEAR] IN ([2008],[2009],[2010],[2011])) as pvt
 order by clientName, advertiser, market, category

select distinct clientname from tempdb..finalreport

Select * into tempdb..a1 from tempdb..finalreport
where clientname in 
('3M Canada', 'Abbott Canada', 'Abbott Diabetes Care', 'Abbott Nutrition', 'ACHFood Canada', 'Acosta', 'Acosta - QuickClear™', 'Acosta Canada Inc.', 'Advantage Sales & Marketing Canada', 'Advantage Sales and Marketing', 'Afexa Canada', 'Agropur Canada', 'Ahold', 'Albertsons LLC', 'Alcon Laboratories', 'Allergan Canada', 'AMC Direct, INC', 'Anglo Canadian Housewares', 'Anheuser-Busch InBev', 'Atkins Nutritionals', 'Avery Dennison', 'B&G Foods', 'Bacardi', 'Bar-S', 'Bausch & Lomb', 'Bausch Canada', 'Baxters Canada', 'Bay Valley Foods', 'Bayer', 'Bayer Canada', 'Beiersdorf Canada', 'Bel Brands', 'Bell-Carter', 'BIC', 'BIC Inc. Canada', 'Bissell', 'Blue Diamond Growers', 'Bolthouse Farms', 'Bozzuto''s', 'Brown-Forman', 'Bumble Bee', 'Bush Brothers Company', 'Butterball', 'Cadbury Adams Canada', 'California Strawberry Commission', 'California Table Grape', 'Campbell Company of Canada', 'Campbell Soup Company', 'Capitol Husting FV', 'Cargill', 'Cargill Canada', 'Carl Buddig', 'Cascades Tissue Group Canada', 'Central Garden', 'CH Robinson', 'Chattem, Inc.', 'Chelan Fresh Marketing', 'Chiquita', 'Church & Dwight', 'Clif Bar, Inc', 'Clorox Canada', 'Clorox Commercial Company', 'CocaCola Canada', 'Colgate BG', 'Colgate Canada', 'Colgate-Palmolive', 'ConAgra Foods', 'ConAgraFoods Canada', 'Constellation Wines U.S.', 'Corby Canada', 'CordonBleu Canada', 'Coty', 'Crayola', 'Crossmark', 'Crown Imports', 'CVS', 'Cyba Stevens Canada')


Select * into tempdb..a2 from tempdb..finalreport
where clientname in 
('Dairy Farmers of America', 'Daisy Brand', 'Dannon', 'Danone Canada Inc.', 'Dare Foods', 'Dean Foods Company', 'Del Monte Fresh Produce', 'Desert Glory, LTD', 'Diageo Canada', 'Diageo FV', 'Diageo North America', 'Diamond Foods', 'Dietz & Watson', 'DNE', 'Dole Fresh Vegetables', 'Dole Packaged Foods Company Canada', 'Domex Superfresh Growers', 'Dr Pepper Snapple Group', 'Dreyers Grand Ice Cream', 'Driscoll Strawberry Associates', 'Dulcinea Farms', 'E.D. Smith Foods Ltd. Canada', 'E.J. Gallo Winery', 'Energizer - Schick', 'Energizer Canada', 'EnergizerPersonalCare Canada', 'EnergizerTotal Canada', 'Family Dollar', 'Federated Co-operatives Limited Canada', 'Ferolie', 'Ferrero Canada', 'Flowers Foods, Inc', 'Foster Farms', 'Fresh & Easy', 'Fresh Look Marketing', 'Freudenberg Canada', 'Fujifilm', 'Gay Lea Foods Canada', 'GE Appliances', 'General Mills Canada Corporation', 'Georgia-Pacific', 'Gerber Products Company', 'Ghirardelli', 'Giumarra', 'GlaxoSmithKline', 'GlaxoSmithKline Canada', 'Glazers FV', 'Gorton''s, Inc', 'Goya Foods', 'Green Mountain Coffee', 'Growers Express, LLC', 'Hallmark', 'Hass Avocado Board', 'Hatfield Quality Meats', 'HC Brill', 'Heineken', 'Heinz', 'Heinz Canada', 'Hershey Canada', 'Hersheys', 'High Liner Foods', 'High Liner Foods Incorporated Canada', 'Hill''s Pet', 'Hormel Foods', 'HP Hood/Kemps', 'Huhtamaki', 'IPC & Authorized Shippers', 'Irving Tissue Canada', 'Jamieson Laboratories Canada', 'Janes Family Foods Ltd Canada', 'Jarden Canada', 'Jarden Consumer Solutions', 'JBS USA, Inc.', 'Jim Beam Brands Company', 'Johnson & Johnson', 'Johnson & Johnson Canada', 'Johnsonville', 'Just Born', 'Kao Brands', 'Kellogg Company', 'Kelloggs Canada', 'Kimberly-Clark', 'KimberlyClark Canada', 'Kings Super Markets', 'KitchenAid Canada', 'Kraft Canada Inc.', 'KrispyKernels Canada', 'Kruger Canada', 'L''Oreal Canada Inc.', 'Lance, Inc', 'Land O''Lakes', 'Lassonde Canada', 'Liberte Canada', 'Lindt Canada', 'Loblaw Companies Ltd. Canada', 'Malt-O-Meal', 'Maple Leaf Consumer Foods Inc. Canada', 'Maple Lodge Farms Canada', 'MarsCanada', 'Massimo Zanetti Beverage', 'Mattel Canada', 'Maybelline and LOreal', 'McCain Foods', 'McCormick Canada', 'Mead Johnson Nutrition Canada', 'Medisense Canada', 'Meilleures Marques Canada', 'Merisant', 'Metro Richelieu Inc. Canada', 'Mike''s Hard Lemonade', 'MillerCoors', 'Mission Foods', 'Mission Produce Inc', 'Moet', 'Molson - West Canada', 'Molson Canada', 'Motts Canada', 'Musco Olives', 'National Cattlemen’s Beef Association', 'National Mango Board', 'National Pork Board', 'National Watermelon Board', 'National Wine & Spirits (FV)', 'Naturipe Farms', 'Nestle Canada', 'Nestle Corporation', 'Nestle Waters', 'NestlePurina Canada', 'NestleWaters Canada', 'Nissin Foods', 'Norseland, Inc.', 'North American Breweries', 'Novartis', 'Novartis Consumer Health Canada Inc.', 'Ocean Spray', 'Ocean Spray International Services, Inc. Canada', 'OfficeMax', 'Olymel Canada', 'Oppenheimer', 'Overwaitea Food Group Canada', 'Pactiv', 'Palermo''s', 'Paramount Farms', 'Parmalat Canada', 'Patron', 'Pear Bureau', 'Pennzoil Canada', 'Pepsi Canada', 'PepsiCo, Inc', 'Perishables Group', 'Pernod Ricard FV', 'Pfizer', 'Pfizer Canada', 'Pharmasave Drugs (National) Ltd. Canada', 'Philips Consumer Lifestyle', 'Pinnacle Foods', 'Pompeian, Inc.', 'Post', 'PRG-Schultz Canada', 'Price Chopper', 'Procter & Gamble', 'Procter & Gamble Canada', 'Produce For Better Health', 'Purina Pet Care', 'Rainier Fruit Company', 'Ralston Foods', 'Reckitt & Benckiser Canada', 'Reckitt Benckiser', 'Red Gold, Inc', 'Revlon', 'Rich Products', 'Rite-Aid', 'RNDC FV', 'Roche', 'Roche Canada', 'RonzoniFoods Canada', 'Rubbermaid Canada', 'Ruiz Foods', 'S.C. Johnson', 'S.C. Johnson Canada', 'Sanford L.P.', 'Saputo Dairy Products Canada G.P.', 'SaputoBakery Canada', 'Sara Lee', 'Sara Lee Fresh', 'Sargento Cheese', 'Schering Canada', 'Schreiber Foods', 'Schwan''s Consumer Brands', 'Scotts Canada', 'Sears Holdings', 'Shoppers Drug Mart Canada', 'Simmons Canada', 'Smithfield Foods', 'Smuckers Canada', 'Sobeys Capital Incorporated Canada', 'Sorrento', 'Spectrum Brands', 'Star Produce Ltd', 'Starbucks', 'State Garden', 'Ste. Michelle', 'Stemilt', 'Steuben Foods', 'Storck Canada', 'Sun Products', 'Sun Products Canada', 'Sun-Rype Products Canada', 'Sunbeam Canada', 'Sundance Beverage, Inc', 'Sunkist Growers', 'Sunstar Americas', 'SUPERVALU', 'SWS FV')


Select * into tempdb..a3 from tempdb..finalreport
where clientname in 
( 'T. Marzetti Company', 'Target', 'Telus Canada', 'The Boston Beer Company', 'The Coca-Cola Company', 'The J.M. Smucker Company', 'The North West Company Canada', 'TreeTop', 'Tyson - Deli', 'Unilever', 'Unilever Canada', 'United Industries', 'United Liquors FV', 'US Nutrition', 'Valio USA', 'VanHoutte Canada', 'Ventura Foods', 'WA Fruit', 'Walmart', 'Walmart Canada', 'Wells Dairy', 'Weston Bakeries Limited Canada', 'Wirtz Beverage Group (FV)', 'Wisconsin Milk Marketing Board', 'WN Pharmaceuticals Canada', 'World Kitchen', 'Wrigley Canada', 'Wrigley Company')
