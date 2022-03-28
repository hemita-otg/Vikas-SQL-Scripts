 WITH CTE_Dup AS
 (
 SELECT*,
 ROW_NUMBER() OVER (PARTITION BY FlyerId,Page,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,EntryComments1,EntryBrand,RegularUnitPrice,EntryTaggedCompany,Weight,MediaDetail,QtySave,PurchaseOf,UnitDiscountPrice,DiscountType,OrMore
 ORDER BY FlyerId,Page,ThumbImagePath,NormalImagePath,FullImagePath,ProductImagePath,MultipleValues,Retailer,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,PageEvent,PageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,Color,NoOfColors,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,ProdImageCreated,ProdImageCreatedOn,Origin,Variety,UnitType,PkgSize,Offerdes,EntryComments1,EntryBrand,RegularUnitPrice,EntryTaggedCompany,Weight,MediaDetail,QtySave,PurchaseOf,UnitDiscountPrice,DiscountType,OrMore) 
AS ROW_NO 
from masterpagedetailtable where flyerid in (Select flyerid from adviewmain where year(addate)='2016')
)
select * into tempdb..dupemasterpdt FROM CTE_Dup WHERE ROW_NO > 1; 






select * from masterpagedetailtable where pagedetailid in  (select pagedetailid from tempdb..dupemasterpdt  where  pagedetailid not like '%ec')
order by FlyerId,		SalePrice1,	UnitPrice,topleftx,	toplefty,	bottomrightx,	bottomrighty,	Manufacturer,	Category,	Brand	,	Features,		Variety,	UnitType,	EntryComments1,	EntryBrand,	EntryTaggedCompany,	Weight,	MediaDetail
