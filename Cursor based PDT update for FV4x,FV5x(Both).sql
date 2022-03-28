declare @category varchar(10)
declare @ClientServer varchar(15)
declare @isintegerid bit
declare @fv50 bit
declare @SQL varchar(5000)



declare curRMC cursor for
select category,isnull(fv50,0) fv50,isnull(isintegerid,0) isintegerid,ClientServer from CategoryCodetable where ClientPDT=1 and ClientServer=@@SERVERNAME order by processorder
open curRMC
fetch next from curRMC
into @category,@fv50,@isintegerid,@ClientServer

while @@fetch_Status = 0
begin
                --print @PDTTable
				If @fv50=0
				BEGIN
					Set @SQL= 'Update pdt set TaggedCompany=tc.adtype  from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @category  + 'PageDetailTable pdt join tempdb..MasterADType TC on  pdt.pagedetailid=tc.pagedetailid '
					print(@SQL)  
                END     
                Else
                BEGIN
					if @isintegerid=0
					BEGIN
						Set @SQL= 'Update pdt set TaggedCompany=tc.adtype  from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @category  + 'DetailReports pdt join tempdb..MasterADType TC on  pdt.pagedetailid=tc.pagedetailid '
						print(@SQL)  
					END
					if @isintegerid=1
					BEGIN
						Set @SQL= 'Update pdt set TaggedCompany=tc.adtype  from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @category  + 'DetailReports pdt join tempdb..MasterADType TC on  pdt.originalpagedetailid=tc.pagedetailid '
						print(@SQL)  
					END
				End
fetch next from curRMC
into @category,@fv50,@isintegerid,@ClientServer

END                       
close curRMC
deallocate curRMC

