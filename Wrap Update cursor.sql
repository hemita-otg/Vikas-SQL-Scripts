declare @category varchar(50)
declare @code varchar(50)
declare @SQL varchar(5000)



declare curRMC cursor for
select name from sysobjects where name like '%detailreports' and xtype='u' and name not like '%future%' and name not like '%orphan%'
open curRMC
fetch next from curRMC
into @category

while @@fetch_Status = 0
begin

         --set @SQL= ' UPDATE T SET FEATURES=W.FEATURES,FEATURESID=W.FEATURESID FROM '+@category+' T JOIN MASTERADVIEWDATA..WRAP W ON T.PAGEDETAILID=W.PAGEDETAILIDINT '
         --exec(@SQL)
              
               
set @SQL= 'update a set features = ''Front Page'' , featuresid = 3 from  '+@category+' a where features in (''Stick-On Coupon'')'
exec(@SQL)
set @SQL= 'update a set features = ''Interior Page'' , featuresid = 6 from  '+@category+' a where features in (''Fragrance Card'')'
exec(@SQL)
set @SQL= 'update a set features = ''Wrap'' , featuresid = 9 from  '+@category+' a  where features in  (''Back Wrap'', ''Front Door'', ''Front Wrap'', ''Gatefold'', ''Inside Gatefold'', ''Slip Sheet'', ''Spine Wrap'', ''Insert'')'
exec(@SQL)

              SET @code =replace(@Category,'Detailreports','')

              set @SQL= '
                           if exists (select * from dbo.sysobjects where id = object_id(N''[' + @Code + 'DisFeatures]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
                           drop table [' + @Code + 'DisFeatures]
                           --DisFeatures
                           SELECT distinct [FeaturesId], Isnull([Features],'''') Features 
                           INTO [dbo].[' + @Code + 'DisFeatures]
                           FROM [dbo].[' + @Code + 'DetailReports]
                                    '
              exec (@sql)


                 
               
fetch next from curRMC
into @category

END                       
close curRMC
deallocate curRMC