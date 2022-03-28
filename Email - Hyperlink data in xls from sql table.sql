declare @pquery varchar(8000)
SEt @pquery   = 'select ''"http://www.featurevision.com/xls?CliId=357&C=1489&X=''+p.Flyerid+''&pdtid=''+p.Pagedetailid+''&Print=PI&ProductWithMidPage=true"'' as [Page & Product Image],Advertiser as ''Account'',AdDate as ''Ad Date'',Publication as ''Newspaper'',Media as ''Media Type'',Market as ''Market'',district as ''State'',Category as ''Subcategory'',Brand as ''Brand'',variety as ''Subbrand'',origin as ''Origin'',unittype as ''Unit Type'',Comments1 as ''Product Description'',OfferDes as ''Offer Description'',SalePrice1 as ''Sale Price'',RegularPrice1 as ''Reg. Price'',NORPrice as ''NOR Price'',UnitPrice as ''Unit Price - Sale'',RegularPrice2 as ''Unit Price - Reg.'',RequiredQuantity as ''Pur Qty'',CouponValueP1 as ''% Off'',CouponValueD2 as ''$ Off'',OtherDiscountD2 as ''Rtl Cpn $'',OtherDiscountD1 as ''Mfr Cpn $'',TaggedCompany as ''Ad Type'',NumberPackage as ''Limit'',LowestDiscountPrice as ''Save Up To'',PageEvent as ''Promotions'',Features as ''Page Position'',SaleStartDate as ''Sale Start Date'',SaleEndDate as ''Sale End Date'',Manufacturer as ''Supplier'',MerchandiseSubCat as ''Category'',MerchandiseCategory as ''Category Group'',productterritory as ''Diageo Priority'' from dgachildwebmain c join  dgapagedetailtable p on c.flyerid=p.flyerid where pagedetailid not in (select pagedetailid from dgapagedetailtable P join expansion.dbo.dgaVarietyCatMfrUpdate T on p.category=t.newcategory and p.brand=t.newbrand and p.manufacturer=t.newmfg and p.variety=t.newvariety) and category not in (''Unassigned - Beer'',''Unassigned - Beer Alternatives'',''Unassigned - Wine'')'


select '"http://www.featurevision.com/xls?CliId=357&C=1489&X='+p.Flyerid+'&pdtid='+p.Pagedetailid+'&Print=PI&ProductWithMidPage=true"' as [Page & Product Image],Advertiser as 'Account',AdDate as 'Ad Date',Publication as 'Newspaper',Media as 'Media Type',Market as 'Market',district as 'State',Category as 'Subcategory',Brand as 'Brand',variety as 'Subbrand',origin as 'Origin',unittype as 'Unit Type',Comments1 as 'Product Description',OfferDes as 'Offer Description',SalePrice1 as 'Sale Price',RegularPrice1 as 'Reg. Price',NORPrice as 'NOR Price',UnitPrice as 'Unit Price - Sale',RegularPrice2 as 'Unit Price - Reg.',RequiredQuantity as 'Pur Qty',CouponValueP1 as '% Off',CouponValueD2 as '$ Off',OtherDiscountD2 as 'Rtl Cpn $',OtherDiscountD1 as 'Mfr Cpn $',TaggedCompany as 'Ad Type',NumberPackage as 'Limit',LowestDiscountPrice as 'Save Up To',PageEvent as 'Promotions',Features as 'Page Position',SaleStartDate as 'Sale Start Date',SaleEndDate as 'Sale End Date',Manufacturer as 'Supplier',MerchandiseSubCat as 'Category',MerchandiseCategory as 'Category Group',productterritory as 'Diageo Priority' 
into tempdb..testtable 
from dgachildwebmain c join  dgapagedetailtable p on c.flyerid=p.flyerid where pagedetailid not in (select pagedetailid from dgapagedetailtable P join expansion.dbo.dgaVarietyCatMfrUpdate T on p.category=t.newcategory and p.brand=t.newbrand and p.manufacturer=t.newmfg and p.variety=t.newvariety) and category not in ('Unassigned - Beer','Unassigned - Beer Alternatives','Unassigned - Wine')

Exec MT2Dev1.master.dbo.sp_procExportDataNew
	@subject = 'DGA Unassigned Records - <date>'
	, @message = ''
	, @recipients = 'vkantawala@markettrack.com;'
	, @tabname = 'DGA Unassigned Records'
	, @filename = 'DGA Unassigned Records - <date>'
	, @servername = 'MT2SQL11'
	, @dbname = 'SQL11'
	, @query = 'select * from tempdb..testtable'
	, @exporttype = 'excel'





	, @query = 'select top 10 ''"http://www.featurevision.com/xls?CliId=357&C=1489&X=''+p.Flyerid+''&pdtid=''+p.Pagedetailid+''&Print=PI&ProductWithMidPage=true"'' as [PageProductImage],Advertiser as ''Account'',AdDate as ''Ad Date'',Publication as ''Newspaper'',Media as ''Media Type'',Market as ''Market'',district as ''State'',Category as ''Subcategory'',Brand as ''Brand'',variety as ''Subbrand'',origin as ''Origin'',unittype as ''Unit Type'',Comments1 as ''Product Description'',OfferDes as ''Offer Description'',SalePrice1 as ''Sale Price'',RegularPrice1 as ''Reg. Price'',NORPrice as ''NOR Price'',UnitPrice as ''Unit Price - Sale'',RegularPrice2 as ''Unit Price - Reg.'',RequiredQuantity as ''Pur Qty'',CouponValueP1 as ''% Off'',CouponValueD2 as ''$ Off'',OtherDiscountD2 as ''Rtl Cpn $'',OtherDiscountD1 as ''Mfr Cpn $'',TaggedCompany as ''Ad Type'',NumberPackage as ''Limit'',LowestDiscountPrice as ''Save Up To'',PageEvent as ''Promotions'',Features as ''Page Position'',SaleStartDate as ''Sale Start Date'',SaleEndDate as ''Sale End Date'',Manufacturer as ''Supplier'',MerchandiseSubCat as ''Category'',MerchandiseCategory as ''Category Group'',productterritory as ''Diageo Priority'' from dgachildwebmain c join  dgapagedetailtable p on c.flyerid=p.flyerid where pagedetailid not in (select pagedetailid from dgapagedetailtable P join expansion.dbo.dgaVarietyCatMfrUpdate T on p.category=t.newcategory and p.brand=t.newbrand and p.manufacturer=t.newmfg and p.variety=t.newvariety) and category not in (''Unassigned - Beer'',''Unassigned - Beer Alternatives'',''Unassigned - Wine'')'



update tempdb..testtable set [page & product image]=replace([page & product image],'"','')