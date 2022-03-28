Need some statistics from UPC database: 
- total # of records = 844737
- # of records with UPC populated = 103549
- # of records where categories are in attached "30" list. = 192172
- # of records where categories ar in attached "30 " list and UPC populated = 99266
- # of records where Page Position=Front Page = 71177
- # of records where Page Position=Front Page AND UPC populated. = 20446


select count(*) from prdupcpagedetailtable where len(skutype ) > 2

select count(*) from prdupcpagedetailtable where category in ('Bacon','Bath Tissue','Beer','Bottled Water - Enhanced','Bottled Water - Still','Canned Soup','Cereals - Ready to Eat',
'Coffee - Ground/Bean','Conditioners','Cookies','Crackers','Drinks - Sodas','Fr. Dessert','Fr. Novelties',
'Fr. Pizza','Fr. Pocket Sandwich','Fr. Single Srv Entrée','Hotdogs','Juice Drinks - SS Bulk','Juices - Chilled',
'Laundry Detergent','Paper Towels','Prepared Meals - Dry','Salads - Packaged','Shampoo','Snacks - Potato Chips',
'Snacks - Tortilla Chips','Sports Drinks','Toothpaste','Yogurt')



select count(*) from prdupcpagedetailtable where category in ('Bacon','Bath Tissue','Beer','Bottled Water - Enhanced','Bottled Water - Still','Canned Soup','Cereals - Ready to Eat',
'Coffee - Ground/Bean','Conditioners','Cookies','Crackers','Drinks - Sodas','Fr. Dessert','Fr. Novelties',
'Fr. Pizza','Fr. Pocket Sandwich','Fr. Single Srv Entrée','Hotdogs','Juice Drinks - SS Bulk','Juices - Chilled',
'Laundry Detergent','Paper Towels','Prepared Meals - Dry','Salads - Packaged','Shampoo','Snacks - Potato Chips',
'Snacks - Tortilla Chips','Sports Drinks','Toothpaste','Yogurt')
and len(skutype) > 2

select count(*) from prdupcpagedetailtable where features='front page'

select count(*) from prdupcpagedetailtable where features='front page' and len(skutype) > 2 