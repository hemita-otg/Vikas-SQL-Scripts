if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetPageImagePath_MT2SQL04CONNECTIONS1]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetPageImagePath_MT2SQL04CONNECTIONS1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetPageImagePath_MT2SQL05CONNECTIONS2]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetPageImagePath_MT2SQL05CONNECTIONS2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetProductImagePathADL_MT2SQL04CONNECTIONS1]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetProductImagePathADL_MT2SQL04CONNECTIONS1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetProductImagePathADL_MT2SQL05CONNECTIONS2]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetProductImagePathADL_MT2SQL05CONNECTIONS2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetProductImagePath_MT2SQL04CONNECTIONS1]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetProductImagePath_MT2SQL04CONNECTIONS1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AV_GetProductImagePath_MT2SQL05CONNECTIONS2]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AV_GetProductImagePath_MT2SQL05CONNECTIONS2]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE  Function DBO.AV_GetPageImagePath_MT2SQL04CONNECTIONS1
(@img varchar(255),
@ImageType varchar(3), -- 'PgT' for Thumbnail Page Image, PgF for Full Size Page Image, PgN for Normal Page Image Path
@PageNo int
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @Extension varchar(10)
	Declare @PageNum varchar(10)
	set @Extension = right(@img, len(@Img)- charindex('.', @img)+1)
	if @PageNo < 10
		set @PageNum = '00' + cast(@PageNo as varchar(3))
	
	if @PageNo >= 10 and @PageNo <= 100
		set @PageNum = '0' + cast(@PageNo as varchar(3))	

	if @PageNo > 99
		set @PageNum = cast(@PageNo as varchar(3))	


	if @ImageType = 'PgT'
		set @PageNum = @PageNum + 's'
	if @ImageType = 'PgN'
		set @PageNum = @PageNum + 'n'
	if @ImageType = 'PgF'
		set @PageNum = @PageNum + ''
	set @PageNum = @PageNum + @Extension

	set @ImagePath = replace(@img, '001s.jpg', @PageNum)
	return @ImagePath

END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE  Function DBO.AV_GetPageImagePath_MT2SQL05CONNECTIONS2
(@img varchar(255),
@ImageType varchar(3), -- 'PgT' for Thumbnail Page Image, PgF for Full Size Page Image, PgN for Normal Page Image Path
@PageNo int
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @Extension varchar(10)
	Declare @PageNum varchar(10)
	set @Extension = right(@img, len(@Img)- charindex('.', @img)+1)
	if @PageNo < 10
		set @PageNum = '00' + cast(@PageNo as varchar(3))
	
	if @PageNo >= 10 and @PageNo <= 100
		set @PageNum = '0' + cast(@PageNo as varchar(3))	

	if @PageNo > 99
		set @PageNum = cast(@PageNo as varchar(3))	


	if @ImageType = 'PgT'
		set @PageNum = @PageNum + 's'
	if @ImageType = 'PgN'
		set @PageNum = @PageNum + 'n'
	if @ImageType = 'PgF'
		set @PageNum = @PageNum + ''
	set @PageNum = @PageNum + @Extension

	set @ImagePath = replace(@img, '001s.jpg', @PageNum)
	return @ImagePath

END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE   Function DBO.AV_GetProductImagePathADL_MT2SQL04CONNECTIONS1
(@PDTID varchar(50),
@ImageType varchar(3) -- 'PrT' for Thumbnail Product Image, PrF for Full Size Product Image
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @ImagePathFull varchar(255)
	Declare @ImagePathThumbnail varchar(255)
	set @ImagePath = ''
	set @ImagePathThumbnail = ''
	set @ImagePathFull = ''
	select  @ImagePathThumbnail = Replace(productImagePath, 'Crops', 'crszd'), @ImagePathFull = ProductImagePath from [MT2SQL04\CONNECTIONS1].CONNECTION.DBO.PDTProcessed_ADL where PageDetailID = @PDTID

	if @ImageType = 'PrF' 
	begin
		set @ImagePath = @ImagePathFull
	end
	else
	begin
		set @ImagePath = @ImagePathThumbnail
	end
	
	return @ImagePath
END







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE   Function DBO.AV_GetProductImagePathADL_MT2SQL05CONNECTIONS2
(@PDTID varchar(50),
@ImageType varchar(3) -- 'PrT' for Thumbnail Product Image, PrF for Full Size Product Image
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @ImagePathFull varchar(255)
	Declare @ImagePathThumbnail varchar(255)
	set @ImagePath = ''
	set @ImagePathThumbnail = ''
	set @ImagePathFull = ''
	select  @ImagePathThumbnail = Replace(productImagePath, 'Crops', 'crszd'), @ImagePathFull = ProductImagePath from [MT2SQL05\CONNECTIONS2].CONNECTION.DBO.PDTProcessed_ADL where PageDetailID = @PDTID

	if @ImageType = 'PrF' 
	begin
		set @ImagePath = @ImagePathFull
	end
	else
	begin
		set @ImagePath = @ImagePathThumbnail
	end
	
	return @ImagePath
END









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE    Function DBO.AV_GetProductImagePath_MT2SQL04CONNECTIONS1
(@PDTID varchar(50),
@ImageType varchar(3) -- 'PrT' for Thumbnail Product Image, PrF for Full Size Product Image
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @ImagePathFull varchar(255)
	Declare @ImagePathThumbnail varchar(255)

	if len(@PDTID) = 12 and right(@PDTID, 1) = 'R'
	  SET @PDTID = left(@PDTID, 11)

	set @ImagePath = ''
	set @ImagePathThumbnail = ''
	set @ImagePathFull = ''
	select  @ImagePathThumbnail = ProductImagePath, @ImagePathFull = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL04\CONNECTIONS1].CONNECTION.DBO.PDTProcessed where PageDetailID = @PDTID
	if @ImagePathFull = '' 
	begin
		select  @ImagePathThumbnail = ProductImagePath, @ImagePathFull = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL04\CONNECTIONS1].CONNECTION.DBO.PDTProcessedTemp where PageDetailID = @PDTID
	end
	if @ImageType = 'PrF' 
	begin
		set @ImagePath = @ImagePathFull
	end
	else
	begin
		set @ImagePath = @ImagePathThumbnail
	end
	
	return @ImagePath
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE    Function DBO.AV_GetProductImagePath_MT2SQL05CONNECTIONS2
(@PDTID varchar(50),
@ImageType varchar(3) -- 'PrT' for Thumbnail Product Image, PrF for Full Size Product Image
)
RETURNS VARCHAR(255)
AS
BEGIN
	Declare @ImagePath varchar(255)
	Declare @ImagePathFull varchar(255)
	Declare @ImagePathThumbnail varchar(255)

	if len(@PDTID) = 12 and right(@PDTID, 1) = 'R'
	  SET @PDTID = left(@PDTID, 11)

	set @ImagePath = ''
	set @ImagePathThumbnail = ''
	set @ImagePathFull = ''
	select  @ImagePathThumbnail = ProductImagePath, @ImagePathFull = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL05\CONNECTIONS2].CONNECTION.DBO.PDTProcessed where PageDetailID = @PDTID
	if @ImagePathFull = '' 
	begin
		select  @ImagePathThumbnail = ProductImagePath, @ImagePathFull = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL05\CONNECTIONS2].CONNECTION.DBO.PDTProcessedTemp where PageDetailID = @PDTID
	end
	if @ImageType = 'PrF' 
	begin
		set @ImagePath = @ImagePathFull
	end
	else
	begin
		set @ImagePath = @ImagePathThumbnail
	end
	
	return @ImagePath
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

