
USE [ClientRecordset]
 ALTER DATABASE [ClientRecordset] 
 SET RECOVERY SIMPLE WITH NO_WAIT DBCC SHRINKFILE(N'ClientRecordset_Log', 1) ALTER DATABASE [ClientRecordset] SET RECOVERY FULL WITH NO_WAIT


 --take backup manually of CRS on MT2SQL14