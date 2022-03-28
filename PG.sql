select * from tempdb..sj 

select * from tempdb..sj where clientrun=1 and codestatus=1 -- pending codes to be processed
select * from tempdb..sj where clientrun=2 and codestatus=1 --codes which are in progress as of now
select * from tempdb..sj where clientrun=0 and codestatus=0 --codes which are done for the day
select * from tempdb..sj where clientrun=2 and codestatus=2 -- codes which are failed
