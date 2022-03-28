--- Produce

--Update C Set Comments1=PDT.Comments1
--From dmfCAN50DetailReports C
--Join MasterAdviewData..MasterPageDetailTable PDT
--On PDT.PageDetailID = C.OriginalPageDetailID  
--Where PDT.Category in (Select Category from MasterClientCoverage.DBO.JaAllDisplayCategory)

Update dmfCAN50DetailReports Set Comments1=
case
            when [PkgSize] is not null and ltrim(rtrim([PkgSize])) <> '' 
            then replace(replace(IsNull([PkgSize],''),char(10),''),char(13),'') + 
                case when ([UnitType] is not null and ltrim(rtrim([UnitType])) <> '') or
				([MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '') or 
				([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') or
				([comments1] is not null and ltrim(rtrim([comments1])) <> '') then ', ' else '' end
            else ''
              end +
              case
            when [UnitType] is not null and ltrim(rtrim([UnitType])) <> '' 
            then replace(replace(IsNull([UnitType],''),char(10),''),char(13),'') + 
                case when ([MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '') or 
				([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') or
				([comments1] is not null and ltrim(rtrim([comments1])) <> '') then ', ' else '' end
            else ''
              end + 			   
              case
            when [MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '' 
            then replace(replace(IsNull([MPVVariety],''),char(10),''),char(13),'') + 
                case when ([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') or
				([comments1] is not null and ltrim(rtrim([comments1])) <> '') then ', ' else '' end
            else ''
              end + 
			case
           when ([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') 
            then replace(replace(IsNull([MPVOrigin],''),char(10),''),char(13),'') + 
                case when ([comments1] is not null and ltrim(rtrim([comments1])) <> '') then ', ' else '' end
           else ''
             end +
              case
            when [comments1] is not null and ltrim(rtrim([comments1])) <> '' 
            then replace(replace(IsNull([comments1],''),char(10),''),char(13),'')
            else ''
              end
			  from dmfCAN50DetailReports PDT Join TEMPDB..TMCC9DD51E1006E4F2DAC2DFED8900AE805 MC
			  on PDT.Category = MC.Category 
Where MC.RealCategory in (Select Category from MasterClientCoverage.DBO.JaAllDisplayCategory)

Select Comments1,PkgSize, UnitType, MPVVariety, MPVOrigin From dmfCAN50DetailReports
Where Category in (Select Category from MasterClientCoverage.DBO.JaAllDisplayCategory)

---Alcohol 

--Update C Set Comments1=PDT.Comments1
--From dmfCAN50DetailReports C
--Join MasterAdviewData..MasterPageDetailTable PDT
--On PDT.PageDetailID = C.OriginalPageDetailID  
--Where PDT.Category in ('Beer','Beer Alternatives','Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Gin','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine') 

Update dmfCAN50DetailReports Set Comments1=
case
           when [UnitType] is not null and ltrim(rtrim([UnitType])) <> ''
           then replace(replace(IsNull([UnitType],''),char(10),''),char(13),'') +
               case when ([comments1] is not null and ltrim(rtrim([comments1])) <> '')
                or ([MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '') or ([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') then ', ' else '' end
           else ''
             end +
           case
           when [comments1] is not null and ltrim(rtrim([comments1])) <> ''
           then replace(replace(IsNull([comments1],''),char(10),''),char(13),'') +
               case when ([MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '') or ([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') then ', ' else '' end
           else ''
             end + 
            case
           when ([MPVVariety] is not null and ltrim(rtrim([MPVVariety])) <> '') 
            then replace(replace(IsNull([MPVVariety],''),char(10),''),char(13),'') + 
                case when ([MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> '') then ', ' else '' end
           else ''
             end +
           case
           when [MPVOrigin] is not null and ltrim(rtrim([MPVOrigin])) <> ''
           then replace(replace(IsNull([MPVOrigin],''),char(10),''),char(13),'')
       else '' end
	   	  from dmfCAN50DetailReports PDT Join TEMPDB..TMCC9DD51E1006E4F2DAC2DFED8900AE805 MC
			  on PDT.Category = MC.Category 
Where MC.RealCategory in ('Beer','Beer Alternatives','Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Gin','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine') 



Select UnitType, Comments1, MPVVariety, MPVOrigin From dmfCAN50DetailReports
Where Category in ('Beer','Beer Alternatives','Blended Whisky','Brandy','Canadian Whisky','Cordials & Liqueurs','Dessert Wines','Gin','Rum','Scotch Whisky','Sparkling Wines','Spirit Cocktails','Straight Bourbon Whiskey','Tequila','Vodka','Wine') 
