select * into TempACFVDetailReports_1Pending from TempACFVDetailReports_1 where 1=2
select count(1) from TempACFVDetailReports_2 with (nolock) 


exec sp_rename 'TempACFVDetailReports_1','TempACFVDetailReports_1Ready'
exec sp_rename 'TempACFVDetailReports_1Pending','TempACFVDetailReports_1'

select count(1) from TempACFVDetailReports_1

select count(1) from TempACFVDetailReports_1Ready


--------------


select * into TempACFVDetailReports_2Pending from TempACFVDetailReports_2 where 1=2
select count(1) from TempACFVDetailReports_2 with (nolock) 


exec sp_rename 'TempACFVDetailReports_2','TempACFVDetailReports_2Ready'
exec sp_rename 'TempACFVDetailReports_2Pending','TempACFVDetailReports_2'

select count(1) from TempACFVDetailReports_2

select count(1) from TempACFVDetailReports_2Ready

--


select * into TempACFVDetailReports_3Pending from TempACFVDetailReports_3 where 1=2
select count(1) from TempACFVDetailReports_3 with (nolock) 


exec sp_rename 'TempACFVDetailReports_3','TempACFVDetailReports_3Ready'
exec sp_rename 'TempACFVDetailReports_3Pending','TempACFVDetailReports_3'

select count(1) from TempACFVDetailReports_3

select count(1) from TempACFVDetailReports_3Ready

-----


select min(addate),max(addate) from tempacfvdetailreports_1ready --2016-06-09 00:00:00.000	2017-11-05 00:00:00.000
select min(addate),max(addate) from tempacfvdetailreports_2ready -- 2017-01-01 00:00:00.000	2018-07-01 00:00:00.000
select min(addate),max(addate) from tempacfvdetailreports_3ready --2017-01-04 00:00:00.000	2019-12-30 00:00:00.000 -- 23602880


select count(1) from tempacfvdetailreports with (nolock)
select count(1) from tempacfvdetailreports_1ready -- 22384079
select count(1) from tempacfvdetailreports_2ready --22755846
select count(1) from tempacfvdetailreports_3ready --23602880




