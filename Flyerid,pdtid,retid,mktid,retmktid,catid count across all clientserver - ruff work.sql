USE TEMPDB

DROP TABLE S1 
SELECT DISTINCT CLIENTID,CLIENTNAME,CATEGORYCODEID,CATEGORY,CLIENTSERVER,CLIENTPDT,ISPDT,ISADLERT INTO TEMPDB..S1  FROM SITECONTROL..vw_catinfo WHERE ISINTERNAL<>1 AND CLIENTSERVER NOT IN ('MT2SQL00','MT2SQL00A','MT2SQL16','MT2SQL17')


SELECT DISTINCT CLIENTSERVER  FROM S1 ORDER BY CLIENTSERVER 

select * from s1 ORDER BY CLIENTSERVER  where clientserver='mt2sql08'


select count(distinct flyerid) from mt2sql15.sql15.dbo.pgcorp50flyerreports
select count(distinct advertiserid) from mt2sql15.sql15.dbo.pgcorp50flyerreports
select count(distinct marketid) from mt2sql15.sql15.dbo.pgcorp50flyerreports
select count(distinct retmktid) from mt2sql15.sql15.dbo.pgcorp50flyerreports

select count(distinct pagedetailid) from mt2sql15.sql15.dbo.pgcorp50detailreports
select count(distinct categoryid) from mt2sql15.sql15.dbo.pgcorp50detailreports


select * from SITECONTROL..vw_catinfo where clientserver in ('mt2sql13','mt2sql16','mt2sql17') and clientname like '%family%'

-----------------------------------------------------------------------------------------


declare @category varchar(10)
declare @ClientServer varchar(15)
declare @SQL varchar(5000)
declare @flyercnt int,@advcnt int,@mktcnt int,@retmktcnt int,@pdtcnt int,@catcnt int
Declare @tablename varchar(max)



declare curRMC cursor for
select category,ClientServer from MT2SQL00.TEMPDB.DBO.S1 WHERE ClientServer=@@SERVERNAME ORDER BY CATEGORY 
open curRMC
fetch next from curRMC
into @category,@ClientServer

while @@fetch_Status = 0
begin
                

				SET @flyercnt=0
				SET @advcnt=0
				SET @mktcnt=0
				SET @retmktcnt = 0
				SET @pdtcnt=0
				SET @catcnt=0
				SET @tablename = @category +'FlyerReports'

			Set @SQL='IF Exists(Select * from sysobjects Where name='''+@tablename+'''  )
				  Begin
				    select '+@flyercnt +' count(distinct flyerid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
					select '+@advcnt +' count(distinct advertiserid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
					select '+@mktcnt +' count(distinct marketid)  from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
					select '+@retmktcnt +' count(distinct retmktid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
				  End'''
			--Exec (@SQL)
			Print (@SQL)
			
			SET @tablename = @category +'DetailReports'

			Set @SQL='IF Exists(Select * from sysobjects Where name='''+@tablename+'''  )
				  Begin
				    select '+@pdtcnt +' count(distinct pagedetailid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '
					select '+@catcnt +' count(distinct categoryid) from '+@ClientServer+'.'+right(@ClientServer,5)+'.dbo.' + @tablename  + '				
				  End'''
			--Exec (@SQL)
			Print (@SQL)
					
            --update    MT2SQL00.TEMPDB.DBO.S1 set flyercnt=@flyercnt , Advertisercnt=@advcnt ,marketcnt=@mktcnt , Retmktcnt=@retmktcnt , PDTIDcnt=@pdtidcnt,categorycnt=@catcnt where category=@category 


fetch next from curRMC
into @category,@fv50,@isintegerid,@ClientServer

END                       
close curRMC
deallocate curRMC



alter table s1 add imageOnlyDB varchar(10)
 select * from s1 
 select  * from SITECONTROL..vw_catinfo
 update s1 set databaselink=v.homepagelink from s1 join SITECONTROL..vw_catinfo v on s1.CategoryCodeId =v.CategoryCodeId 

 update s1 set imageOnlyDB=v.isdaa  from s1 join SITECONTROL..vw_catinfo v on s1.CategoryCodeId =v.CategoryCodeId 