USE CompetiTrackRawData 
GO

/*
Broadcast – Ret, Mkt count of ads, count of occurrences – in panel and out of panel
2013 forward

Sent to Craig, Jacob, Stacy, Amanda, Heather and Anna
*/

IF  EXISTS (SELECT * FROM tempdb.dbo.sysobjects WHERE name = 'AutoQuery_AVPanel')
DROP TABLE tempdb.[dbo].AutoQuery_AVPanel1
GO

IF  EXISTS (SELECT * FROM tempdb.dbo.sysobjects WHERE name = 'AutoQuery_AVPane2')
DROP TABLE tempdb.[dbo].AutoQuery_AVPanel2
GO
--Get a list of active Insert-Digital Flyers
-- that have the same AdDate, Market, Advertiser as the Insert-Paper

select F.Advertiser, F.Market, F.CTLanguage, case when vF.FlyerId is not null then 'In Panel' else '' end Panel,
Count(Distinct F.CTAdCode) AdCodes, count(*) Total_Occurrences
into tempdb.[dbo].AutoQuery_AVPanel1
 from [dbo].[MasterAVFlyerReports] F
left outer join  [dbo].[vwMasterAVFlyerReports_Filtered] vF on vf.FlyerId = F.FlyerId
where F.AdDate >='1/1/2013'
group by  F.Advertiser, F.Market, F.CTLanguage, case when vF.FlyerId is not null then 'In Panel' else '' end
order by Advertiser, CTLanguage

select F.Advertiser, F.CTLanguage, case when vF.FlyerId is not null then 'In Panel' else '' end Panel,
Count(Distinct F.CTAdCode) AdCodes, count(*) Total_Occurrences
into tempdb.[dbo].AutoQuery_AVPanel2
 from [dbo].[MasterAVFlyerReports] F
left outer join  [dbo].[vwMasterAVFlyerReports_Filtered] vF on vf.FlyerId = F.FlyerId
where F.AdDate >='1/1/2013'
group by  F.Advertiser, F.CTLanguage, case when vF.FlyerId is not null then 'In Panel' else '' end
order by Advertiser, CTLanguage
GO


Exec MT2SQL03.master.dbo.sp_procExportData
 @subject = 'BroadCast Panel Report - <date>'
 , @message = ''
 , @recipients = 'vkantawala@markettrack.com;halapati@markettrack.com'
 --, @cc_recipients = 'afalotico@markettrack.com;'
 , @tabname = 'Retailer_Market_Based;Retailer_Based'
 , @filename = 'BroadCast Panel Report - <date>'
 , @servername = 'MT2SQL00a'
 , @dbname = 'tempdb'
 , @query = 'Select * from tempdb.[dbo].AutoQuery_AVPanel1;Select * from tempdb.[dbo].AutoQuery_AVPanel2;'
 , @exporttype = 'Excel'
 , @zip = 'True'