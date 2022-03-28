
select * from entrydata..DurConsMultiplepageValues where FieldValue like '%Free w/ Other Purchase%' and FieldName='pageevent'
--update entrydata..DurConsMultiplepageValues set FieldValue ='Free w/Other Purchase'  where FieldValue like '%Free w/ Other Purchase%' and FieldName='pageevent'

select count(1) from masteradviewdata..masterpagedetailtable  where pageevent like '%Free w/ Other Purchase%'
insert into MasterClientCoverage..TempFutureMPV 
select * from masteradviewdata..mastermultiplepagevalues where FieldValue like '%Free w/ Other Purchase%' and FieldName='pageevent'
update masteradviewdata..mastermultiplepagevalues set fieldvalue='Free w/Other Purchase'  where FieldValue like '%Free w/ Other Purchase%' and FieldName='pageevent'

select pageevent,* from entrydatadur..uswebdPageDetailTable where pageevent like '%Z – Image Only%'
update entrydatadur..uswebdPageDetailTable set pageevent='Z - Image Only' where pageevent like '%Z – Image Only%'
select fieldvalue,* from entrydatadur..USWebDMultiplePageValues where fieldvalue like '%Z – Image Only%' and FieldName='pageevent' 
update entrydatadur..USWebDMultiplePageValues set fieldvalue='Z - Image Only' where fieldvalue like '%Z – Image Only%' and FieldName='pageevent' 



update MasterClientCoverage..TempFutureMPV set fieldvalue='Free w/Other Purchase'  where FieldValue like '%Free w/ Other Purchase%' and FieldName='pageevent'



use masteradviewdata 
GO 

Update MasterPageDetailTable Set PageEvent='Free w/Other Purchase'
where PageEvent  like 'Free w/ Other Purchase' 

Update MasterMultiplepageValues Set FieldValue='Free w/Other Purchase'
where FieldValue like 'Free w/ Other Purchase'  and FieldName='PageEvent' 

Update MasterPageDetailTable Set PageEvent='Z - Image Only'
where PageEvent like 'Z – Image Only'

Update MasterMultiplepageValues Set FieldValue='Z - Image Only'
where FieldValue like 'Z – Image Only' and FieldName='PageEvent' 
 
