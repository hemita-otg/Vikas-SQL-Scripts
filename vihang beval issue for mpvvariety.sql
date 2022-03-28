
SELECT * FROM masteradviewdata..MasterMultiplePageValues    MPV WITH (NOLOCK) WHERE  PageDetailID  = '1610198B292'
SELECT Variety, * FROM masteradviewdata..masterpagedetailtable   WITH (NOLOCK) WHERE PageDetailID  = '1610198B292'


SELECT * FROM masterbeval..MasterBevALMPVVariety  MPV WITH (NOLOCK) WHERE PageDetailId = 1610198138292
SELECT MPVVariety, * FROM masterbeval..MasterBevALDetailReports  WITH (NOLOCK) WHERE OriginalPageDetailID  like '1610198B292%'


SELECT * FROM mt2sql07.sql07.dbo.sazMPVVariety MPV WITH (NOLOCK) WHERE PageDetailId = 1610198138292
SELECT MPVVariety, dtadded,* FROM mt2sql07.sql07.dbo.sazDetailReports WITH (NOLOCK) WHERE PageDetailId = 1610198138292
