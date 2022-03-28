
Declare @Cnt As Int=1
              ,@Consolidated as Int=0
              ,@Msg as varchar(500)
While @Cnt >0
Begin

       IF EXISTS (SELECT * FROM tempdb.sys.objects WHERE name = N'TOPwalPePMC')
              Drop table tempdb.dbo.TOPwalPePMC

       --exec mt_proc_deletelogs
       select top 10 *
       Into tempdb.dbo.TOPwalPePMC
       from tempdb.[dbo].walPePMerchandiseCategory A
       
     CREATE NONCLUSTERED INDEX [IDX_TOPwalPePMCCat] ON tempdb.[dbo].TOPwalPePMC(CategoryID)

       
	Update PDT Set MerchandiseCategory=T.MerchandiseCategory,MerchandiseCategoryID=T.MerchandiseCategoryID,MerchandiseSubCat=T.MerchandiseSubCat,MerchandiseSubCatID=T.MerchandiseSubCatID
	from walPePDetailReports PDT with(nolock)
	join tempdb.dbo.TOPwalPePMC T with(nolock)
	on PDT.CategoryId=T.Categoryid
    Option (maxdop 1) 

       Delete A From tempdb.dbo.walPePMerchandiseCategory A JOIN tempdb.dbo.TOPwalPePMC B ON A.CategoryID=B.CategoryID

       Select  @Cnt=count(1) from tempdb.[dbo].walPePMerchandiseCategory
       Set @Msg='Pending records: '+Cast(@Cnt as varchar)+' at :'+convert(varchar,getdate(),109)
       RAISERROR (@Msg, 0, 1) WITH NOWAIT
End



 

 --fragmentation removal
 --ALTER INDEX [IDX_CatID] ON [dbo].[walPePDetailReports] REORGANIZE  WITH ( LOB_COMPACTION = ON )