ABMC
jaAlc
JaAsm
JaBev
jaInet
JaSpan
Manila
USCTCMC
USCTCVC 


select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..ABMCpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..jaAlcpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..JaAsmpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..JaBevpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..jaInetpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..JaSpanpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..Manilapagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..USCTCMCpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))

select * from adviewmain where flyerid in (
select distinct flyerid from entrydata..USCTCVCpagedetailtable where flyerid in (select flyerid from entrydata..usacmcpagedetailtable ))




select  * from adviewmain  where flyerid in 
(11471910,12294021,12476635,12476665,12476667,13124260,13820060,13820061,14383731,14646433,7622593,7890003,7947702,8113961,8723120,8723126,8723127,8723160,8723161,8723163,8734699,8734700,8734701,8734702,8734703,8734704,9746630)



select  * from adviewmain  where flyerid in 
('11471910','12294021','12476635','12476665','12476667','13124260','13820060','13820061','14383731','14646433','7622593','7890003','7947702','8113961','8723120','8723126','8723127','8723160','8723161','8723163','8734699','8734700','8734701','8734702','8734703','8734704','9746630')


select * into tempdb..mildelete from 
(
select pagedetailid from entrydata..jaAlcpagedetailtable where flyerid in 
('11471910','12294021','12476635','12476665','12476667','13124260','13820060','13820061','14383731','14646433','7622593','7890003','7947702','8113961','8723120','8723126','8723127','8723160','8723161','8723163','8734699','8734700','8734701','8734702','8734703','8734704','9746630')
 union 
 select pagedetailid from entrydata..jaBEVpagedetailtable where flyerid in 
('11471910','12294021','12476635','12476665','12476667','13124260','13820060','13820061','14383731','14646433','7622593','7890003','7947702','8113961','8723120','8723126','8723127','8723160','8723161','8723163','8734699','8734700','8734701','8734702','8734703','8734704','9746630')
 union 
 
select pagedetailid from entrydata..usctcmcpagedetailtable where flyerid in 
('11471910','12294021','12476635','12476665','12476667','13124260','13820060','13820061','14383731','14646433','7622593','7890003','7947702','8113961','8723120','8723126','8723127','8723160','8723161','8723163','8734699','8734700','8734701','8734702','8734703','8734704','9746630')
 union 
 select pagedetailid from entrydata..usctcvcpagedetailtable where flyerid in 
('11471910','12294021','12476635','12476665','12476667','13124260','13820060','13820061','14383731','14646433','7622593','7890003','7947702','8113961','8723120','8723126','8723127','8723160','8723161','8723163','8734699','8734700','8734701','8734702','8734703','8734704','9746630')
 )  x 






select * from tempdb..mildelete