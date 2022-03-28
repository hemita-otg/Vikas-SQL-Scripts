select homepagelink,firstname,lastname, DefaultEmailAddress ,year(starttime),month(starttime),count(distinct l.querylogid) from queryexecutionlog L
Join queryexecutionlogdetail D
on L.querylogid=D.querylogid  
join archivesub..vwuser u on l.UserID =u.userid 
join archivesub..ClientDatabases c on l.CategoryCodeId =c.CategoryCodeID 
where (l.clientid=675 )--or l.categorycodeid in (2534,3405,7167))
and starttime between '11/1/17' and  '10/31/18'
and u.type=1 
group by homepagelink,firstname,lastname, DefaultEmailAddress,year(starttime),month(starttime)


select * from subscription..vwuser


select * from archivesub..clientprofile where clientname like '%gala%'