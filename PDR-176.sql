




Select Year(Addate),Month(Addate),advertiser,  Count(pagedetailid) from SQL17..ACFVDetailReports with (nolock)
Where Comments3 like '%hello toothpaste%'
Group by  Year(Addate),Month(Addate),advertiser