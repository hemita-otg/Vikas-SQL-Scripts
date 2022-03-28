--Change name insted of below
ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempdev, FILENAME = 'D:\SQLData\tempdb.mdf');
GO

ALTER DATABASE tempdb 
MODIFY FILE (NAME = templog, FILENAME = 'D:\SQLData\templog.ldf');
GO


ALTER DATABASE tempdb MODIFY FILE (NAME = temp2, FILENAME = 'D:\SQLData\tempdb_mssql_2.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp3, FILENAME = 'D:\SQLData\tempdb_mssql_3.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp4, FILENAME = 'D:\SQLData\tempdb_mssql_4.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp5, FILENAME = 'D:\SQLData\tempdb_mssql_5.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp6, FILENAME = 'D:\SQLData\tempdb_mssql_6.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp7, FILENAME = 'D:\SQLData\tempdb_mssql_7.ndf');
ALTER DATABASE tempdb MODIFY FILE (NAME = temp8, FILENAME = 'D:\SQLData\tempdb_mssql_8.ndf');

-- Restart SQL Servercies

-- Delte old files from Old Drive