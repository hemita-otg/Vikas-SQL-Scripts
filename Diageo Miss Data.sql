select active,EntryProjectID ,* from MasterAdviewData.dbo.adviewmain where flyerid in ('19863892')
select * from MasterAdviewData.dbo.MasterPageDetailTable where flyerid in ('19863892')
select distinct category from MasterBevAL.dbo.MasterBevALDetailReports where flyerid in ('19863892')

select * from mt2sql07.sql07.dbo.dga50detailreports where flyerid in ('19863892') and category in ('Rum - Flavored','Gin - Imported','Irish','VSOP Cognac','Cocktails','Wine','Rum - Traditional','Domestic Brandy','Imported Brandy','Sparkling Wines','Rum - Spiced','Dessert Wines','NAW - Bourbon','Drink Mixes/Garnish','NAW - Canadian','Vodka - Unflavored','NAW - Blends','Vodka - Flavored','Tequila','Scotch - Single Malts','Scotch - Blends','VS Cognac','Gin - Domestic','Cordials / Liqueurs','Sake / Plum Wine','XO / Other Cognac')
select * from mt2bu1.sql07.dbo.dga50detailreports where flyerid in ('19863892') and category in ('Rum - Flavored','Gin - Imported','Irish','VSOP Cognac','Cocktails','Wine','Rum - Traditional','Domestic Brandy','Imported Brandy','Sparkling Wines','Rum - Spiced','Dessert Wines','NAW - Bourbon','Drink Mixes/Garnish','NAW - Canadian','Vodka - Unflavored','NAW - Blends','Vodka - Flavored','Tequila','Scotch - Single Malts','Scotch - Blends','VS Cognac','Gin - Domestic','Cordials / Liqueurs','Sake / Plum Wine','XO / Other Cognac')


select * from masterclientcoverage.dbo.TempBevALDetailReports  where flyerid in ('19863892')


select distinct category from mt2sql07.sql07.dbo.dga50disquerypage order by 1 


select * from mt2sql07.MasterBevAL.dbo.MasterBevALDetailReports where flyerid in ('19863892') and  category in 
('Beer Alternatives','Cordials / Liqueurs','NAW - Bourbon','Rum - Spiced','Vodka - Unflavored')



select * from mt2sql07.sql07.dbo.dga50detailreports where flyerid in ('19863892') and  category in 
('Beer Alternatives','Cordials / Liqueurs','NAW - Bourbon','Rum - Spiced','Vodka - Unflavored')

select * from mt2sql07.sql07.dbo.dga50detailreports_futuredelete where flyerid in ('19863892') and  category in 
('Beer Alternatives','Cordials / Liqueurs','NAW - Bourbon','Rum - Spiced','Vodka - Unflavored')

select * from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in (
select originalpagedetailid  from MasterBevAL.dbo.MasterBevALDetailReports where flyerid in (
select distinct flyerid  from dga50FlyerReports where advertiser='meijer' and addate='2017-11-26 00:00:00.000')
)

----------------------


select * from mt2sql00.fvdatalog.dbo.tempjapagedetailtablelog where pagedetailid in 
('044458002EC','044458003EC','044458004EC','044458005EC')

select * from mt2sql00.masterclientcoverage.dbo.tempfuturepdt where pagedetailid in 
('044458002EC','044458003EC','044458004EC','044458005EC')


----------------------

select * from acfvcdetailmap where destpagedetailid in 
('044458002EC','044458003EC','044458004EC','044458005EC')


select * from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in 
('214161196AC','214161271AC','214161384AC','214161452AC')





select * from mt2sql00.masterclientcoverage.dbo.tempbevaldetailreports where originalpagedetailid in 
('044458002EC','044458003EC','044458004EC','044458005EC')



Select X.*

From TempJAPageDetailtable X
where X.Flyerid not in (Select Flyerid from MasterAdViewData..AdviewMain) 
AND X.Flyerid not in (Select Flyerid from MasterAdViewData..FlyerExp)
and pagedetailid in ('044458002EC','044458003EC','044458004EC','044458005EC')



Select X.*
From TempJAPageDetailtable X
where ISNULL(X.prodimagecreated,0)=0 --And X.PageDetailId Not In (Select Distinct PageDetailId From [TempFuturePDT])
and pagedetailid in ('044458002EC','044458003EC','044458004EC','044458005EC')


Select * from TempJAPagedetailtable where Pagedetailid in (
select Map.DestPageDetailId from TempFuturePDT PDT
inner join MasterMappingTables.dbo.MT360PDTMap MAP on MAP.SourcePageDetailId = PDT.PageDetailID
Where PDT.PageDetailId Not In (Select PageDetailId From MT2SQL14.Connection.dbo.PDTProcessedTEMP)
)
--and pagedetailid not in (select pagedetailid from TempFuturePDT)
and pagedetailid in ('044458002EC','044458003EC','044458004EC','044458005EC')



Select * from TempJAPagedetailtable where Pagedetailid in (
select Map.DestPageDetailId from TempFuturePDT PDT
inner join MasterMappingTables.dbo.RepEmailDetailMap MAP on MAP.SourcePageDetailId = PDT.PageDetailID
Where PDT.PageDetailId Not In (Select PageDetailId From MT2SQL14.Connection.dbo.PDTProcessedTEMP)
)
--and pagedetailid not in (select pagedetailid from TempFuturePDT)
and pagedetailid in ('044458002EC','044458003EC','044458004EC','044458005EC')


select * from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in (
select pagedetailid,ProdImageCreated  from masterclientcoverage..TempFuturePDT p join masteradviewdata..adviewmain c on p.flyerid=c.flyerid where advertiser='meijer' and addate='2017-11-26 00:00:00.000' 
and ProdImageCreated =1
)


select distinct SourcePageDetailId  from MasterMappingTables..acfvcdetailmap where destpagedetailid in 
('044457092EC','044457093EC','044457094EC','044457095EC','044457096EC','044457097EC','044457098EC','044457100EC','044457101EC','044457102EC','044457546EC','044457547EC','044457548EC','044457549EC','044457550EC','044457551EC','044457552EC','044457554EC','044457555EC','044457556EC','044459827EC','044459828EC','044459832EC','044459834EC','044455273EC','044455275EC','044455276EC','044454835EC','044454836EC','044454837EC','044454838EC','044458002EC','044458003EC','044458004EC','044458005EC','044455721EC','044455722EC','044455723EC','044455724EC','044456633EC','044456637EC','044456639EC','044458915EC','044458916EC','044458917EC','044458918EC','044458919EC','044458920EC','044458921EC','044458923EC','044458924EC','044458925EC','044459372EC','044459373EC','044459374EC','044459375EC','044459377EC','044459381EC','044456173EC','044456174EC','044456178EC','044456180EC','044458459EC','044458460EC','044458461EC','044458462EC')

select active,EntryProjectID , * from MasterAdviewData..AdviewMain where flyerid in (
select distinct flyerid  from masterclientcoverage..TempFuturePDT where pagedetailid in 
('214161771AC','214161856AC','214161983AC','214163755AC','214161452AC','214161336AC','214161305AC','214161271AC','214161196AC','214161097AC','214163755AC','214161715AC','214161122AC','214163755AC','214161196AC','214161271AC','214161384AC','214161452AC','214161715AC','214161196AC','214161122AC','214161452AC','214161384AC','214161271AC','214161196AC','214163755AC','214161715AC','214161196AC','214161452AC','214161384AC','214161271AC','214161196AC','214161097AC','214161196AC','214161271AC','214161305AC','214161336AC','214161452AC','214161771AC','214161856AC','214161983AC','214163755AC','214161097AC','214161196AC','214161271AC','214161305AC','214161336AC','214161452AC','214161771AC','214161856AC','214161983AC','214163755AC','214161271AC','214161305AC','214161384AC','214161656AC','214163755AC','214161196AC','214161271AC','214161384AC','214161452AC','214161097AC','214161122AC','214161196AC','214161715AC','214163755AC')
)


select * from  masterclientcoverage..TempFuturePDT  where pagedetailid in 
('214161771AC','214161856AC','214161983AC','214163755AC','214161452AC','214161336AC','214161305AC','214161271AC','214161196AC','214161097AC','214163755AC','214161715AC','214161122AC','214163755AC','214161196AC','214161271AC','214161384AC','214161452AC','214161715AC','214161196AC','214161122AC','214161452AC','214161384AC','214161271AC','214161196AC','214163755AC','214161715AC','214161196AC','214161452AC','214161384AC','214161271AC','214161196AC','214161097AC','214161196AC','214161271AC','214161305AC','214161336AC','214161452AC','214161771AC','214161856AC','214161983AC','214163755AC','214161097AC','214161196AC','214161271AC','214161305AC','214161336AC','214161452AC','214161771AC','214161856AC','214161983AC','214163755AC','214161271AC','214161305AC','214161384AC','214161656AC','214163755AC','214161196AC','214161271AC','214161384AC','214161452AC','214161097AC','214161122AC','214161196AC','214161715AC','214163755AC')
and ProdImageCreated =0



select *  from MasterMappingTables..acfvcdetailmap where sourcepagedetailid in ('214161715AC','214161771AC')

update MasterClientCoverage..tempfuturepdt set prodimagecreated=0 where pagedetailid in 
('044455275EC','044456178EC','044456637EC','044459832EC','044814307EC','044457098EC','044457552EC','044458921EC')
