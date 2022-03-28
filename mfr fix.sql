use sql07

--Sea Of Red
select distinct manufacturer,category,brand from  CWU50detailreports where brand ='Sea Of Red' and category='wine'
select distinct manufacturer,category,brand from  BAR50detailreports where brand ='Sea Of Red' and category='wine'
select distinct manufacturer,category,brand from BFCb50detailreports where brand ='Sea Of Red' and category='wine'
select distinct manufacturer,category,brand from masteradviewdata..masterpagedetailtable where  brand ='Sea Of Red' and category='wine'


--Oyster Bay
select distinct manufacturer,category,brand from  CWU50detailreports where brand ='Oyster Bay' and category='wine'
select distinct manufacturer,category,brand from  BAR50detailreports where brand ='Oyster Bay' and category='wine'
select distinct manufacturer,category,brand from BFCb50detailreports where brand ='Oyster Bay' and category='wine'
select distinct manufacturer,category,brand from masteradviewdata..masterpagedetailtable where  brand ='Oyster Bay' and category='wine'
select distinct manufacturer,count(1) from masteradviewdata..masterpagedetailtable where  brand ='Oyster Bay' and category='wine' group by Manufacturer 


--Barossa Valley State
select distinct manufacturer,category,brand from  CWU50detailreports where brand ='Barossa Valley eState' and category='wine'
select distinct manufacturer,category,brand from  BAR50detailreports where brand ='Barossa Valley eState' and category='wine'
select distinct manufacturer,category,brand from BFCb50detailreports where brand ='Barossa Valley eState' and category='wine'
select distinct manufacturer,category,brand from masteradviewdata..masterpagedetailtable where  brand ='Barossa Valley eState' and category='wine'

select distinct manufacturer,count(1) from masteradviewdata..masterpagedetailtable where  brand ='Barossa Valley eState' and category='wine' group by Manufacturer 
select distinct manufacturer,count(1) from masterbeval..MasterBevALDetailReports  where  brand ='Barossa Valley eState' and category='wine' group by Manufacturer 