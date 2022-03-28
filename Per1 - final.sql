--**********************************************************************************************************************************************************

use sql09

--select Comments1, variety, * from PER1PageDetailTable where Comments1 = '0.5 lb, wisconsin amer or muenster'

---Variety--start--

update per1pagedetailtable set variety='Colby' where comments1 like '%colby%' and not (comments1 like '%colby jack%' or comments1 like '%co jack%' or comments1 like '%cojack%') and variety = ''
update per1pagedetailtable set variety='Jack' where
(comments1 like '%jack%' or comments1 like '%monterey%' or comments1  like '%co jack%' or comments1  like '%cojack%') and variety  = ''
update per1pagedetailtable set variety='Mozzarella' where comments1 like '%mozz%' and variety  = ''
update per1pagedetailtable set variety='American' where comments1 like '%amer%' and variety  = ''
update per1pagedetailtable set variety='Provolone' where comments1 like '%prov%' and variety  = ''
update per1pagedetailtable set variety='Swiss' where (comments1 like '%swiss%' or comments1 like 'lorraine') and variety  = ''
update per1pagedetailtable set variety='Brick' where comments1 like '%brick%' and variety  = ''
update per1pagedetailtable set variety='Muenster' where comments1 like '%muenster%' and variety  = ''
update per1pagedetailtable set variety='Havarti' where comments1 like '%havarti%' and variety  = ''
update per1pagedetailtable set variety='Asiago' where comments1 like '%asiago%' and variety  = ''
update per1pagedetailtable set variety='Cheddar' where
(comments1 like '%ched%' or comments1 like '%cheddar%') and variety  = ''
update per1pagedetailtable set variety='Cheese And Meat' where comments1 like '%combo%' and variety  = ''
update per1pagedetailtable set variety='Feta' where comments1 like '%feta%' and variety  = ''
update per1pagedetailtable set variety='Hispanic' where (comments1 like '%queso%' or comments1 like 'quesadilla') and variety  = ''


 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Colby' from per1pagedetailtable where comments1 like '%colby%' and not (comments1 like '%colby jack%' or comments1 like '%co jack%' or comments1 like '%cojack%') and variety <> '' and variety <> 'Colby' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Jack' from per1pagedetailtable where (comments1 like '%jack%' or comments1 like '%monterey%' or comments1  like '%co jack%' or comments1  like '%cojack%') 
and variety <> '' and variety <> 'Jack' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Mozzarella' from per1pagedetailtable where comments1 like '%mozz%' and variety <> '' and variety <> 'Mozzarella' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'American' from per1pagedetailtable where comments1 like '%amer%' and variety <> '' and variety <> 'American' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Provolone' from per1pagedetailtable where comments1 like '%prov%' and variety <> '' and variety <> 'Provolone' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Swiss' from per1pagedetailtable where (comments1 like '%swiss%' or comments1 like 'lorraine') and variety <> '' and variety <> 'Swiss' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Brick' from per1pagedetailtable where comments1 like '%brick%' and variety <> '' and variety <> 'Brick' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Muenster' from per1pagedetailtable where comments1 like '%muenster%' and variety <> '' and variety <> 'Muenster' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Havarti' from per1pagedetailtable where comments1 like '%havarti%' and variety <> '' and variety <> 'Havarti' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Asiago' from per1pagedetailtable where comments1 like '%asiago%' and variety <> '' and variety <> 'Asiago' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Cheddar' from per1pagedetailtable where (comments1 like '%ched%' or comments1 like '%cheddar%') and variety <> '' and variety <> 'Cheddar' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Cheese And Meat' from per1pagedetailtable where comments1 like '%combo%' and variety <> '' and variety <> 'Cheese And Meat' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Feta' from per1pagedetailtable where comments1 like '%feta%' and variety <> '' and variety <> 'Feta' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'Variety', 'Hispanic' from per1pagedetailtable where (comments1 like '%queso%' or comments1 like 'quesadilla') and variety <> '' and variety <> 'Hispanic' 
---Variety--end--

---Skudesc1--start--

--skudescription1 PDT updates
update per1pagedetailtable set skudescription1='wht' where comments1 like '%wht%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='yllw' where comments1 like '%yllw%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='jalapeno' where comments1 like '%jalapeno%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='hot pepper' where comments1 like '%hot pepper%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='colby-jack' where 
(comments1 like '%colby jack%' or comments1 like '%colby-jack%' or comments1 like '%co jack%' or comments1 like '%cojack%') and skudescription1  = ''
update per1pagedetailtable set skudescription1='sndwch' where comments1 like '%sndwch%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='stagionato' where comments1 like '%stagionato%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='baby' where comments1 like '%baby%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='lacey' where 
(comments1 like '%lacey%' or comments1 like '%lace%') and skudescription1  = ''
update per1pagedetailtable set skudescription1='sharp' where 
(comments1 like '%sharp%' and not (comments1 like '%ultra sharp%' or comments1 like '%super sharp%')) and skudescription1  = ''
update per1pagedetailtable set skudescription1='super sharp' where comments1 like '%super sharp%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='dill' where comments1 like '%dill%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='orange' where comments1 like '%orange%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='smokey' where
(comments1 like '%smokey%' or comments1 like '%smky%') and skudescription1  = ''
update per1pagedetailtable set skudescription1='med' where comments1 like '%med%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='mild' where comments1 like '%mild%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='ultra sharp' where comments1 like '%ultra sharp%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='marble' where comments1 like '%marble%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='pepper' where comments1 like '%pepper%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='picante' where comments1 like '%picante%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='big eye' where comments1 like '%big eye%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='flavored' where
(comments1 like '%flavored%' or comments1 like '%flv%') and skudescription1  = ''
update per1pagedetailtable set skudescription1='amish' where comments1 like '%amish%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='lorraine' where comments1 like '%lorraine%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='monterey' where comments1 like '%monterey%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='mini horn' where comments1 like '%mini horn%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='longhorn' where comments1 like '%longhorn%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='classic' where comments1 like '%classic%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='firecracker' where comments1 like '%firecracker%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='aged' where comments1 like '%aged%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='blk wax' where
(comments1 like '%blk wax%' or (comments1 like '%blk%' and comments1 like '%wax%')) and skudescription1  = ''
update per1pagedetailtable set skudescription1='rd wax' where
(comments1 like '%rd wax%' or (comments1 like '%rd%' and comments1 like '%wax%')) and skudescription1  = ''
update per1pagedetailtable set skudescription1='gold' where comments1 like '%gold%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='gold label' where comments1 like '%gold label%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='w/ bacon' where comments1 like '%w/ bacon%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='garlic' where comments1 like '%glc%' and skudescription1  = ''
update per1pagedetailtable set skudescription1='habanero' where comments1 like '%habanero%' and skudescription1  = ''


--skudescription1 MPV updates
Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'wht' from per1pagedetailtable where comments1 like '%wht%' and skudescription1 <> '' and skudescription1 <> 'wht' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'yllw' from per1pagedetailtable where comments1 like '%yllw%' and skudescription1 <> '' and skudescription1 <> 'yllw' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'jalapeno' from per1pagedetailtable where comments1 like '%jalapeno%' and skudescription1 <> '' and skudescription1 <> 'jalapeno' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'hot pepper' from per1pagedetailtable where comments1 like '%hot pepper%' and skudescription1 <> '' and skudescription1 <> 'hot pepper' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'colby-jack' from per1pagedetailtable where
(comments1 like '%colby jack%' or comments1 like '%colby-jack%' or comments1 like '%co jack%' or comments1 like '%cojack%') and skudescription1 <> '' and skudescription1 <> 'colby-jack' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'sndwch' from per1pagedetailtable where comments1 like '%sndwch%' and skudescription1 <> '' and skudescription1 <> 'sndwch' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'stagionato' from per1pagedetailtable where comments1 like '%stagionato%' and skudescription1 <> '' and skudescription1 <> 'stagionato' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'baby' from per1pagedetailtable where comments1 like '%baby%' and skudescription1 <> '' and skudescription1 <> 'baby' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'lacey' from per1pagedetailtable where
(comments1 like '%lacey%' or comments1 like '%lace%') and skudescription1 <> '' and skudescription1 <> 'lacey' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'sharp' from per1pagedetailtable where
(comments1 like '%sharp%' and not (comments1 like '%ultra sharp%' or comments1 like '%super sharp%')) and skudescription1 <> '' and skudescription1 <> 'sharp' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'super sharp' from per1pagedetailtable where comments1 like '%super sharp%' and skudescription1 <> '' and skudescription1 <> 'super sharp' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'dill' from per1pagedetailtable where comments1 like '%dill%' and skudescription1 <> '' and skudescription1 <> 'dill' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'orange' from per1pagedetailtable where comments1 like '%orange%' and skudescription1 <> '' and skudescription1 <> 'orange' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'smokey' from per1pagedetailtable where
(comments1 like '%smokey%' or comments1 like '%smky%') and skudescription1 <> '' and skudescription1 <> 'smokey' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'med' from per1pagedetailtable where comments1 like '%med%' and skudescription1 <> '' and skudescription1 <> 'med' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'mild' from per1pagedetailtable where comments1 like '%mild%' and skudescription1 <> '' and skudescription1 <> 'mild' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'ultra sharp' from per1pagedetailtable where comments1 like '%ultra sharp%' and skudescription1 <> '' and skudescription1 <> 'ultra sharp' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'marble' from per1pagedetailtable where comments1 like '%marble%' and skudescription1 <> '' and skudescription1 <> 'marble' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'pepper' from per1pagedetailtable where comments1 like '%pepper%' and skudescription1 <> '' and skudescription1 <> 'pepper' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'picante' from per1pagedetailtable where comments1 like '%picante%' and skudescription1 <> '' and skudescription1 <> 'picante' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'big eye' from per1pagedetailtable where comments1 like '%big eye%' and skudescription1 <> '' and skudescription1 <> 'big eye' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'flavored' from per1pagedetailtable where
(comments1 like '%flavored%' or comments1 like '%flv%') and skudescription1 <> '' and skudescription1 <> 'flavored' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'amish' from per1pagedetailtable where comments1 like '%amish%' and skudescription1 <> '' and skudescription1 <> 'amish' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'lorraine' from per1pagedetailtable where comments1 like '%lorraine%' and skudescription1 <> '' and skudescription1 <> 'lorraine' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'monterey' from per1pagedetailtable where comments1 like '%monterey%' and skudescription1 <> '' and skudescription1 <> 'monterey' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'mini horn' from per1pagedetailtable where comments1 like '%mini horn%' and skudescription1 <> '' and skudescription1 <> 'mini horn' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'longhorn' from per1pagedetailtable where comments1 like '%longhorn%' and skudescription1 <> '' and skudescription1 <> 'longhorn' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'classic' from per1pagedetailtable where comments1 like '%classic%' and skudescription1 <> '' and skudescription1 <> 'classic' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'firecracker' from per1pagedetailtable where comments1 like '%firecracker%' and skudescription1 <> '' and skudescription1 <> 'firecracker' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'aged' from per1pagedetailtable where comments1 like '%aged%' and skudescription1 <> '' and skudescription1 <> 'aged' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'blk wax' from per1pagedetailtable where
(comments1 like '%blk wax%' or (comments1 like '%blk%' and comments1 like '%wax%')) and skudescription1 <> '' and skudescription1 <> 'blk wax' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'rd wax' from per1pagedetailtable where
(comments1 like '%rd wax%' or (comments1 like '%rd%' and comments1 like '%wax%')) and skudescription1 <> '' and skudescription1 <> 'rd wax' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'gold' from per1pagedetailtable where comments1 like '%gold%' and skudescription1 <> '' and skudescription1 <> 'gold' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'gold label' from per1pagedetailtable where comments1 like '%gold label%' and skudescription1 <> '' and skudescription1 <> 'gold label' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'w/ bacon' from per1pagedetailtable where comments1 like '%w/ bacon%' and skudescription1 <> '' and skudescription1 <> 'w/ bacon' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'garlic' from per1pagedetailtable where comments1 like '%glc%' and skudescription1 <> '' and skudescription1 <> 'garlic' 

Insert Into per1MultiplePageValues
Select PageDetailID, 'skudescription1', 'habanero' from per1pagedetailtable where comments1 like '%habanero%' and skudescription1 <> '' and skudescription1 <> 'habanero' 

---Skudesc1--End--




---Skudesc2--Start--
update per1pagedetailtable set skudescription2='2% milk' where comments1 like '%2~%%' ESCAPE '~' And  skudescription2 = ''
update per1pagedetailtable set skudescription2='less sodium' where 
(comments1 like '% ls%' or comments1 like '%less sodium%' or comments1 like '%30~%%' ESCAPE '~' or comments1 like '%lower sodium%' or comments1 like '%rdc sodium%') And  skudescription2 = ''
update per1pagedetailtable set skudescription2='rdc fat' where comments1 like '%rdc fat%' And  skudescription2 = ''
update per1pagedetailtable set skudescription2='lt' where comments1 like '% lt%' And  skudescription2 = ''

Insert Into per1MultiplePageValues
Select PageDetailID, 'SKUDescription2', '2% milk' from per1pagedetailtable where comments1 like '%2~%%' ESCAPE '~' and skudescription2 <> '' and skudescription2 <> '2% milk' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'SKUDescription2', 'less sodium' from per1pagedetailtable where 
(comments1 like '% ls%' or comments1 like '%less sodium%' or comments1 like '%30~%%' ESCAPE '~' or comments1 like '%lower sodium%' or comments1 like '%rdc sodium%') 
and skudescription2 <> '' and skudescription2 <> 'less sodium' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'SKUDescription2', 'rdc fat' from per1pagedetailtable where comments1 like '%rdc fat%' and skudescription2 <> '' and skudescription2 <> 'rdc fat' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'SKUDescription2', 'lt' from per1pagedetailtable where comments1 like '% lt%' and skudescription2 <> '' and skudescription2 <> 'lt' 
---Skudesc2--End--

---Skudesc3--End--
update per1pagedetailtable set skudescription3='natural' where comments1 like '%natural%' And  skudescription3 = ''
Insert Into per1MultiplePageValues
Select PageDetailID, 'SKUDescription3', 'natural' from per1pagedetailtable where comments1 like '%natural%' and SKUDescription3 <> '' and SKUDescription3 <> 'natural' 
---Skudesc3--End--

---Skudesc2--End--

---Origin--Start--
update per1pagedetailtable set origin='Import' where 
(comments1 like '%imprtd%' or comments1 like '%imprt%' or comments1 like '%import%') And  Origin = ''
update per1pagedetailtable set origin='Wisconsin' where comments1 like '%wisconsin%' And  Origin = ''
update per1pagedetailtable set origin='Vermont' where comments1 like '%vermont%' And  Origin = ''
update per1pagedetailtable set origin='NY state' where comments1 like '%ny state%' And  Origin = ''


Select PageDetailID, 'Origin', 'Import' from per1pagedetailtable where (comments1 like '%imprtd%' or comments1 like '%imprt%' or comments1 like '%import%') 
and Origin <> '' and Origin <> 'Import' 
Select PageDetailID, 'Origin', 'Wisconsin' from per1pagedetailtable where comments1 like '%wisconsin%' and Origin <> '' and Origin <> 'Wisconsin' 
Select PageDetailID, 'Origin', 'Vermont' from per1pagedetailtable where comments1 like '%vermont%' and Origin <> '' and Origin <> 'Vermont' 
Select PageDetailID, 'Origin', 'NY state' from per1pagedetailtable where comments1 like '%ny state%' and Origin <> '' and Origin <> 'NY state' 
---Origin--End--


---UnitType--Start--
update per1pagedetailtable set unittype='0.25 lb' where 
(comments1 like '%0.25 lb%' or comments1 like '%1/4 lb%') and UnitType = ''
update per1pagedetailtable set unittype='1 lb' where comments1 like '%1 lb%' and UnitType = ''
update per1pagedetailtable set unittype='per lb' where comments1 like '%per lb%' and UnitType = ''


Insert Into per1MultiplePageValues
Select PageDetailID, 'UnitType', '0.25 lb', UnitType from per1pagedetailtable where (comments1 like '%0.25 lb%' or comments1 like '%1/4 lb%') --and UnitType <> '' and UnitType <> '0.25 lb' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'UnitType', '1 lb' from per1pagedetailtable where comments1 like '%1 lb%' and UnitType <> '' and UnitType <> '1 lb' 
Insert Into per1MultiplePageValues
Select PageDetailID, 'UnitType', 'per lb' from per1pagedetailtable where comments1 like '%per lb%' and UnitType <> '' and UnitType <> 'per lb' 
---UnitType--End--



--**********************************************************************************************************************************************************

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[per1DisOrigin]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE per1DisOrigin
GO
SELECT DISTINCT Origin INTO per1DisOrigin FROM per1PageDetailTable
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[per1DisVariety]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE per1DisVariety
GO
SELECT DISTINCT Variety INTO per1DisVariety FROM per1PageDetailTable
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[per1DisUnitType]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE per1DisUnitType
GO
SELECT DISTINCT UnitType INTO per1DisUnitType FROM per1PageDetailTable
GO


DROP TABLE per1DisQueryPage
GO
SELECT DISTINCT Brand, Manufacturer, MerchandiseCategory, MerchandiseSubCat, Category, SKUDescription1, SKUDescription2, SKUDescription3, SKUType 
 INTO per1DisQueryPage FROM per1PageDetailTable
GO



--**********************************************************************************************************************************************************





Select 
[FlyerId],[Page],
PDT.PageDetailID + c.Code as PageDetailID,
[ThumbImagePath],[NormalImagePath],[FullImagePath],[ProductImagePath],[MultipleValues],[DTAdded],
[Retailer],[TaggedCompany],[Manufacturer],[MerchandiseCategory],[MerchandiseSubCat],[Category],[Brand],[SKUDescription1],[SKUDescription2],
[SKUDescription3],[SKUType],[SalePrice1],[SalePrice2],[RegularPrice1],[RegularPrice2],[NorPrice],[RebateAmount],[LowestRebatePrice],[LowestDiscountPrice],
[UnitPrice],[Promotions],[PageEvent],[PageTheme],[Features],[NumberPackage],[Coupon],[CouponValueD1],[CouponValueD2],[CouponValueP1],[CouponValueP2],
[OtherDiscountD1],[OtherDiscountD2],[OtherDiscountD3],[RequiredQuantity],[MaximumQuantity],[AdSize],[AdCost],[Illustrated],[Color],[NoOfColors],[SaleStDt],
[SaleEndDt],[CouponExpirationDate],[Optional1],[Optional2],[Optional3],[Optional4],[Optional5],[Optional6],[Optional7],[Optional8],[Optional9],[Optional10],
[Optional11],[Optional12],[Comments],[ProductTerritory],[ProductTerritorySubGroup],[ProductTerritoryGroup],[EnteredClient],[CouponExpirationDate1],[CouponExpirationDate2],
[OtherDiscountP1],[OtherDiscountP2],[OtherDiscountP3],[Comments1],[OfferDes],[comments2],[comments3],[comments4],[topleftx],[toplefty],[bottomrightx],
[bottomrighty],[McUpdatedOn],[MscUpdatedOn],[MfrUpdatedOn],[PtUpdatedOn],[PtgUpdatedOn],[PtsgUpdatedOn],
[ProdImageCreated],[ProdImageCreatedOn],[Origin],
mpv.FieldValue as Variety,
[UnitType],[PkgSize],[OfferId],[Offer],[OfferType],[MainOffer]
From per1pagedetailtable pdt join per1multiplepagevalues mpv on pdt.pagedetailid = mpv.pagedetailid and mpv.fieldname = 'variety'
join per1varietycode c on mpv.fieldvalue = c.variety



--**********************************************************************************************************************************************************

1. Replace PerMaster to Per1Master
2. Change PerPDT, PerMPV, PerCWM to Per1 tables
3. Create Per1Master tables
4. Remove pdtmpvmerge for non mpv fields
5. Add pdtmpvmerge for mpv fields which are not existing
6. Run script




--**********************************************************************************************************************************************************

--UPDATE Per1MasterExportTable SET Exported = (SELECT MAX(Exported)+1 FROM Per1MasterExportTable) WHERE Exported = 0

DELETE From [PER1MaterDelete_Data]

Insert Into [PER1MaterDelete_Data]
Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0 And PageDetailID Not In (Select PageDetailID From PER1PageDetailTable)

Insert Into [PER1MaterDelete_Data]
Select Distinct PDT.PageDetailId
From PER1ChildWebMain CWM
JOIN PER1PageDetailTable PDT ON CWM.FlyerID = PDT.FlyerID
WHERE PDT.DTADDED > (Select  Max(DtAdded) From Per1MasterExportTable Where Exported > 0) AND 
PageDetailID In (Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0)

Insert Into Per1MasterArchive
Select * From Per1MasterExportTable Where Exported > 0 And PageDetailID IN (Select [Product Detail ID] From [PER1MaterDelete_Data])

Delete From Per1MasterExportTable Where Exported > 0 And PageDetailID IN (Select [Product Detail ID] From [PER1MaterDelete_Data])

Delete From Per1MasterExportTable Where Exported = 0 

Insert Into [Per1MasterExportTable]
Select CWM.Flyerid, PDT.PageDetailId, CWM.TradeClass, Cast(0 As Int) As TradeClassID, CWM.Advertiser, Cast(0 As Int) As AdvertiserID, 
CWM.AdDate, CWM.WeekOf, CWM.Market, Cast(0 As Int) As MarketID, CWM.Media, Cast(0 As Int) As MediaID, CWM.Publication, 
Cast(0 As Int) As PublicationID, CWM.pages, CWM.Event, Cast(0 As Int) As EventID, CWM.Theme, Cast(0 As Int) As ThemeID, CWM.SaleStartDate, 
CWM.SaleEndDate, CWM.WeekOfn, CWM.WeekOfi, CWM.District, Cast(0 As Int) As DistrictID, 
CWM.Region, Cast(0 As Int) As RegionID, CWM.Size, Cast(0 As Int) As SizeID, CWM.SalesTerritory, Cast(0 As Int) As SalesTerritoryID, 
CWM.SalesTerritoryGroup, Cast(0 As Int) As SalesTerritoryGroupID, CWM.SalesTerritorySubGroup, Cast(0 As Int) As SalesTerritorySubGroupID, 
Case When CWM.Coupon = 'Yes' Then Cast(1 as bit) Else Cast(0 as Bit) End Coupon, CWM.Priority, PDT.MerchandiseCategory, Cast(0 As Int) As MerchandiseCategoryID, 
PDT.MerchandiseSubCat, Cast(0 As Int) As MerchandiseSubCatID, PDT.Category, Cast(0 As Int) As CategoryID, PDT.Manufacturer, 
Cast(0 As Int) As ManufacturerID, PDT.Brand, Cast(0 As Int) As BrandID, PDT.Features, Cast(0 As Int) As FeaturesID, Replace(PDT.Comments1, '"', '''') Comments1, 
PDT.TaggedCompany, 
Cast(Replace(PDT.PageEvent, '"', '''') as varchar(255)) PageEvent, Cast(0 As Int) As PageEventID, 
Cast(Replace(PDT.Origin, '"', '''') as varchar(255)) Origin, Cast(0 As Int) As OriginID, 
Cast(Replace(PDT.Variety, '"', '''') as varchar(100)) Variety, Cast(0 As Int) As VarietyID, PDT.MainOffer, Cast(0 As Int) As MainOfferID, 
Cast(PDT.Offer as varchar(255)) Offer, Cast(0 As Int) As OfferID, 
Cast(PDT.OfferType as varchar(255)) OfferType, Cast(0 As Int) As OfferTypeID, PDT.OfferDes, Cast(0 As Int) As OfferDesID, PDT.page, PDT.SalePrice1, 
PDT.SalePrice2, PDT.RegularPrice1, PDT.RegularPrice2, PDT.NORPrice, PDT.RebateAmount, PDT.LowestRebatePrice, PDT.LowestDiscountPrice, 
PDT.UnitPrice, PDT.CouponValueD2, PDT.CouponValueP1, PDT.OtherDiscountD1, PDT.OtherDiscountD2, PDT.RequiredQuantity, PDT.MaximumQuantity, 
PDT.NumberPackage, PDT.pkgsize, PDT.unittype, Cast(0 As Int) As unittypeID, PDT.productterritory, Cast(0 As Int) As productterritoryID, 
PDT.productterritorysubgroup, Cast(0 As Int) As productterritorysubgroupID, PDT.productterritorygroup, 
Cast(0 As Int) As productterritorygroupID, PDT.SKUType, Cast(0 As Int) As SKUTypeID, PDT.SKUDescription1, 
Cast(0 As Int) As SKUDescription1ID, PDT.SKUDescription2, Cast(0 As Int) As SKUDescription2ID, PDT.SKUDescription3, 
Cast(0 As Int) As SKUDescription3ID, Cast(0 as SmallInt) Exported, DTAdded
From PER1ChildWebMain CWM
JOIN PER1PageDetailTable PDT ON CWM.FlyerID = PDT.FlyerID
WHERE 
PAGEDETAILID NOT IN (Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0)
-- (PDT.DTADDED = (Select Max(Convert(varchar(12), X.DTADDED, 101)) From Per1MasterExportTable X Where Exported > 0) AND 
-- 	PAGEDETAILID  NOT IN (Select Distinct PageDetailID From Per1MasterExportTable 
-- 		Where Exported > 0 AND PDT.DTADDED = (Select Max(Convert(varchar(12), Y.DTADDED, 101)) From Per1MasterExportTable Y Where Exported > 0)))
-- OR
-- (PDT.DTADDED > (Select Max(Convert(varchar(12), Z.DTADDED, 101)) From Per1MasterExportTable Z Where Exported > 0) AND 
-- PAGEDETAILID NOT IN (Select Distinct PageDetailID From Per1MasterExportTable Where Exported > 0))
ORDER BY CWM.AdDate, CWM.FlyerID, PDT.PageDetailID

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_PageEvent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_PageEvent]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.PageEvent 
Into Per1MasterExportTable_PageEvent 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'PageEvent'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'PageEvent', 'SQL09..Per1MasterExportTable_PageEvent', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set PageEvent = Temp.PageEvent
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_PageEvent Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set PageEvent = Replace(PageEvent, '"', '''') Where PageEvent Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_PageEvent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_PageEvent]


if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Origin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Origin]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.Origin 
Into Per1MasterExportTable_Origin 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'Origin'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'Origin', 'SQL09..Per1MasterExportTable_Origin', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set Origin = Temp.Origin
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_Origin Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set Origin = Replace(Origin, '"', '''') Where Origin Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Origin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Origin]

---New Fields added

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription1]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription1 
Into Per1MasterExportTable_skuDescription1 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription1'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription1', 'SQL09..Per1MasterExportTable_skuDescription1', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription1 = Temp.skuDescription1
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription1 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription1 = Replace(skuDescription1, '"', '''') Where skuDescription1 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription1]


--
if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription2]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription2 
Into Per1MasterExportTable_skuDescription2 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription2'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription2', 'SQL09..Per1MasterExportTable_skuDescription2', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription2 = Temp.skuDescription2
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription2 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription2 = Replace(skuDescription2, '"', '''') Where skuDescription2 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription2]


--
if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription3]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.skuDescription3 
Into Per1MasterExportTable_skuDescription3 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'skuDescription3'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'skuDescription3', 'SQL09..Per1MasterExportTable_skuDescription3', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set skuDescription3 = Temp.skuDescription3
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_skuDescription3 Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set skuDescription3 = Replace(skuDescription3, '"', '''') Where skuDescription3 Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_skuDescription3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_skuDescription3]


---New Fields added


if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Offer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Offer]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.Offer
Into Per1MasterExportTable_Offer 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'Offer'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'Offer', 'SQL09..Per1MasterExportTable_Offer', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set Offer = Temp.Offer
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_Offer Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set Offer = Replace(Offer, '"', '''') Where Offer Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Offer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Offer]

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_OfferType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_OfferType]

Select Distinct PDT.FlyerID, PDT.PageDetailID, PDT.OfferType 
Into Per1MasterExportTable_OfferType 
From Per1MasterExportTable PDT Join PER1MultiplePageValues MPV ON PDT.PageDetailID = MPV.PageDetailID And MPV.FieldName = 'OfferType'
Where PDT.Exported = 0

EXEC [DataSP].[dbo].[procMergeMPVField_SemiColon] 'OfferType', 'SQL09..Per1MasterExportTable_OfferType', 'SQL09..PER1MultiplePageValues', 'SQL09..Per1MasterExportTable'

Update PDT Set OfferType = Temp.OfferType
From Per1MasterExportTable PDT
JOIN Per1MasterExportTable_OfferType Temp ON PDT.PageDetailID = Temp.PageDetailID
Where PDT.Exported = 0

Update Per1MasterExportTable Set OfferType = Replace(OfferType, '"', '''') Where OfferType Like '%''%'

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_OfferType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_OfferType]

-- INSERT INTO Per1MasterExportTable
-- Select Distinct Flyerid, A.PageDetailId, TradeClass, TradeClassID, Advertiser, AdvertiserID, AdDate, WeekOf, Market, MarketID, Media, MediaID, Publication, PublicationID, pages, Event, EventID, Theme, ThemeID, SaleStartDate, SaleEndDate, WeekOfn, WeekOfi, District, DistrictID, Region, RegionID, Size, SizeID, SalesTerritory, SalesTerritoryID, SalesTerritoryGroup, SalesTerritoryGroupID, SalesTerritorySubGroup, SalesTerritorySubGroupID, Coupon, Priority, MerchandiseCategory, MerchandiseCategoryID, MerchandiseSubCat, MerchandiseSubCatID, Category, CategoryID, Manufacturer, ManufacturerID, Brand, BrandID, Features, FeaturesID, Comments1, TaggedCompany, 
-- PageEvent, PageEventID, Origin, OriginID, 
-- Replace(B.FieldValue, '"', '''') As Variety, 
-- VarietyID, MainOffer, MainOfferID, Offer, OfferID, OfferType, OfferTypeID, 
-- OfferDes, OfferDesID, page, SalePrice1, SalePrice2, RegularPrice1, RegularPrice2, NORPrice, RebateAmount, LowestRebatePrice, LowestDiscountPrice, UnitPrice, CouponValueD2, CouponValueP1, OtherDiscountD1, OtherDiscountD2, RequiredQuantity, MaximumQuantity, NumberPackage, pkgsize, unittype, unittypeID, productterritory, productterritoryID, productterritorysubgroup, productterritorysubgroupID, productterritorygroup, productterritorygroupID, SKUType, SKUTypeID, SKUDescription1, SKUDescription1ID, SKUDescription2, SKUDescription2ID, SKUDescription3, SKUDescription3ID, Exported, DTAdded
-- FROM Per1MasterExportTable A
-- JOIN PER1MultiplePageValues B ON A.PageDetailID = B.PageDetailID And B.FieldName = 'Variety'
-- Where A.Exported = 0

Insert Into Per1MasterTradeClassIDTable (TradeClass) Select Distinct IsNull(TradeClass, '') TradeClass From Per1MasterExportTable Where IsNull(TradeClass, '') Not In (Select IsNull(TradeClass, '') TradeClass From Per1MasterTradeClassIDTable) Order By TradeClass
Insert Into Per1MasterAdvertiserIDTable (Advertiser) Select Distinct IsNull(Advertiser, '') Advertiser From Per1MasterExportTable Where IsNull(Advertiser, '') Not In (Select IsNull(Advertiser, '') Advertiser From Per1MasterAdvertiserIDTable) Order By Advertiser
Insert Into Per1MasterMarketIDTable (Market) Select Distinct IsNull(Market, '') Market From Per1MasterExportTable Where IsNull(Market, '') Not In (Select IsNull(Market, '') Market From Per1MasterMarketIDTable) Order By Market

Insert Into Per1MasterMediaIDTable (Media) Select Distinct IsNull(Media, '') Media From Per1MasterExportTable Where IsNull(Media, '') Not In (Select IsNull(Media, '') Media From Per1MasterMediaIDTable) Order By Media
Insert Into Per1MasterPublicationIDTable (Publication) Select Distinct IsNull(Publication, '') Publication From Per1MasterExportTable Where IsNull(Publication, '') Not In (Select IsNull(Publication, '') Publication From Per1MasterPublicationIDTable) Order By Publication
Insert Into Per1MasterEventIDTable (Event) Select Distinct IsNull(Event, '') Event From Per1MasterExportTable Where IsNull(Event, '') Not In (Select IsNull(Event, '') Event From Per1MasterEventIDTable) Order By Event
Insert Into Per1MasterThemeIDTable (Theme) Select Distinct IsNull(Theme, '') Theme From Per1MasterExportTable Where IsNull(Theme, '') Not In (Select IsNull(Theme, '') Theme From Per1MasterThemeIDTable) Order By Theme
Insert Into Per1MasterDistrictIDTable (District) Select Distinct IsNull(District, '') District From Per1MasterExportTable Where IsNull(District, '') Not In (Select IsNull(District, '') District From Per1MasterDistrictIDTable) Order By District
Insert Into Per1MasterRegionIDTable (Region) Select Distinct IsNull(Region, '') Region From Per1MasterExportTable Where IsNull(Region, '') Not In (Select IsNull(Region, '') Region From Per1MasterRegionIDTable) Order By Region
Insert Into Per1MasterSizeIDTable (Size) Select Distinct IsNull(Size, '') Size From Per1MasterExportTable Where IsNull(Size, '') Not In (Select IsNull(Size, '') Size From Per1MasterSizeIDTable) Order By Size
Insert Into Per1MasterSalesTerritoryIDTable (SalesTerritory) Select Distinct IsNull(SalesTerritory, '') SalesTerritory From Per1MasterExportTable Where IsNull(SalesTerritory, '') Not In (Select IsNull(SalesTerritory, '') SalesTerritory From Per1MasterSalesTerritoryIDTable) Order By SalesTerritory
Insert Into Per1MasterSalesTerritoryGroupIDTable (SalesTerritoryGroup) Select Distinct IsNull(SalesTerritoryGroup, '') SalesTerritoryGroup From Per1MasterExportTable Where IsNull(SalesTerritoryGroup, '') Not In (Select IsNull(SalesTerritoryGroup, '') SalesTerritoryGroup From Per1MasterSalesTerritoryGroupIDTable) Order By SalesTerritoryGroup
Insert Into Per1MasterSalesTerritorySubGroupIDTable (SalesTerritorySubGroup) Select Distinct IsNull(SalesTerritorySubGroup, '') SalesTerritorySubGroup From Per1MasterExportTable Where IsNull(SalesTerritorySubGroup, '') Not In (Select IsNull(SalesTerritorySubGroup, '') SalesTerritorySubGroup From Per1MasterSalesTerritorySubGroupIDTable) Order By SalesTerritorySubGroup
Insert Into Per1MasterMerchandiseCategoryIDTable (MerchandiseCategory) Select Distinct IsNull(MerchandiseCategory, '') MerchandiseCategory From Per1MasterExportTable Where IsNull(MerchandiseCategory, '') Not In (Select IsNull(MerchandiseCategory, '') MerchandiseCategory From Per1MasterMerchandiseCategoryIDTable) Order By MerchandiseCategory
Insert Into Per1MasterMerchandiseSubCatIDTable (MerchandiseSubCat) Select Distinct IsNull(MerchandiseSubCat, '') MerchandiseSubCat From Per1MasterExportTable Where IsNull(MerchandiseSubCat, '') Not In (Select IsNull(MerchandiseSubCat, '') MerchandiseSubCat From Per1MasterMerchandiseSubCatIDTable) Order By MerchandiseSubCat
Insert Into Per1MasterCategoryIDTable (Category) Select Distinct IsNull(Category, '') Category From Per1MasterExportTable Where IsNull(Category, '') Not In (Select IsNull(Category, '') Category From Per1MasterCategoryIDTable) Order By Category
Insert Into Per1MasterManufacturerIDTable (Manufacturer) Select Distinct IsNull(Manufacturer, '') Manufacturer From Per1MasterExportTable Where IsNull(Manufacturer, '') Not In (Select IsNull(Manufacturer, '') Manufacturer From Per1MasterManufacturerIDTable) Order By Manufacturer
Insert Into Per1MasterBrandIDTable (Brand) Select Distinct IsNull(Brand, '') Brand From Per1MasterExportTable Where IsNull(Brand, '') Not In (Select IsNull(Brand, '') Brand From Per1MasterBrandIDTable) Order By Brand
Insert Into Per1MasterFeaturesIDTable (Features) Select Distinct IsNull(Features, '') Features From Per1MasterExportTable Where IsNull(Features, '') Not In (Select IsNull(Features, '') Features From Per1MasterFeaturesIDTable) Order By Features
Insert Into Per1MasterPageEventIDTable (PageEvent) Select Distinct IsNull(PageEvent, '') PageEvent From Per1MasterExportTable Where IsNull(PageEvent, '') Not In (Select IsNull(PageEvent, '') PageEvent From Per1MasterPageEventIDTable) Order By PageEvent
Insert Into Per1MasterOriginIDTable (Origin) Select Distinct IsNull(Origin, '') Origin From Per1MasterExportTable Where IsNull(Origin, '') Not In (Select IsNull(Origin, '') Origin From Per1MasterOriginIDTable) Order By Origin
Insert Into Per1MasterVarietyIDTable (Variety) Select Distinct IsNull(Variety, '') Variety From Per1MasterExportTable Where IsNull(Variety, '') Not In (Select IsNull(Variety, '') Variety From Per1MasterVarietyIDTable) Order By Variety
Insert Into Per1MasterMainOfferIDTable (MainOffer) Select Distinct IsNull(MainOffer, '') MainOffer From Per1MasterExportTable Where IsNull(MainOffer, '') Not In (Select IsNull(MainOffer, '') MainOffer From Per1MasterMainOfferIDTable) Order By MainOffer
Insert Into Per1MasterOfferIDTable (Offer) Select Distinct IsNull(Offer, '') Offer From Per1MasterExportTable Where IsNull(Offer, '') Not In (Select IsNull(Offer, '') Offer From Per1MasterOfferIDTable) Order By Offer
Insert Into Per1MasterOfferTypeIDTable (OfferType) Select Distinct IsNull(OfferType, '') OfferType From Per1MasterExportTable Where IsNull(OfferType, '') Not In (Select IsNull(OfferType, '') OfferType From Per1MasterOfferTypeIDTable) Order By OfferType
Insert Into Per1MasterOfferDesIDTable (OfferDes) Select Distinct IsNull(OfferDes, '') OfferDes From Per1MasterExportTable Where IsNull(OfferDes, '') Not In (Select IsNull(OfferDes, '') OfferDes From Per1MasterOfferDesIDTable) Order By OfferDes
Insert Into Per1MasterunittypeIDTable (unittype) Select Distinct IsNull(unittype, '') unittype From Per1MasterExportTable Where IsNull(unittype, '') Not In (Select IsNull(unittype, '') unittype From Per1MasterunittypeIDTable) Order By unittype
Insert Into Per1MasterproductterritoryIDTable (productterritory) Select Distinct IsNull(productterritory, '') productterritory From Per1MasterExportTable Where IsNull(productterritory, '') Not In (Select IsNull(productterritory, '') productterritory From Per1MasterproductterritoryIDTable) Order By productterritory
Insert Into Per1MasterproductterritorysubgroupIDTable (productterritorysubgroup) Select Distinct IsNull(productterritorysubgroup, '') productterritorysubgroup From Per1MasterExportTable Where IsNull(productterritorysubgroup, '') Not In (Select IsNull(productterritorysubgroup, '') productterritorysubgroup From Per1MasterproductterritorysubgroupIDTable) Order By productterritorysubgroup
Insert Into Per1MasterproductterritorygroupIDTable (productterritorygroup) Select Distinct IsNull(productterritorygroup, '') productterritorygroup From Per1MasterExportTable Where IsNull(productterritorygroup, '') Not In (Select IsNull(productterritorygroup, '') productterritorygroup From Per1MasterproductterritorygroupIDTable) Order By productterritorygroup
Insert Into Per1MasterSKUTypeIDTable (SKUType) Select Distinct IsNull(SKUType, '') SKUType From Per1MasterExportTable Where IsNull(SKUType, '') Not In (Select IsNull(SKUType, '') SKUType From Per1MasterSKUTypeIDTable) Order By SKUType
Insert Into Per1MasterSKUDescription1IDTable (SKUDescription1) Select Distinct IsNull(SKUDescription1, '') SKUDescription1 From Per1MasterExportTable Where IsNull(SKUDescription1, '') Not In (Select IsNull(SKUDescription1, '') SKUDescription1 From Per1MasterSKUDescription1IDTable) Order By SKUDescription1
Insert Into Per1MasterSKUDescription2IDTable (SKUDescription2) Select Distinct IsNull(SKUDescription2, '') SKUDescription2 From Per1MasterExportTable Where IsNull(SKUDescription2, '') Not In (Select IsNull(SKUDescription2, '') SKUDescription2 From Per1MasterSKUDescription2IDTable) Order By SKUDescription2
Insert Into Per1MasterSKUDescription3IDTable (SKUDescription3) Select Distinct IsNull(SKUDescription3, '') SKUDescription3 From Per1MasterExportTable Where IsNull(SKUDescription3, '') Not In (Select IsNull(SKUDescription3, '') SKUDescription3 From Per1MasterSKUDescription3IDTable) Order By SKUDescription3

Update A Set TradeClassID = B.AVTCID From Per1MasterTradeClassIDTable A Join masterclientcoverage..tblAvTradeClass B On A.TradeCLass = B.AVTradeClass WHere A.TradeClassID Is Null
Update A Set AdvertiserID = B.RetID From Per1MasterAdvertiserIDTable A Join masterclientcoverage..retmkt B On A.Advertiser = B.Advertiser Where A.AdvertiserID Is Null
Update A Set MarketID = B.MktID From Per1MasterMarketIDTable A Join masterclientcoverage..retmkt B On A.Market = B.Market Where A.MarketID Is Null

Update A Set TradeClassID = B.TradeClassID From Per1MasterExportTable A Join [Per1MasterTradeClassIDTable] B  On IsNull(A.TradeClass, '') = IsNull(B.TradeClass, '')  Where A.TradeClassID = 0
Update A Set AdvertiserID = B.AdvertiserID From Per1MasterExportTable A Join [Per1MasterAdvertiserIDTable] B  On IsNull(A.Advertiser, '') = IsNull(B.Advertiser, '')  Where A.AdvertiserID = 0
Update A Set MarketID = B.MarketID From Per1MasterExportTable A Join [Per1MasterMarketIDTable] B  On IsNull(A.Market, '') = IsNull(B.Market, '')  Where A.MarketID = 0
Update A Set MediaID = B.MediaID From Per1MasterExportTable A Join [Per1MasterMediaIDTable] B  On IsNull(A.Media, '') = IsNull(B.Media, '')  Where A.MediaID = 0
Update A Set PublicationID = B.PublicationID From Per1MasterExportTable A Join [Per1MasterPublicationIDTable] B  On IsNull(A.Publication, '') = IsNull(B.Publication, '')  Where A.PublicationID = 0
Update A Set EventID = B.EventID From Per1MasterExportTable A Join [Per1MasterEventIDTable] B  On IsNull(A.Event, '') = IsNull(B.Event, '')  Where A.EventID = 0
Update A Set ThemeID = B.ThemeID From Per1MasterExportTable A Join [Per1MasterThemeIDTable] B  On IsNull(A.Theme, '') = IsNull(B.Theme, '')  Where A.ThemeID = 0
Update A Set DistrictID = B.DistrictID From Per1MasterExportTable A Join [Per1MasterDistrictIDTable] B  On IsNull(A.District, '') = IsNull(B.District, '')  Where A.DistrictID = 0
Update A Set RegionID = B.RegionID From Per1MasterExportTable A Join [Per1MasterRegionIDTable] B  On IsNull(A.Region, '') = IsNull(B.Region, '')  Where A.RegionID = 0
Update A Set SizeID = B.SizeID From Per1MasterExportTable A Join [Per1MasterSizeIDTable] B  On IsNull(A.Size, '') = IsNull(B.Size, '')  Where A.SizeID = 0
Update A Set SalesTerritoryID = B.SalesTerritoryID From Per1MasterExportTable A Join [Per1MasterSalesTerritoryIDTable] B  On IsNull(A.SalesTerritory, '') = IsNull(B.SalesTerritory, '')  Where A.SalesTerritoryID = 0
Update A Set SalesTerritoryGroupID = B.SalesTerritoryGroupID From Per1MasterExportTable A Join [Per1MasterSalesTerritoryGroupIDTable] B  On IsNull(A.SalesTerritoryGroup, '') = IsNull(B.SalesTerritoryGroup, '')  Where A.SalesTerritoryGroupID = 0
Update A Set SalesTerritorySubGroupID = B.SalesTerritorySubGroupID From Per1MasterExportTable A Join [Per1MasterSalesTerritorySubGroupIDTable] B  On IsNull(A.SalesTerritorySubGroup, '') = IsNull(B.SalesTerritorySubGroup, '')  Where A.SalesTerritorySubGroupID = 0
Update A Set MerchandiseCategoryID = B.MerchandiseCategoryID From Per1MasterExportTable A Join [Per1MasterMerchandiseCategoryIDTable] B  On IsNull(A.MerchandiseCategory, '') = IsNull(B.MerchandiseCategory, '')  Where A.MerchandiseCategoryID = 0
Update A Set MerchandiseSubCatID = B.MerchandiseSubCatID From Per1MasterExportTable A Join [Per1MasterMerchandiseSubCatIDTable] B  On IsNull(A.MerchandiseSubCat, '') = IsNull(B.MerchandiseSubCat, '')  Where A.MerchandiseSubCatID = 0
Update A Set CategoryID = B.CategoryID From Per1MasterExportTable A Join [Per1MasterCategoryIDTable] B  On IsNull(A.Category, '') = IsNull(B.Category, '')  Where A.CategoryID = 0
Update A Set ManufacturerID = B.ManufacturerID From Per1MasterExportTable A Join [Per1MasterManufacturerIDTable] B  On IsNull(A.Manufacturer, '') = IsNull(B.Manufacturer, '')  Where A.ManufacturerID = 0
Update A Set BrandID = B.BrandID From Per1MasterExportTable A Join [Per1MasterBrandIDTable] B  On IsNull(A.Brand, '') = IsNull(B.Brand, '')  Where A.BrandID = 0
Update A Set FeaturesID = B.FeaturesID From Per1MasterExportTable A Join [Per1MasterFeaturesIDTable] B  On IsNull(A.Features, '') = IsNull(B.Features, '')  Where A.FeaturesID = 0
Update A Set PageEventID = B.PageEventID From Per1MasterExportTable A Join [Per1MasterPageEventIDTable] B  On IsNull(A.PageEvent, '') = IsNull(B.PageEvent, '')  Where A.PageEventID = 0
Update A Set OriginID = B.OriginID From Per1MasterExportTable A Join [Per1MasterOriginIDTable] B  On IsNull(A.Origin, '') = IsNull(B.Origin, '')  Where A.OriginID = 0
Update A Set VarietyID = B.VarietyID From Per1MasterExportTable A Join [Per1MasterVarietyIDTable] B  On IsNull(A.Variety, '') = IsNull(B.Variety, '')  Where A.VarietyID = 0
Update A Set MainOfferID = B.MainOfferID From Per1MasterExportTable A Join [Per1MasterMainOfferIDTable] B  On IsNull(A.MainOffer, '') = IsNull(B.MainOffer, '')  Where A.MainOfferID = 0
Update A Set OfferID = B.OfferID From Per1MasterExportTable A Join [Per1MasterOfferIDTable] B  On IsNull(A.Offer, '') = IsNull(B.Offer, '')  Where A.OfferID = 0
Update A Set OfferTypeID = B.OfferTypeID From Per1MasterExportTable A Join [Per1MasterOfferTypeIDTable] B  On IsNull(A.OfferType, '') = IsNull(B.OfferType, '')  Where A.OfferTypeID = 0
Update A Set OfferDesID = B.OfferDesID From Per1MasterExportTable A Join [Per1MasterOfferDesIDTable] B  On IsNull(A.OfferDes, '') = IsNull(B.OfferDes, '')  Where A.OfferDesID = 0
Update A Set unittypeID = B.unittypeID From Per1MasterExportTable A Join [Per1MasterunittypeIDTable] B  On IsNull(A.unittype, '') = IsNull(B.unittype, '')  Where A.unittypeID = 0
Update A Set productterritoryID = B.productterritoryID From Per1MasterExportTable A Join [Per1MasterproductterritoryIDTable] B  On IsNull(A.productterritory, '') = IsNull(B.productterritory, '')  Where A.productterritoryID = 0
Update A Set productterritorysubgroupID = B.productterritorysubgroupID From Per1MasterExportTable A Join [Per1MasterproductterritorysubgroupIDTable] B  On IsNull(A.productterritorysubgroup, '') = IsNull(B.productterritorysubgroup, '')  Where A.productterritorysubgroupID = 0
Update A Set productterritorygroupID = B.productterritorygroupID From Per1MasterExportTable A Join [Per1MasterproductterritorygroupIDTable] B  On IsNull(A.productterritorygroup, '') = IsNull(B.productterritorygroup, '')  Where A.productterritorygroupID = 0
Update A Set SKUTypeID = B.SKUTypeID From Per1MasterExportTable A Join [Per1MasterSKUTypeIDTable] B  On IsNull(A.SKUType, '') = IsNull(B.SKUType, '')  Where A.SKUTypeID = 0
Update A Set SKUDescription1ID = B.SKUDescription1ID From Per1MasterExportTable A Join [Per1MasterSKUDescription1IDTable] B  On IsNull(A.SKUDescription1, '') = IsNull(B.SKUDescription1, '')  Where A.SKUDescription1ID = 0
Update A Set SKUDescription2ID = B.SKUDescription2ID From Per1MasterExportTable A Join [Per1MasterSKUDescription2IDTable] B  On IsNull(A.SKUDescription2, '') = IsNull(B.SKUDescription2, '')  Where A.SKUDescription2ID = 0
Update A Set SKUDescription3ID = B.SKUDescription3ID From Per1MasterExportTable A Join [Per1MasterSKUDescription3IDTable] B  On IsNull(A.SKUDescription3, '') = IsNull(B.SKUDescription3, '')  Where A.SKUDescription3ID = 0

if exists (select * from dbo.sysobjects where id = object_id(N'[Per1MasterExportTable_Final]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Per1MasterExportTable_Final]

Select Flyerid As [Unique Ad], PageDetailId As [Product Detail ID], TradeClassID As [Account Group ID], AdvertiserID As [Account ID], 
AdDate As [Ad Date], WeekOf As [Week Starting], MarketID As [Market ID], MediaID As [Media Type ID], PublicationID As [Specific Media ID], 
pages As [# of Pgs], EventID As [Event ID], ThemeID As [Theme ID], SaleStartDate As [Sale Start Date], SaleEndDate As [Sale End Date], 
WeekOfn As [ACN Week Ending], WeekOfi As [IRI Week Ending], DistrictID As [District ID], 
RegionID As [Region ID], SizeID As [Ad Size ID], SalesTerritoryID As [Sales Territory ID], 
SalesTerritoryGroupID As [Sales Territory Group ID], SalesTerritorySubGroupID As [Sales Territory Subgroup ID], Coupon As [Coupon], 
Priority As [Priority], MerchandiseCategoryID As [Department ID], MerchandiseSubCatID As [Category Group ID], CategoryID As [Category ID], 
ManufacturerID As [Manufacturer ID], BrandID As [Brand ID], FeaturesID As [Page Position ID], Comments1 As [Product Description], 
TaggedCompany As [Ad Type], PageEventID As [Promotions ID], OriginID As [Origin ID], VarietyID As [Variety ID], 
MainOfferID As [Main Offer ID], OfferID As [Offer ID], OfferTypeID As [Offer Type ID], OfferDesID As [Offer Description ID], 
page As [Page # In Ad], SalePrice1 As [Sale Price], SalePrice2 As [High Sale Price], RegularPrice1 As [Reg. Price], 
RegularPrice2 As [Unit Price - Reg.], NORPrice As [NOR Price], RebateAmount As [Low Rebate Amount], 
LowestRebatePrice As [Lowest Rebate Price], LowestDiscountPrice As [Save Up To], UnitPrice As [Unit Price - Sale], 
CouponValueD2 As [$ Off], CouponValueP1 As [% Off], OtherDiscountD1 As [Mfr Cpn $], OtherDiscountD2 As [Rtl Cpn $], 
RequiredQuantity As [Pur Qty], MaximumQuantity As [Maximum Quantity], NumberPackage As [Limit], pkgsize As [Pkg Size], 
unittypeID As [Unit Type ID], productterritoryID As [Product Territory ID], 
productterritorysubgroupID As [Product Territory Subgroup ID], productterritorygroupID As [Product Territory Group ID], 
SKUTypeID As [SKU Type (product type) ID], SKUDescription1ID As [SKU Description 1 (product attribute 1) ID], 
SKUDescription2ID As [SKU Description 1 (product attribute 2) ID], SKUDescription3ID As [SKU Description 1 (product attribute 3) ID]
Into Per1MasterExportTable_Final
From Per1MasterExportTable
Where Exported = 0



--**********************************************************************************************************************************************************

Select * From [PER1MaterDelete_Data]
Select * From Per1MasterExportTable_Final
Select Distinct TradeClassID As [Account Group ID], TradeClass As [Account Group] From [Per1MasterTradeClassIDTable]
Select Distinct AdvertiserID As [Account ID], Advertiser As [Account] From [Per1MasterAdvertiserIDTable]
Select Distinct MarketID As [Market ID], Market As [Market] From [Per1MasterMarketIDTable]
Select Distinct MediaID As [Media Type ID], Media As [Media Type] From [Per1MasterMediaIDTable]
Select Distinct PublicationID As [Specific Media ID], Publication As [Specific Media] From [Per1MasterPublicationIDTable]
Select Distinct EventID As [Event ID], Event As [Event] From [Per1MasterEventIDTable]
Select Distinct ThemeID As [Theme ID], Theme As [Theme] From [Per1MasterThemeIDTable]
Select Distinct DistrictID As [District ID], District As [District] From [Per1MasterDistrictIDTable]
Select Distinct RegionID As [Region ID], Region As [Region] From [Per1MasterRegionIDTable]
Select Distinct SizeID As [Ad Size ID], Size As [Ad Size] From [Per1MasterSizeIDTable]
Select Distinct SalesTerritoryID As [Sales Territory ID], SalesTerritory As [Sales Territory] From [Per1MasterSalesTerritoryIDTable]
Select Distinct SalesTerritoryGroupID As [Sales Territory Group ID], SalesTerritoryGroup As [Sales Territory Group] From [Per1MasterSalesTerritoryGroupIDTable]
Select Distinct SalesTerritorySubGroupID As [Sales Territory Subgroup ID], SalesTerritorySubGroup As [Sales Territory Subgroup] From [Per1MasterSalesTerritorySubGroupIDTable]
Select Distinct MerchandiseCategoryID As [Department ID], MerchandiseCategory As [Department] From [Per1MasterMerchandiseCategoryIDTable]
Select Distinct MerchandiseSubCatID As [Category Group ID], MerchandiseSubCat As [Category Group] From [Per1MasterMerchandiseSubCatIDTable]
Select Distinct CategoryID As [Category ID], Category As [Category] From [Per1MasterCategoryIDTable]
Select Distinct ManufacturerID As [Manufacturer ID], Manufacturer As [Manufacturer] From [Per1MasterManufacturerIDTable]
Select Distinct BrandID As [Brand ID], Brand As [Brand] From [Per1MasterBrandIDTable]
Select Distinct FeaturesID As [Page Position ID], Features As [Page Position] From [Per1MasterFeaturesIDTable]
Select Distinct PageEventID As [Promotions ID], PageEvent As [Promotions] From [Per1MasterPageEventIDTable]
Select Distinct OriginID As [Origin ID], Origin As [Origin] From [Per1MasterOriginIDTable]
Select Distinct VarietyID As [Variety ID], Variety As [Variety] From [Per1MasterVarietyIDTable]
Select Distinct MainOfferID As [Main Offer ID], MainOffer As [Main Offer] From [Per1MasterMainOfferIDTable]
Select Distinct OfferID As [Offer ID], Offer As [Offer] From [Per1MasterOfferIDTable]
Select Distinct OfferTypeID As [Offer Type ID], OfferType As [Offer Type] From [Per1MasterOfferTypeIDTable]
Select Distinct OfferDesID As [Offer Description ID], OfferDes As [Offer Description] From [Per1MasterOfferDesIDTable]
Select Distinct unittypeID As [Unit Type ID], unittype As [Unit Type] From [Per1MasterunittypeIDTable]
Select Distinct productterritoryID As [Product Territory ID], productterritory As [Product Territory] From [Per1MasterproductterritoryIDTable]
Select Distinct productterritorysubgroupID As [Product Territory Subgroup ID], productterritorysubgroup As [Product Territory Subgroup] From [Per1MasterproductterritorysubgroupIDTable]
Select Distinct productterritorygroupID As [Product Territory Group ID], productterritorygroup As [Product Territory Group] From [Per1MasterproductterritorygroupIDTable]
Select Distinct SKUTypeID As [SKU Type (product type) ID], SKUType As [SKU Type (product type)] From [Per1MasterSKUTypeIDTable]
Select Distinct SKUDescription1ID As [SKU Description 1 (product attribute 1) ID], SKUDescription1 As [SKU Description 1 (product attribute 1)] From [Per1MasterSKUDescription1IDTable]
Select Distinct SKUDescription2ID As [SKU Description 1 (product attribute 2) ID], SKUDescription2 As [SKU Description 1 (product attribute 2)] From [Per1MasterSKUDescription2IDTable]
Select Distinct SKUDescription3ID As [SKU Description 1 (product attribute 3) ID], SKUDescription3 As [SKU Description 1 (product attribute 3)] From [Per1MasterSKUDescription3IDTable]


--**********************************************************************************************************************************************************


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterAdvertiserIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterAdvertiserIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterArchive]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterArchive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterBrandIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterBrandIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterCategoryIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterCategoryIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterDistrictIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterDistrictIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterEventIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterEventIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterExportTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterExportTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterExportTable_Final]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterExportTable_Final]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterFeaturesIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterFeaturesIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterMainOfferIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterMainOfferIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterManufacturerIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterManufacturerIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterMarketIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterMarketIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterMediaIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterMediaIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterMerchandiseCategoryIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterMerchandiseCategoryIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterMerchandiseSubCatIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterMerchandiseSubCatIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterOfferDesIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterOfferDesIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterOfferIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterOfferIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterOfferTypeIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterOfferTypeIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterOriginIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterOriginIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterPageEventIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterPageEventIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterPublicationIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterPublicationIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterRegionIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterRegionIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSKUDescription1IDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSKUDescription1IDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSKUDescription2IDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSKUDescription2IDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSKUDescription3IDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSKUDescription3IDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSKUTypeIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSKUTypeIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSalesTerritoryGroupIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSalesTerritoryGroupIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSalesTerritoryIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSalesTerritoryIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSalesTerritorySubGroupIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSalesTerritorySubGroupIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterSizeIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterSizeIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterTaggedCompanyIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterTaggedCompanyIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterThemeIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterThemeIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterTradeClassIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterTradeClassIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterVarietyIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterVarietyIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterproductterritoryIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterproductterritoryIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterproductterritorygroupIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterproductterritorygroupIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterproductterritorysubgroupIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterproductterritorysubgroupIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Per1MasterunittypeIDTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Per1MasterunittypeIDTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PER1MaterDelete_Data]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PER1MaterDelete_Data]
GO

CREATE TABLE [dbo].[Per1MasterAdvertiserIDTable] (
	[AdvertiserID] [int] NULL ,
	[Advertiser] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterArchive] (
	[Flyerid] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PageDetailId] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[TradeClass] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TradeClassID] [int] NULL ,
	[Advertiser] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AdvertiserID] [int] NULL ,
	[AdDate] [datetime] NULL ,
	[WeekOf] [datetime] NULL ,
	[Market] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MarketID] [int] NULL ,
	[Media] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MediaID] [int] NULL ,
	[Publication] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PublicationID] [int] NULL ,
	[pages] [int] NULL ,
	[Event] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EventID] [int] NULL ,
	[Theme] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ThemeID] [int] NULL ,
	[SaleStartDate] [datetime] NULL ,
	[SaleEndDate] [datetime] NULL ,
	[WeekOfn] [datetime] NULL ,
	[WeekOfi] [datetime] NULL ,
	[District] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DistrictID] [int] NULL ,
	[Region] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RegionID] [int] NULL ,
	[Size] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SizeID] [int] NULL ,
	[SalesTerritory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritoryID] [int] NULL ,
	[SalesTerritoryGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritoryGroupID] [int] NULL ,
	[SalesTerritorySubGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritorySubGroupID] [int] NULL ,
	[Coupon] [bit] NULL ,
	[Priority] [int] NULL ,
	[MerchandiseCategory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseCategoryID] [int] NULL ,
	[MerchandiseSubCat] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseSubCatID] [int] NULL ,
	[Category] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CategoryID] [int] NULL ,
	[Manufacturer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ManufacturerID] [int] NULL ,
	[Brand] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BrandID] [int] NULL ,
	[Features] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeaturesID] [int] NULL ,
	[Comments1] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TaggedCompany] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageEvent] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageEventID] [int] NULL ,
	[Origin] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OriginID] [int] NULL ,
	[Variety] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VarietyID] [int] NULL ,
	[MainOffer] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[MainOfferID] [int] NULL ,
	[Offer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferID] [int] NULL ,
	[OfferType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferTypeID] [int] NULL ,
	[OfferDes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferDesID] [int] NULL ,
	[page] [int] NULL ,
	[SalePrice1] [numeric](18, 2) NULL ,
	[SalePrice2] [numeric](18, 2) NULL ,
	[RegularPrice1] [numeric](18, 2) NULL ,
	[RegularPrice2] [numeric](18, 2) NULL ,
	[NORPrice] [numeric](18, 2) NULL ,
	[RebateAmount] [numeric](18, 2) NULL ,
	[LowestRebatePrice] [numeric](18, 2) NULL ,
	[LowestDiscountPrice] [numeric](18, 2) NULL ,
	[UnitPrice] [numeric](18, 2) NULL ,
	[CouponValueD2] [numeric](18, 2) NULL ,
	[CouponValueP1] [int] NULL ,
	[OtherDiscountD1] [numeric](18, 2) NULL ,
	[OtherDiscountD2] [numeric](18, 2) NULL ,
	[RequiredQuantity] [int] NULL ,
	[MaximumQuantity] [int] NULL ,
	[NumberPackage] [int] NULL ,
	[pkgsize] [decimal](18, 2) NULL ,
	[unittype] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[unittypeID] [int] NULL ,
	[productterritory] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritoryID] [int] NULL ,
	[productterritorysubgroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritorysubgroupID] [int] NULL ,
	[productterritorygroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritorygroupID] [int] NULL ,
	[SKUType] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUTypeID] [int] NULL ,
	[SKUDescription1] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription1ID] [int] NULL ,
	[SKUDescription2] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription2ID] [int] NULL ,
	[SKUDescription3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription3ID] [int] NULL ,
	[Exported] [smallint] NULL ,
	[DTAdded] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterBrandIDTable] (
	[BrandID] [int] IDENTITY (1, 1) NOT NULL ,
	[Brand] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterCategoryIDTable] (
	[CategoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[Category] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterDistrictIDTable] (
	[DistrictID] [int] IDENTITY (1, 1) NOT NULL ,
	[District] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterEventIDTable] (
	[EventID] [int] IDENTITY (1, 1) NOT NULL ,
	[Event] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterExportTable] (
	[Flyerid] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PageDetailId] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[TradeClass] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TradeClassID] [int] NULL ,
	[Advertiser] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AdvertiserID] [int] NULL ,
	[AdDate] [datetime] NULL ,
	[WeekOf] [datetime] NULL ,
	[Market] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MarketID] [int] NULL ,
	[Media] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MediaID] [int] NULL ,
	[Publication] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PublicationID] [int] NULL ,
	[pages] [int] NULL ,
	[Event] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EventID] [int] NULL ,
	[Theme] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ThemeID] [int] NULL ,
	[SaleStartDate] [datetime] NULL ,
	[SaleEndDate] [datetime] NULL ,
	[WeekOfn] [datetime] NULL ,
	[WeekOfi] [datetime] NULL ,
	[District] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DistrictID] [int] NULL ,
	[Region] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RegionID] [int] NULL ,
	[Size] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SizeID] [int] NULL ,
	[SalesTerritory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritoryID] [int] NULL ,
	[SalesTerritoryGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritoryGroupID] [int] NULL ,
	[SalesTerritorySubGroup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SalesTerritorySubGroupID] [int] NULL ,
	[Coupon] [bit] NULL ,
	[Priority] [int] NULL ,
	[MerchandiseCategory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseCategoryID] [int] NULL ,
	[MerchandiseSubCat] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MerchandiseSubCatID] [int] NULL ,
	[Category] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CategoryID] [int] NULL ,
	[Manufacturer] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ManufacturerID] [int] NULL ,
	[Brand] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BrandID] [int] NULL ,
	[Features] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeaturesID] [int] NULL ,
	[Comments1] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TaggedCompany] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageEvent] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PageEventID] [int] NULL ,
	[Origin] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OriginID] [int] NULL ,
	[Variety] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VarietyID] [int] NULL ,
	[MainOffer] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[MainOfferID] [int] NULL ,
	[Offer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferID] [int] NULL ,
	[OfferType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferTypeID] [int] NULL ,
	[OfferDes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OfferDesID] [int] NULL ,
	[page] [int] NULL ,
	[SalePrice1] [numeric](18, 2) NULL ,
	[SalePrice2] [numeric](18, 2) NULL ,
	[RegularPrice1] [numeric](18, 2) NULL ,
	[RegularPrice2] [numeric](18, 2) NULL ,
	[NORPrice] [numeric](18, 2) NULL ,
	[RebateAmount] [numeric](18, 2) NULL ,
	[LowestRebatePrice] [numeric](18, 2) NULL ,
	[LowestDiscountPrice] [numeric](18, 2) NULL ,
	[UnitPrice] [numeric](18, 2) NULL ,
	[CouponValueD2] [numeric](18, 2) NULL ,
	[CouponValueP1] [int] NULL ,
	[OtherDiscountD1] [numeric](18, 2) NULL ,
	[OtherDiscountD2] [numeric](18, 2) NULL ,
	[RequiredQuantity] [int] NULL ,
	[MaximumQuantity] [int] NULL ,
	[NumberPackage] [int] NULL ,
	[pkgsize] [decimal](18, 2) NULL ,
	[unittype] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[unittypeID] [int] NULL ,
	[productterritory] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritoryID] [int] NULL ,
	[productterritorysubgroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritorysubgroupID] [int] NULL ,
	[productterritorygroup] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[productterritorygroupID] [int] NULL ,
	[SKUType] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUTypeID] [int] NULL ,
	[SKUDescription1] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription1ID] [int] NULL ,
	[SKUDescription2] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription2ID] [int] NULL ,
	[SKUDescription3] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SKUDescription3ID] [int] NULL ,
	[Exported] [smallint] NULL ,
	[DTAdded] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterExportTable_Final] (
	[Unique Ad] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Product Detail ID] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Account Group ID] [int] NULL ,
	[Account ID] [int] NULL ,
	[Ad Date] [datetime] NULL ,
	[Week Starting] [datetime] NULL ,
	[Market ID] [int] NULL ,
	[Media Type ID] [int] NULL ,
	[Specific Media ID] [int] NULL ,
	[# of Pgs] [int] NULL ,
	[Event ID] [int] NULL ,
	[Theme ID] [int] NULL ,
	[Sale Start Date] [datetime] NULL ,
	[Sale End Date] [datetime] NULL ,
	[ACN Week Ending] [datetime] NULL ,
	[IRI Week Ending] [datetime] NULL ,
	[District ID] [int] NULL ,
	[Region ID] [int] NULL ,
	[Ad Size ID] [int] NULL ,
	[Sales Territory ID] [int] NULL ,
	[Sales Territory Group ID] [int] NULL ,
	[Sales Territory Subgroup ID] [int] NULL ,
	[Coupon] [bit] NULL ,
	[Priority] [int] NULL ,
	[Department ID] [int] NULL ,
	[Category Group ID] [int] NULL ,
	[Category ID] [int] NULL ,
	[Manufacturer ID] [int] NULL ,
	[Brand ID] [int] NULL ,
	[Page Position ID] [int] NULL ,
	[Product Description] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Ad Type] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Promotions ID] [int] NULL ,
	[Origin ID] [int] NULL ,
	[Variety ID] [int] NULL ,
	[Main Offer ID] [int] NULL ,
	[Offer ID] [int] NULL ,
	[Offer Type ID] [int] NULL ,
	[Offer Description ID] [int] NULL ,
	[Page # In Ad] [int] NULL ,
	[Sale Price] [numeric](18, 2) NULL ,
	[High Sale Price] [numeric](18, 2) NULL ,
	[Reg. Price] [numeric](18, 2) NULL ,
	[Unit Price - Reg.] [numeric](18, 2) NULL ,
	[NOR Price] [numeric](18, 2) NULL ,
	[Low Rebate Amount] [numeric](18, 2) NULL ,
	[Lowest Rebate Price] [numeric](18, 2) NULL ,
	[Save Up To] [numeric](18, 2) NULL ,
	[Unit Price - Sale] [numeric](18, 2) NULL ,
	[$ Off] [numeric](18, 2) NULL ,
	[% Off] [int] NULL ,
	[Mfr Cpn $] [numeric](18, 2) NULL ,
	[Rtl Cpn $] [numeric](18, 2) NULL ,
	[Pur Qty] [int] NULL ,
	[Maximum Quantity] [int] NULL ,
	[Limit] [int] NULL ,
	[Pkg Size] [decimal](18, 2) NULL ,
	[Unit Type ID] [int] NULL ,
	[Product Territory ID] [int] NULL ,
	[Product Territory Subgroup ID] [int] NULL ,
	[Product Territory Group ID] [int] NULL ,
	[SKU Type (product type) ID] [int] NULL ,
	[SKU Description 1 (product attribute 1) ID] [int] NULL ,
	[SKU Description 1 (product attribute 2) ID] [int] NULL ,
	[SKU Description 1 (product attribute 3) ID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterFeaturesIDTable] (
	[FeaturesID] [int] IDENTITY (1, 1) NOT NULL ,
	[Features] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterMainOfferIDTable] (
	[MainOfferID] [int] IDENTITY (1, 1) NOT NULL ,
	[MainOffer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterManufacturerIDTable] (
	[ManufacturerID] [int] IDENTITY (1, 1) NOT NULL ,
	[Manufacturer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterMarketIDTable] (
	[MarketID] [int] NULL ,
	[Market] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterMediaIDTable] (
	[MediaID] [int] IDENTITY (1, 1) NOT NULL ,
	[Media] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterMerchandiseCategoryIDTable] (
	[MerchandiseCategoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[MerchandiseCategory] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterMerchandiseSubCatIDTable] (
	[MerchandiseSubCatID] [int] IDENTITY (1, 1) NOT NULL ,
	[MerchandiseSubCat] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterOfferDesIDTable] (
	[OfferDesID] [int] IDENTITY (1, 1) NOT NULL ,
	[OfferDes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterOfferIDTable] (
	[OfferID] [int] IDENTITY (1, 1) NOT NULL ,
	[Offer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterOfferTypeIDTable] (
	[OfferTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[OfferType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterOriginIDTable] (
	[OriginID] [int] IDENTITY (1, 1) NOT NULL ,
	[Origin] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterPageEventIDTable] (
	[PageEventID] [int] IDENTITY (1, 1) NOT NULL ,
	[PageEvent] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterPublicationIDTable] (
	[PublicationID] [int] IDENTITY (1, 1) NOT NULL ,
	[Publication] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterRegionIDTable] (
	[RegionID] [int] IDENTITY (1, 1) NOT NULL ,
	[Region] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSKUDescription1IDTable] (
	[SKUDescription1ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SKUDescription1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSKUDescription2IDTable] (
	[SKUDescription2ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SKUDescription2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSKUDescription3IDTable] (
	[SKUDescription3ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SKUDescription3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSKUTypeIDTable] (
	[SKUTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SKUType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSalesTerritoryGroupIDTable] (
	[SalesTerritoryGroupID] [int] IDENTITY (1, 1) NOT NULL ,
	[SalesTerritoryGroup] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSalesTerritoryIDTable] (
	[SalesTerritoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[SalesTerritory] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSalesTerritorySubGroupIDTable] (
	[SalesTerritorySubGroupID] [int] IDENTITY (1, 1) NOT NULL ,
	[SalesTerritorySubGroup] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterSizeIDTable] (
	[SizeID] [int] IDENTITY (1, 1) NOT NULL ,
	[Size] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterTaggedCompanyIDTable] (
	[TaggedCompanyID] [int] IDENTITY (1, 1) NOT NULL ,
	[TaggedCompany] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterThemeIDTable] (
	[ThemeID] [int] IDENTITY (1, 1) NOT NULL ,
	[Theme] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterTradeClassIDTable] (
	[TradeClassID] [int] NULL ,
	[TradeClass] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterVarietyIDTable] (
	[VarietyID] [int] IDENTITY (1, 1) NOT NULL ,
	[Variety] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterproductterritoryIDTable] (
	[productterritoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[productterritory] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterproductterritorygroupIDTable] (
	[productterritorygroupID] [int] IDENTITY (1, 1) NOT NULL ,
	[productterritorygroup] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterproductterritorysubgroupIDTable] (
	[productterritorysubgroupID] [int] IDENTITY (1, 1) NOT NULL ,
	[productterritorysubgroup] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Per1MasterunittypeIDTable] (
	[unittypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[unittype] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PER1MaterDelete_Data] (
	[Product Detail ID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO



--**********************************************************************************************************************************************************


