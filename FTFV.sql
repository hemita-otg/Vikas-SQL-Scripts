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
declare @pdtcount1	int
declare @cnt int
set @cnt = 1
set @advertiser1 = ''
set @market1 = ''
set @addate1 = getdate()
set @diff1 = 0
set @pdtcount = 0
set @pdtcount1 = 0

--select * from ftfvreport1 order by 2,3,4

declare curFTFV cursor for
--select distinct a.a_advertiser, a.a_market, a.a_addate, datediff(d, a.a_addate, b.a_addate),a.PDTCount
--from ftfvreport1 a join ftfvreport1 b 
--on a.a_advertiser = b.a_advertiser and a.a_market = b.a_market and (datediff(d, a.a_addate, b.a_addate) between -1 and 1)
--	and a.a_flyerid <> b.a_flyerid
select a.a_advertiser, a.a_market, a.a_addate, a.PDTCount, a.DispCnt from ftfvreport1 a
where recnum < 500
order by 1,2,3

open curFTFV

fetch next from curFTFV
into @advertiser, @market, @addate, @pdtcount, @dispcnt

while @@fetch_Status = 0
begin
	if @cnt > 92 and @cnt < 95
	begin
		print @advertiser
		print @advertiser1
		print @market
		print @market1
		print @addate
		print @addate1
		print @pdtcount
		print @pdtcount1
	end
	select @cnt = max(Dispcnt) + 1 from ftfvreport1
	
	if @advertiser <> @advertiser1 and @market <> @market1 and @pdtcount <> @pdtcount1 and @dispcnt = 0 and datediff(d, @addate1, @addate) not between -1 and 1
	begin
		update a 
		set dispcnt = @cnt 
		from ftfvreport1 a 
		where a.a_advertiser = @advertiser and a.a_market = @market and dispcnt = 0 and 
			datediff(d, a.a_addate, @addate) between -1 and 1

		set @advertiser1 = @advertiser
		set @market1 = @market
		set @addate1 = @addate
		set @pdtcount1 = @pdtcount
		--set @cnt = @cnt + 1
		
	end
	else if @dispcnt = 0 and @advertiser = @advertiser1 and @market = @market1  and datediff(d, @addate1, @addate)  not between -1 and 1 
	begin
		
		if @pdtcount1 = @pdtcount
		begin
			update a 
			set dispcnt = @cnt 
			from ftfvreport1 a 
			where a.a_advertiser = @advertiser and a.a_market = @market and dispcnt = 0 and 
				datediff(d, a.a_addate, @addate) between -2 and 2 
			set @advertiser1 = @advertiser
			set @market1 = @market
			set @addate1 = @addate
			set @pdtcount1 = @pdtcount
		end
		else
		begin
			update a 
			set dispcnt = @cnt 
			from ftfvreport1 a 
			where a.a_advertiser = @advertiser and a.a_market = @market and dispcnt = 0 and 
				datediff(d, a.a_addate, @addate) between -1 and 1 
			set @advertiser1 = @advertiser
			set @market1 = @market
			set @addate1 = @addate
			set @pdtcount1 = @pdtcount
		end
			
		
	end
	else if @dispcnt = 0 and @advertiser = @advertiser1 and @market <> @market1  and datediff(d, @addate1, @addate) not between -1 and 1 
	begin
		
		if @pdtcount1 <> @pdtcount
		begin
			update a 
			set dispcnt = @cnt 
			from ftfvreport1 a 
			where a.a_advertiser = @advertiser and a.a_market = @market and dispcnt = 0 and 
				datediff(d, a.a_addate, @addate) between -1 and 1
			set @advertiser1 = @advertiser
			set @market1 = @market
			set @addate1 = @addate
			set @pdtcount1 = @pdtcount
		end
	end
	


	fetch next from curFTFV
	into @advertiser, @market, @addate, @pdtcount, @dispcnt

end                           
close curFTFV
deallocate curFTFV

--select * from ftfvreport1 where recnum not between 10 and 15

--update ftfvreport1 set dispcnt=0
--select * into dbo.ftfvreport11 from ftfvreport1

--select * from ftfvreport1 where a_advertiser='albertsons' and a_market='dallas'


--select distinct dispcnt from ftfvreport1 where recnum < 501 order by 1


--Alter table ftfvreport1 Add Media varchar(25)


select * from ftfvreport1
--update ftfvreport1 set media='NewsPaper' 