
/*
select ClientServer,category,IsIntegerID into tempdb..testtable
from categorycode where SourceCWM like '%can%' and (IsPDT=1 or ClientPDT=1) 

select clientserver,category,isintegerid  from tempdb..testtable 
*/

declare @ClientServer varchar(35)
declare @Category varchar(35)
declare @isintegerid bit
declare @SQL varchar(5000)

set @ClientServer = ''
set @Category = ''
set @isintegerid = 0
set @SQL = ''

declare curFixPDTTable cursor for
select clientserver,category,isintegerid from tempdb..testtable -- where clientserver=@@servername
order by 1
open curFixPDTTable
fetch next from curFixPDTTable
into @ClientServer,@Category,@isintegerid

while @@fetch_Status = 0
begin
	--print @ClientServer

	IF @isintegerid=1 
	BEGIN
			Set @SQL= 'delete from   ' + @ClientServer +'.'+ RIGHT(@clientserver,5)+ '.dbo.' + @Category +  
						'Detailreports where originalpagedetailid in (''0005655M111'',
							''0005656M111'',
							''0005654M111'',
							''0313901Q342'',
							''0313900Q342'',
							''0005653M111'',
							''0097180M297''
							)'
			print @SQL
	END
	ELSE
	BEGIN
			Set @SQL= 'delete from   ' + @ClientServer +'.'+ RIGHT(@clientserver,5)+ '.dbo.' + @Category +  
						'Detailreports where pagedetailid in (''0005655M111'',
							''0005656M111'',
							''0005654M111'',
							''0313901Q342'',
							''0313900Q342'',
							''0005653M111'',
							''0097180M297''
							)'
			print @SQL	
	END
	
fetch next from curFixPDTTable
into @ClientServer,@Category,@isintegerid

END                       
close curFixPDTTable
deallocate curFixPDTTable