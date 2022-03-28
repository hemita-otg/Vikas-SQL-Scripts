Declare @vchrComments1 VARCHAR(4000)
Declare @vchrSQL VARCHAR(8000)
Declare @vchrCategory VARCHAR(255)
Declare @vchrRenamedCategory VARCHAR(255)
Set @vchrComments1 = ''
Set @vchrSQL = ''

DECLARE curCat cursor  
FOR SELECT DISTINCT Category, RenamedCategory FROM mcupdate where DatabaseCategory='TFN' and RealBrand = ''
OPEN curCat
FETCH NEXT FROM curCat INTO @vchrCategory, @vchrRenamedCategory
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @vchrComments1 = ''
	SELECT @vchrComments1 = @vchrComments1 + ' (COMMENTS1 LIKE ' + Comments1 + ') OR ' FROM MCUpdate 
		WHERE DatabaseCategory='TFN' AND RealBrand = '' AND Category = @vchrCategory
	SET @vchrcomments1 = '(Category = ''' + @vchrCategory + ''' AND (' + LEFT(@vchrComments1, len(@vchrComments1)-2) + '))'
	SET @vchrSQL = @vchrSQL + 'UPDATE sql01..tfnpageDetailTable SET Category = ''' + @vchrRenamedCategory + ''' WHERE ' + @vchrComments1 + ' OPTION (MAXDOP 1);'
	FETCH NEXT FROM curCat INTO @vchrCategory, @vchrRenamedCategory
END
CLOSE curCat
DEALLOCATE curCat
EXEC(@vchrSQL)

UPDATE SQL01.dbo.tfnPAgeDetailTable SET 
	Category = T.RenamedCategory
FROM SQL01.dbo.tfnPAgeDetailTable PDT JOIN ConversionControl..MCUpdate T
	ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand
WHERE T.DatabaseCategory IN('tfn') option (maxdop 1)
 
UPDATE SQL01.dbo.tfnPAgeDetailTable SET 
	Category = T.RenamedCategory
FROM SQL01.dbo.tfnPAgeDetailTable PDT JOIN ConversionControl..MCUpdate T
	ON PDT.Category = T.Category AND PDT.Brand = T.RealBrand AND PDT.Comments1 = T.Comments1
WHERE T.DatabaseCategory IN('tfn') option (maxdop 1)

