SELECT distinct table_name,count(column_name)  FROM INFORMATION_SCHEMA.COLUMNS WHERE 
 TABLE_SCHEMA = 'dbo'
AND TABLE_NAME like '%detailreports%' and table_name not like '%_orphaned' and table_name not like '%_futuredelete'
group by table_name
order by 2 