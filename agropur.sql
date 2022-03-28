
Declare @category varchar(15) = 'agpca50'
Declare @IsDebug bit =1

Declare @SQL NVARCHAR(max)
Declare @Alt NVARCHAR(max)

--Declare @vchrControDbPrefix varchar(50)
--SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
Declare @vchrConnectionDbPrefix varchar(50)
SET @vchrConnectionDbPrefix = dbo.mtfunc_GetDatabasePrefix('Connection')
Declare @vchrControDbPrefix varchar(50)
SET @vchrControDbPrefix = dbo.mtfunc_GetDatabasePrefix('control')
Declare @vchrControDbPrefix1 varchar(50) 
SET @vchrControDbPrefix1 = dbo.mtfunc_GetDatabasePrefix('sub')
------------------------------------------
Set @SQL = 'if exists(select * from tempdb.sys.objects where Name = ''agpca50exprecords'' and Type = ''U'')
                           DROP table tempdb..agpca50exprecords'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       set @SQL = 'select * into tempdb.dbo.'+@category+'exprecords from (
                           SELECT DISTINCT PageDetailID, Comments4,(Split.a.value(''.'', ''VARCHAR(100)'')) AS Comments4Nw 
                           ,rank()over (partition by pagedetailid order by  (Split.a.value(''.'', ''VARCHAR(100)''))) as flag
                           FROM  
                           (
                                  SELECT PageDetailID,Comments4,CAST(''<M>'' + replace((select Comments4 + '''' for xml path('''')), ''/'', ''</M><M>'') + ''</M>'' AS XML) AS Comments4Nw  
                                  FROM  '+@category+'DetailReports
                                  WHERE category like ''%cheese%'' and comments4 like ''%/%''
                           ) AS A CROSS APPLY Comments4Nw.nodes (''/M'') AS Split(a) )x'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

Set @SQL = 'if exists(select * from tempdb.sys.objects where Name = '''+@category+'detailreports_exp'' and Type = ''U'')
                           DROP table tempdb..'+@category+'detailreports_exp'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       set @SQL = 'select d.*,t.flag,t.Comments4Nw into tempdb.dbo.'+@category+'detailreports_exp from '+@category+'DetailReports d
                           join 
                           tempdb.dbo.'+@category+'exprecords t
                           on d.PageDetailID = t.PageDetailID'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       SET @SQL = 'alter table  tempdb.dbo.'+@Category+'detailreports_exp alter column OriginalPageDetailID varchar(13)'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       set @SQL = 'update tempdb.dbo.'+@category+'detailreports_exp set OriginalPageDetailID = OriginalPageDetailID +cast(flag as varchar(5)) where flag >1'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       set @SQL = 'update a set a.comments4 = b.Comments4Nw
                           from tempdb.dbo.'+@category+'detailreports_exp a
                           join 
                           tempdb.dbo.'+@category+'detailreports_exp b
                           on a.OriginalPageDetailID = b.OriginalPageDetailID'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)
       set @sql = 'Declare @MinexpID bigint
                           DEclare @CurrentPDTID bigint
       Select @MinexpID=min(pagedetailid) from '+@vchrConnectionDbPrefix+'[MasterMapPagedetailID_exp]
              
       update tempdb.dbo.'+@category+'detailreports_exp set pagedetailid =0 where flag >1
       

       if exists (select * from tempdb.sys.objects where name like ''MasterMapPagedetailID_exp'') 
                           drop table tempdb.dbo.[MasterMapPagedetailID_exp]
       

       select * into tempdb.DBO.[MasterMapPagedetailID_exp] from '+@vchrConnectionDbPrefix+'[MasterMapPagedetailID_exp]
       

       DECLARE version_cursor CURSOR
                           FOR
                           select pagedetailid,originalpagedetailid
                           from tempdb.dbo.'+@category+'detailreports_exp 
                           where pagedetailid = 0 and OriginalPageDetailID not in (Select OriginalPageDetailID from '+@vchrConnectionDbPrefix+'[MasterMapPagedetailID_exp])
                           order by pagedetailid

       set @CurrentPDTID = @MinexpID-1
              OPEN version_cursor
              DECLARE @PageDetailId as bigint
              DECLARE @originalpagedetailid as varchar(15) 
                 FETCH NEXT FROM version_cursor INTO @PageDetailId, @originalpagedetailid
                     WHILE (@@FETCH_STATUS <> -1)
                     BEGIN
                     IF (@@FETCH_STATUS <> -2)
                     BEGIN   
            --this is a new PDT up from JA, so create new PDTID for destination 
            --Insert the map
            Insert into '+@vchrConnectionDbPrefix+'[MasterMapPagedetailID_exp]( pagedetailid,originalpagedetailid)
                           Values( @CurrentPDTID, @originalpagedetailid)
                           Insert into tempdb.DBO.[MasterMapPagedetailID_exp]( pagedetailid,originalpagedetailid)
                           Values( @CurrentPDTID, @originalpagedetailid)
                     
                     set @CurrentPDTID = @CurrentPDTID - 1
                     
        END
        FETCH NEXT FROM version_cursor INTO @PageDetailId, @originalpagedetailid
       END
       CLOSE version_cursor
       DEALLOCATE version_cursor'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)
       set @SQL = 'update a set pagedetailid = b.pagedetailid
              from tempdb.dbo.'+@category+'detailreports_exp a
              join  
              tempdb.dbo.[MasterMapPagedetailID_exp] b 
              on a.originalpagedetailid =b.originalpagedetailid 
              where a.PageDetailID = 0'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)


       set @sql = 'alter table '+@category+'detailreports alter column originalpagedetailid varchar(13)'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)
       set @sql = 'delete from '+@category+'detailreports where originalpagedetailid in (select originalpagedetailid from tempdb.dbo.'+@category+'detailreports_exp)'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       set @sql = 'insert into '+@category+'detailreports
                           select [PageDetailID],[OriginalPageDetailID],[FlyerId],[OriginalFlyerID],[Page],[PageType],[OrderValue],[Height],[Width],[PageSpace],[AdvertiserId],[Advertiser],[marketid],[market],[RetMktId],[mediaId],[media],[eventId],[event],[Size],[FirstPageHeight],[FirstPageWidth],[FlyerSpace],[themeid],[theme],[PublicationId],[Publication],[TradeClassId],[tradeclass],[AdDate],[WeekOf],[salestartdate],[saleenddate],[Pages],[CouponInd],[PublishedOn],[RegionId],[Region],[DistrictId],[District],[CountryID],[Country],[LanguageID],[Language],[WeekOfn],[WeekOfi],[AdMonth],[AdMonthId],[subject],[persona],[receivedDt],[SalesTerritory],[SalesTerritoryId],[SalesTerritoryGroup],[SalesTerritoryGroupId],[SalesTerritorySubGroup],[SalesTerritorySubGroupId],[ManufacturerId],[Manufacturer],[MerchandiseCategoryId],[MerchandiseCategory],[MerchandiseSubCatId],[MerchandiseSubCat],[CategoryId],[Category],[BrandId],[Brand],[SKUDescription1ID],[SKUDescription1],[SKUDescription2ID],[SKUDescription2],[SKUDescription3ID],[SKUDescription3],[SKUTypeID],[SKUType],[SalePrice1],[SalePrice2],[RegularPrice1],[RegularPrice2],[NorPrice],[RebateAmount],[LowestRebatePrice],[LowestDiscountPrice],[UnitPrice],[Promotions],[Features],[NumberPackage],[Coupon],[CouponValueD1],[CouponValueD2],[CouponValueP1],[CouponValueP2],[OtherDiscountD1],[OtherDiscountD2],[OtherDiscountD3],[RequiredQuantity],[MaximumQuantity],[AdSize],[AdCost],[Illustrated],[SaleStDt],[SaleEndDt],[CouponExpirationDate],[Optional1],[Optional2],[Optional3],[Optional4],[Optional5],[Optional6],[Optional7],[Optional8],[Optional9],[Optional10],[Optional11],[Optional12],[Comments],[ProductTerritoryID],[ProductTerritory],[ProductTerritorySubGroupID],[ProductTerritorySubGroup],[ProductTerritoryGroupID],[ProductTerritoryGroup],[EnteredClient],[CouponExpirationDate1],[CouponExpirationDate2],[OtherDiscountP1],[OtherDiscountP2],[OtherDiscountP3],[Comments1],[OfferDes],[comments2],[comments3],[comments4],[topleftx],[toplefty],[bottomrightx],[bottomrighty],[UnitTypeId],[UnitType],[PkgSizeId],[PkgSize],[MPVPageEvent],[MPVPageEventId],[MPVPageTheme],[MPVPageThemeId],[MPVVariety],[MPVVarietyId],[MPVOrigin],[MPVOriginId],[MPVOffer],[MPVOfferId],[MPVOfferType],[MPVOfferTypeId],[MPVUnitType],[MPVUnitTypeID],[McUpdatedOn],[MscUpdatedOn],[MfrUpdatedOn],[PtUpdatedOn],[PtgUpdatedOn],[PtsgUpdatedOn],[FeaturesId],[AdType],[Img],[PageTypeId],[TaggedCompany],[DTAdded],[Weight],[AdDay],[AdDayId],[VehicleId],[CreationMonth],[ImageName],[PageName],[FVSystemPage],[FVDisplayPage],[FrontPageInd],[BackPageInd],[AdSalePeriod],[AdSaleWeek],[AdSaleMonth],[AdSaleYear],[MediaDetail],[MediaDetailID],[Channel],[ChannelID],[DisplayMedia],[Source],[DistDt],[AdDist],[AdTypeID],[AdDistID],[Spend]
                           from tempdb.dbo.'+@category+'detailreports_exp where originalpagedetailid not in (select originalpagedetailid from '+@category+'detailreports)
                           and PageDetailID<>0'
       If @IsDebug = 1
              Print @SQL
       Else
              Exec (@SQL)

       --       Set @SQL='Update '+@category+'detailreports set SkuDescription2 = Comments4 where category like ''%cheese%'' and isnull(comments4,'''')<>'''''
       --              If @IsDebug = 1
       --       Print @SQL
       --Else
       --       Exec (@SQL)

                    

---Missing ProductTerritory assignment for Brand like 'Delisio%' through ticket #54620

       Set @Alt='Execute mt_proc_Create_DisplayTables ''' + @Category + ''''
       If @IsDebug = 1
              Print @Alt
       Else
              Exec (@Alt)
------------------------------------------------
