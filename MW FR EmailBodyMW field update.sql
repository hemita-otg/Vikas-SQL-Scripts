select * from subscription..clientprofile where clientname like '%fresh%'
select EmailBodyMW,EmailSubjectMW,* from clientvalues where clientid=297

--For SuperValu-------Clientid=253-------------------------
--Update clientvalues Set EmailBodyMW = Replace(Cast(EmailBodyMW as varchar(8000)), ', such as Kroger, Food Lion, Winn-Dixie, and HEB, in key markets including Dallas, Denver, Memphis, and Orlando, among many others.', ', such as Albertsons, Farm Fresh, Ralphs, Safeway, Food Lion, Harris Teeter, and Vons, in key markets including Chicago, Los Angeles, Seattle, Norfolk, and Baltimore, among many others.') where clientid = 253

--For Fresh & Easy-----Clientid=297---------------------------
--Update clientvalues Set EmailBodyMW = Replace(Cast(EmailBodyMW as varchar(8000)), ', such as Kroger, Food Lion, Winn-Dixie, and HEB, in key markets including Dallas, Denver, Memphis, and Orlando, among many others.', ', such as Albertsons, Lucky (SM), Frys Marketplace, Ralphs, Raleys, and Safeway, in key markets including Los Angeles, San Francisco, Sacramento and Phoenix, among many others.') where clientid = 297