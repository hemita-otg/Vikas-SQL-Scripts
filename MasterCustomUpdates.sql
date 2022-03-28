select * from MasterCustomUpdates order by checkid where checkid <>100CategoryCode in ('nst50','PEP50','fmd50')
update MasterCustomUpdates set pdtdone=1 where CategoryCode in ('srb50','fmd50')
select * from MasterCustomupdates where checkid=100 and pdtdone=1 and pdtflag=1 
select distinct categorycode from MasterCustomupdates where checkid=100 
select * from CustomupdatesLog order by DATE desc 

/*
update mastercustomupdates set PDTFlag=0,PDTDone=0,segflag=0
update mastercustomupdates set PDTFlag=0,PDTDone=0 where categorycode in ('pep50')
update mastercustomupdates set PDTFlag=0,PDTDone=1 where categorycode in ('srb50','pep50','min')
update mastercustomupdates set categorycode='ccdb' where CategoryCode='pgcorp'
update mastercustomupdates set PDTFlag=0 where  CategoryCode='srb50'

Update M set PDTFlag=1 From mastercustomupdates  M 
where checkid=100 and CategoryCode in (
select distinct CategoryCode from mastercustomupdates 
group by CategoryCode 
having COUNT(categorycodeid) <>1 ) 
*/
select * from mt2sql14.sitecontrol.dbo.customupdateslog
--truncate table customupdateslog

--alter table mastercustomupdates drop column cwmflag

--insert into MasterCustomUpdates values(18,1731,'FSIPNG50','MT2SQL15',1,0,0,0)

update m set pdtdone=1

from MasterCustomUpdates m join categorycode cc 
on m.categorycode=cc.Category 
where m.clientserver='mt2sql15'  and cc.ClientRun=0   order by processorder


select * from MasterCustomUpdates where CHECKid=100 


select * from MasterCustomUpdates where pdtdone=1 and pdtflag=1 and checkid <> 100
select * from MasterCustomUpdates where pdtdone=1 and segflag=1 

select * from mt2sql14.sitecontrol.dbo.customupdateslog order by categorycode, DATE  

--update MasterCustomUpdates set pdtflag=1 where CategoryCode ='fostest50'