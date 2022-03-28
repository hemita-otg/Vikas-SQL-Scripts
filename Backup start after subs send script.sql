--Start : Client DataDB Backup Kick 
Declare @Kick_DataDB_BackUp as bit=0
Declare @DataLoaded as bit=0
Declare @BackUpLocation as varchar(500)

Select @DataLoaded=dataloaded, @BackUpLocation=backuplocation from MT2SQL14.Connection.dbo.Nightlyprocessing
where sqlserver =right(@@servername,5) and DateAdd(d, 0, DateDiff(d, 0, ClientRunSet)) = DATEADD(d,DATEDIFF(d,0,GETDATE()-1),0)  


    Select @Kick_DataDB_BackUp=count(1)
		 from MT2SQL14.Subscription.dbo.pendingsubscriptions  p join MT2SQL14.Subscription.dbo.Subscription s on p.subscriptionid=s.subscriptionid join MT2SQL14.sitecontrol.dbo.categorycode c on s.categorycodeid=c.id
		where deliverydate = convert(varchar(10), getdate(), 101) and C.ClientServer=@@SERVERNAME
		having  count(1)=0
		


IF @Kick_DataDB_BackUp=0 and @DataLoaded=1 and @BackUpLocation is null
	Update MT2SQL14.Connection.dbo.AdviewBackupLocation SET BackupStartTime=CONVERT(TIME,GETDATE())  Where BackupType=@@SERVERNAME 
	
--Reset Time to 9 AM for next day in clientDataDB job for respective server via below update	
--Update MT2SQL14.Connection.dbo.AdviewBackupLocation SET BackupStartTime='09:00:00.0000000'  Where BackupType=@@SERVERNAME  
--End : Client DataDB Backup Kick 


 --Select * from pendingsubscriptions  p join Subscription s on p.subscriptionid=s.subscriptionid join sitecontrol..categorycode c on s.categorycodeid=c.id
	--	where deliverydate = convert(varchar(10), getdate(), 101)


		
 --Select distinct clientserver	 from pendingsubscriptions  p join Subscription s on p.subscriptionid=s.subscriptionid join sitecontrol..categorycode c on s.categorycodeid=c.id
	--	where deliverydate = convert(varchar(10), getdate(), 101)
