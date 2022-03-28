with
c as (select Pagedetailid , Weight from CWU50DetailReports),
m as ( select PageDetailIDint, Weight from masteradviewdata.dbo.masterpagedetailtable)
select count(1) from c join m on c.Pagedetailid =m.PageDetailIDint 
where c.weight <> m.weight  