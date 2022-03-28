Login through guid 


How to login through guid for gal clients

http://www.adview2.net?username=guid

guid is a field in vwuser(userprofile table)



select guid,* from vwuser where firstname='ashish' and clientid=94

select * from subscription..clientprofile where clientname like '%gal%'


select guid,* from vwuser where clientid=108


userprofile


--update userprofile set guid='7AA68F66-0673-45BA-B5D4-324F4E7B4422' ,[password]=null,type=1 where userrefid=11805

select newid()
