Use MasterACFV
Go

Declare @StepName varchar(500) = 'TempACFVAdLevelUpdates'
Declare @StepStatus int = (Select StepStatus from MasterACFV.dbo.PackageStepDetail with(nolock) where StepName = @StepName)

IF(@StepStatus = 0)
Begin

		IF Exists(Select name From ACFVINCR.dbo.sysobjects where name = 'TempACFVAdLevelUpdates')
			Drop Table ACFVINCR.dbo.TempACFVAdLevelUpdates
		

		Select	Distinct
				B.pagedetailid
				, A.img
				, A.advertiserid
				, A.advertiser
				, A.marketid
				, A.market
				, A.retmktid
				, A.mediaid
				, A.media
				, A.publicationid
				, A.publication
				, A.tradeclassid
				, A.tradeclass
				, A.addate
				, A.weekof
				, A.salestartdate
				, A.saleenddate
				, A.pages
				, A.publishedon
				, A.districtid
				, A.district
				, A.countryid
				, A.country
				, A.weekofn
				, A.weekofi
				, A.admonth
				, A.admonthid
				, A.adday
				, A.addayid
				, A.vehicleid
				, A.creationmonth
				, A.imagename
				, A.pagename
				, A.fvsystempage
				, A.fvdisplaypage
				, A.frontpageind
				, A.backpageind
				, A.ChannelId
				, A.Channel
		Into ACFVINCR.dbo.TempACFVAdLevelUpdates
		From ACFVINCR.dbo.TempACFVPageReports A with(nolock)
		JOIN MasterACFV.dbo.ACFVDetailReports B with(nolock) on A.FlyerID = B.flyerid And A.Page = B.page
		JOIN ACFVINCR.dbo.Updated_AdBlock C with(nolock) on A.OriginalFlyerID = C.circ_i
		Option(Maxdop 1)
		

		IF Not Exists(Select name from ACFVINCR.dbo.sysindexes where name = 'NonClusteredIndex_TempTable')
			CREATE NONCLUSTERED INDEX [NonClusteredIndex_TempTable] ON ACFVINCR.dbo.TempACFVAdLevelUpdates([pagedetailid] ASC)


		Update MasterACFV.dbo.PackageStepDetail SET StepStatus = 1 Where StepName = @StepName

End
