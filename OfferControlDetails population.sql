declare @categorycodeid int
declare @newcategorycodeid int
set @categorycodeid = 1220
set @newcategorycodeid = 289

INSERT INTO categoryoffercontrol(CategoryCodeId, SalePrice1, NorPrice, 
RequiredQuantity, CouponValueP1, CouponValueD2, OtherDiscountD2, OtherDiscountD1, NumberPackage,
LowestDiscountPrice, PageEvent, Offer1, Offer2, Offer3, Offer4, Offer5, OfferType1, OfferType2,
OfferType3, OfferType4, OfferType5, MainOffer)
SELECT @newcategorycodeid, SalePrice1, NorPrice, 
RequiredQuantity, CouponValueP1, CouponValueD2, OtherDiscountD2, OtherDiscountD1, NumberPackage,
LowestDiscountPrice, PageEvent, Offer1, Offer2, Offer3, Offer4, Offer5, OfferType1, OfferType2,
OfferType3, OfferType4, OfferType5, MainOffer
FROM categoryoffercontrol Where CategoryCodeID = @categorycodeid

--select * from categoryoffercontrol where categorycodeid = @categorycodeid 
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'Offer',  offer2, null from categoryoffercontrol where isnull(offer2, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'Offer',  offer3, null from categoryoffercontrol where isnull(offer3, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'Offer',  offer4, null from categoryoffercontrol where isnull(offer4, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'Offer',  offer5, null from categoryoffercontrol where isnull(offer5, '') <> '' and categorycodeid = @newcategorycodeid



insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'OfferType',  OfferType2, null from categoryoffercontrol where isnull(OfferType2, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'OfferType',  OfferType3, null from categoryoffercontrol where isnull(OfferType3, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'OfferType',  OfferType4, null from categoryoffercontrol where isnull(OfferType4, '') <> '' and categorycodeid = @newcategorycodeid
insert into categoryoffercontroldetails
Select @newcategorycodeid, offerid, 'OfferType',  OfferType5, null from categoryoffercontrol where isnull(OfferType5, '') <> '' and categorycodeid = @newcategorycodeid







