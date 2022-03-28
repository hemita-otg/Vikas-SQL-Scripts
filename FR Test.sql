use FlashReport

select * from processing where weekof = '070410' and  clientid in (3, 4, 7, 8, 31) 
--update processing set [User] = 'ashishp' , process = 0, send= 0 where weekof = '070410' and  clientid in (3, 4, 7, 8, 31) 

select * from clientvalues where clientid in (3, 4, 7, 8, 31)

--Update status Set Status = 'Pending' where weekof = '070410' and  clientid in (3, 4, 7, 8, 31) 
and emailaddress in ('vipuld@markettrack.com', 'vparmar@markettrack.com', 'pmakwana@markettrack.com', 
'shetalg@markettrack.com', 'ramt@markettrack.com')

select Distinct Clientid, userid, weekof from SelectedClients

--Insert Into SelectedClients (clientid, userid, weekof) 
select * from status where weekof = '070410' and  clientid in (3, 4, 7, 8, 31) 
and emailaddress in ('vipuld@markettrack.com', 'vparmar@markettrack.com', 'pmakwana@markettrack.com', 'shetalg@markettrack.com', 'ramt@markettrack.com')


select * from subscription..vwuser where userid in (26981, 27064)


select * from addresslist where userid = 27064