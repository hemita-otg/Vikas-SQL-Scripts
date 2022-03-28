--drop table holdingmfrupdate

select distinct pagedetailid, mfr.manufacturer 
into sql11..holdingmfrupdate
from BCRPageDetailTAble_holding pdt
join (select Category, Case when MF.PL = 1 then MF.PLBrand else MF.[Brand] end As Brand, manufacturer
 	from masteradviewdata..tempmanufacturer MF where category in (
	select category from ftcompdatapullcategory)) mfr
on pdt.category=mfr.category and pdt.brand=mfr.brand
where not pdt.manufacturer = mfr.manufacturer
option (maxdop 1)


ALTER TABLE [dbo].[HoldingMfrUpdate] WITH NOCHECK ADD 
CONSTRAINT [PK_HoldingMfrUpdate] PRIMARY KEY  CLUSTERED 
(
[PageDetailID]
) WITH  FILLFACTOR = 90  ON [PRIMARY] 


