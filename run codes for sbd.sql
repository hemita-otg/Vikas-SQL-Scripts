select clientserver,mt2aclientserver,* from Master..LocalCategoryCode where run=1


select mt2aclientserver,* from categorycodetable where category in ('mtl50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

select DISTINCT SOURCECWM from categorycodetable where category in ('mtl50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

update categorycodetable set isfull=1,ispdt=1,clientpdt=1,cwmfull=1,fullsourcecode='MasterDurData..masterDur', mt2aclientserver= 'MT2aSQL12' where category in 
('mtl50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')


update mt2asql06.sitecontrol.dbo.categorycode set isfull=1,ispdt=1,clientpdt=1,cwmfull=1,fullsourcecode='MasterDurData..masterDur', mt2aclientserver= 'MT2aSQL12' where category in 
('mtl50','pny50','ofm50','bslcAdl','sbd50','sbdc50','lgt50','mwv50','blmbi','dbag','pel50')

update Master..LocalCategoryCode set run=1 where category in 
('gilADL50','adGEA50','GEA50','gecan50','geDD','gemhw50','kohAD','kohADL50','toysdd','lev50','LevMerge','ema50','exmap50','lss50','bos50','bosc50','actadl50','scea50','bic50','gild50','HBPS50','lego50','legocan','LegoDD','mtl50','TFN50','INT50','flws50','myr50','mmmADL','mwv50','mwvs50','ttifc50','stbADL','icn50','cngd','iciADL','vlspr','dbag','nickDur','gmtADL','dysca','hhg','hhgs','whf','nau','hpADL','hpADL2','whlp','incADL','craADL','hpca','pebADL','pebca','dliADL','atcADL','efcADL','canca','ccpca','Aleca','hunADL','hunCA','cncADL','dicADL','iniADL','yotADL','yotcan','samcan','ZebADL','lliADL','nbaADL','dmADL','ankADL','ankCAN')


SELECT COUNT(1) FROM dbagFLYERREPORTS 
SELECT COUNT(1) FROM mtl50FLYERREPORTS 
SELECT COUNT(1) FROM flws50FLYERREPORTS 
SELECT COUNT(1) FROM mwv50FLYERREPORTS 
SELECT COUNT(1) FROM NIN50FLYERREPORTS 
SELECT COUNT(1) FROM ofm50FLYERREPORTS 
SELECT COUNT(1) FROM sbdc50FLYERREPORTS 
SELECT COUNT(1) FROM lgt50FLYERREPORTS 
SELECT COUNT(1) FROM blmbiFLYERREPORTS 
SELECT COUNT(1) FROM PEL50FLYERREPORTS 
SELECT COUNT(1) FROM pny50FLYERREPORTS 
SELECT COUNT(1) FROM bslcAdlFLYERREPORTS 


EXEC CreateDetailReports 'dbag','',0--7
EXEC CreateDetailReports 'mtl50','',0--8
EXEC CreateDetailReports 'flws50','',0--
EXEC CreateDetailReports 'mwv50','',0--5
EXEC CreateDetailReports 'NIN50','',0--

EXEC CreateDetailReports 'ofm50','',0--
EXEC CreateDetailReports 'sbdc50','',0
EXEC CreateDetailReports 'lgt50','',0--4
EXEC CreateDetailReports 'blmbi','',0--2
EXEC CreateDetailReports 'PEL50','',0--3
EXEC CreateDetailReports 'pny50','',0--6
EXEC CreateDetailReports 'bslcAdl','',0 --1


SELECT COUNT(1) FROM MT2ASQL12.SQL12.DBO.DBAGDETAILREPORTS