
Create Index idxBrandCatMfr On AdTrakPageDetailTable	(Brand, Category) 
CReate Index IX_MasterPDT_FID_CAT_BR	On AdTrakPageDetailTable(FlyerId, Category, Brand) 
CReate Index IX_MasterPDT_FID_CAT_BR1	On AdTrakPageDetailTable(FlyerId, PageDetailId, Category, Brand) 
CReate Index IX_MasterPDT_FID_CAT_BR2	On AdTrakPageDetailTable(Category, Brand, FlyerId, PageDetailId) 



adtrakpagedetailtable