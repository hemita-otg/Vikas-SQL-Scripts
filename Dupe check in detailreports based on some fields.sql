
 ;With CTE
AS
(
Select
Row_Number() Over (Partition By FlyerId,Page,PageType,OrderValue,Height,Width,PageSpace,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,SaleStDt,SaleEndDt,CouponExpirationDate,ProductTerritoryID,ProductTerritory,ProductTerritorySubGroupID,ProductTerritorySubGroup,ProductTerritoryGroupID,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,comments2,comments3,comments4,UnitTypeId,UnitType,PkgSizeId,PkgSize,MPVPageEvent,MPVPageTheme,MPVVariety,MPVOrigin,MPVOffer,MPVOfferType,MPVUnitType,FeaturesId,PageTypeId,TaggedCompany,Weight,MediaDetail,MediaDetailID
Order By PageDetailId) as RowNum,
Row_Number() Over (Partition By FlyerId,Page,PageType,OrderValue,Height,Width,PageSpace,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,SaleStDt,SaleEndDt,CouponExpirationDate,ProductTerritoryID,ProductTerritory,ProductTerritorySubGroupID,ProductTerritorySubGroup,ProductTerritoryGroupID,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,comments2,comments3,comments4,UnitTypeId,UnitType,PkgSizeId,PkgSize,MPVPageEvent,MPVPageTheme,MPVVariety,MPVOrigin,MPVOffer,MPVOfferType,MPVUnitType,FeaturesId,PageTypeId,TaggedCompany,Weight,MediaDetail,MediaDetailID
Order By PageDetailId Desc) as RevRowNum,
*
from mil50detailreports  where originalpagedetailid like '%ac'
) Select * into dupmilac From CTE
Where RowNum<>RevRowNum


select * from dupmilac where advertiser='walgreens' order by addate desc 