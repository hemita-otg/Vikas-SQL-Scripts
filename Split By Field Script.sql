---Note Check the Field and the Condition prior to running
---Make Sure that PDT and MPV tables have PageDetailID column as varchar(13)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PER_Multiple]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PER_Multiple]

Select [FlyerId], [Page], PDT.[PageDetailID], [ThumbImagePath], [NormalImagePath], [FullImagePath], [ProductImagePath], [MultipleValues], [DTAdded], [Retailer], [TaggedCompany], [Manufacturer], [MerchandiseCategory], [MerchandiseSubCat], [Category], [Brand], [SKUDescription1], [SKUDescription2], [SKUDescription3], [SKUType], 
[SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [PageEvent], [PageTheme], [Features], [NumberPackage], [Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [Color], [NoOfColors], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritory], [ProductTerritorySubGroup], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [ProdImageCreated], [ProdImageCreatedOn], [Origin], 
MPV.FieldValue As [Variety], 
[UnitType], [PkgSize], [OfferId], [Offer], [OfferType], [MainOffer]
, PDT.PageDetailID MasterPageDetailID, Cast(0 As Int) ID_Num, Cast('' as varchar(2)) As PostFix
Into PER_Multiple
From PER1PageDetailTable PDT
JOIN PER1MultiplePageValues MPV
ON PDT.PageDetailID = MPV.PageDetailID And FieldName = 'Variety'
WHERE PDT.Category In ('Beef', 'Chicken')

Update A Set ID_NUM = (Select Count(*) From PER_Multiple Where MasterPageDetailID = A.MasterPageDetailID And Variety <= A.Variety)
from PER_Multiple A

Update A Set PostFix = B.PostFix
From PER_Multiple A
Join MT2SQL11.Expansion.dbo.MCAPCopyIDPostFix B On A.ID_Num = B.ID_Num

Update PER_Multiple Set PageDetailID = [PageDetailID] + PostFix 

Insert Into PER1PageDetailTable
Select [FlyerId], [Page], Cast([PageDetailID] as varchar(13)) PageDetailID, [ThumbImagePath], [NormalImagePath], [FullImagePath], [ProductImagePath], [MultipleValues], [DTAdded], [Retailer], [TaggedCompany], [Manufacturer], [MerchandiseCategory], [MerchandiseSubCat], [Category], [Brand], [SKUDescription1], [SKUDescription2], [SKUDescription3], 
[SKUType], [SalePrice1], [SalePrice2], [RegularPrice1], [RegularPrice2], [NorPrice], [RebateAmount], [LowestRebatePrice], [LowestDiscountPrice], [UnitPrice], [Promotions], [PageEvent], [PageTheme], [Features], [NumberPackage], [Coupon], [CouponValueD1], [CouponValueD2], [CouponValueP1], [CouponValueP2], [OtherDiscountD1], [OtherDiscountD2], [OtherDiscountD3], [RequiredQuantity], [MaximumQuantity], [AdSize], [AdCost], [Illustrated], [Color], [NoOfColors], [SaleStDt], [SaleEndDt], [CouponExpirationDate], [Optional1], [Optional2], [Optional3], [Optional4], [Optional5], [Optional6], [Optional7], [Optional8], [Optional9], [Optional10], [Optional11], [Optional12], [Comments], [ProductTerritory], [ProductTerritorySubGroup], [ProductTerritoryGroup], [EnteredClient], [CouponExpirationDate1], [CouponExpirationDate2], [OtherDiscountP1], [OtherDiscountP2], [OtherDiscountP3], [Comments1], [OfferDes], [comments2], [comments3], [comments4], [topleftx], [toplefty], [bottomrightx], [bottomrighty], [McUpdatedOn], [MscUpdatedOn], [MfrUpdatedOn], [PtUpdatedOn], [PtgUpdatedOn], [PtsgUpdatedOn], [ProdImageCreated], [ProdImageCreatedOn], [Origin], [Variety], [UnitType], [PkgSize], [OfferId], [Offer], [OfferType], [MainOffer]
From PER_Multiple

Delete from PER1MultiplePageValues Where FieldName = 'Variety' And PageDetailID In (Select PageDetailID from PER1PageDetailTable Where Category In ('Beef', 'Chicken'))

if exists (select * from dbo.sysobjects where id = object_id(N'[PER_Multiple]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [PER_Multiple]

