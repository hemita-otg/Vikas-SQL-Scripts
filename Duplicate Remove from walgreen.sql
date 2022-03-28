;With CTE
AS
(
Select
Row_Number() Over (Partition By FlyerId,Page,advertiser,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,UnitType,PkgSize,Offerdes
Order By PageDetailId) as RowNum,																																																																																																																						  
Row_Number() Over (Partition By FlyerId,Page,advertiser,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,UnitType,PkgSize,Offerdes
Order By PageDetailId Desc) as RevRowNum,																																																																																																																				  
*
from SQL02..waldetailreports
) Select * From CTE
Where RowNum<>RevRowNum


 WITH CTE_Dup AS
 (
 SELECT*,
 ROW_NUMBER() OVER (PARTITION BY FlyerId,OriginalFlyerID,Page,PageType,OrderValue,Height,Width,PageSpace,AdvertiserId,Advertiser,marketid,market,RetMktId,mediaId,media,eventId,event,Size,FirstPageHeight,FirstPageWidth,FlyerSpace,themeid,theme,PublicationId,Publication,TradeClassId,tradeclass,AdDate,WeekOf,salestartdate,saleenddate,Pages,CouponInd,RegionId,Region,DistrictId,District,CountryID,Country,LanguageID,Language,WeekOfn,WeekOfi,AdMonth,AdMonthId,subject,persona,receivedDt,SalesTerritory,SalesTerritoryId,SalesTerritoryGroup,SalesTerritoryGroupId,SalesTerritorySubGroup,SalesTerritorySubGroupId,ManufacturerId,Manufacturer,MerchandiseCategoryId,MerchandiseCategory,MerchandiseSubCatId,MerchandiseSubCat,CategoryId,Category,BrandId,Brand,SKUDescription1ID,SKUDescription1,SKUDescription2ID,SKUDescription2,SKUDescription3ID,SKUDescription3,SKUTypeID,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritoryID,ProductTerritory,ProductTerritorySubGroupID,ProductTerritorySubGroup,ProductTerritoryGroupID,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,UnitTypeId,UnitType,PkgSizeId,PkgSize,MPVPageEvent,MPVPageEventId,MPVPageTheme,MPVPageThemeId,MPVVariety,MPVVarietyId,MPVOrigin,MPVOriginId,MPVOffer,MPVOfferId,MPVOfferType,MPVOfferTypeId,MPVUnitType,MPVUnitTypeID,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,FeaturesId,AdType,Img,PageTypeId,TaggedCompany,DTAdded,Weight,AdDay,AdDayId,VehicleId,CreationMonth,ImageName,PageName,FVSystemPage,FVDisplayPage,FrontPageInd,BackPageInd,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,MediaDetail,MediaDetailID,Channel,ChannelID,DisplayMedia,Source,DistDt,AdDist,AdTypeID,AdDistID,Spend
 ORDER BY FlyerId,OriginalFlyerID,Page,PageType,OrderValue,Height,Width,PageSpace,AdvertiserId,Advertiser,marketid,market,RetMktId,mediaId,media,eventId,event,Size,FirstPageHeight,FirstPageWidth,FlyerSpace,themeid,theme,PublicationId,Publication,TradeClassId,tradeclass,AdDate,WeekOf,salestartdate,saleenddate,Pages,CouponInd,RegionId,Region,DistrictId,District,CountryID,Country,LanguageID,Language,WeekOfn,WeekOfi,AdMonth,AdMonthId,subject,persona,receivedDt,SalesTerritory,SalesTerritoryId,SalesTerritoryGroup,SalesTerritoryGroupId,SalesTerritorySubGroup,SalesTerritorySubGroupId,ManufacturerId,Manufacturer,MerchandiseCategoryId,MerchandiseCategory,MerchandiseSubCatId,MerchandiseSubCat,CategoryId,Category,BrandId,Brand,SKUDescription1ID,SKUDescription1,SKUDescription2ID,SKUDescription2,SKUDescription3ID,SKUDescription3,SKUTypeID,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritoryID,ProductTerritory,ProductTerritorySubGroupID,ProductTerritorySubGroup,ProductTerritoryGroupID,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,UnitTypeId,UnitType,PkgSizeId,PkgSize,MPVPageEvent,MPVPageEventId,MPVPageTheme,MPVPageThemeId,MPVVariety,MPVVarietyId,MPVOrigin,MPVOriginId,MPVOffer,MPVOfferId,MPVOfferType,MPVOfferTypeId,MPVUnitType,MPVUnitTypeID,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,FeaturesId,AdType,Img,PageTypeId,TaggedCompany,DTAdded,Weight,AdDay,AdDayId,VehicleId,CreationMonth,ImageName,PageName,FVSystemPage,FVDisplayPage,FrontPageInd,BackPageInd,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,MediaDetail,MediaDetailID,Channel,ChannelID,DisplayMedia,Source,DistDt,AdDist,AdTypeID,AdDistID,Spend) 
AS ROW_NO 
from SQL02..waldetailreports
)
select * into tempdb..dumpwal FROM CTE_Dup WHERE ROW_NO > 1; 




 select * from tempdb..dumpwal where originalpagedetailid in ('013180344DC','013320224DC')

 
 select * from dumpwalDetailReports where OriginalPageDetailID like '%dc'

 delete from walDetailReports where pagedetailid in (select pagedetailid from dumpwalDetailReports)

 exec creatdis


 
 select count(1) from waldetailreports 