use subscription


select * from clientprofile where clientid=54

--update clientprofile set fv40=null where clientid=54

select distinct fv40 from userprofile where userrefid in 
(select userrefid from usercontrol where clientid=54)


--update userprofile set fv40=41 where userrefid in (select userrefid from usercontrol where clientid=54)


Paul Salay, Bill Dunn, Jennifer Phillips, myself, CS account

--update userprofile set fv40=42 where userrefid in 
--select * from userprofile where userrefid in 
(2013998,7883,7893,7873,7992)

