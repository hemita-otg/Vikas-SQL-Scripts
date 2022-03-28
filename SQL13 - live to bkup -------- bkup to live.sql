
--bkup to live -- Update [MT2SQL14].[Connection].dbo.DBParameters Set ActiveID = 1 where DatabaseParameterID =182 and not (ActiveID = 1)
--live to bkup -- Update [MT2SQL14].[Connection].dbo.DBParameters Set ActiveID = 2 where DatabaseParameterID =182 and not (ActiveID = 2)