Declare @Category varchar(15)

print 'Select category from mt2sql14.sitecontrol.dbo.categorycode 
where clientserver = ''mt2sql13'' and sourcecwm like ''masterclientcoverage..EPCAN%'''


EXECUTE('declare ProcessOrderCur cursor Read_Only for 
Select category from mt2sql14.sitecontrol.dbo.categorycode 
where clientserver = ''mt2sql13'' and sourcecwm like ''masterclientcoverage..EPCAN%''')


open processordercur
fetch next from processordercur into @Category 
WHILE @@FETCH_STATUS = 0
BEGIN
	If Exists(select name from sysobjects where name =  @Category + 'childwebmain' and xtype = 'U')
	  	Exec('update CWM set media = ''Flyer''
		from ' + @category + 'ChildWebMain CWM where media in (''Insert-Paper'', ''Pick-Up In-Store'')
		Option (maxdop 1)')
		
		Exec('update CWM set advertiser = replace(advertiser, '' (CAN)'', '''') 
		from ' + @category + 'ChildWebMain CWM where advertiser like ''%(CAN)%''
		Option (maxdop 1)')
		
		Exec('update CWM set media = ''Flyer - Digital''
		from ' + @category + 'ChildWebMain CWM where media = ''Insert-Digital''
		Option (maxdop 1)')
		
		Exec('update cwm set media = ''Flyer'' 
		from ' + @category + 'childwebmain CWM 
		where mediaid = 6 and Retmktid = 6104
		Option (maxdop 1)')
		
		print 'drop table ' + @category + 'Media'	
		Exec('drop table ' + @category + 'Media')
		
		print 'SELECT DISTINCT Media INTO ' + @category + 'media From ' + @category + 'ChildWebMain'
		Exec('SELECT DISTINCT Media INTO ' + @category + 'media From ' + @category + 'ChildWebMain')
		
		print 'Insert into mt2sql14.subscription.dbo.htmlquerypagechange values ('''+ @category +''')'
		Exec('Insert into mt2sql14.subscription.dbo.htmlquerypagechange values ('''+ @category +''')')


  FETCH NEXT FROM ProcessOrderCur INTO @Category
END
close processordercur
deallocate processordercur
