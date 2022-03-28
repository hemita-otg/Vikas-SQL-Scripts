--SKUTYPE Field add in PEP Basic-Full Client

--1. Add SKUType on QP,PDT Page from CS Site
Select * from SiteControl..vw_QvfcFields Where CategoryCodeId=5867 and FieldId=16    

--2. Insert in Table
Select * from SiteControl..TableNames 
Where CategoryCodeID=5867 and TableID in (63,64)

--Full
--Insert into SiteControl..TableNames values ('sbaPepDisSKUType','sbaPepDisSKUType',63,5867)
--Insert into SiteControl..TableNames values ('sbaPepMPVSKUType','sbaPepMPVSKUType',64,5867)

--Basic
--Insert into SiteControl..TableNames values ('scjPEPDisSKUType','scjPEPDisSKUType',63,7148)
--Insert into SiteControl..TableNames values ('ACFVMPVSKUType','ACFVMPVSKUType',64,7148)


--3. Insert in CategoryField

Select * from SiteControl..CategoryFields  
Where CategoryCodeID=5867 and FieldID=16 

--Insert into SiteControl..CategoryFields (CategoryCodeID,FieldID,TableID,ColumnFormatID,FieldType,IsSummaryField,MPVTableID,GroupId) 
--Values (5867,16,63,0,3,1,64,6)