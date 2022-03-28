USE [Subscription]
GO

/****** Object:  UserDefinedFunction [dbo].[AV_GetProductImagePath_MT2SQL04CONNECTIONS1]    Script Date: 08/23/2012 03:07:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create   Function [dbo].[AV_GetProductImagePath_MT2SQL04CONNECTIONS1]
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
	select @ImagePathFull = ProductImagePath, @ImagePathThumbnail = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL04\CONNECTIONS1].CONNECTION.DBO.PDTProcessed where PageDetailID = @PDTID
	if @ImageType = 'PrT' 
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




USE [Subscription]
GO

/****** Object:  UserDefinedFunction [dbo].[AV_GetProductImagePath_MT2SQL05CONNECTIONS2]    Script Date: 08/23/2012 03:07:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


Create   Function [dbo].[AV_GetProductImagePath_MT2SQL05CONNECTIONS2]
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
	select @ImagePathFull = ProductImagePath, @ImagePathThumbnail = left(ProductImagePath, len(ProductImagePath) - 5) + right(ProductImagePath, 4) from [MT2SQL05\CONNECTIONS2].CONNECTION.DBO.PDTProcessed where PageDetailID = @PDTID
	if @ImageType = 'PrT' 
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


