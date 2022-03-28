select distinct flyerid   from prdcnen50flyerReports where advertiser='rexall' and market='Toronto, Ontario'
and  flyerid not in 
(select distinct flyerid   from prdcnen50detailReports where advertiser='rexall' and market='Toronto, Ontario')

select * from masteradviewdata..masterpagedetailtable where flyerid = 21424674

select * from masteradviewdata..masterpagedetailtable a join masterclientcoverage..tempfuturepdt b
on a.pagedetailid =b.PageDetailID 
where flyerid = 21424674

select distinct category from masteradviewdata..masterpagedetailtable where flyerid = 21424674 order by 1 
select distinct category from prdcnen50DetailReports  order by 1 