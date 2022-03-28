


declare @tn varchar(200) ='', @SQL varchar(max)



declare curRMC cursor for
select distinct clienttablename 
from mt2sql14.sitecontrol.dbo.vw_catinfo a join mt2sql14.sitecontrol.dbo.tablenames b on a.categorycodeid = b.categorycodeid
where fvcctype = 4  and  tableid in (3,22,56) and (cwmfull=1 or clientpdt=1 ) and clientserver='MT2SQL06'
and category in ('dolPEP','ferPeP','itsPEP','mcncPeP','milPEP','mispPEP','tdcPEP','TFPEP','uniPep','bariPEP')

open curRMC

fetch next from curRMC
into @tn



while @@fetch_Status = 0
begin
	print @tn
	if exists(select 1 from sys.tables where name = @tn)
	begin
		Set @SQL='update '+@tn+'
		set market = ''St. Louis, MO'',marketid = 67
		where market = ''Saint Louis, MO'' '
		exec  (@SQL)
	end
	print @tn	
		
fetch next from curRMC
into @tn

END                       
close curRMC
deallocate curRMC


