declare @sql as varchar(5000)
set @SQl=''
declare @ConversionDataDb varchar(75)
declare @PDTTableName varchar(75)
declare @categorycode  varchar(75)
set @ConversionDataDb='sql01'
set @PDTTableName='offdepagedetailtable'
set @categorycode='offde'
SET @sql  = 'UPDATE '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' SET 
			Category = T.RenamedCategory
			FROM '+ @ConversionDataDb + '.dbo.' + @PDTTableName + ' PDT JOIN ConversionControl..MCUpdate T
			ON PDT.Category = T.Category AND PDT.Comments1 like ''%'' + T.Comments1 + ''%''  
			WHERE T.DatabaseCategory IN(''' + @categorycode + ''') option (maxdop 1)'
--print @sql
execute(@sql)