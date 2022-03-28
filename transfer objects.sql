--Needs to run from local server(mt2dev1)
declare @DestServer varchar(255)
declare @DestDatabase varchar(255)
declare @SrcServer varchar(255)
declare @SrcDatabase varchar(255)
declare @TName varchar(255)
declare @Tlike varchar(255)
declare @vcCmdLine varchar(3000)
declare @Tlist varchar(255)
set @SrcServer='MT2SQL00' -- Source Server
set @SrcDatabase='SQL03' -- Source Database
set @DestServer='mt2sql03' -- Destination Server
set @DestDatabase='sql03'  -- Destination Database
set @TName='' --Tablename(s), if specifying more than one use comma after each tablename
set @TLike='pgtest' --Table names containing these letters in a sequence will be transfered BE CAREFULL WHILE USING THIS FOR MASTER CLIENTS
set @Tlist = 'tname'
set @vcCmdLine = 'C:\SQLExportObjects\bin\SQLExportObjects.exe /ss:' 
+ @SrcServer + ' /sd:' + @SrcDatabase + ' /ds:' + @DestServer + ' /dd:' + @DestDatabase + 
--' /tl:' + @TName --If using @TName you will use - ' /tl:' + @TName, if using @TLike use - ' /tlike:' + @Tlike
' /tlike:' + @Tlike + ' /allobj:false'
print @vcCmdLine
exec master..xp_cmdshell @vcCmdLine

