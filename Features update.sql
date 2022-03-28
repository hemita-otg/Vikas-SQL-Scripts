use masteradviewdata


select features,count(distinct flyerid) ADCount 
from masterpagedetailtable 
group by features

with rollup 
order by 1


select features, count(distinct pagedetailid) DetailCount 
from masterpagedetailtable 
group by features
with rollup 
order by 1  

select count(distinct flyerid) from masterpagedetailtable 
select count(distinct pagedetailid) from masterpagedetailtable 