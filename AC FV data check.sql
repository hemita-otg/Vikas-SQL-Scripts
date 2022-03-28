select * from  ACFVParentChildCopy where parent_Adc_i = '183318709AC' and Child_Flyerid ='15218282' 
select * from  ACFVParentChildCopy where child_Adc_i = '183318709AC'

select * from mastermappingtables..ACFVCDetailMap  where DestPageDetailId in ('0012957E288','044391276EC','044079757EC')
select * from mastermappingtables..ACFVCDetailMap  where sourcePageDetailId in ('0012957E288','044391276EC','044079757EC')


select * from masteradviewdata..adviewmain  where flyerid='15218293'
select * from entrydata..usacmcpagedetailtable where pagedetailid='0012957E288'
select * from entrydata..acfvcpagedetailtable where pagedetailid in ('044391276EC','044079757EC')



select * from MCAPVehiclePages where VehicleId  in (134752132,'134740552') and pagenumber =6



select * from MasterMapPageDetailID where originalPageDetailID = '82964071610EC'


  
use EntryData
select * from USACBasePDT_Master where pagedetailid in ('0037409E839','0037413E839','0012957E288')

select * from MasterMappingTables..ACFVCDetailMap where DestPageDetailId in ('039255472EC','039255480EC','039024777EC','039063034EC','039254603EC','039183626EC','038959916EC','038960360EC','039009575EC','039009307EC')


--------------------


For "AC Data Check In FR - <date>" 

Check on PRD150, PRD250, PRD350, PRDHSP, PRDPR, PRDPROD50, PRDCNEN50, PRDBA50PDR 

Check Codes after processing is over on SQL11 Server.



Exec MT2SQL11.SQL11.dbo.ACFRCheckForDA


select * from mt2dev0.apimapractice.dbo.acpdtid
----Step1--Delete from table
Delete from mt2dev0.apimapractice.dbo.acpdtid

----Step2--insert into table
insert into mt2dev0.apimapractice.dbo.acpdtid values(829640716101414)

----Step3--then Run this SP
exec mt2sql14.sitecontrol.dbo.acpicheck

----Step4-- write comments in the last column and send email.
---------------------------------



insert into  mt2dev0.apimapractice.dbo.acpdtid values('3920669216101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3920925716101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921549216101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3922175116101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('19732168231'	 )
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3920527816101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921290616101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3923272016101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921400616101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3922288416101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3922515016101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3922588616101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921254016101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3920963416101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921880516101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3922552516101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3923311116101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3921473616101414')
insert into  mt2dev0.apimapractice.dbo.acpdtid values('19711168231'	 )
insert into  mt2dev0.apimapractice.dbo.acpdtid values('3920888116101414')
