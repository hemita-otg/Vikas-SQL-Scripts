--MT2:
select * from mt2sql00.masteradviewdata.dbo.mcapvehiclepages where vehicleid=181044082 and pagenumber=24

--MT3SQL01 under mcap db:
select * from page where vehicleid='181044082'
select * from PageType

Select FVDisplayValue,P.PageTypeId , PT.PageTypeId,*
from VehiclePages vp with(nolock)
			inner join Page p  with(nolock) on P.vehicleId = vp.VehicleId and p.ImageName = vp.ImageName
			inner join Vehicle v  with(nolock) on v.vehicleId = vp.VehicleId 
			inner join (
			select PageTypeId, Descrip as PageType , FVSystemValue, FVDisplayValue  from 
			PageType  with(nolock) 
			union
			Select 'B', 'Base', null, null
			) pt on P.PageTypeId = PT.PageTypeId
			where vp.vehicleid=181044082 
			and PageNumber=24 


case when PageTypeId='B' and PageName=cast(BaseCount-1 as varchar) and BaseCount > 3 then 1 else 0 end as InsideBackPageInd 


select * from  masteradviewdata..adviewmain where flyerid in 
(19207721,19207723,19207729,19207731,19207732,19207737,19207738,19207739,19207741,19207742,19207744,19207746,19207750,19207753,19207755,19207758,19207760,19207761,19207763,19207764,19207766,19207767,19207768,19207769,19207771,19207772,19207774,19207775,19207777,19207779,19207780,19207782,19207783,19207784,19207786,19207788,19207810,19207811,19207813,19207814,19207816,19207817,19207818,19207820,19207821,19207823,19207824,19207825,19207826,19207827,19207828,19207829,19207830,19207831,19207832,19207833,19207864,19207865,19207866,19207869,19207870,19207871,19207872,19207873,19207875,19207876,19207877,19207878,19207879,19207880,19207881,19207882,19207884,19207885,19207886,19207887,19207888,19207889,19207891,19207892,19207893,19207894,19207895,19207897,19207899,19207902,19207905,19207906,19207909,19207911,19218996)
order by 2,3