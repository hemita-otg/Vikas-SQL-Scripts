 select top 10  * from masterdurdata.dbo.MasterEntryPageCat
 select * from masterdurdata..masterdurflyerreports where flyerid =14102396

use ConversionControl 

select distinct clientserver, databasecategory,id,b.clientid,c.clientname  from ConversionCategory a join mt2sql14.sitecontrol.dbo.categorycode b on a.DatabaseCategory =b.category join mt2sql14.subscription.dbo.clientprofile c on b.clientid=c.clientid  where ISNULL(IsPgCats ,0)=1 and ISNULL(a.Run,0)=1 
and clientserver in ('mt2sql01','mt2sql05','mt2sql09')

select distinct category ,'seacaadl50' as Code from MT2SQL01.SQL01.dbo.seacaadl50disquerypage
union all select distinct category ,'besADL' as Code from MT2SQL01.SQL01.dbo.besADLdisquerypage
union all select distinct category ,'hhg' as Code from MT2SQL01.SQL01.dbo.hhgdisquerypage
union all select distinct category ,'besADL2' as Code from MT2SQL01.SQL01.dbo.besADL2disquerypage
union all select distinct category ,'wlmADL50' as Code from MT2SQL01.SQL01.dbo.wlmADL50disquerypage
union all select distinct category ,'wlmDUR50' as Code from MT2SQL01.SQL01.dbo.wlmDUR50disquerypage
union all select distinct category ,'wlmADL250' as Code from MT2SQL01.SQL01.dbo.wlmADL250disquerypage
union all select distinct category ,'NIN50' as Code from MT2SQL01.SQL01.dbo.NIN50disquerypage
union all select distinct category ,'kohADL50' as Code from MT2SQL01.SQL01.dbo.kohADL50disquerypage
union all select distinct category ,'fmds' as Code from MT2SQL01.SQL01.dbo.fmdsdisquerypage
union all select distinct category ,'HBI50' as Code from MT2SQL01.SQL01.dbo.HBI50disquerypage
union all select distinct category ,'beh50' as Code from MT2SQL01.SQL01.dbo.beh50disquerypage
union all select distinct category ,'vfc50' as Code from MT2SQL01.SQL01.dbo.vfc50disquerypage
union all select distinct category ,'besADLT' as Code from MT2SQL01.SQL01.dbo.besADLTdisquerypage
union all select distinct category ,'dsgADL' as Code from MT2SQL01.SQL01.dbo.dsgADLdisquerypage
union all select distinct category ,'DARep' as Code from MT2SQL01.SQL01.dbo.DARepdisquerypage
union all select distinct category ,'sstADL' as Code from MT2SQL01.SQL01.dbo.sstADLdisquerypage
union all select distinct category ,'stacaADL' as Code from MT2SQL01.SQL01.dbo.stacaADLdisquerypage
union all select distinct category ,'hhgs' as Code from MT2SQL01.SQL01.dbo.hhgsdisquerypage
union all select distinct category ,'icn50' as Code from MT2SQL05.SQL05.dbo.icn50disquerypage
union all select distinct category ,'tarADL50' as Code from MT2SQL05.SQL05.dbo.tarADL50disquerypage
union all select distinct category ,'mwv50' as Code from MT2SQL05.SQL05.dbo.mwv50disquerypage
union all select distinct category ,'mwvs50' as Code from MT2SQL05.SQL05.dbo.mwvs50disquerypage
union all select distinct category ,'LowAdS50' as Code from MT2SQL05.SQL05.dbo.LowAdS50disquerypage
union all select distinct category ,'brgADL50' as Code from MT2SQL09.SQL09.dbo.brgADL50disquerypage
union all select distinct category ,'hds50' as Code from MT2SQL09.SQL09.dbo.hds50disquerypage
union all select distinct category ,'brgCAN' as Code from MT2SQL09.SQL09.dbo.brgCANdisquerypage
union all select distinct category ,'REM50' as Code from MT2SQL09.SQL09.dbo.REM50disquerypage
union all select distinct category ,'gap50' as Code from MT2SQL09.SQL09.dbo.gap50disquerypage
union all select distinct category ,'toy50' as Code from MT2SQL09.SQL09.dbo.toy50disquerypage
union all select distinct category ,'ubi50' as Code from MT2SQL09.SQL09.dbo.ubi50disquerypage
union all select distinct category ,'OFFDE50' as Code from MT2SQL09.SQL09.dbo.OFFDE50disquerypage
union all select distinct category ,'JCPd50' as Code from MT2SQL09.SQL09.dbo.JCPd50disquerypage
union all select distinct category ,'blma50' as Code from MT2SQL09.SQL09.dbo.blma50disquerypage
union all select distinct category ,'wbs50' as Code from MT2SQL09.SQL09.dbo.wbs50disquerypage
union all select distinct category ,'wbsca' as Code from MT2SQL09.SQL09.dbo.wbscadisquerypage
union all select distinct category ,'brgADLs' as Code from MT2SQL09.SQL09.dbo.brgADLsdisquerypage
union all select distinct category ,'remca' as Code from MT2SQL09.SQL09.dbo.remcadisquerypage
union all select distinct category ,'JCPAds' as Code from MT2SQL09.SQL09.dbo.JCPAdsdisquerypage
