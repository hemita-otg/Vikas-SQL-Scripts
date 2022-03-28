MT2SQL00 (EntryDataDur, MasterClientCoverage), view only on SQL Jobs
MT2SQL01 (SQL01, ConversionControl), view only on SQL Jobs


USE msdb;

CREATE ROLE JobsViewer AUTHORIZATION db_securityadmin;

GO

use msdb

EXECUTE sp_addrolemember 'JobsViewer', 'NUMERATOR\ravi.jethva'

DENY EXECUTE ON OBJECT::msdb.dbo.sp_add_job TO JobsViewer

DENY EXECUTE ON OBJECT::msdb.dbo.sp_add_jobserver TO JobsViewer

DENY EXECUTE ON OBJECT::msdb.dbo.sp_add_jobstep TO JobsViewer

DENY EXECUTE ON OBJECT::msdb.dbo.sp_update_job TO JobsViewer

DENY EXECUTE ON OBJECT::msdb.dbo.sp_add_jobschedule TO JobsViewer

DENY EXECUTE ON OBJECT::msdb.dbo.sp_delete_job TO JobsViewer