

select * from AdviewBackupLocation 

--update AdviewBackupLocation set backuplocation ='\\MT2BU2\CLIENTBU\' where backuptype='MT2SQL13' and id  = 14


select * from SQLParameters where sqlserver='mt2sql13'

select * from SQLParameters where sqlserver='mt2bu0'

--insert into SQLParameters values(278,'MT2BU0','SQL13','sa','B498EE06-88C4-4B68-99DA-304A6F255AF0')
139

select * from DBParameters where sqlid2=169--182
--UPDATE DBParameters SET SQLID2=278 WHERE SQLID2=169 AND DatabaseParameterID = 182 
select * from vwDBParameters where DatabaseParameterID = 182


select max(sqlid) from SQLParameters

SELECT * FROM vwDBRestoreLocation

SELECT * FROM DBRestoreLocation  
SELECT * FROM DBBACKUPLocation  

--UPDATE DBBACKUPLocation SET BACKUPLOCATION ='\\MT2BU2\CLIENTBU\' WHERE BACKUPSERVER='mt2sql13' AND ID=2

UPDATE DBRestoreLocation SET RESTORESERVER ='MT2BU0' WHERE ID=3 AND BACKUPID=2 