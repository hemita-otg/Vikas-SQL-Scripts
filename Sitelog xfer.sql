--select count(*) from Mt2SQL00.ArchiveSitelog.dbo.queryexecutionlogdetail


insert into Mt2SQL00.ArchiveSitelog.dbo.queryexecutionlogdetail
select * from queryexecutionlogdetail with (nolock)
where querylogid in (
select querylogid from queryexecutionlog with (nolock)
where month(starttime) in (1) and year(starttime)='2010'
)

