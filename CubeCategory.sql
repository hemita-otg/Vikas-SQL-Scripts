/*
insert into cubecategory values(2578,getdate(),null)
insert into cubecategory values(3082,getdate(),null)
insert into cubecategory values(2810,getdate(),null)
*/
select * from cubecategory where categorycodeid in (1,2)
select * from vwCubeCategory where category in ('','')
select * from vwCategoryCode  where category in ('','')




