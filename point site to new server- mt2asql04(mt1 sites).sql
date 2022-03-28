select * from sqlparameters
select * from dbparameters

-- insert into dbparameters values(85,131,null,null,1)

select * from adview2dataservers


--insert into adview2dataservers values('MT2ASQL04','Client','SQL04',null,null,null,null)

select * from clientgroup where clientgroupid=8 or clientid = 263

select * from clientgroupiddesc
--insert into clientgroupiddesc values(11,'SQL04')
select * from clientappparameters where clientgroupid = 8

select * from categoryappparameters where DatabaseparameterId = 85 --categorycodeid = 1006


update categoryappparameters set databaseparameterid=85 where DatabaseparameterId = 63



select * from dbparameters
select * from adview2dataservers
select * from clientgroupiddesc

insert into dbparameters values(85,131,null,null,1)
insert into adview2dataservers values('MT2ASQL04','Client','SQL04',null,null,null,null)
insert into clientgroupiddesc values(11,'SQL04')
update categoryappparameters set databaseparameterid=85 where DatabaseparameterId = 63