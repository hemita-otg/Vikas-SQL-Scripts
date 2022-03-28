use sql07

declare @advertiser varchar(35)
declare @market varchar(35)
declare @addate datetime
declare @diff int
declare @pdtcount	int
declare @dispcnt	int
declare @advertiser1 varchar(35)
declare @market1 varchar(35)
declare @addate1 datetime
declare @diff1 int
declare @datediff	int
declare @pdtcount1	int
declare @cnt int
declare @recnum int
set @cnt = 1
set @advertiser1 = ''
set @market1 = ''
set @addate1 = getdate()
set @diff1 = 0
set @pdtcount = 0
set @pdtcount1 = 0
set @datediff=0
set @recnum=0

--select * from ftfvreport1 order by 2,3,4

declare curFTFV cursor for
select a.a_advertiser, a.a_market, a.a_addate, a.DateDifference,a.PDTCount, a.DispCnt,a.recnum 
from ftfvreportTest a
where recnum < 6
order by 1,2,3

open curFTFV

fetch next from curFTFV
into @advertiser, @market, @addate,@datediff, @pdtcount, @dispcnt,@recnum

while @@fetch_Status = 0
begin
	select @cnt = max(Dispcnt) + 1 from ftfvreportTest	

	print @advertiser
	print @advertiser1
	print @market
	print @market1
	print @addate
	print @addate1
	print @pdtcount
	print @pdtcount1
	/*
	set @advertiser1 = @advertiser
	set @market1 = @market
	set @addate1 = @addate
	set @pdtcount1 = @pdtcount
	*/
	if (@advertiser=@advertiser1) and (@market=@market1) and (@pdtcount=@pdtcount1) 
		and @dispcnt=0 and datediff(d, @addate1, @addate)  between -1 and 1
	begin
		update ftfvreportTest 
		set flag=1
		where recnum=@recnum
		print 'if' + cast(@recnum as varchar(15))
			
	end
	else	
	begin
		print 'else'  + cast(@recnum as varchar(15))

		update ftfvreportTest 
		set Dispcnt=@cnt
		where flag=1

		--update ftfvreportTest set flag=0 where flag=1

	end
		set @advertiser1 = @advertiser
		set @market1 = @market
		set @addate1 = @addate
		set @pdtcount1 = @pdtcount
	
fetch next from curFTFV
into @advertiser, @market, @addate,@datediff, @pdtcount, @dispcnt,@recnum

END                       
close curFTFV
deallocate curFTFV

--select * from ftfvreportTest where recnum not between 10 and 15

--update ftfvreportTest set dispcnt=0
--select * into dbo.ftfvreportTest from ftfvreport1


--drop table ftfvreportTest
--select * from ftfvreportTest where a_advertiser='albertsons' and a_market='dallas'


--select distinct dispcnt from ftfvreport1 where recnum < 501 order by 1

--alter table ftfvreportTest add flag bit

select * from ftfvreportTest

