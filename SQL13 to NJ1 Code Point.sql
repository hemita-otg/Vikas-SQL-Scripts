Select * from SiteControl..vw_catinfo Where Category in ('kelPep')
Select * from SiteControl..CategoryCode Where ClientID in (1270)

Update SiteControl..CategoryCode Set ClientServer='NJ1-FVPRD-DB00' Where Category='kelPEP'

Select * from Connection..ClientGroup Where ClientID=1270 
Select * from Connection..ClientGroupIDDesc  Where ClientGroupID=19 
--Update Connection..ClientGroup Set ClientGroupID=23 Where ClientID=1270 

Select * from Connection..CategoryAppParameters Where CategoryCodeID= 7067 
  
--MT2SQL14
Select * from Connection..ClientGroup Where ClientID=1028
--To Point on 13 for Client 1028
--Update Connection..ClientGroup Set ClientGroupID=19 Where ClientID=1028

Select * from Connection..CategoryAppParameters Where CategoryCodeID=4710 and DatabaseParameterID=202
--To Point on 13 for ClientID 433
--Update  Connection..CategoryAppParameters Set DatabaseParameterID=182 Where CategoryCodeID=4710 and DatabaseParameterID=202

