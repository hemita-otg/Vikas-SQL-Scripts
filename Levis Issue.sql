--MT2SQL00
select Distinct CTAdCode
from MasterAVData.dbo.AVcdFlyerReports     
where CTAdCode in  ('JCPERT-30073','JCPERT-22272','JCPERT-22972','JCPERT-22841','JCPERT-23607','JCPERT-22273','JCPERT-22285','JCPERT-23137','JCPERT-22283','JCPERT-29872','JCPERT-28432','JCPERT-25180')

Select Advertiser, Year(Addate), Count(1)
from MasterAVData..AVCDFlyerReports  
Where media in ('TV','Radio')
and Advertiser='JC Penney'
and retmktid in (select Rm.retmktid FROM MasterClientCoverage..MasterClientCWM MCC JOIN MasterClientCoverage..RETMKT RM ON 
MCC.RetId = RM.RetId WHERE CategoryCodeId = 3374)
Group by Advertiser, Year(Addate)

--MT2SQL05
Select Advertiser, Year(Addate), Count(1)
from levMergeFlyerReports 
Where media in ('TV','Radio')
and Advertiser='JC Penney'
and retmktid in (select Rm.retmktid FROM MT2SQL00.MasterClientCoverage.dbo.MasterClientCWM MCC JOIN MT2SQL00.MasterClientCoverage.dbo.RETMKT RM ON 
MCC.RetId = RM.RetId WHERE CategoryCodeId = 3374)
Group by Advertiser, Year(Addate)

select Distinct CTAdCode
from levMergeFlyerReports    
where CTAdCode in  ('JCPERT-30073','JCPERT-22272','JCPERT-22972','JCPERT-22841','JCPERT-23607','JCPERT-22273','JCPERT-22285','JCPERT-23137','JCPERT-22283','JCPERT-29872','JCPERT-28432','JCPERT-25180')

--MT2SQL00A
select Distinct CTAdCode
from CompetiTrackRawData..MasterAVFlyerReports     
where CTAdCode in  ('JCPERT-30073','JCPERT-22272','JCPERT-22972','JCPERT-22841','JCPERT-23607','JCPERT-22273','JCPERT-22285','JCPERT-23137','JCPERT-22283','JCPERT-29872','JCPERT-28432','JCPERT-25180')

Select Advertiser, Year(Addate), Count(1)
from CompetiTrackRawData..MasterAVFlyerReports 
Where media in ('TV','Radio')
and Advertiser='JC Penney'
and retmktid in (select Rm.retmktid FROM MasterClientCoverage..MasterClientCWM MCC JOIN MasterClientCoverage..RETMKT RM ON 
MCC.RetId = RM.RetId WHERE CategoryCodeId = 3374)
Group by Advertiser, Year(Addate)
