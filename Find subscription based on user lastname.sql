
select * from  (select s.userid,subscriptionid from subscription s
join userprofile up join usercontrol uc
on up.userrefid=uc.userrefid
on s.userid=uc.userid
and up.lastname='kantawala')  a
join subscriptionschedule ss
on a.subscriptionid=ss.subscriptionid
order by 4

select * from subscriptionschedule