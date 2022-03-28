select distinct a.categorycodeid,count(1) cnt into tempdb..t from vw_QvfcFields a join categorycode b on a.categorycodeid=b.id where b.fvcctype=3 and  fieldid in (5,85,71)  --order by categorycodeid ,a.clientid,a.FieldId  
group by a.categorycodeid 
having count(1) > 1 

select * from vw_QvfcFields where fieldid in (85) and displayseq is not null 
select * from vw_QvfcFields where fieldid in (71) and displayseq is not null 


select * from masterfields where fieldname ='district'

5	Market
85	region
71	district



select distinct a.categorycodeid,fieldid,fieldname,DisplaySeq  from vw_QvfcFields a join tempdb..t b on a.categorycodeid=b.CategoryCodeId 
 where  fieldid in (5,85,71) and displayseq is not null  order by categorycodeid ,a.FieldId


 Select Distinct Q1.CategoryCodeId,C.Category,ClientName 
 into tempdb..Canadaregions
 from vw_QvfcFields Q1
 Join vw_catinfo C On Q1.CategoryCodeId = C.CategoryCodeId
 Where FieldId =85 and FVCCType=3 and DisplaySeq is not null 


 Select Distinct M.*,D.*
 from tempdb..CanadaMarkets M
 Join tempdb..CanadaRegions R on M.CategoryCOdeID=R.CategoryCOdeID
 left Join tempdb..Canadadistrict D on M.CategoryCOdeID=D.CategoryCOdeID order by 3


 Select * from QueryViewTemplatesDetail 
 Where QueryTemplateID=2530 and FieldId= 71

 insert into QueryViewTemplatesDetail (QueryTemplateID,FieldID,DisplayName,Selectionpage,HelpMeSelect) values (2530,71,'District',1,0)

 Select * from vw_QvfcFields 
 Where CategoryCodeID in (2695)