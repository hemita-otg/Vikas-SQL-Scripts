If Exists (select top 1 name from tempdb..sysobjects where xtype='u' and name='tempMAP')
Drop Table tempdb..tempMAP
Go

		select * into tempdb..tempMAP from mt2sql00.masterdurdata.dbo.DurPDTMapCons where conspagedetailid in 
		(select pagedetailid from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate)

If Exists (select top 1 name from tempdb..sysobjects where xtype='u' and name='DCRecords')
Drop Table tempdb..DCRecords
Go


		select distinct dc.pagedetailid ,pc.trackno,pc.madcode,pc.page
		into tempdb..DCRecords
		from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate dc
		join tempdb..tempMAP map on dc.pagedetailid = map.conspagedetailid
		join mt2sql00.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll tfa on dc.flyerid = tfa.consflyerid
		Join masterclientcoverage.dbo.TempJAPageDetailTable_DUR  pc on tfa.trackno = pc.trackno and cast(dc.page as varchar(50)) = pc.page and map.madcode = pc.madcode

--with new view---------------------------
If Exists (select top 1 name from tempdb..sysobjects where xtype='u' and name='DCRecords')
Drop Table tempdb..DCRecords
Go


		select distinct dc.pagedetailid ,pc.trackno,pc.madcode,pc.page
		into tempdb..DCRecords
		from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate dc
		join tempdb..tempMAP map on dc.pagedetailid = map.conspagedetailid
		join mt2sql00.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll_Test tfa on dc.flyerid = tfa.consflyerid
		Join masterclientcoverage.dbo.TempJAPageDetailTable_DUR  pc on tfa.trackno = pc.trackno and cast(dc.page as varchar(50)) = pc.page and map.madcode = pc.madcode
--with new view---------------------------

	
--Consumable PI process - DC records
		select * from masterclientcoverage.dbo.TempJAPageDetailTable where pagedetailid like '%dc' and pagedetailid not  in (select pagedetailid from MasterClientCoverage..TempFuturePDTPreviousDay )

--Durable PI process - DC records
		select * from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate -- 53542
		select * from tempdb..DCRecords -- 33719 

--Common
		select * from masterclientcoverage.dbo.TempJAPageDetailTable t join tempdb..DCRecords td on t.PageDetailID =td.pagedetailid 


-- flyerid missing in vwTracknoDurFlyerIdConsFlyeridAll --2272 
		select distinct dc.pagedetailid from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate dc left join mt2sql00.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll tfa
		on dc.flyerid=tfa.consflyerid where 
		tfa.consflyerid is null 


-- data missing in masterclientcoverage.dbo.TempJAPageDetailTable_DUR -- 19824
		select distinct dc.pagedetailid  from mt2sql00.triggerdb.dbo.DurConsPageDetailTableUpdate dc 
		left join tempdb..tempMAP map on dc.pagedetailid = map.conspagedetailid 
		left join mt2sql00.masterdurdata.dbo.vwTracknoDurFlyerIdConsFlyeridAll tfa on dc.flyerid=tfa.consflyerid
		left join masterclientcoverage.dbo.TempJAPageDetailTable_DUR  pc on tfa.trackno = pc.trackno and cast(dc.page as varchar(50)) = pc.page and map.madcode = pc.madcode
		 where 
		pc.trackno is null or tfa.consflyerid is null 

--DC records PI created by Consumable PI- 52899
		select distinct pagedetailid  from mt2sql14.connection.dbo.pdtprocessed where pagedetailid in (
		select pagedetailid from masterclientcoverage.dbo.TempJAPageDetailTable where pagedetailid like '%dc' and pagedetailid not  in (select pagedetailid from MasterClientCoverage..TempFuturePDTPreviousDay ))

--DC records PI created by Durable PI  - 52899
		select * from mt2sql14.connection.dbo.pdtprocessed_dur ppd join tempdb..DCRecords dc  on ppd.trackno=dc.trackno and ppd.madcode=dc.madcode and ppd.page=dc.page 

		
--select 53542 - (37686 + 2272 + 19824)


select top 200000 * from mt2sql14.connection.dbo.pdtprocessed_dur order by prodimagecreatedon desc 