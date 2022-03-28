update v set MaxThumbnailsImagesSinglePPT=5000-- [ Max PageImage ThumbNail Single File (PPT) ], 
,MaxProductThumbnailImageSinglePPT=5000-- [ Max ProductImage ThumbNail Single File (PPT) ],
 ,MaxProductImageSinglePPT =5000-- [ Max ProductImage FullSize Single File (PPT) ],
  
,MaximumAllowedPDTRecords=5000--
, MaximumAllowedXLSSumRecords =5000-- [Summary MaxLimit (Xls)], 
,MaxSingleFileXLSRecordsEmail=5000-- [SingleFile MaxLimit for Email (Xls)]
, MaxSingleFileXlsRecordsDownload =5000--[SingleFile MaxLimit for Download (Xls)], 
--TotalXLSCwmRecords [TotalFlyer TillDate (Xls)], TotalXLSPDTRecords [TotalProduct TillDate (Xls)], TotalXLSSumPDTRecords [TotalSummary TillDate (Xls)]
   
   , MaxFullSizeImagesSinglePPT=5000-- [ Max PageImage FullSize Single File (PPT) ]
from vwuser v where clientid=285 --userid = 2535119