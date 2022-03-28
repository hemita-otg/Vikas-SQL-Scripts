SELECT name, range_begin, range_end, max_used,*
FROM MSmerge_identity_range mir
    INNER JOIN sysmergearticles sma ON mir.artid = sma.artid
WHERE is_pub_range = 1 --AND range_end <= max_used + pub_range
order by 4 desc


select distinct mediadetail into tempdb..md from MSmerge_conflict_IDDB_mediadetail
select * from sysmergesubscriptions where subid='A69A2D2B-13CC-4DED-876F-D86213A653C1'

select * from MSmerge_conflicts_info where reason_code=2627 order by MSrepl_create_time desc 

insert into iddb..brand (brand) 
(select a.brand from tempdb..b a left join iddb..brand b  on a.brand=b.brand where b.brand is null ) 

select *  from iddb..manufacturer a inner join tempdb..m  b  on a.manufacturer=b.manufacturer 


select distinct Manufacturer from tempdb..m 


select * from iddb..category where category='smart watch accessories' 
