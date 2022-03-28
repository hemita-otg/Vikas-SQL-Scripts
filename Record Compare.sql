Select 'adv02PageDetailTable', count(*) from mt2sql00.sql02.dbo.adv02PageDetailTable with(nolock)
Select 'adv02PageDetailTable', count(*) from mt2sql02.sql02.dbo.adv02PageDetailTable with(nolock)
--			Master	Client	Master - Client
--adv02PageDetailTable	3764887	3755738	-9149

select 3764887 - 3755738



--PDTID exists in master but not on client server-----------------------------
select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable)
------------------------------------------------------------------------------

--PDTID exists in client but not on master server-----------------------------
select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable)
------------------------------------------------------------------------------

--check whether pdtid exists in tempfuturepdt------------------Master - Client---------------
select * from mt2sql00.masterclientcoverage.dbo.tempfuturepdt
where pagedetailid in 
(
select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable)
)
---------------------------------------------------------------------------------------------

--check whether pdtid exists in tempfuturepdt----------------Client - Master-----------------
select * from mt2sql00.masterclientcoverage.dbo.tempfuturepdt
where pagedetailid in 
(
select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable)
)
------------------------------------------------------------------------------


--check whether pdtid exists in masterpdt---------------------Master - Client-------------------------------
select * from mt2sql00.masteradviewdata.dbo.masterpagedetailtable
where pagedetailid in 
(
select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable)
)
------------------------------------------------------------------------------

--check whether pdtid exists in masterpdt---------------------Client - Master----------------
select * from mt2sql00.masteradviewdata.dbo.masterpagedetailtable
where pagedetailid in 
(
select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable)
)
------------------------------------------------------------------------------

--check whether pdtid exists in tempjapagedetaitable---------------------------
select * from mt2sql00.masterclientcoverage.dbo.tempjapagedetailtable
where pagedetailid in 
(
select distinct pagedetailid from mt2sql02.sql02.dbo.adv02pagedetailtable
where pagedetailid not in 
( select distinct pagedetailid from mt2sql00.sql02.dbo.adv02pagedetailtable)
)
------------------------------------------------------------------------------