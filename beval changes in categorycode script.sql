select * from categorycode where category='pat50'

--update categorycode set sourcecwm='masterclientcoverage..EPAMBBDAAAFlyerReports',fullsourcecode='MasterBevAl..MasterBevAL' ,isfull=1 where category='pat50'


update categorycode set sourcecwm='masterclientcoverage..EPAMBBDAAAFlyerReports',fullsourcecode='MasterBevAl..MasterBevAL'  where category in  ('rndcK','SWStest50','wbg50')

select * from  categorycode_nf_mt2 
insert into categorycode_nf_mt2 values('rndcK')
insert into categorycode_nf_mt2 values('SWStest50')
insert into categorycode_nf_mt2 values('wbg50')

insert into CategoryMarkedFull (CATEGOrYCODEID,FULLRUNDATE,USERNAME)  values(2973,GETDATE(),'VIKASK')
insert into CategoryMarkedFull (CATEGOrYCODEID,FULLRUNDATE,USERNAME) values(2567,GETDATE(),'VIKASK')
insert into CategoryMarkedFull (CATEGOrYCODEID,FULLRUNDATE,USERNAME)  values(2997,GETDATE(),'VIKASK')







