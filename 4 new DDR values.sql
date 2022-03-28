select * from masterfieldsselections 
--delete from masterfieldsselections
where fieldid=888 and ( itemname like '%6 calend%') or itemname like '% to 2 weeks ago%')


'Month - Last 9 Calendar'
'Month - Last 9 Calendar(Prior Year)'

'YTD (Calendar) - To 2 Weeks Ago'
'YTD (Calendar) Prior - To 2 Weeks Ago'
/*
insert into masterfieldsselections values(888,'Month - Last 9 Calendar',null,'The previous 9 complete calendar months.')
insert into masterfieldsselections values(888,'Month - Last 9 Calendar - Prior Year',null,'The previous 9 complete calendar months, one year ago.')
insert into masterfieldsselections values(888,'YTD (Calendar) - To 2 Weeks Ago',null,'Year to date for this year excluding the most recent two weeks (ending Sunday), for a YTD comparison of "completed" data.')
insert into masterfieldsselections values(888,'YTD (Calendar) Prior - To 2 Weeks Ago',null,'Year to date last year excluding the most recent two weeks (ending Sunday), for a YTD comparison of "completed" data.')
*/

--delete from  masterfieldsselections where itemname='Month - Last 6 Calendar - Prior Year' and itemvalue like 'The previous 9 complete calendar months, one year ago.'


