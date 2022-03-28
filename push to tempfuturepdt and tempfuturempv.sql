drop table tempdb..p
drop table tempdb..m 

------------------------------------------------
--for FR records
------------------------------------------------
use masterclientcoverage


select * into tempdb..p from masteradviewdata..masterpagedetailtable 
where pagedetailid in (select pagedetailid from mt2sql14.frnational.dbo.natpdt)


select * into tempdb..m from masteradviewdata..mastermultiplepagevalues where pagedetailid in (select pagedetailid from tempdb..p)


insert into masterclientcoverage..TempFuturePDT 
select * from tempdb..p


insert into masterclientcoverage..TempFuturempv 
select * from tempdb..m
--------------------------

------------------------------------------------
--for flyerid based records
------------------------------------------------

use masterclientcoverage

select * into tempdb..p from masteradviewdata..masterpagedetailtable 
--where flyerid in ('11584779','11039192','11831730','11351367','11585915','11774860','11742775','11815681','11775733','11844542')
where flyerid in ('11352059','11772947','11833221','11840414','10064240','11818335')


select * into tempdb..m from masteradviewdata..mastermultiplepagevalues where pagedetailid in (select pagedetailid from tempdb..p)


insert into masterclientcoverage..TempFuturePDT 
select * from tempdb..p


insert into masterclientcoverage..TempFuturempv 
select * from tempdb..m


------------------------------------------------
--for PageDetailID based records
------------------------------------------------
use masterclientcoverage

select * into tempdb..p from masteradviewdata..masterpagedetailtable 
where pagedetailid in 
('162816966AC','162809553AC','162728601AC','162809578AC','162540728AC','162816982AC','162816981AC','162809601AC','162817021AC','162816958AC','162809568AC','162816998AC','162816971AC','162816990AC','162817009AC','162816984AC','162817006AC','162809612AC','162816961AC','162817016AC','162816972AC','162817003AC','162472049AC','162472886AC','162473069AC','162473929AC','162474258AC','162474480AC','162474562AC','162496718AC','162472189AC','162472195AC','162472359AC','162475130AC','162477082AC','162496368AC','162523372AC','162472193AC','162472585AC','162473000AC','162474272AC','162474797AC','162474798AC','162471738AC','162473710AC','162791108AC','162472632AC','162473461AC','162474537AC','162475694AC','162496340AC','162497051AC','162791131AC','162473525AC','162474021AC','162474526AC','162474991AC','162477056AC','162791157AC','162814726AC','162472436AC','162472553AC','162496286AC','162791107AC','162791159AC','162473140AC','162473810AC','162474313AC','162474930AC','162475105AC','162476698AC','162496331AC','162472498AC','162475773AC','162496352AC','162496479AC','162471794AC','162472270AC','162472780AC','162472963AC','162475715AC','162474101AC','162474421AC','162474806AC','162496701AC','162472142AC','162472421AC','162472721AC','162473527AC','162473655AC','162473856AC','162474725AC','162496522AC','162791085AC','162472825AC','162473020AC','162473568AC','162474499AC','162474603AC','162496400AC','162474822AC','162475117AC','162472853AC','162473276AC','162791110AC','162472496AC','162473926AC','162474097AC','162474452AC','162474701AC','162791088AC','162472093AC','162472138AC','162472798AC','162473232AC','162473571AC','162474625AC','162474664AC','162473489AC','162473660AC','162474564AC','162496407AC','162523381AC','162473528AC','162474077AC','162474652AC','162474941AC','162471791AC','162473059AC','162473167AC','162473658AC','162473801AC','162474103AC','162474446AC','162477091AC','162496602AC','162471694AC','162471867AC','162474288AC','162474709AC','162472349AC','162472387AC','162473062AC','162474409AC','162474600AC','162474740AC','162791609AC','162472739AC','162474207AC','162474304AC','162474778AC','162472136AC','162472302AC','162473569AC','162474566AC','162474737AC','162474821AC','162472222AC','162472284AC','162472935AC','162473851AC','162473853AC','162474055AC','162496304AC','162496555AC','162472394AC','162473447AC','162473806AC','162473923AC','162474160AC','162474597AC','162475147AC','162791087AC','162472157AC','162472690AC','162473737AC','162473996AC','162474048AC','162475085AC','162472301AC','162472660AC','162496556AC','162472238AC','162473065AC','162474338AC','162496387AC','162496524AC','162472500AC','162473210AC','162472505AC','162473750AC','162791104AC')



select * into tempdb..m from masteradviewdata..mastermultiplepagevalues where pagedetailid in (select pagedetailid from tempdb..p)


insert into masterclientcoverage..TempFuturePDT 
select * from tempdb..p


insert into masterclientcoverage..TempFuturempv 
select * from tempdb..m
 
 update p set prodimagecreated=0 from  masterclientcoverage..TempFuturePDT p  where pagedetailid in ( select pagedetailid  from tempdb..p)