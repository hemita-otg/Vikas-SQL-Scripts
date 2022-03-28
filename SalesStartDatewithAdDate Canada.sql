
Declare @Cat varchar(50)
Declare @SQL varchar(max)
Declare @lCwmTable varchar(30)
Declare @lPdtTable varchar(30)

	IF Cursor_Status('global', 'CatCursor') >= 0
	 Begin
	  Close CatCursor
	  Deallocate CatCursor  
	 End

	Declare CatCursor Cursor Static For Select Distinct Category from CategoryCodetable where clientserver=@@SERVERNAME 
	and FVCCType=3 Order by 1

	Open CatCursor 
	Fetch Next From CatCursor Into @Cat
	While @@Fetch_Status=0
	Begin
		EXECUTE GetTableName @Cat, 3, @lCwmTable OUTPUT
		EXECUTE GetTableName @Cat, 22, @lPdtTable OUTPUT

		Set @SQL='IF Exists (Select * from sys.objects where name='''+@lPdtTable+''' and type=''u'')
		And Exists (Select * from sys.objects where name='''+@lCwmTable+''' and type=''u'')
		Begin
			Update PDT Set PDT.AdDate=CWM.AdDate, PDT.WeekOF=CWM.WeekOF, PDT.AdMonthId=CWM.AdMonthId, PDT.AdMonth=CWM.AdMonth, PDT.AdDay=CWM.AdDay, PDT.AdDayId=CWM.AdDayId
			From '+@lPdtTable+' PDT Join '+@lCwmTable+' CWM On PDT.FlyerID = CWM.FlyerID 
			Where CWM.AdDate <> PDT.AdDate 
		End '
		Exec (@SQL)
		Print @Cat + ' Completed'

	Fetch Next From CatCursor Into @Cat  
	End	
	Close  CatCursor
	Deallocate CatCursor

