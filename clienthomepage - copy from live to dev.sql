select * from sitecontrol..categorycode where clientid=11
select * from mt2sql04.sitecontrol.dbo.categorycode where clientid=11

select * from mt2sql04.subscription.dbo.clienthomepage where clientid=11
select * from clienthomepage where clientid=11


--insert into clienthomepage (
ClientID,ClientLogo,TourPage,TermsPage,HomePageContent,EnableTermsLink,EnableGuidedTourLink,EnableQuickTips,
EnableDatabaseFieldsLink,EnablePrivacyPolicyLink,EnableContactUsLink,TableWidth,EnableFAQLink,ClientLineImage,
CustomMessage,CustomLinkText,CustomLinkURL,AllLinkColor,CustomLinkPlacementID
)
select 
ClientID,ClientLogo,TourPage,TermsPage,HomePageContent,EnableTermsLink,EnableGuidedTourLink,EnableQuickTips,
EnableDatabaseFieldsLink,EnablePrivacyPolicyLink,EnableContactUsLink,TableWidth,EnableFAQLink,ClientLineImage,
CustomMessage,CustomLinkText,CustomLinkURL,AllLinkColor,CustomLinkPlacementID
from mt2sql04.subscription.dbo.clienthomepage where clientid=11

select startpage,* from clientprofile where clientid=11
--update clientprofile set startpage='clienthome.asp' where clientid=11

select distinct defaultasp from vwuser where clientid=11
select distinct defaultasp from usercontrol where clientid=11

--update usercontrol set defaultasp='clienthome.asp' where clientid=11

select * from clientdatabases where clientid=11
--delete from clientdatabases  where clientid=11

--insert into clientdatabases (ClientID,YourWeb,ClientCode,AllSequence,AllRow,AllBold,AllColor,AllFont,AllFontSize,
AllBackGround,HomePageLink,CategoryCodeID,Status)
select ClientID,YourWeb,ClientCode,AllSequence,AllRow,AllBold,AllColor,AllFont,AllFontSize,
AllBackGround,HomePageLink,CategoryCodeID,Status 
from mt2sql04.subscription.dbo.clientdatabases where clientid=11