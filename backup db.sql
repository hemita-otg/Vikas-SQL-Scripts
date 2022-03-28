
Declare @SQL varchar(2000)
	Declare @DBName varchar(2000)
	Declare @backupLoc varchar(2000)
	Declare @DeviceName varchar(2000)

SET @backuploc='\\MT2BU\ClientBU\'
set @DeviceName='xSQL02'

SET @SQL = 'USE Master
			BACKUP DATABASE  SQL02  To Disk = ''' + @backuploc + @devicename + '.bak''  WITH  INIT ,  NOUNLOAD ,  SKIP ,  STATS = 10,  FORMAT '

		Exec(@sql)
