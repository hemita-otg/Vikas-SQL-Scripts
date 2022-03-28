--use acfvincr 
--drop table TempACFVDetailReports_3 
--exec sp_rename  'TempACFVDetailReports_3ready','TempACFVDetailReports_3'
--Select*  From masteracfv.dbo.MasterTableList where TableType = 'Detail'
--select count(1) from TempACFVDetailReports_3
--------------------------------------------------------------------------------------------


Declare @StepName varchar(500) = 'Update ACFVdetail'
--Declare @StepStatus int = (Select StepStatus from dbo.PackageStepDetail with(nolock) where StepName = @StepName)

Declare @sql varchar(max)

SET @sql =	'
						IF Exists(Select name From ACFVINCR.dbo.sysobjects where name = ''PDT_Delete'')
							Drop Table ACFVINCR.dbo.PDT_Delete

						Select Pagedetailid Into ACFVINCR.dbo.PDT_Delete From MasterACFV.dbo.ACFVDetailreports with(nolock) where 1 = 2
					'
		EXEC(@sql)
		
		SET @sql =	'
						CREATE CLUSTERED INDEX [IDX_PDT_Delete_PageDetailid] ON [ACFVINCR].[dbo].[PDT_Delete]([Pagedetailid] ASC)

						Update MasterACFV.dbo.MasterTableList Set isProcessed = 0 where TableType = ''Detail'' and MT2_Tablename =''TempACFVDetailReports_3''
					'
		EXEC(@sql)


		Declare @MT2_Detail varchar(100) 
				, @i int = 1
				

		While(@i > 0)
		Begin
				SET @MT2_Detail = (Select Top 1 MT2_Tablename From MasterACFV.dbo.MasterTableList where TableType = 'Detail' And isProcessed = 0)
		
				SET @sql =	'
								Insert Into ACFVINCR.dbo.PDT_Delete
								Select Pagedetailid From ACFVINCR.dbo.' + @MT2_Detail + ' with(nolock) 

								Delete From MasterACFV.dbo.ACFVMPVOfferType where PageDetailId In (Select PageDetailId From ACFVINCR.dbo.PDT_Delete with(nolock))
							'
				Print @sql
				EXEC(@sql)

				SET @sql =	'
								Declare @count int = 1
								While(@Count > 0)
								Begin
										Select Top 999999 Pagedetailid Into #t From ACFVINCR.dbo.PDT_Delete with(nolock)

										Delete A
										From MasterACFV.dbo.ACFVDetailReports A
										Join #t B with(nolock) on A.pagedetailid = B.pagedetailid

										Insert Into MasterACFV.dbo.ACFVDetailReports (pagedetailid,originalpagedetailid,flyerid,originalflyerid,page,pagetype,ordervalue,height,width,pagespace,advertiserid,advertiser,marketid,market,mediaid,media,eventid,event,size,firstpageheight,firstpagewidth,flyerspace,themeid,theme,publicationid,publication,tradeclassid,tradeclass,addate,weekof,salestartdate,saleenddate,pages,couponind,publishedon,regionid,region,districtid,district,countryid,country,languageid,language,weekofn,weekofi,admonth,admonthid,subject,persona,receiveddt,salesterritory,salesterritoryid,salesterritorygroup,salesterritorygroupid,salesterritorysubgroup,salesterritorysubgroupid,manufacturerid,manufacturer,merchandisecategoryid,merchandisecategory,merchandisesubcatid,merchandisesubcat,categoryid,category,brandid,brand,SKUDescription1ID,SKUDescription1,SKUDescription2ID,SKUDescription2,SKUDescription3ID,SKUDescription3,SKUTypeId,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NorPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice
										,MPVPageTheme,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritoryID,ProductTerritory,ProductTerritorySubGroupId,ProductTerritorySubGroup,ProductTerritoryGroupID,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,Comments1,OfferDes,Comments2,Comments3,Comments4,topleftx,toplefty,bottomrightx,bottomrighty,UnitTypeId,UnitType,PkgSizeId,PkgSize,MPVPageEvent,MPVPageEventId
										,MPVPageThemeId,MPVVariety,MPVVarietyId,MPVOrigin,MPVOriginId,MPVSKUType,MPVSKUTypeId,MPVOffer,MPVOfferId,MPVOfferType,MPVOfferTypeId,MPVSKU,MPVSKUID,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,featuresid,AdType,CircularType,img,PageTypeId,TaggedCompany,DTAdded,Weight,AdDay,AdDayId,VehicleId,CreationMonth,ImageName,PageName,FVSystemPage,FVDisplayPage,FrontPageInd,BackPageInd,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,MediaDetail,MediaDetailId,channel,channelid,DisplayMedia,Source,DistDt,AdDist,AdTYpeID,CircularTypeID,AdDistId,Spend,MainOffer,MainOfferId,ACNetPriceAfterIncentive,ACAdCompBrandId,ACSegment,ACEventName,ACShowMathFlag,ACAttributeName,ACCouponFlag,ACBrandFamily,UnitDiscountPrice,ACAdBlockCount,ACPatchX,ACRepflag,ACParentAdcId,AcAdImage,ACAdvertiserId,ACCityId,ACMediaType,ACCategoryId,ACLoyaltyFlag,ACRebateFlag,ACLimtedTimeFlag,ACLinerFlag,ACMealDealFlag,ACMultiPrd,ACBrandEquityFlag,ACNewItem,ACMultiMfg,ACAdGrade,ACFSISameWeek,ACDigitalSameWeek,ACCouponSameWeek,retmktid,ACBlockPixelSize,ACPageId,ACPage,ACBrandFamilyId, AdBlockId,Promotions,ACPrivateBrand,ACProductsFlag,AC_volume,AC_count,AC_form)
										Select 
												A.pagedetailid,A.originalpagedetailid,A.flyerid,A.originalflyerid,A.page,A.pagetype,A.ordervalue,A.height,A.width,A.pagespace,A.advertiserid,A.advertiser,A.marketid,A.market,A.mediaid,A.media,A.eventid,A.event,A.size,A.firstpageheight,A.firstpagewidth,A.flyerspace,A.themeid,A.theme,A.publicationid,A.publication,A.tradeclassid,A.tradeclass,A.addate,A.weekof,A.salestartdate,A.saleenddate,A.pages,A.couponind,A.publishedon,A.regionid,A.region,A.districtid,A.district,A.countryid,A.country,A.languageid,A.language,A.weekofn,A.weekofi,A.admonth,A.admonthid,A.subject,A.persona,A.receiveddt,A.salesterritory,A.salesterritoryid,A.salesterritorygroup,A.salesterritorygroupid,A.salesterritorysubgroup,A.salesterritorysubgroupid,A.manufacturerid,A.manufacturer,A.merchandisecategoryid,A.merchandisecategory,A.merchandisesubcatid,A.merchandisesubcat,A.categoryid,A.category,A.brandid,A.brand,A.SKUDescription1ID,A.SKUDescription1,A.SKUDescription2ID,A.SKUDescription2,A.SKUDescription3ID,A.SKUDescription3,A.SKUTypeId,A.SKUType,A.SalePrice1,A.SalePrice2,A.RegularPrice1,A.RegularPrice2,A.NorPrice,A.RebateAmount,A.LowestRebatePrice,A.LowestDiscountPrice,A.UnitPrice
												,A.MPVPageTheme,A.Features,A.NumberPackage,A.Coupon,A.CouponValueD1,A.CouponValueD2,A.CouponValueP1,A.CouponValueP2,A.OtherDiscountD1,A.OtherDiscountD2,A.OtherDiscountD3,A.RequiredQuantity,A.MaximumQuantity,A.AdSize,A.AdCost,A.Illustrated,A.SaleStDt,A.SaleEndDt,A.CouponExpirationDate,A.Optional1,A.Optional2,A.Optional3,A.Optional4,A.Optional5,A.Optional6,A.Optional7,A.Optional8,A.Optional9,A.Optional10,A.Optional11,A.Optional12,A.Comments,A.ProductTerritoryID,A.ProductTerritory,A.ProductTerritorySubGroupId,A.ProductTerritorySubGroup,A.ProductTerritoryGroupID,A.ProductTerritoryGroup,A.EnteredClient,A.CouponExpirationDate1,A.CouponExpirationDate2,A.OtherDiscountP1,A.OtherDiscountP2,A.OtherDiscountP3,A.Comments1,A.OfferDes,A.Comments2,A.Comments3,A.Comments4,A.topleftx,A.toplefty,A.bottomrightx,A.bottomrighty,A.UnitTypeId,A.UnitType,A.PkgSizeId,A.PkgSize,A.MPVPageEvent,A.MPVPageEventId
												,A.MPVPageThemeId,A.MPVVariety,A.MPVVarietyId,A.MPVOrigin,A.MPVOriginId,A.MPVSKUType,A.MPVSKUTypeId,A.MPVOffer,A.MPVOfferId,A.MPVOfferType,A.MPVOfferTypeId,A.MPVSKU,A.MPVSKUID,A.McUpdatedOn,A.MscUpdatedOn,A.MfrUpdatedOn,A.PtUpdatedOn,A.PtgUpdatedOn,A.PtsgUpdatedOn,A.featuresid,A.AdType,A.CircularType,A.img,A.PageTypeId,A.TaggedCompany,A.DTAdded,A.Weight,A.AdDay,A.AdDayId,A.VehicleId,A.CreationMonth,A.ImageName,A.PageName,A.FVSystemPage,A.FVDisplayPage,A.FrontPageInd,A.BackPageInd,A.AdSalePeriod,A.AdSaleWeek,A.AdSaleMonth,A.AdSaleYear,A.MediaDetail,A.MediaDetailId,A.channel,A.channelid,A.DisplayMedia,A.Source,A.DistDt,A.AdDist,A.AdTYpeID,A.CircularTypeID,A.AdDistId,A.Spend,A.MainOffer,A.MainOfferId,A.ACNetPriceAfterIncentive,A.ACAdCompBrandId,A.ACSegment,A.ACEventName,A.ACShowMathFlag,A.ACAttributeName,A.ACCouponFlag,A.ACBrandFamily,A.UnitDiscountPrice,A.ACAdBlockCount,A.ACPatchX,A.ACRepflag,A.ACParentAdcId,A.AcAdImage,A.ACAdvertiserId,A.ACCityId,A.ACMediaType,A.ACCategoryId,A.ACLoyaltyFlag,A.ACRebateFlag,A.ACLimtedTimeFlag,A.ACLinerFlag,A.ACMealDealFlag,A.ACMultiPrd,A.ACBrandEquityFlag,A.ACNewItem,A.ACMultiMfg,A.ACAdGrade,A.ACFSISameWeek,A.ACDigitalSameWeek,A.ACCouponSameWeek,A.retmktid,A.ACBlockPixelSize, A.ACPageId , A.Acpage, a.ACBrandFamilyId, A.AdBlockId,A.Promotions,A.ACPrivateBrand,A.ACProductsFlag,A.AC_volume,A.AC_count,A.AC_form
										From ACFVINCR.dbo.' + @MT2_Detail + ' A with(nolock)
										Join #t B with(nolock) on A.pagedetailid = B.Pagedetailid

										Delete A
										From ACFVINCR.dbo.PDT_Delete A
										Join #t B with(nolock) on A.pagedetailid = B.pagedetailid

										Set @Count = (Select Count(1) From ACFVINCR.dbo.PDT_Delete with(nolock))

										Drop Table #t
								End
							'
				Print @sql
				EXEC(@sql)

				Update MasterACFV.dbo.MasterTableList Set isProcessed = 1 where TableType = 'Detail' And MT2_Tablename = @MT2_Detail 

				SET @i = (Select Count(1) From MasterACFV.dbo.MasterTableList where TableType = 'Detail' And isProcessed = 0)
		End
