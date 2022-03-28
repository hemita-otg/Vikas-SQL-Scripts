--select * into frnational.dbo.FlashCoveragePEP from mt2sql14.tempdb.dbo.FlashCoveragePEP
--select* from frnational.dbo.FlashCoveragePEP



USE [FRNational]
GO

/****** Object:  Table [dbo].[NATChildWebMainPEP]    Script Date: 6/23/2017 2:39:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--drop table [NATChildWebMainPEP]
CREATE TABLE [dbo].[NATChildWebMainPEP](
	[OriginalFlyerId] varchar(11),
	[FlyerID] [varchar](11) NOT NULL,
	[Advertiser] [varchar](100) NULL,
	[AdDate] [datetime] NULL,
	[WeekOf] [datetime] NULL,
	[media] [varchar](35) NULL,
	[event] [varchar](35) NULL,
	[theme] [varchar](50) NULL,
	[market] [varchar](35) NULL,
	[Publication] [varchar](35) NULL,
	[salestartdate] [datetime] NULL,
	[saleenddate] [datetime] NULL,
	[pages] [int] NULL,
	[size] [varchar](35) NULL,
	[tradeclass] [varchar](35) NULL,
	[img] [varchar](100) NULL,
	[PublishedOn] [datetime] NULL,
	[Region] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[SalesTerritory] [varchar](50) NULL,
	[SalesTerritoryGroup] [varchar](50) NULL,
	[SalesTerritorySubGroup] [varchar](50) NULL,
	[TcUpdatedOn] [datetime] NULL,
	[DistUpdatedOn] [datetime] NULL,
	[RegionUpdatedOn] [datetime] NULL,
	[StUpdatedOn] [datetime] NULL,
	[StgUpdatedOn] [datetime] NULL,
	[StsgUpdatedOn] [datetime] NULL,
	[RetID] [int] NULL,
	[MktID] [int] NULL,
	[RetMktID] [BigInt] NULL,
	[AdMonth] [datetime] NULL,
	[AdDay] [smallint] NULL,
	[CountryID] [smallint] NULL,
	[LanguageID] [smallint] NULL,
	[AVTCID] [int] NULL,
	[MediaID] [int] NULL,
	[ThemeID] [int] NULL,
	[EventID] [int] NULL,
	[subject] [varchar](500) NULL,
	[persona] [varchar](50) NULL,
	[receivedDt] [datetime] NULL,
	[AdSalePeriod] [int] NULL,
	[AdSaleWeek] [smallint] NULL,
	[AdSaleMonth] [datetime] NULL,
	[AdSaleYear] [datetime] NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[DoB] [datetime] NULL,
	[AgeBracket] [varchar](50) NULL,
	[DisplayMedia] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[DistDt] [datetime] NULL,
	[AdDist] [varchar](100) NULL,
	[AdDistID] [int] NULL,
	[AdType] [varchar](100) NULL,
	[AdTypeID] [int] NULL,
	[Spend] [numeric](10, 2) NULL,
	[Channel] [varchar](100) NULL,
 CONSTRAINT [pk_natchildwebmainPEP] PRIMARY KEY CLUSTERED 
(
	[FlyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

----For Campbell---
insert into FRNational.dbo.NATChildWebMainPEP
select distinct OriginalFlyerId,FlyerID,Advertiser,AdDate,WeekOf,media,event,theme,market,Publication,salestartdate,saleenddate,pages,size,tradeclass,img,PublishedOn,Region,District,SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup,TcUpdatedOn,DistUpdatedOn,RegionUpdatedOn,StUpdatedOn,StgUpdatedOn,StsgUpdatedOn,RetID,MktID,a.RetMktID,AdMonthid,AdDayid,CountryID,LanguageID,AVTCID,MediaID,ThemeID,EventID,subject,persona,receivedDt,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,City,State,ZipCode,Gender,DoB,AgeBracket,DisplayMedia,Source,DistDt,AdDist,AdDistID,AdType,AdTypeID,Spend,Channel
from mt2sql00.masteracfv.dbo.ACFVFlyerReports a
join FRNational.dbo.FlashCoveragePEP b
on a.retmktid = b.retmktid
where AdDate >= '2017-06-19 00:00:00.000' and [Flash Entry Status] = 'JA Entry' and a.AdType = 'Electronic Circular'
Union
--For Coke----
select distinct OriginalFlyerId,FlyerID,a.Advertiser,AdDate,WeekOf,media,event,theme,a.market,Publication,salestartdate,saleenddate,pages,size,tradeclass,img,PublishedOn,Region,District,SalesTerritory,SalesTerritoryGroup,SalesTerritorySubGroup,TcUpdatedOn,DistUpdatedOn,RegionUpdatedOn,StUpdatedOn,StgUpdatedOn,StsgUpdatedOn,RetID,MktID,a.RetMktID,AdMonthid,AdDayid,CountryID,LanguageID,AVTCID,MediaID,ThemeID,EventID,subject,persona,receivedDt,AdSalePeriod,AdSaleWeek,AdSaleMonth,AdSaleYear,City,State,ZipCode,Gender,DoB,AgeBracket,DisplayMedia,Source,DistDt,AdDist,AdDistID,AdType,AdTypeID,Spend,Channel
from mt2sql00.masteracfv.dbo.ACFVFlyerReports a
join FRNational.dbo.FlashCoveragePEPCC b
on a.retmktid = b.retmktid
where AdDate >= '2017-06-19 00:00:00.000' and a.AdType = 'Electronic Circular'

sp_RENAME 'NATChildWebMainPEP.retmktid' , 'ACRetMktID', 'COLUMN'

alter table NATChildWebMainPEP add RetMktID int

Update b set RetMktid = a.RetMktID from mt2sql00.MasterMappingTables.dbo.REtMKTpep a
join FRNational.dbo.NATChildWebMainPEP b
on a.ACRetMktID = b.ACRetmktid

USE [FRNational]
GO

/****** Object:  Table [dbo].[NATPDTPEP]    Script Date: 6/23/2017 2:40:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--drop table [NATPDTPEP]
CREATE TABLE [dbo].[NATPDTPEP](
	[FlyerID] [varchar](11) NULL,
	[Page] [int] NULL,
	[PageDetailID] [varchar](11) NOT NULL,
	[DTAdded] [datetime] NULL,
	[TaggedCompany] [varchar](37) NULL,
	[Manufacturer] [varchar](1200) NULL,
	[MerchandiseCategory] [varchar](300) NULL,
	[MerchandiseSubCat] [varchar](1000) NULL,
	[Category] [varchar](100) NULL,
	[Brand] [varchar](1500) NULL,
	[SKUDescription1] [varchar](100) NULL,
	[SKUDescription2] [varchar](100) NULL,
	[SKUDescription3] [varchar](100) NULL,
	[SKUType] [varchar](100) NULL,
	[SalePrice1] [numeric](18, 2) NULL,
	[SalePrice2] [numeric](18, 2) NULL,
	[RegularPrice1] [numeric](18, 2) NULL,
	[RegularPrice2] [numeric](18, 2) NULL,
	[NORPrice] [numeric](18, 2) NULL,
	[RebateAmount] [numeric](18, 2) NULL,
	[LowestRebatePrice] [numeric](18, 2) NULL,
	[LowestDiscountPrice] [numeric](18, 2) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[Promotions] [varchar](2000) NULL,
	[Features] [varchar](100) NULL,
	[NumberPackage] [int] NULL,
	[Coupon] [numeric](8, 0) NULL,
	[CouponValueD1] [numeric](18, 2) NULL,
	[CouponValueD2] [numeric](18, 2) NULL,
	[CouponValueP1] [int] NULL,
	[CouponValueP2] [int] NULL,
	[OtherDiscountD1] [numeric](18, 2) NULL,
	[OtherDiscountD2] [numeric](18, 2) NULL,
	[OtherDiscountD3] [numeric](18, 2) NULL,
	[RequiredQuantity] [int] NULL,
	[MaximumQuantity] [int] NULL,
	[AdSize] [int] NULL,
	[AdCost] [int] NULL,
	[Illustrated] [numeric](8, 0) NULL,
	[SaleStDt] [datetime] NULL,
	[SaleEndDt] [datetime] NULL,
	[CouponExpirationDate] [datetime] NULL,
	[Optional1] [varchar](100) NULL,
	[Optional2] [varchar](100) NULL,
	[Optional3] [varchar](100) NULL,
	[Optional4] [varchar](100) NULL,
	[Optional5] [varchar](100) NULL,
	[Optional6] [varchar](100) NULL,
	[Optional7] [varchar](3000) NULL,
	[Optional8] [varchar](1200) NULL,
	[Optional9] [varchar](100) NULL,
	[Optional10] [varchar](100) NULL,
	[Optional11] [varchar](100) NULL,
	[Optional12] [varchar](100) NULL,
	[Comments] [numeric](8, 0) NULL,
	[ProductTerritory] [varchar](100) NULL,
	[ProductTerritorySubGroup] [varchar](100) NULL,
	[ProductTerritoryGroup] [varchar](100) NULL,
	[EnteredClient] [numeric](8, 0) NULL,
	[CouponExpirationDate1] [datetime] NULL,
	[CouponExpirationDate2] [datetime] NULL,
	[OtherDiscountP1] [int] NULL,
	[OtherDiscountP2] [int] NULL,
	[OtherDiscountP3] [int] NULL,
	[comments1] [varchar](1000) NULL,
	[comments2] [varchar](1000) NULL,
	[comments3] [varchar](500) NULL,
	[comments4] [varchar](255) NULL,
	[topleftx] [int] NULL,
	[toplefty] [int] NULL,
	[bottomrightx] [int] NULL,
	[bottomrighty] [int] NULL,
	[McUpdatedOn] [datetime] NULL,
	[MscUpdatedOn] [datetime] NULL,
	[MfrUpdatedOn] [datetime] NULL,
	[PtUpdatedOn] [datetime] NULL,
	[PtgUpdatedOn] [datetime] NULL,
	[PtsgUpdatedOn] [datetime] NULL,
	[UnitType] [varchar](150) NULL,
	[PkgSize] [numeric](18, 2) NULL,
	[OfferDes] [varchar](2000) NULL,
	[MediaDetail] [varchar](100) NULL,
	[AdDate] [datetime] NULL, 
	[Advertiser] [varchar](100) NULL, 
	[Market] [varchar](100) NULL, 
	[MainOffer] [varchar](2000) NULL, 
	[ACNetPriceAfterIncentive] [numeric](18, 9) NULL,
	[ACShowMathFlag] [varchar](10) NULL, 
	[SaleStartDate] [datetime] NULL, 
	[SaleEndDate] [datetime] NULL, 
	[ACSegment] [nvarchar](100) NULL, 
	[ACLoyaltyFlag] [varchar](5) NULL, 
	[ACRebateFlag] [varchar](5) NULL, 
	[ACLimtedTimeFlag] [varchar](5) NULL, 
	[ACLinerFlag] [varchar](5) NULL, 
	[ACMealDealFlag] [varchar](5) NULL, 
	[ACMultiPrd] [varchar](5) NULL, 
	[ACBrandEquityFlag] [varchar](5) NULL, 
	[ACBrandFamily] [nvarchar](255) NULL, 
	[ACMultiMfg] [varchar](5) NULL, 
	[ACAttributeName] [nvarchar](400) NULL, 
	[ACFSISameWeek] [varchar](5) NULL, 
	[ACDigitalSameWeek] [varchar](5) NULL, 
	[ACCouponSameWeek] [varchar](5) NULL, 
	[ACAdBlockCount] [numeric](5, 2) NULL,
	[ACPatchX] [nvarchar](4000) NULL, 
	[ACEventName] [nvarchar](2000) NULL, 
	[ACNewItem] [varchar](5) NULL, 
	[ACCouponFlag] [smallmoney] NULL, 
	[ACAdCompBrandId] [int] NULL, 
	[OriginalPageDetailId] [varchar](30) NULL, 
	[OriginalFlyerId] [varchar](11) NOT NULL,

) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


insert into FRNational.dbo.NATPDTPEP
select a.FlyerID,Page,PageDetailID,DTAdded,TaggedCompany,Manufacturer,MerchandiseCategory,MerchandiseSubCat,Category,Brand,SKUDescription1,SKUDescription2,SKUDescription3,SKUType,SalePrice1,SalePrice2,RegularPrice1,RegularPrice2,NORPrice,RebateAmount,LowestRebatePrice,LowestDiscountPrice,UnitPrice,Promotions,Features,NumberPackage,Coupon,CouponValueD1,CouponValueD2,CouponValueP1,CouponValueP2,OtherDiscountD1,OtherDiscountD2,OtherDiscountD3,RequiredQuantity,MaximumQuantity,AdSize,AdCost,Illustrated,SaleStDt,SaleEndDt,CouponExpirationDate,Optional1,Optional2,Optional3,Optional4,Optional5,Optional6,Optional7,Optional8,Optional9,Optional10,Optional11,Optional12,Comments,ProductTerritory,ProductTerritorySubGroup,ProductTerritoryGroup,EnteredClient,CouponExpirationDate1,CouponExpirationDate2,OtherDiscountP1,OtherDiscountP2,OtherDiscountP3,comments1,comments2,comments3,comments4,topleftx,toplefty,bottomrightx,bottomrighty,McUpdatedOn,MscUpdatedOn,MfrUpdatedOn,PtUpdatedOn,PtgUpdatedOn,PtsgUpdatedOn,UnitType,PkgSize,OfferDes,MediaDetail,a.AdDate,a.Advertiser,a.Market,MainOffer,ACNetPriceAfterIncentive,ACShowMathFlag,a.SaleStartDate,a.SaleEndDate,ACSegment,ACLoyaltyFlag,ACRebateFlag,ACLimtedTimeFlag,ACLinerFlag,ACMealDealFlag,ACMultiPrd,ACBrandEquityFlag,ACBrandFamily,ACMultiMfg,ACAttributeName,ACFSISameWeek,ACDigitalSameWeek,ACCouponSameWeek,ACAdBlockCount,ACPatchX,ACEventName,ACNewItem,ACCouponFlag,ACAdCompBrandId,OriginalPageDetailId,a.OriginalFlyerId
from mt2sql00.masteracfv.dbo.ACFVDetailReports a
join FRNational.dbo.NATChildWebMainPEP b
on a.flyerid = b.flyerid

USE [FRNational]
GO

/****** Object:  Table [dbo].[NATMPVPEP]    Script Date: 6/23/2017 2:39:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--drop table [NATMPVPEP]
CREATE TABLE [dbo].[NATMPVPEP](
	[PageDetailID] [varchar](11) NOT NULL,
	[FieldName] [varchar](50) NOT NULL,
	[FieldValue] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


insert into FRNational.dbo.[NATMPVPEP]
select a.PageDetailID,'OfferType' FieldName,OfferType from mt2sql00.masteracfv.dbo.ACFVMPVOfferType a
join FRNational.dbo.NATPDTPEP b
on a.PageDetailID = b.PagedetailID


USE MasterClientCoverage
GO

--SELECT [FlyerID]
--      ,[WeekOf] into MasterClientCoverage..[FlashDataFlyerIDPEP]
--  FROM Frnational.[dbo].[NATChildWebMainPEP]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--drop table [FlashDataFlyerIDPEP]
CREATE TABLE [dbo].[FlashDataFlyerIDPEP](
	[FlyerID] [varchar](11) NOT NULL,
	[WeekOf] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into MasterClientCoverage..[FlashDataFlyerIDPEP]
select b.FlyerID,b.WeekOf from MasterClientCoverage..[FlashDataFlyerIDPEP] a
right join Frnational.[dbo].[NATChildWebMainPEP] b
on a.FlyerID = b.FlyerID and a.WeekOf = b.WeekOf
where a.FlyerID is null
GO


--One Time-------------------------------------View for SourceCWM for FRDataPEP in MT2SQL00-------------------------------------------------------------------
USE [MasterClientCoverage]
GO

/****** Object:  View [dbo].[FRDataCWMPEP]    Script Date: 6/23/2017 3:13:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Alter VIEW [dbo].[FRDataCWMPEP]
AS
SELECT        m.*
FROM            MasterACFV..ACFVFlyerReports AS m INNER JOIN
                             (SELECT        flyerid, weekof FRWeekOf
                               FROM            dbo.FlashDataFlyerIDPEP
                             ) AS F ON m.FlyerID = F.flyerid
WHERE         (m.AdDate >= DATEADD(yy, - 2, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0)))




GO
---------------------------------------------------------------------------------------------------------------------------------------------


-- Use Mt2sql14 connection to Sync from SQL00 to SQL14
USE [FRNational]
GO


drop table frnational..[NATChildWebMainPEP]
drop table frnational..[NATPDTPEP]
drop table frnational..[NATMPVPEP]



select * into frnational..[NATChildWebMainPEP] from mt2sql00.frnational.dbo.[NATChildWebMainPEP]
select * into frnational..[NATPDTPEP]from mt2sql00.frnational.dbo.[NATPDTPEP]
select * into frnational..[NATMPVPEP]from mt2sql00.frnational.dbo.[NATMPVPEP]


USE [FlashReport]
GO

/****** Object:  Table [dbo].[FlashAdsPEP]    Script Date: 6/23/2017 2:41:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FlashAdsPEP](
	[flyerid] [varchar](11) NOT NULL,
	[pages] [int] NULL,
	[tradeclass] [varchar](35) NULL,
	[advertiser] [varchar](100) NULL,
	[addate] [datetime] NULL,
	[weekof] [datetime] NULL,
	[market] [varchar](35) NULL,
	[media] [varchar](35) NULL,
	[RetMktID] [int] NOT NULL,
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


insert into Mt2sql14.FlashReport.dbo.[FlashAdsPEP]
select flyerid,pages,tradeclass,advertiser,addate,weekof,market,media,a.RetMktID
from mt2sql00.masteracfv.dbo.ACFVFlyerReports a
join mt2sql00.FRNational.dbo.FlashCoveragePEP b
on a.retmktid = b.retmktid
where AdDate >= '2017-06-19 00:00:00.000'
Union
select flyerid,pages,tradeclass,a.advertiser,addate,weekof,a.market,media,a.RetMktID
from mt2sql00.masteracfv.dbo.ACFVFlyerReports a
join mt2sql00.FRNational.dbo.FlashCoveragePEPCC b
on a.retmktid = b.retmktid
where AdDate >= '2017-06-19 00:00:00.000' 

sp_RENAME 'FlashAdsPEP.RetMktID' , 'ACRetMktID', 'COLUMN'

alter table [FlashAdsPEP] add RetMktID int

Update b set RetMktid = a.RetMktID from mt2sql00.MasterMappingTables.dbo.REtMKTpep a
join Mt2sql14.FlashReport.dbo.[FlashAdsPEP] b
on a.ACRetMktID = b.ACRetmktid


