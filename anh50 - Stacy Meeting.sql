select * from mt2sql08.sql08.dbo.ANH50ChangeReport where  originalpagedetailid in ('034983417EC','034990726EC')

select * from mt2sql08.sql08.dbo.anh50detailreports where  originalpagedetailid in ('034983417EC','034990726EC')

select  * from mt2sql08.sql08.dbo.ANH50ExportDetailReports_History  where [Product Detail ID] in ('034983417EC','034990726EC') order by senddate  desc 
-- [Ad Block ID]  in (  769031 ,  769308  )  and  senddate ='12/17/2018'  order by [Ad Block ID] ,senddate  desc 

select  * from mt2sql08.sql08.dbo.ANH50DetailReports where originalpagedetailid in ('034983417EC','034990726EC')

select  * from masteradviewdata.dbo.MasterPageDetailTable  where pagedetailid in ('034983417EC','034990726EC')


select * from mt2sql14.connection.dbo.PDTProcessed where pagedetailid in  ('0039274E525','034990726EC','034983417EC')