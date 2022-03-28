Select * from mt2sql04.sitecontrol.dbo.categorycode where category in ('wlm','wlmadl')

--Below SQL's are used to determine which server..datadb is used for Walmart client.
--Here in Walmart client we have FV as well as Adlert codes.
--use MT2SQL04\Connections1
select * from ClientGroup where clientid=92 -- 92 is ClientId for Walmart
--We got ClientGroupId=3 for Walmart Client

select * from ClientAppParameters Where ClientGroupId=3
--for Live FV site Appname=FeatureVisionV40 and corresponding DatabaseParameterID=25

select * from DBParameters Where DatabaseParameterId=25
-- we got SQLID1=43 for DatabaseParameterId=25

select * from SQLParameters Where SQLID=43
-- Here We came to know that for SQLID=43 => SQLSERVER=MT2SQL06 and SQLDatabase=SQL06

--This means that By Default all categorycodes of Walmart will point to SQLSERVER=MT2SQL06 and SQLDatabase=SQL06

--Now in Walmart Site we have Adlert codes also like wlmADL so how to know that it is pointing to MT2SQL01.SQL01.
--follow below steps:

Select * from CategoryAppparameters where Categorycodeid=626 and [AppName]='FeatureVisionV40'  -- 626 is id for WLMADL
--we got DatabaseParameterID=60

select * from DBParameters Where DatabaseParameterId=60
-- we got SQLID1=112 for DatabaseParameterId=60

select * from SQLParameters Where SQLID=112
-- Here We came to know that for SQLID=112 => SQLSERVER=MT2SQL01 and SQLDatabase=SQL01

--In Summary, ClientAppParaMeters and CategoryAppparaMeters tables are used to determine server..datadb