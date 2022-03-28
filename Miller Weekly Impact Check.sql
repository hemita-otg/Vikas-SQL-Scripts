use sql08


select object_name(id), * from syscolumns where name like 'weeklyindex%'


select * from mil50NielsenSalesData_ClusterWeeklyIndexValue
where weekofn = '06/08/2019' and [Market Short Description] = 'FESTIVAL FOODS TOTAL CENSUS TA'

select SUM([Total$]) [Total$Sum]

		from mil50NielsenSalesData_Intermediate where [Period Description Short] = '1 W/E 06/08/19'  and [Market Short Description] = 'FESTIVAL FOODS TOTAL CENSUS TA' 
		GROUP BY [WeekOfN] ,[Period Description Short], [Market Short Description]
		
select AVG([Total$Sum]) [AvgTotal$Sum]
		from mil50NielsenSalesData_ClusterWeeklyIndexValue where  [Market Short Description] = 'FESTIVAL FOODS TOTAL CENSUS TA' 
		GROUP BY  [Market Short Description]

select top 100 sum([$]) from Nielsen_MillerCoors_SalesData where [Period Description Short] = '1 W/E 06/08/19'  and [Market Short Description] = 'FESTIVAL FOODS TOTAL CENSUS TA' 
