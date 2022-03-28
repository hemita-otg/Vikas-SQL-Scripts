use sql08

select * from anh50flyerreports where addate='02/12/2020' and  originalflyerid in ( 22537913  , 22537860 )
select * from anh50pagereports where addate='02/12/2020' and  originalflyerid in ( 22537913  , 22537860 )
select * from anh50detailreports where addate='02/12/2020' and  originalflyerid in ( 22537913  , 22537860 ) order by 2 
select * from ANH50DetailReports_FutureDelete  where addate='02/12/2020' and  originalflyerid in ( 22537913  , 22537860 )



select * from masteradviewdata..adviewmain where addate='02/12/2020' and  flyerid in ( 22537913  , 22537860 )
select * from masteradviewdata..masterpagedetailtable  where   flyerid in ( 22537913  , 22537860 )
insert into masteradviewdata..masterpagedetailtable
select * from MasterClientCoverage..tempjapagedetailtable  where   flyerid in ( 22537913  , 22537860 ) and pagedetailid not in (select pagedetailid from masteradviewdata..masterpagedetailtable  where   flyerid in ( 22537913  , 22537860 ) )
select * from mt2sql00.masteradviewdata.dbo.masterpagedetailtable  where   flyerid in ( 22537913  , 22537860 )


select * from MasterClientCoverage..tempjapagedetailtable  where   flyerid in ( 22537913  , 22537860 ) and category  in ('Beer Alternatives','Beer')
select * from MasterClientCoverage..tempfuturepdt   where  pagedetailid in( select  pagedetailid  from MasterClientCoverage..tempjapagedetailtable  where   flyerid in ( 22537913  , 22537860 ) )