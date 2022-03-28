

update addisdateranges
set addate=cast(convert(char(11), addate, 101) as datetime)  ,
weekof=cast(convert(char(11), weekof, 101) as datetime),
admonth=cast(convert(char(11), admonth, 101) as datetime),
[month]=cast(convert(char(11), [month], 101) as datetime)
 where year(addate) in ('2011','2010')

