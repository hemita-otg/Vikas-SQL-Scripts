use master



exec xp_cmdshell 'TASKKILL /S \\MT2IIS1 /F /IM powerpnt.exe'
exec xp_cmdshell 'TASKKILL /S \\MT2IIS1 /F /IM excel.exe'
exec xp_cmdshell 'TASKKILL /S \\MT2IIS1 /F /IM frserviceprogram.exe'
exec xp_cmdshell 'sc \\mt2iis1 stop flashreportservice'
exec xp_cmdshell 'sc \\mt2iis1 query flashreportservice'
WAITFOR DELAY '00:00:10'
exec xp_cmdshell 'sc \\mt2iis1 start flashreportservice'
exec xp_cmdshell 'sc \\mt2iis1 query flashreportservice'


