USE master 
GO 
EXEC sp_addlinkedserver 'MT2SQL16', N'SQL Server' 
GO 
Exec sp_addlinkedsrvlogin 'MT2SQL16' , 'false', NULL, 'sa', 'F87077A1-D3E0-4363-8BD8-017458069FC7'