if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EPCanADChildWebMain]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[EPCanADChildWebMain]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.EPCanADChildWebMain
AS
	Select * from masterclientcoverage.dbo.epcanchildwebmain where addate >= '1/1/2011'
	Union
	Select * from masteradviewdata.dbo.AdtrakChildwebmain where addate between '1/1/2008' and '12/31/2010'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


--select count(flyerid) from masterclientcoverage..epcanadchildwebmain where year(addate) < '2011'

use masteradviewdata
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ADMasterPageDetailTable]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[ADMasterPageDetailTable]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.ADMasterPageDetailTable
AS
	Select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,EntryComments1,EntryBrand,RegularUnitPrice,EntryTaggedCompany
		 from masteradviewdata.dbo.MasterPageDetailTable
	Union
	Select FlyerId,Page,PageDetailID,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,DTAdded,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,null,null,null,null
		 from masteradviewdata.dbo.AdtrakPageDetailTable

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


ALTER TABLE [dbo].[AdTrakPagedetailtable] WITH NOCHECK ADD CONSTRAINT [PK_AdTrakPagedetailtable] PRIMARY KEY  CLUSTERED 
	([PageDetailID]	)  ON [PRIMARY] 
GO

 CREATE  INDEX [idxBrandCatMfr] ON [dbo].[AdTrakPagedetailtable]([Brand], [Category]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_MasterPDT_FID_CAT_BR] ON [dbo].[AdTrakPagedetailtable]([FlyerId], [Category], [Brand]) ON [PRIMARY]
GO





select count(pagedetailid) from MasterPageDetailTable option (maxdop 1)
select count(pagedetailid) from AdtrakPageDetailTable option (maxdop 1)
select count(pagedetailid) from ADMasterPageDetailTable option (maxdop 1)



use masteradviewdata
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ADMasterMultiplePageValues]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[ADMasterMultiplePageValues]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.ADMasterMultiplePageValues
AS
	Select pagedetailid,fieldname,fieldvalue
		 from masteradviewdata.dbo.MasterMultiplePageValues
	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



