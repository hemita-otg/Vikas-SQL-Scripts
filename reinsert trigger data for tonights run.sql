

	truncate table masterclientcoverage.dbo.NotLoadedPDT
	truncate table masterclientcoverage.dbo.NotLoadedMPV
	truncate table masterclientcoverage.dbo.NotLoadedDeleted 


	Insert Into  masterclientcoverage.dbo.NotLoadedPDT Select * from masterclientcoverage.dbo.TEMPJAPagedetailtable
	Insert Into masterclientcoverage.dbo.NotLoadedMPV Select * from masterclientcoverage.dbo.TEMPJAMultiplePageValues
	Insert Into  masterclientcoverage.dbo.NotLoadedDeleted (PageDetailID) Select pagedetailid from masterclientcoverage.dbo.TEMPJAPDTDelete 



