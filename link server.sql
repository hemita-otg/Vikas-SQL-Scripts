use connection


select * from SQLPArameters where sqlserver='mt2dev2'

USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL00', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL00' , 'false', NULL, 'sa', '7E05BCF2-DAE3-414C-BAD4-EF4CB8FFE269' 


USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL01', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL01' , 'false', NULL, 'sa', '058E75AE-48A3-4706-8DE0-7A865DEB58DE' 

USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL02', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL02' , 'false', NULL, 'sa', '3747CA59-22CD-4351-AC12-D8A56CC79E34' 


USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL04', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL04' , 'false', NULL, 'sa', '255BBE01-F028-4152-B7E2-F63DCBBDC8F0' 

USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL05', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL05' , 'false', NULL, 'sa', 'B3E0AD7D-401E-49BD-B4A4-999411D2E648' 


USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL06', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL06' , 'false', NULL, 'sa', '608760D4-3671-45CE-AAF4-2DD3CA34406D' 


USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL14', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL14' , 'false', NULL, 'sa', 'F741A5FD-EB12-4815-BAE1-23299587D180' 


USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL15', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL15' , 'false', NULL, 'sa', '14EAC0A5-EEE7-4BEC-9A50-CD3B8372490F' 


USE master 
GO 
EXEC sp_addlinkedserver 'mt2dev1', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'mt2dev1' , 'false', NULL, 'sa', '8162018E-BCD6-440C-A4D7-3C245378FD90' 


USE master 
GO 
EXEC sp_addlinkedserver 'mt2dev2', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'mt2dev2' , 'false', NULL, 'sa', 'BA0AAF18-070F-4630-BF3E-BACD0CE8596E' 

