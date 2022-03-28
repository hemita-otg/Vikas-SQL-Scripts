Use SQL16
Go

Declare 
        @Category varchar(20)
        , @SQL varchar(max)
        , @FVCCType int
        , @Remaining int = 1


While(@Remaining > 0)
Begin
        SET @Category = (SELECT category FROM SQL16.dbo.Categorycodetable where fvcctype IN (2) And ClientRun = 1 And Clientserver = @@SERVERNAME ORDER BY processorder DESC OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY)
                       

        SET @SQL =    '
                        Update CategoryCodeTable  set ClientRun = 0 where Category = ''' + @Category + '''
                    '
        Print (@SQL)
        EXEC (@SQL)

        --IF(@Category IN ('seaPep','driac','bgac','revpep','hfpPeP','nwrPeP','firPeP','offPeP', 'cwgPeP', 'loRepPeP', 'psiPep', 'tarPep', 'uniPep', 'usnPep', 'ferPeP', 'alcac', 'tarPep', 'phaPeP', 'barpep'))
        SET @SQL =    '
                        EXEC ' + Right(@@SERVERNAME, 5) + '.dbo.mt_proc_Create_DisQueryTables ''' + @Category + ''',0,1,0,0,0
                    '
        
        Print (@SQL)
        EXEC (@SQL)

        SET @SQL =    '
                        		Update CategoryCodeTable  set ClientRun = 0 where Category = ''' + @Category + '''
                    '
        Print (@SQL)
        EXEC (@SQL)

-- Set Flag For HTML Run
		SET @SQL =	'
						Update ' + Right(@@SERVERNAME,5) + '.dbo.HTMLCodeRun SET Flag = 1 Where Category = ''' + @Category + '''
					'
		Print (@SQL)
		EXEC (@SQL)
        
        SET @Remaining = (Select Count(1) From SQL16.dbo.Categorycodetable where fvcctype IN (2) And ClientRun = 1 And Clientserver = @@SERVERNAME)

        SET @SQL =    '
                        WaitFor Delay ''00:00:15''
                    '
        Print (@SQL)
        EXEC (@SQL)
End



