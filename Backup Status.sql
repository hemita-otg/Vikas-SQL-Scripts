Select distinct top 10  DataDatabase,RestorePriority from [MT2SQL14].[connection].dbo.Adview2DataServers A,  
	[MT2SQL14].[connection].dbo.nightlyprocessing B
	Where ServerName not like 'MT2a%' and ServerName not in ('MT2Dev1','MT2SQL00','MT2SQL12') and Type = 'Client'
	And DataDatabase = B.SQLServer 
	And DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE()-1),0) 
	And DataLoaded = 1 And BackupEnd Is NULL 
	--And ProcessingEnd Is Not Null And ProcessingEnd > ClientRunSet And BackupEnd Is NULL 
	Order By RestorePriority


select * from [MT2SQL14].[connection].dbo.nightlyprocessing

--update [MT2SQL14].[connection].dbo.nightlyprocessing set backuplocation=null,backupstart=null,backupend=null where processid in (70918)

select * from [MT2SQL14].[connection].dbo.Adview2DataServers where servername <> 'mt2sql00'
and servername not like 'MT2a%' and servername not in ('mt2sql05','mt2sql01','mt2dev1') order by restorepriority

select * from [MT2SQL14].[connection].dbo.adviewbackuphistory

select * from [MT2SQL14].[connection].dbo.adviewbackuplocation
--update [MT2SQL14].[connection].dbo.adviewbackuplocation  set backupstarttime = '05:00:00.0000000'  where backupstarttime is not null 
select * from [MT2SQL14].[connection].dbo.backuprunning

--update [MT2SQL14].[connection].dbo.backuprunning set flag=0


--update [MT2SQL14].[connection].dbo.adviewbackuplocation set BackUpStartTime ='06:00:00.0000000' where BackUpStartTime ='09:00:00.0000000'


select * from masterfields where fieldname like '%priority%'

select distinct a.clientid,clientname    from vw_QvfcFields a 
join subscription..clientprofile b on a.clientid=b.clientid  
join SiteControl..categorycode c on b.MasterCategoryCodeID50 =c.id and fvcctype  in (2,4,6)
where displayname like '%Ad Priority%' and displayseq is not null and isinternal!=1 and IsActiveClient =1 order by 1 

select * from subscription..clientprofile
