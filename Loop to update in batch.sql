--Select OriginalPageDetailID Into #Temp_1 From tempdb..VarietyPDTs with(nolock)

--select OriginalPageDetailID as adc_i, ADCEntry.dbo.AC_GetTopParentAdBlockId(OriginalPageDetailID) as top_parent_i
--Into ACFV.dbo.Variety_Missing
--from tempdb..VarietyPDTs with(nolock)
--Where 1 = 2

--CREATE NONCLUSTERED INDEX [IDX_TEMP_1] ON #Temp_1 (OriginalPageDetailID ASC)

Declare @c int = 2

While(@c > 1)
Begin
		Select Top 99999 OriginalPageDetailID Into #T_1 From #Temp_1 with(nolock)

		CREATE NONCLUSTERED INDEX [IDX_T_1] ON #T_1 (OriginalPageDetailID ASC)

		Insert Into ACFV.dbo.Variety_Missing
		select OriginalPageDetailID as adc_i, ADCEntry.dbo.AC_GetTopParentAdBlockId(OriginalPageDetailID) as top_parent_i
		from #T_1 with(nolock)

		Delete A
		From #Temp_1 A
		JOIN #T_1 B ON A.OriginalPageDetailID = B.OriginalPageDetailID

		Drop Table #T_1
				
		SET @c = (Select Count(1) From #Temp_1 with(nolock))

		Print @c
End






