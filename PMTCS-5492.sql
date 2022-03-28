


Select Distinct CategoryCodeId,ClientName, C.Category, QueryName, FirstName, LastName, DefaultEmailAddress   
From ArchiveSub..SavedQueries Q
Join ArchiveSub..SavedQueriesDetail D
on Q.QueryID = D.QueryID 
Join ArchiveSub..vwUser U
On Q.UserId = U.UserID 
Left Join (Select ID, ClientName, Category, C.ClientID from  ArchiveSub..CategoryCode C
Join ArchiveSub..ClientProfile P on P.ClientID = C.ClientID ) C 
on C.ID=Q.CategoryCodeId  
Where DefaultEmailAddress Like '%snyderslance%'
Order by 1,2,3,4


Select * from ArchiveSub..vwUser Where FirstName='Chuck' and LastName='Bloch' 


Select * from ArchiveSub..Clientdatabases Where CategoryCodeID in (4634,4716)

Select Distinct SubscriptionName, D.EmailAddresses, QP.QueryName  
From ArchiveSub..Subscription Q
Join ArchiveSub..SubscriptionEmail D
on Q.SubscriptionID = D.SubscriptionID 
Join ArchiveSub..SubscriptionSavedQuery DS
on Q.SubscriptionID = DS.SubscriptionID 
Join ArchiveSub..vwUser U
On Q.UserId = U.UserID 
Join ArchiveSub..SavedQueries QP on QP.QueryID = DS.SQID  
Left Join (Select ID, ClientName, Category, C.ClientID from  ArchiveSub..CategoryCode C
Join ArchiveSub..ClientProfile P on P.ClientID = C.ClientID ) C 
on C.ID=Q.CategoryCodeId  
Where DefaultEmailAddress Like '%snyderslance%'
Order by 1,2,3,4