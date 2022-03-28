Declare @lTableString1 varchar(8000)
Declare @lTableString2 varchar(8000)
Declare @lTableString3 varchar(8000)

Declare @lHtmlString varchar(8000)
Declare @lHtmlString1 varchar(8000)
Declare @lHtmlString2 varchar(8000)
Declare @lHtmlString3 varchar(8000)

Declare @lDigitalAdHtmlString varchar(8000)
Declare @lDigitalAdHtmlString1 varchar(8000)
Declare @lDigitalAdHtmlString2 varchar(8000)
Declare @lDigitalAdHtmlString3 varchar(8000)


Declare @cClientCode varchar(15)
Declare @cCwm int
Declare @cPdt int
Declare @cMpv int
Declare @cClientServer varchar(50)

DECLARE @From varchar(100)
DECLARE @To varchar(1000)
DECLARE @CC varchar(1000)
DECLARE @Subject as varchar(500)
DECLARE @vcBody  varchar(2000)
DECLARE @CurrDate datetime
DECLARE @MailServerName VARCHAR(100)
DECLARE @BodyType varchar(100)
DECLARE @iMsg int
DECLARE @hr int
DECLARE @source varchar(255)
DECLARE @description varchar(500)
DECLARE @output varchar(1000)
DECLARE @MasterPdtDateTime datetime
DECLARE @MT2AStyle varchar(255)


SET @From = '"Market Track Automated Email" <sql@markettrack.com>'
SET @To = 'halapati@markettrack.com; vkantawala@markettrack.com'
--SET @CC = 'halapati@markettrack.com'
--SET @To = 'halapati@markettrack.com'
SET @MailServerName = '192.168.2.2'
SET @Subject = 'Master Vs Client Server RecordCount Compare'
SET @BodyType ='HTMLBODY'

SELECT @MasterPdtDateTime = crdate from MT2SQL00.MasterAdviewData.dbo.sysobjects where name = 'masterpagedetailtable' and xtype= 'U'

SET @lTableString1 = '<p><b><font size=2 face=Tahoma>MasterPageDetailTable : ' + CAST(@MasterPdtDateTime AS VARCHAR(50)) + '</font></b></p>'
SET @lTableString1 = @lTableString1 + '<table cellspacing=0 cellpadding=0><tr><td valign="top">'
SET @lTableString2 = '</td><td>&nbsp;</td><td valign="top">'
SET @lTableString3 = '</td></tr></table>'

SET @lHtmlString1 = ''
SET @lHtmlString2 = ''
SET @lHtmlString3 = ''
SET @lHtmlString = ''

SET @lDigitalAdHtmlString1 = ''
SET @lDigitalAdHtmlString2 = ''
SET @lDigitalAdHtmlString3 = ''
SET @lDigitalAdHtmlString = ''




--################################# Digital Ad Archives(CWM Only) ################################# 
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<tr bgcolor="#CCCCCC"><td colspan=3><b>Digital Ad Archives(CWM Only)</b></td></tr>'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<tr bgcolor="yellow">'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>ClientCode</td>'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>CWM</td>'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>ClientServer</td>'
SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '</tr>'

--IF NOT EXISTS(SELECT TableCode ClientCode, CWM, ClientServer FROM ComparedRecordCounts WHERE CWM <> 0 OR PDT <> 0 OR MPV<> 0)
--	RETURN

IF Cursor_Status('variable', 'DisplayValue') >= 0
BEGIN
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
END

DECLARE DisplayValue CURSOR FOR
	SELECT TableCode ClientCode, CWM, ClientServer FROM ComparedRecordCounts WHERE (CWM <> 0) 
	AND TableCode IN(SELECT TableCode FROM MasterRecordCounts WHERE ISNULL(IsPDT,0) = 0 AND ISNULL(ClientPDT,0) = 0)
	ORDER BY  ClientServer,TableCode

OPEN DisplayValue
FETCH NEXT FROM DisplayValue INTO @cClientCode, @cCwm, @cClientServer
WHILE @@Fetch_Status=0
BEGIN	

	SET @MT2AStyle =''
	IF @CClientServer = 'MT2ASQL07'
		SET @MT2AStyle = ' style="color:blue;" '

	IF LEN(@lDigitalAdHtmlString) > 7800
	BEGIN
		IF LEN(@lDigitalAdHtmlString1) > 7800
		BEGIN

			IF LEN(@lDigitalAdHtmlString2) > 7800
			BEGIN
				SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '<tr ' + @MT2AStyle + '>'
				SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '<td>' + @cClientCode + '</td>'
				SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
				SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '<td>' + @cClientServer + '</td>'
				SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '</tr>'
			END
			ELSE
			BEGIN
				SET @lDigitalAdHtmlString2 = @lDigitalAdHtmlString2 + '<tr ' + @MT2AStyle + '>'
				SET @lDigitalAdHtmlString2 = @lDigitalAdHtmlString2 + '<td>' + @cClientCode + '</td>'
				SET @lDigitalAdHtmlString2 = @lDigitalAdHtmlString2 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
				SET @lDigitalAdHtmlString2 = @lDigitalAdHtmlString2 + '<td>' + @cClientServer + '</td>'
				SET @lDigitalAdHtmlString2 = @lDigitalAdHtmlString2 + '</tr>'
			END
		END
		ELSE
		BEGIN
			SET @lDigitalAdHtmlString1 = @lDigitalAdHtmlString1 + '<tr ' + @MT2AStyle + '>'
			SET @lDigitalAdHtmlString1 = @lDigitalAdHtmlString1 + '<td>' + @cClientCode + '</td>'
			SET @lDigitalAdHtmlString1 = @lDigitalAdHtmlString1 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
			SET @lDigitalAdHtmlString1 = @lDigitalAdHtmlString1 + '<td>' + @cClientServer + '</td>'
			SET @lDigitalAdHtmlString1 = @lDigitalAdHtmlString1 + '</tr>'
		END

	END
	ELSE
	BEGIN
		SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<tr ' + @MT2AStyle + '>'
		SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>' + @cClientCode + '</td>'
		SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
		SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '<td>' + @cClientServer + '</td>'
		SET @lDigitalAdHtmlString = @lDigitalAdHtmlString + '</tr>'
	END

	FETCH NEXT FROM DisplayValue INTO @cClientCode, @cCwm, @cClientServer
END 
CLOSE DisplayValue
DEALLOCATE DisplayValue
	
SET @lDigitalAdHtmlString3 = @lDigitalAdHtmlString3 + '</table>'
--################################# Digital Ad Archives(CWM Only) ################################# 


--################################# Detail Databases(CWM and PDT) ################################# 
SET @lHtmlString = @lHtmlString + '<table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
SET @lHtmlString = @lHtmlString + '<tr bgcolor="#CCCCCC"><td colspan=5><b>Detail Databases(CWM and PDT)</b></td></tr>'
SET @lHtmlString = @lHtmlString + '<tr bgcolor="yellow">'
SET @lHtmlString = @lHtmlString + '<td>ClientCode</td>'
SET @lHtmlString = @lHtmlString + '<td>CWM</td>'
SET @lHtmlString = @lHtmlString + '<td>PDT</td>'
SET @lHtmlString = @lHtmlString + '<td>MPV</td>'
SET @lHtmlString = @lHtmlString + '<td>ClientServer</td>'
SET @lHtmlString = @lHtmlString + '</tr>'

--IF NOT EXISTS(SELECT TableCode ClientCode, CWM, PDT, MPV, ClientServer FROM ComparedRecordCounts WHERE CWM <> 0 OR PDT <> 0 OR MPV<> 0)
--	RETURN

IF Cursor_Status('variable', 'DisplayValue') >= 0
BEGIN
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
END
--SELECT TableCode ClientCode, CWM, PDT, MPV, ClientServer FROM ComparedRecordCounts WHERE CWM <> 0 OR PDT <> 0 OR MPV<> 0 ORDER BY  ClientServer,TableCode

DECLARE DisplayValue CURSOR FOR
	SELECT TableCode ClientCode, CWM, PDT, MPV, ClientServer FROM ComparedRecordCounts WHERE (CWM <> 0 OR PDT <> 0 OR MPV<> 0) 
	AND TableCode IN(SELECT TableCode FROM MasterRecordCounts WHERE IsPDT = 1 OR ClientPDT = 1)
	ORDER BY  ClientServer,TableCode

OPEN DisplayValue
FETCH NEXT FROM DisplayValue INTO @cClientCode, @cCwm, @cPdt, @cMpv, @cClientServer
WHILE @@Fetch_Status=0
BEGIN
	SET @MT2AStyle =''
	IF @CClientServer = 'MT2ASQL07'
		SET @MT2AStyle = ' style="color:blue;" '
		
	IF LEN(@lHtmlString) > 7800
	BEGIN
		IF LEN(@lHtmlString1) > 7800
		BEGIN

			IF LEN(@lHtmlString2) > 7800
			BEGIN
				SET @lHtmlString3 = @lHtmlString3 + '<tr ' + @MT2AStyle + '>'
				SET @lHtmlString3 = @lHtmlString3 + '<td>' + @cClientCode + '</td>'
				SET @lHtmlString3 = @lHtmlString3 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
				SET @lHtmlString3 = @lHtmlString3 + '<td>' + Cast(@cPdt as varchar(15)) + '</td>'
				SET @lHtmlString3 = @lHtmlString3 + '<td>' + Cast(@cMpv as varchar(15)) + '</td>'
				SET @lHtmlString3 = @lHtmlString3 + '<td>' + @cClientServer + '</td>'
				SET @lHtmlString3 = @lHtmlString3 + '</tr>'
			END
			ELSE
			BEGIN
				SET @lHtmlString2 = @lHtmlString2 + '<tr ' + @MT2AStyle + '>'
				SET @lHtmlString2 = @lHtmlString2 + '<td>' + @cClientCode + '</td>'
				SET @lHtmlString2 = @lHtmlString2 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
				SET @lHtmlString2 = @lHtmlString2 + '<td>' + Cast(@cPdt as varchar(15)) + '</td>'
				SET @lHtmlString2 = @lHtmlString2 + '<td>' + Cast(@cMpv as varchar(15)) + '</td>'
				SET @lHtmlString2 = @lHtmlString2 + '<td>' + @cClientServer + '</td>'
				SET @lHtmlString2 = @lHtmlString2 + '</tr>'
			END
		END
		ELSE
		BEGIN
			SET @lHtmlString1 = @lHtmlString1 + '<tr ' + @MT2AStyle + '>'
			SET @lHtmlString1 = @lHtmlString1 + '<td>' + @cClientCode + '</td>'
			SET @lHtmlString1 = @lHtmlString1 + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
			SET @lHtmlString1 = @lHtmlString1 + '<td>' + Cast(@cPdt as varchar(15)) + '</td>'
			SET @lHtmlString1 = @lHtmlString1 + '<td>' + Cast(@cMpv as varchar(15)) + '</td>'
			SET @lHtmlString1 = @lHtmlString1 + '<td>' + @cClientServer + '</td>'
			SET @lHtmlString1 = @lHtmlString1 + '</tr>'
		END

	END
	ELSE
	BEGIN
		SET @lHtmlString = @lHtmlString + '<tr ' + @MT2AStyle + '>'
		SET @lHtmlString = @lHtmlString + '<td>' + @cClientCode + '</td>'
		SET @lHtmlString = @lHtmlString + '<td>' + Cast(@cCwm as varchar(15)) + '</td>'
		SET @lHtmlString = @lHtmlString + '<td>' + Cast(@cPdt as varchar(15)) + '</td>'
		SET @lHtmlString = @lHtmlString + '<td>' + Cast(@cMpv as varchar(15)) + '</td>'
		SET @lHtmlString = @lHtmlString + '<td>' + @cClientServer + '</td>'
		SET @lHtmlString = @lHtmlString + '</tr>'
	END

	FETCH NEXT FROM DisplayValue INTO @cClientCode, @cCwm, @cPdt, @cMpv, @cClientServer
END 
CLOSE DisplayValue
DEALLOCATE DisplayValue

SET @lHtmlString3 = @lHtmlString3 + '</table>'
--################################# Detail Databases(CWM and PDT) ################################# 


--################################# HTML TABLE FOR MasterCWMPDTMPVCounts ################################# 
Declare @cAdviewMainCount int
Declare @cMasterPdtCount int
Declare @cMasterMpvCount int
Declare @cVarCWMCount int
Declare @cVarPDTCount int
Declare @cVarMPVCount int
Declare @lMasterCwmPdtMpvCountsString varchar(8000)

SET @lMasterCwmPdtMpvCountsString = ''
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<br><br><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<tr bgcolor="#CCCCCC"><td colspan=7><b>Master CWM | PDT | MPV Counts</b></td></tr>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<tr bgcolor="yellow">'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>ClientServer</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>AdviewMain</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>MasterPDT</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>MasterMPV</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>Variance CWM</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>Variance PDT</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>Variance MPV</td>'
SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '</tr>'

IF Cursor_Status('variable', 'DisplayValue') >= 0
BEGIN
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
END

DECLARE DisplayValue CURSOR FOR
	SELECT ClientServer, ISNULL(AdviewMain,0), ISNULL(MasterPDT,0), ISNULL(MasterMPV,0),
	ISNULL([Variance CWM],0) , ISNULL([Variance PDT],0), ISNULL([Variance MPV],0)  
	FROM MasterCWMPDTMPVCounts WHERE ClientServer <> 'MT2DEV1' Order by ClientServer


	--SELECT ClientServer, AdviewMain, MasterPDT, MasterMPV, [Variance CWM], [Variance PDT], [Variance MPV]  FROM MasterCWMPDTMPVCounts Order by ClientServer

OPEN DisplayValue
FETCH NEXT FROM DisplayValue INTO @cClientServer, @cAdviewMainCount, @cMasterPdtCount, @cMasterMpvCount, @cVarCWMCount, @cVarPDTCount, @cVarMPVCount
WHILE @@Fetch_Status=0
BEGIN	
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<tr>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + @cClientServer + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cAdviewMainCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cMasterPdtCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cMasterMpvCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cVarCWMCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cVarPDTCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '<td>' + Cast(@cVarMPVCount as varchar(20)) + '</td>'
	SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '</tr>'

	FETCH NEXT FROM DisplayValue INTO @cClientServer, @cAdviewMainCount, @cMasterPdtCount, @cMasterMpvCount, @cVarCWMCount, @cVarPDTCount, @cVarMPVCount
END 
CLOSE DisplayValue
DEALLOCATE DisplayValue

SET @lMasterCwmPdtMpvCountsString = @lMasterCwmPdtMpvCountsString + '</table>'
--################################# HTML TABLE FOR MasterCWMPDTMPVCounts ################################# 

--################################# HTML TABLE FOR ClientServer FullRundate ################################# 

Declare @lFullRunDate varchar(50) --datetime
Declare @lFullRunHtmlString varchar(8000)
Declare @lFullRunHtmlString1 varchar(8000)
Declare @lFullRunHtmlString2 varchar(8000)
Declare @lFullRunHtmlString3 varchar(8000)
Declare @lFullRunHtmlString4 varchar(8000)
Declare @cTempClientServer varchar(50)

SET @cTempClientServer = ''
SET @lFullRunHtmlString1 = ''
SET @lFullRunHtmlString2 = ''
SET @lFullRunHtmlString3 = ''
SET @lFullRunHtmlString4 = ''
SET @lFullRunHtmlString = ''

SET @lFullRunHtmlString = '<br><br><table cellspacing=0 cellpadding=0 width=1800><tr>'

IF Cursor_Status('variable', 'DisplayValue') >= 0
BEGIN
	CLOSE DisplayValue
	DEALLOCATE DisplayValue
END

DECLARE DisplayValue CURSOR FOR
	SELECT RTRIM(Category), RTRIM(ClientServer), ISNULL(Cast(ClientFullRundate as varchar(50)),'')
	FROM mt2sql04.sitecontrol.dbo.CATEGORYCODE WHERE  (Ispdt=1 or ClientPDT=1)  
	AND FullSourceCode <> 'FsiEntry' order by ClientServer, ClientFullRundate, Category

OPEN DisplayValue
FETCH NEXT FROM DisplayValue INTO @cClientCode, @cClientServer, @lFullRunDate
WHILE @@Fetch_Status=0
BEGIN
	IF LEN(@lFullRunHtmlString) > 7600
	BEGIN
		IF LEN(@lFullRunHtmlString1) > 7600
		BEGIN

			IF LEN(@lFullRunHtmlString2) > 7600
			BEGIN
				IF LEN(@lFullRunHtmlString3) > 7600
				BEGIN
					IF @cTempClientServer <> @cClientServer
					BEGIN
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '</table></td>'
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<tr bgcolor="#CCCCCC"><td colspan=2><b>' + UPPER(@cClientServer) + '</b></td></tr>'
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<tr bgcolor="yellow">'
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<td>ClientCode</td>'
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<td>FullRunDate</td>'			
						SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '</tr>'
					END
	
					SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<tr>'
					SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<td>' + @cClientCode + '</td>'
					SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '<td>' + Cast(@lFullRunDate as varchar(50)) + '</td>'
					SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '</tr>'
				END
				ELSE			
				BEGIN
					IF @cTempClientServer <> @cClientServer
					BEGIN
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '</table></td>'
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<tr bgcolor="#CCCCCC"><td colspan=2><b>' + UPPER(@cClientServer) + '</b></td></tr>'
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<tr bgcolor="yellow">'
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<td>ClientCode</td>'
						SET @lFullRunHtmlString2 = @lFullRunHtmlString3 + '<td>FullRunDate</td>'			
						SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '</tr>'
					END
	
					SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<tr>'
					SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<td>' + @cClientCode + '</td>'
					SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '<td>' + Cast(@lFullRunDate as varchar(50)) + '</td>'
					SET @lFullRunHtmlString3 = @lFullRunHtmlString3 + '</tr>'
				END
			END
			ELSE
			BEGIN

				IF @cTempClientServer <> @cClientServer
				BEGIN
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '</table></td>'
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<tr bgcolor="#CCCCCC"><td colspan=2><b>' + UPPER(@cClientServer) + '</b></td></tr>'
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<tr bgcolor="yellow">'
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<td>ClientCode</td>'
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<td>FullRunDate</td>'			
					SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '</tr>'
				END

				SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<tr>'
				SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<td>' + @cClientCode + '</td>'
				SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '<td>' + Cast(@lFullRunDate as varchar(50)) + '</td>'
				SET @lFullRunHtmlString2 = @lFullRunHtmlString2 + '</tr>'
			END
		END
		ELSE
		BEGIN
			IF @cTempClientServer <> @cClientServer
			BEGIN
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '</table></td>'
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<tr bgcolor="#CCCCCC"><td colspan=2><b>' + UPPER(@cClientServer) + '</b></td></tr>'
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<tr bgcolor="yellow">'
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<td>ClientCode</td>'
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<td>FullRunDate</td>'			
				SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '</tr>'
			END

			SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<tr>'
			SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<td>' + @cClientCode + '</td>'
			SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '<td>' + Cast(@lFullRunDate as varchar(50)) + '</td>'
			SET @lFullRunHtmlString1 = @lFullRunHtmlString1 + '</tr>'
		END

	END
	ELSE
	BEGIN
		IF @cTempClientServer <> @cClientServer
		BEGIN
			--SET @lFullRunHtmlString = @lFullRunHtmlString + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
			IF @lFullRunHtmlString = '<br><br><table cellspacing=0 cellpadding=0 width=1800><tr>' 
				SET @lFullRunHtmlString = @lFullRunHtmlString + '<td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'
			ELSE
				SET @lFullRunHtmlString = @lFullRunHtmlString + '</table></TD><td valign="top"><table border="1" cellspacing=0 style="font-family:verdana;font-size:10pt">'

			SET @lFullRunHtmlString = @lFullRunHtmlString + '<tr bgcolor="#CCCCCC"><td colspan=2><b>' + UPPER(@cClientServer) + '</b></td></tr>'
			SET @lFullRunHtmlString = @lFullRunHtmlString + '<tr bgcolor="yellow">'
			SET @lFullRunHtmlString = @lFullRunHtmlString + '<td>ClientCode</td>'
			SET @lFullRunHtmlString = @lFullRunHtmlString + '<td>FullRunDate</td>'			
			SET @lFullRunHtmlString = @lFullRunHtmlString + '</tr>'
		END

		SET @lFullRunHtmlString = @lFullRunHtmlString + '<tr>'
		SET @lFullRunHtmlString = @lFullRunHtmlString + '<td>' + @cClientCode + '</td>'
		SET @lFullRunHtmlString = @lFullRunHtmlString + '<td>' + Cast(@lFullRunDate as varchar(50)) + '</td>'
		SET @lFullRunHtmlString = @lFullRunHtmlString + '</tr>'
	END

	SET @cTempClientServer = @cClientServer
	FETCH NEXT FROM DisplayValue INTO @cClientCode, @cClientServer, @lFullRunDate
END 
CLOSE DisplayValue
DEALLOCATE DisplayValue

SET @lFullRunHtmlString4 = @lFullRunHtmlString4 + '</table></td></tr></table>'

--PRINT @lFullRunHtmlString + char(13)
--PRINT @lFullRunHtmlString1 + char(13)
--PRINT @lFullRunHtmlString2 + char(13)
--PRINT @lFullRunHtmlString3 + char(13)
--PRINT @lFullRunHtmlString4 + char(13)
--################################# HTML TABLE FOR ClientServer FullRundate ################################# 

SET NOCOUNT OFF
/*
PRINT @lTableString1
PRINT @lDigitalAdHtmlString
PRINT @lDigitalAdHtmlString1
PRINT @lDigitalAdHtmlString2
PRINT @lDigitalAdHtmlString3
PRINT @lTableString2
PRINT @lHtmlString
PRINT @lHtmlString1
PRINT @lHtmlString2
PRINT @lHtmlString3
PRINT @lTableString3
*/
EXEC @hr = sp_OACreate 'CDO.Message', @iMsg OUT
EXEC @hr = sp_OASetProperty @iMsg,'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusing").Value','2'

-- Replace MailServerName by the name or IP of your SMTP Server.
EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpserver").Value', @MailServerName 
EXEC @hr = sp_OAMethod @iMsg, 'Configuration.Fields.Update', null
EXEC @hr = sp_OASetProperty @iMsg, 'To', @To
EXEC @hr = sp_OASetProperty @iMsg, 'From', @From
EXEC @hr = sp_OASetProperty @iMsg, 'CC', @CC
EXEC @hr = sp_OASetProperty @iMsg, 'Subject', @Subject

-- If you are using HTML e-mail, use 'HTMLBody' instead of 'TextBody'.
--EXEC @hr = sp_OASetProperty @iMsg, @BodyType , @lHtmlString
EXECUTE('sp_OASetProperty ' + @iMsg + ',''' + @BodyType + ''',''' + @lTableString1 + @lDigitalAdHtmlString + @lDigitalAdHtmlString1 + @lDigitalAdHtmlString2 + @lDigitalAdHtmlString3 + @lTableString2 + @lHtmlString + @lHtmlString1 + @lHtmlString2 + @lHtmlString3 + @lTableString3 + @lMasterCwmPdtMpvCountsString + @lFullRunHtmlString + @lFullRunHtmlString1 + @lFullRunHtmlString2 + @lFullRunHtmlString3 + @lFullRunHtmlString4 + '''')
EXEC @hr = sp_OAMethod @iMsg, 'Send', NULL
--PRINT @hr
-- Sample error handling.
IF @hr <>0 
BEGIN
	select @hr
	EXEC @hr = sp_OAGetErrorInfo NULL, @source OUT, @description OUT
	IF @hr = 0
	BEGIN
		SELECT @output = ' Source: ' + @source
		PRINT @output
		SELECT @output = ' Description: ' + @description
		PRINT @output
	END
	ELSE
	BEGIN
		PRINT ' sp_OAGetErrorInfo failed.'
		RETURN
	END
END
ELSE
BEGIN
	--print 'hello'
	TRUNCATE TABLE MasterRecordCounts
	TRUNCATE TABLE ClientRecordCounts
	TRUNCATE TABLE ComparedRecordCounts	
	TRUNCATE TABLE MT2AClientRecordCounts
	TRUNCATE TABLE MT2AMasterCWMPDTMPVCounts
END

-- Do some error handling after each step if you need to.
-- Clean up the objects created.
EXEC @hr = sp_OADestroy @iMsg
