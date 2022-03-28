---MT1SQL01------------------------------------------------------
\\mt1ftp1\ftp\AdviewEntryData

use MasterData

update adlerttofv
set rerun =1 
--select * from adlerttofv
 where DatabaseCategory in 
('cngd','craADL','dliADL','dysca','gilADL50','hpADL','hpADL2','hpca','iciADL','INT50','lego50','legocan','lowADL50','LowAdS50','mtl50','myr50','pgNBDDur50','taradl250','tarADL50','vlspr')

----JOBS---------------------

Extract FV Data - Client Exports 1
Extract FV Data - Client Exports 2

----JOBS---------------------

---MT2SQL01------------------------------------------------------
\\Mt2ftp1\ftp\Chicago\ADlertToFVConversion

Job : ADlert-FV - Sequencial Processing