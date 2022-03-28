--use acfvincr 
--drop table TempACFVDetailReports_2
--exec sp_rename  'TempACFVDetailReports_2ready','TempACFVDetailReports_2'
--Select*  From sql17.dbo.MasterTableList where TableType = 'Detail'
--select count(1) from TempACFVDetailReports_2
--select count(1) from ACFVINCR.dbo.PDT_Delete
--------------------------------------------------------------------------------------------



Declare @StepName varchar(500) = 'Update ACFVdetail'
--Declare @StepStatus int = (Select StepStatus from dbo.PackageStepDetail with(nolock) where StepName = @StepName)

Declare @sql varchar(max)


SET @sql =	'
						IF Exists(Select name From ACFVINCR.dbo.sysobjects where name = ''PDT_Delete'')
							Drop Table ACFVINCR.dbo.PDT_Delete
		
						Select Pagedetailid Into ACFVINCR.dbo.PDT_Delete From sql17.dbo.ACFVDetailreports with(nolock) where 1 = 2
					'
		EXEC(@sql)
		
		Update sql17.dbo.MasterTableList Set isProcessed = 0 where TableType = 'Detail' and MT2_Tablename ='TempACFVDetailReports_2'
		

		Declare @MT2_Detail varchar(100) 
		  , @i int = 1
		  
		While(@i > 0)
		Begin
				SET @MT2_Detail = (Select Top 1 MT2_Tablename From sql17.dbo.MasterTableList where TableType = 'Detail' And isProcessed = 0)
  
				SET @sql = 'IF EXISTS(Select top 1 * From ACFVINCR..SYSINDEXES WHERE Name=''IDX_PDT_Delete_PageDetailid'' and id = object_id(N''[ACFVINCR].[dbo].[PDT_Delete]''))
							DROP INDEX [IDX_PDT_Delete_PageDetailid] ON ACFVINCR.[dbo].PDT_Delete'
				EXEC(@sql)

				SET @sql =	'
								  Insert Into ACFVINCR.dbo.PDT_Delete
								  Select Pagedetailid From ACFVINCR.dbo.' + @MT2_Detail + ' with(nolock) 
							'
				Print @sql
				EXEC(@sql)

				SET @sql = 'IF EXISTS(Select top 1 * From ACFVINCR..SYSINDEXES WHERE Name=''IDX_PDT_Delete_PageDetailid'' and id = object_id(N''[ACFVINCR].[dbo].[PDT_Delete]''))
								DROP INDEX [IDX_PDT_Delete_PageDetailid] ON ACFVINCR.[dbo].PDT_Delete
							CREATE CLUSTERED INDEX [IDX_PDT_Delete_PageDetailid] ON [ACFVINCR].[dbo].[PDT_Delete] ([Pagedetailid] ASC)'
				EXEC(@sql)

				SET @sql = 'Delete a From sql17.dbo.ACFVMPVOfferType a
							join ACFVINCR.dbo.PDT_Delete b with(nolock) 
							on a.PageDetailId = b.PageDetailId'
				EXEC(@sql)

				declare  @columnname nvarchar(max), @lsql  nvarchar(max)
				set @lsql = 'SELECT @columnname = STUFF((SELECT '','' + name
							 FROM  syscolumns where id in (select id from sysobjects where name = ''ACFVDetailReports'')
							 --ORDER BY name
							 FOR XML PATH('''')), 1, 1, '''')'


				EXECUTE SP_EXECUTESQL @lsql
									, N'@columnname nvarchar(max) output'
									, @columnname = @columnname output
				print(@columnname)

				SET @sql = '
							  Declare @count int = 1
							  While(@Count > 0)
							  Begin
									Select Top 50000 Pagedetailid Into #t From ACFVINCR.dbo.PDT_Delete with(nolock)

									Delete A
									From sql17.dbo.ACFVDetailReports A
									Join #t B with(nolock) on A.pagedetailid = B.pagedetailid

									Insert Into sql17.dbo.ACFVDetailReports ('+ @columnname +')
									Select '+ REPLACE(@columnname,',Pagedetailid',',A.Pagedetailid') +' 
									From ACFVINCR.dbo.' + @MT2_Detail + ' A with(nolock)
									Join #t B with(nolock) on A.pagedetailid = B.Pagedetailid

									Delete A
									From ACFVINCR.dbo.PDT_Delete A
									Join #t B with(nolock) on A.pagedetailid = B.pagedetailid

									Set @Count = (Select Count(1) From ACFVINCR.dbo.PDT_Delete with(nolock))

									Drop Table #t
							  End
							'
				Print @sql
				EXEC(@sql)

				Update sql17.dbo.MasterTableList Set isProcessed = 1 where TableType = 'Detail' And MT2_Tablename = @MT2_Detail 

				SET @i = (Select Count(1) From sql17.dbo.MasterTableList where TableType = 'Detail' And isProcessed = 0)
		End