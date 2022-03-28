use subscription
/*
Prior to update do the following

1. Truncate Table UpdateSavedQueryFieldValue
2. Insert the old and new values into UpdateSavedQueryFieldValue table which are required to be updated for cases
3. Remove same values using the following
	Delete from UpdateSavedQueryFieldValue where cast(OldFieldValue as varbinary) =  cast(NewFieldValue as varbinary)
4. Replace space and comma with special characters required for AdView site by using the following
	Update UpdateSavedQueryFieldValue Set OldFieldValue = Replace(Replace(OldFieldValue, ' ', '_'), ',', '@'),
		NewFieldValue = Replace(Replace(NewFieldValue, ' ', '_'), ',', '@')
5. Run the entire process with @DebugScript = 0 and after changing the fieldname variable to be updated.

Note : Please use the following by altering the statement for replacing field media and ignore everything else.
update savedqueriesdetail set sessionidvalue = replace(replace(replace(replace(replace(replace(replace(SessionIDValue, 'Insert__', 'Insert'), 'Magazine', 'Magazine'), 'Mailer', 'Mailer'), 'In-store', 'In-store'), 'Catalog', 'Catalog'), 'Sp_-_In-store', 'Sp_-_In-store'), 'Online', 'Online') 
where  sessionidname='Displaymedia' and sessionidvalue <> '-1:'

*/


Declare @FieldName Varchar(128)
Declare @DebugScript Bit

Declare @OldValue Varchar(1000)
Declare @NewValue Varchar(128)
Declare @QueryID numeric(18)
Declare @NoOfRowsAffected Numeric(18)
Declare @SequenceNo int

Set @FieldName = 'Advertiser'
Set @DebugScript = 1

Begin
	Set @NoOfRowsAffected = 0
	IF Cursor_Status('variable', 'UpdateTableCursor') >= 0
	Begin
		Close UpdateTableCursor
		Deallocate UpdateTableCursor		
	End
	
	Declare UpdateTableCursor Cursor For Select OldFieldValue, NewFieldValue From UpdateSavedQueryFieldValue

	Open UpdateTableCursor 
	Fetch Next From UpdateTableCursor Into @OldValue, @NewValue
	
	While @@Fetch_Status=0
	Begin
		Print '[' + @OldValue + ']->[' + @NewValue + ']'

		Declare @VarSessionIDValue varchar(7999)
		Declare @InnerIndex int

		IF Cursor_Status('variable', 'QNameCursor') >= 0
		Begin
			Close QNameCursor
			Deallocate QNameCursor		
		End


		Declare QNameCursor Cursor For Select QueryId, LTrim(RTrim(SessionIDValue)) As SessionIDValue, SequenceNo From SavedQueriesDetail where sessionidname='Display' + @FieldName And ', ' + sessionidvalue + ',' Like '%, ' + @OldValue + ',%' 
						--And QueryID in (171140)

		Open QNameCursor 
		Fetch Next From QNameCursor Into @QueryID, @VarSessionIDValue, @SequenceNo

		While @@Fetch_Status=0
		Begin

			Set @InnerIndex = (CHARINDEX(', ' + @OldValue + ',', ', ' + @VarSessionIDValue + ',') )
			If CHARINDEX(Cast(', ' + @NewValue + ',' As Varbinary), Cast(', ' + @VarSessionIDValue + ',' As Varbinary)) != 0
			--Set To Blank as new value exists
			Begin
				If @DebugScript = 1
					Print '1.' + @VarSessionIDValue

				If @InnerIndex != 1 And ((@InnerIndex + Len(@OldValue))-1 != Len(@VarSessionIDValue))
Begin
					If @DebugScript = 1
						Print 'Middle'

					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, ', ' +  @OldValue + ',', ',')
						Where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
				Else If @InnerIndex != 1 And ((@InnerIndex + Len(@OldValue))-1 = Len(@VarSessionIDValue))
Begin
					If @DebugScript = 1
						Print 'Last'
						
					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, ', ' + @OldValue, '')
						Where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
				Else
Begin
					If @DebugScript = 1
						Print 'First'

					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue,  @OldValue + ', ', '')
						Where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
			End
			Else
			--Replace With New value as new value do not exists
			Begin
				If @DebugScript = 1
					Print '2.' + Cast(@QueryId As Varchar) + '->' + @VarSessionIDValue
				If @InnerIndex != 1 And ((@InnerIndex + Len(@OldValue))-1 != Len(@VarSessionIDValue))
Begin
					If @DebugScript = 1
						Print 'Middle'

					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, ', ' + @OldValue + ',', ', ' +@Newvalue + ',')
						where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
				Else If @InnerIndex != 1 And ((@InnerIndex + Len(@OldValue))-1 = Len(@VarSessionIDValue))
Begin
					If @DebugScript = 1
						Print 'Last'

					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, ', ' + @OldValue, ', ' + @Newvalue)
						where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
				Else If @InnerIndex = 1 And ((@InnerIndex + Len(@OldValue))-1 = Len(@VarSessionIDValue))
Begin
					If @DebugScript = 1
						Print 'One and Only One'

					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, @OldValue, @Newvalue)
						where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
				Else
Begin
					If @DebugScript = 1
						Print 'First'
					If @DebugScript = 0
						Update SavedQueriesDetail Set SessionIDValue = Replace(SessionIDValue, @OldValue + ', ', @Newvalue + ', ')
						where sessionidname='Display' + @FieldName And QueryId = @QueryID And SequenceNo = @SequenceNo 
						And ', ' + sessionidvalue + ',' Like '%, '+ @OldValue + ',%' 

End
			End 

			Set @NoOfRowsAffected = @NoOfRowsAffected + @@ROWCOUNT
			Fetch Next From QNameCursor Into @QueryID, @VarSessionIDValue, @SequenceNo
		End		
		Close 	QNameCursor
		Deallocate QNameCursor			

		Fetch Next From UpdateTableCursor Into @OldValue, @NewValue
	End		
	Close UpdateTableCursor
	Deallocate UpdateTableCursor	
	
End 
