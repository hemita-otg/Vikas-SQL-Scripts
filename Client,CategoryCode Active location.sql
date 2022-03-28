select * from vwClientDBBackupLocation	
							
							

select distinct clientid,db.activesql 
from ClientAppParameters cap
join ClientGroup cg on cap.clientgroupid = cg.clientgroupid
join vwDBParameters db on cap.databaseparameterid = db.databaseparameterid
join vwClientDBBackupLocation cbl on cbl.sqlserver= activesql 


select distinct Categorycodeid,Category,db.activesql 
from CategoryAppParameters cap
join vwDBParameters db on cap.databaseparameterid = db.databaseparameterid
join sitecontrol..categorycode cc on cc.id=cap.CategoryCodeID 
join vwClientDBBackupLocation cbl on cbl.sqlserver= activesql 
where AppName = 'FeatureVisionV50'
order by 2 




select distinct appname from ClientAppParameters