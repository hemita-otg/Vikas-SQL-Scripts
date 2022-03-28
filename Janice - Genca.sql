
Select Distinct Category, Brand, Comments3, Comments4, MPVVariety  
from SQL07..genca50tDetailReports 
Where ISNULL(MPVVariety,'')=''
and Category='Cereals - Ready to Eat'
and (Brand Like '%General Mills%' or Brand Like '%Kelloggs%' or Brand Like '%Quaker%')
union
Select Distinct Category, Brand, Comments3, Comments4, MPVVariety  
from SQL07..genca50tDetailReports 
Where ISNULL(MPVVariety,'')=''
and Category='Frozen Hot Snacks'
and (Brand Like '%Bagel Bites%' or Brand Like '%McCain%')
union
Select Distinct Category, Brand, Comments3, Comments4, MPVVariety  
from SQL07..genca50tDetailReports 
Where ISNULL(MPVVariety,'')=''
and Category='Yogurt'
and (Brand Like '%Yoplait%' or Brand Like '%Danone%')
Order By 1,2,3,4,5
