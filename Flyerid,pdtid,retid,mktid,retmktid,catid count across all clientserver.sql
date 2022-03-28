
if exists( select * from tempdb..sysobjects where name = 's1' and type = 'u')
	drop table tempdb..s1
	GO
select category, flyercnt,advertisercnt,marketcnt,retmktcnt,pdtidcnt,categorycnt into tempdb..s1 
from mt2sql14.tempdb.dbo.s1 where 1=2
go

declare @category varchar(10)
declare @ClientServer varchar(15)
declare @SQL nvarchar(4000)
--declare @flyercnt int --,@advcnt varchar(10),@mktcnt varchar(10),@retmktcnt varchar(10),@pdtcnt varchar(10),@catcnt varchar(10)
Declare @tablename varchar(max),@pdttable varchar(max)



declare curRMC cursor for
select  category,ClientServer from MT2SQL14.TEMPDB.DBO.S1 WHERE ClientServer=@@SERVERNAME  ORDER BY CATEGORY 
open curRMC
fetch next from curRMC
into @category,@ClientServer

while @@fetch_Status = 0
begin
                

				--SET @flyercnt=0
				--SET @advcnt=0
				--SET @mktcnt=0
				--SET @retmktcnt = 0
				--SET @pdtcnt=0
				--SET @catcnt=0

				
				SET @tablename = (select clienttablename  from mt2sql14.sitecontrol.dbo.tablenames t join mt2sql14.sitecontrol.dbo.categorycode c on t.categorycodeid=c.id where category=@category and tableid=3)
				set @pdttable = (select clienttablename  from mt2sql14.sitecontrol.dbo.tablenames t join mt2sql14.sitecontrol.dbo.categorycode c on t.categorycodeid=c.id where category=@category and tableid=22)

		IF Exists(Select * from sysobjects Where name=''+@tablename+'')
				  Begin
					IF Exists(Select * from sysobjects Where name=''+@pdttable+'')
						Set @SQL='insert into tempdb..s1'	
					else 
						Set @SQL='insert into tempdb..s1 (category, flyercnt,advertisercnt,marketcnt,retmktcnt)	'
					--declare @flyercnt int --,@advcnt varchar(10),@mktcnt varchar(10),@retmktcnt varchar(10),@pdtcnt varchar(10),@catcnt varchar(10)
						--Set @SQL='insert into tempdb..s1 (category, flyercnt,advertisercnt,marketcnt,retmktcnt)
				    set @sql = @sql +' select '''+@category+''', (select count(distinct flyerid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '),
					(select count(distinct advertiserid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '),
					(select count(distinct marketid)  from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '),
					(select count(distinct retmktid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + ')'
				  End
				IF Exists(Select * from sysobjects Where name=''+@pdttable+'')
				begin
				 Set @SQL=@sql + ',(select count(distinct pagedetailid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @pdttable  + '),
					(select count(distinct Categoryid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @pdttable  + ')'
				end

			Exec (@SQL)

			--EXECUTE SP_EXECUTESQL @SQL, N'@flyercnt'
			Print (@SQL)
			
			--SET @tablename = @category +'DetailReports'

			--Set @SQL='IF Exists(Select * from sysobjects Where name='''+@tablename+'''  )
			--	  Begin
			--	    select '+cast(@pdtcnt as varchar(10))+'= count(distinct pagedetailid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
			--		select '+cast(@catcnt as varchar(10))+'= count(distinct categoryid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '				
			--	  End'''
			----Exec (@SQL)
			--Print (@SQL)
					
            --update    MT2SQL00.TEMPDB.DBO.S1 set flyercnt=@flyercnt , Advertisercnt=@advcnt ,marketcnt=@mktcnt , Retmktcnt=@retmktcnt , PDTIDcnt=@pdtidcnt,categorycnt=@catcnt where category=@category 
				--PRint  @flyercnt
				--PRint  @advcnt
				--PRint  @mktcnt
				--PRint  @retmktcnt 
				--PRint  @pdtcnt
				--PRint  @catcnt

fetch next from curRMC
into @category,@ClientServer

END                       
close curRMC
deallocate curRMC

--select count(distinct flyerid) from sql02..achca50FlyerReports
--drop table tempdb..s1
--select category, flyercnt,advertisercnt,marketcnt,retmktcnt,pdtidcnt,categorycnt into tempdb..s1 
--from mt2sql14.tempdb.dbo.s1 where 1=2

--select * from tempdb..s1
--select 'achca50', (select count(distinct flyerid) from MT2SQL02.SQL02.dbo.achca50FlyerReports),
--					(select count(distinct advertiserid) from MT2SQL02.SQL02.dbo.achca50FlyerReports),
--					(select count(distinct marketid)  from MT2SQL02.SQL02.dbo.achca50FlyerReports),
--					(select count(distinct retmktid) from MT2SQL02.SQL02.dbo.achca50FlyerReports)
--select distinct Category from MT2SQL02.SQL02.dbo.achca50detailreports
go

Update f set flyercnt = s.flyercnt, advertisercnt = s.advertisercnt, marketcnt = s.marketcnt, retmktcnt = s.retmktcnt, pdtidcnt = s.pdtidcnt, categorycnt = s.categorycnt
from mt2sql14.tempdb.dbo.s1 f
join tempdb..s1 s
on f.category = s.category

