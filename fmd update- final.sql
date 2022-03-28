update PDT
set pageevent='Multiple Purchase'
from fmdpagedetailtable PDT 
where (not isnull(rtrim(ltrim([RequiredQuantity])),0) = 0 )--or rtrim(ltrim([RequiredQuantity])) = '')
and pageevent = '' 


insert into fmdmultiplepagevalues(pagedetailid,fieldname,fieldvalue)
select 
               distinct PDT.PageDetailid,'PageEvent' as Fieldname,'Multiple Purchase' as Fieldvalue 
from 
                fmdpagedetailtable PDT LEFT Outer Join fmdmultiplepagevalues MPV ON
                PDT.Pagedetailid=MPV.PageDetailid
where 
                (not isnull(rtrim(ltrim(pdt.[RequiredQuantity])),0) = 0 ) AND
                MPV.PageDetailid Is NULL AND (PDT.pageevent not like '%multiple purchase%') 

Declare @IsFull varchar(15)
select @isfull=isfull from mt2sql14.sitecontrol.dbo.categorycode where category='fmd'

IF @IsFull =1
Begin
	insert into fmdmultiplepagevalues(pagedetailid,fieldname,fieldvalue)
	select 
	                 distinct PDT.PageDetailid,'PageEvent' as Fieldname,'Multiple Purchase' as Fieldvalue 
	from 
	                fmdmultiplepagevalues MPV Inner Join fmdpagedetailtable PDT ON
	                PDT.Pagedetailid=MPV.PageDetailid
	where 
	                (not isnull(rtrim(ltrim(pdt.[RequiredQuantity])),0) = 0 ) AND
	                (NOT (fieldname = 'pageevent' AND FieldValue like '%multiple purchase%')) AND
	                (PDT.pageevent not like '%multiple purchase%')
End	
