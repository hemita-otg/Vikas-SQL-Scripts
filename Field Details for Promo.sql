------------------------General----------------------------------------------------------------------------------------------------
select * from vw_catinfo  
select * from MasterFields where fieldid=93
select * from tablenames where tableid=54

select * from vw_QvfcFields 
select * from vw_ReportFields 



------------------------Part 1 ----------------------------------------------------------------------------------------------------

select
case 
when (b.FVCCType =2) then 'PEP Basic Client'
when (b.FVCCType =4) then 'PEP Full Client'
when (b.FVCCType =6) then 'PEP Price Pulse CLient'
when (b.FVCCType =0) then 'Durable Client'
when (b.FVCCType =3) then 'Consumable Client'
when (b.FVCCType =7) then 'Puerto Rico Client'
when (b.FVCCType =1) then 'CR Client-AU/NZ client'
end as [ClientType],
a.FieldId as [Field ID],a.FieldName as [System Field Name],a.DisplayName as [Displayed field Name],
count(distinct b.ClientID)  as [No. of Clients]
from vw_ReportFields a 
join vw_catinfo b on a.CategoryCodeId=b.CategoryCodeId 
where a.DisplaySeq is not null and b.FVCCType =2 and a.DisplayName like '%brand%'
group by a.FieldId,a.FieldName,a.DisplayName,b.FVCCType
order by 1,2,3,4,5


--select distinct b.ClientName,b.FVCCType,b.HomePageLink from vw_ReportFields a 
--join vw_catinfo b on a.CategoryCodeId=b.CategoryCodeId
--where   b.FVCCType=1


------------------------Part 2 ----------------------------------------------------------------------------------------------------


select distinct
case 
when (b.FVCCType =2) then 'PEP Basic Client'
when (b.FVCCType =4) then 'PEP Full Client'
when (b.FVCCType =6) then 'PEP Price Pulse CLient'
when (b.FVCCType =0) then 'Durable Client'
when (b.FVCCType =3) then 'Consumable Client'
when (b.FVCCType =7) then 'Puerto Rico Client'
when (b.FVCCType =1) then 'CR Client-AU/NZ client'
end as [ClientType],
a.FieldId as [Field ID],
case 
when (a.FieldType=1) then 'PDT Field'
when (a.FieldType=2) then 'CWM Field'
when (a.FieldType=3) then 'MPV Field'
end as [Field Type],
a.FieldName as [System Field Name],
case 
when (a.FieldType=1) then 'Updated by DetailReports'
when (a.FieldType=2) then 'Updated by FlyerReports'
when (a.FieldType=3 and a.FieldName='PageEvent') then 'Updated by DisPageEvent'
when (a.FieldType=3 and a.FieldName='unittype') then 'Updated by DisUnitType'
when (a.FieldType=3 and a.FieldName='PageEvent') then 'Updated by DisEvent'
when (a.FieldType=3 and a.FieldName='PageTheme') then 'Updated by DisTheme'
when (a.FieldType=3 and a.FieldName='origin') then 'Updated by DisOrigin'
when (a.FieldType=3 and a.FieldName='variety') then 'Updated by DisVariety'
when (a.FieldType=3 and a.FieldName='Offer') then 'Updated by DisOffer'
when (a.FieldType=3 and a.FieldName='OfferType') then 'Updated by DisOfferType'
--when (a.FieldType=3 and a.FieldName='SKUType') then 'Updated by CustmSteps'
end as [ClientTable],FieldType,b.clientname as [Name Of client],count(b.HomePageLink) as [Database Count]
from vw_ReportFields a 
join vw_catinfo b on a.CategoryCodeId=b.CategoryCodeId 
where a.DisplaySeq is not null and a.FieldType in (1,2,3) 
group by b.FVCCType,a.FieldId,a.FieldName,a.FieldType,b.ClientName
order by 1,2,3,4,5

---not found any table for SKU and sku type,SKUDescription3,BrandPackSize,SalesText3,SalesText4,ACUPCCode field name and type =3

--select * from MasterFields where fieldname='SKUDescription3'
--select * from tablenames where tableid=54
--select * from vw_ReportFields a
--join vw_catinfo b on a.CategoryCodeId=b.CategoryCodeId
--where FieldType=3 and a.FieldName='SKUDescription3'

