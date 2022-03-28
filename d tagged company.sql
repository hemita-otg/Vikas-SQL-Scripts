
SELECT distinct taggedcompany FROM ENTRYDATA..FSIEntryPagedetailtable WHERE PAGEDETAILID IN (
select PAGEDETAILID from masteradviewdata..masterfsipagedetailtable)

select * from entrydata..MasterRollupFlyerids where flyerid in (
select distinct flyerid into tempdb..f  from masterpagedetailtable where pagedetailid in (select pagedetailid from tempdb..d))

select distinct market  from MasterAdviewData..AdviewMain where flyerid in (select flyerid from tempdb..f)

select d.* into tempdb..us  from tempdb..d d  join masterpagedetailtable m on d.pagedetailid = m.PageDetailID join adviewmain a on a.flyerid =m.flyerid and a.market in 
('Atlanta, GA','Atlanta, GA-Email','Birmingham, AL','Boston, MA-Email','Chicago, IL-Email','Dallas, TX-Email','Denver, CO-Email','Los Angeles, CA-Email','Memphis, TN','Miami, FL','Nashville, TN','National','New York, NY-Email','Phoenix, AZ-Email','Representative-Email','San Francisco, CA-Email','Seattle, WA-Email','Tampa/St. Petersburg, FL-Email','Washington, DC-Email')



select distinct market  from MasterAdviewData..AdviewMain where flyerid in 
(
select FlyerID from entrydata..MasterRollupFlyerids where flyerid in (
select distinct flyerid  from masterpagedetailtable where pagedetailid in (select pagedetailid from tempdb..d))
)


select * from tempdb..f 
select * from tempdb..d 




select * from entrydata..MasterRollupFlyerids 
where flyerid in (


insert into entrydata..MasterRollupFlyerids
select flyerid  from tempdb..f 
where   flyerid not  in (select flyerid  from entrydata..MasterRollupFlyerids )