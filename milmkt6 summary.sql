use sql08


select count(1) from MILMKT6DetailReports --271476

select count(1) from MILMKT6DetailReports where mpvbrandpacksize is not null --264450

select count(1) from MILMKT6DetailReports  where salesnumeric1  is not null --100350
select count(1) from MILMKT6DetailReports where SalesText6 is not null and salesnumeric1 is not null 

select distinct advertiser,market,salesterritory,count(pagedetailid),count(distinct MPVBrandPackSize ),count(distinct salesnumeric1) from MILMKT6DetailReports
group by advertiser,market,salesterritory
order by 1,2

select count(1) from MILMKT6DetailReportsn  where mpvbrandpacksize is not null  and salesnumeric1 is not null

--2 tabs
$ vol - filled ADzone + adv+ mkt
$ vol - blank ADzone + adv+ mkt



select distinct advertiser,market from milmkt6disadvertisermarket order by 1 ,2 




select distinct advertiser,market,salesterritory from MILMKT6DetailReports order by 1 ,2 