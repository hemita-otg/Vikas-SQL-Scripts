select category,brand,comments3,comments4,comments1,* from lorca50detailreports
where brand='l''oreal' and market='toronto, ontario' and comments3='selected' and media='flyer' and comments4='gel mascara/pencil'

select category,brand,comments3,comments4,comments1,* from masteradviewdata..masterpagedetailtable where pagedetailid='3087057Q493'
select * from masteradviewdata..masterpagedetailtable   where pagedetailid='3087057Q493' or pagedetailid in ('0664752Q551','0385789Q492','0325742Q492','0562019Q551','0234125Q551','0369800Q492')



select distinct category,brand,comments3,comments4,comments1 from lorca50detailreports where category='Cosmetics - Lip'


select category,brand,comments3,comments4,comments1,* from lorca50detailreports
where brand like 'L''Oreal Colour Riche%' and market='vancouver, bc' and comments3='1' and media='flyer - digital' and comments4='enamel' and saleprice1='7.99'