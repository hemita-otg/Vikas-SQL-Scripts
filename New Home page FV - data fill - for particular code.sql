declare @sql nvarchar(max), @clientid varchar(10), @id varchar(10)
Declare @CatCode Varchar(50)='snbPEP'
-- FillHomePageInsight
				SET @SQL = N'SELECT @lclientid = ISNULL(clientid, 0), @lid = ISNULL(id, 0) FROM mt2sql14.sitecontrol.dbo.CategoryCode WHERE category = ''' + @catcode + ''''
				EXECUTE sp_Executesql @SQL, N'@lclientid int OUTPUT, @lid int OUTPUT', @lclientid = @clientid OUTPUT, @lid = @id OUTPUT
				

set @sql = 'EXEC DataSP50Int..[fv_FillHomePageInsightsManufacturerOfferType] '+@clientid+','+ @id+', ''MT2SQL14.SiteControl.dbo.'', ''MT2SQL14.Subscription.dbo.'', '''+@@SERVERNAME+'.'+right(@@servername,5)+'.dbo.'''
				exec (@sql)
				
				set @sql = 'EXEC DataSP50Int..[fv_FillHomePageInsightsRetailerSOV] '+@clientid+','+ @id+', ''MT2SQL14.SiteControl.dbo.'', ''MT2SQL14.Subscription.dbo.'', '''+@@SERVERNAME+'.'+right(@@servername,5)+'.dbo.'' '
				exec (@sql)


--('fePEP','majPEP','nesPEP','eosPEP','snbPEP')