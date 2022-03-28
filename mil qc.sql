use sql08


select MPVBrandPackSize,salestext2,SalesText6 				
,SalesNumeric1 				
,SalesNumeric2 				
,SalesNumeric3, * from mil50DetailReports where SalesText6='raley''s corp cta' and MPVBrandPackSize like '%henry%'


select * from  mil50MPVBrandPackSize where BrandPackSize like '%henry%'
select * from  mil50PDTUpdate 

select * from FVBrandPackSizeMapping where brandpacksize like '%henry%' and ProductTerritory =''