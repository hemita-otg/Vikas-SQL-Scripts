--=========================================================================================================
--Basically to configure MWFR : we are using fresh & Easy(297) clients config as our standard template.

--1) first add recod in FRsites : same like Fresh & easy : by changing cleintid,clientname and newid
--2) Add records in FRRetMktMW
--3) update values in ClientValues table - fields to be updated are : Emailbodymw,Emailsubjectmw
--Use belwo script to do 3 points mentioned above.
--=========================================================================================================

select * from frsites where clientname like '%fresh%'
select newid()
--insert into frsites values(65,'Sara Lee Fresh','EC27FC1E',0)

select * from frretmktmw where clientid=65

--insert into frretmktmw 
select 65,retmktid from frretmktmw where clientid=297


select * from clientvalues where clientid=65
 

update clientvalues
set 
Emailbodymw='Good Afternoon from Market Track – <br><br>As your partner in competitive and market intelligence, we are happy to provide you with the Market Track Mid-week FlashReport. The FlashReport provides quick visibility into ''Best Food Day'' advertising across more than 50 retailer-markets, including a broad cross section of national and regional grocers, such as Kroger, Food Lion, Winn-Dixie, and HEB, in key markets including Dallas, Denver, Memphis, and Orlando, among many others. Similar to the Market Track Sunday FlashReport, the Mid-week FlashReport provides you with a very timely snapshot of ad activity by top retailers in markets where they drop print circulars on Monday, Tuesday, or Wednesday. <br><br>To view all ads covered by this FlashReport please {Public Site}.<br><br>In addition to the FlashReport, Market Track provides your organization with granular product and market-level intelligence around promotional and competitive activity. Our team looks forward to closely supporting your organization as you drive your business, and please do not hesitate to contact your Account team listed below to discuss how we can better support you in your initiatives.<br><br>Market Track FlashReport Images may be shared with other direct employees of {Company} but may not be disclosed to anyone who is not directly employed by {Company}.<br><br>Best Regards,<br>'
,Emailsubjectmw='Market Track''s Midweek FlashReport for {Company} {m-dd-yy}'
where clientid=65