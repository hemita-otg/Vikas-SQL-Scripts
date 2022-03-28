select * from tempdb..test

select fv4,fv5,(100 - ((fv5*100.00)/fv4)) as perDiff from tempdb..test