Declare @CatCode varchar(25)
set @CatCode='asmn'

exec('delete from ' + @CatCode+'pagedetailtable where pagedetailid in 
	(select pagedetailid from masterclientcoverage..tempfuturepdt)')
If Exists(select name from sysobjects where name =  @CatCode + 'multiplepagevalues' and xtype = 'U')
  exec('delete from ' + @CatCode + 'multiplepagevalues where pagedetailid in 
	(select pagedetailid from masterclientcoverage..tempfuturepdt)')
