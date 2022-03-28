



Select fv40, MaxThumbnailsImagesSinglePPT, MaxProductThumbnailImageSinglePPT, MaxProductImageSinglePPT, TotalNumberPPT,  MaxAllowedPPT, ClientID, MaxFullSizeImagesSinglePPT, * from vwuser where userid = 2535119
Select fv40, MaxThumbnailsImagesSinglePPT [ Max PageImage ThumbNail Single File (PPT) ], MaxProductThumbnailImageSinglePPT [ Max ProductImage ThumbNail Single File (PPT) ],
 MaxProductImageSinglePPT [ Max ProductImage FullSize Single File (PPT) ], TotalNumberPPT  [Total TillDate (PPT)],  MaxAllowedPPT [ Max Allowed (PPT) ], ClientID, MaxFullSizeImagesSinglePPT [ Max PageImage FullSize Single File (PPT) ]
 , * from vwuser where userid = 2535119


Select fv40, MaximumAllowedCWMRecords, MaximumAllowedPDTRecords, MaximumAllowedXLSSumRecords, MaxSingleFileXLSRecordsEmail, MaxSingleFileXlsRecordsDownload, TotalXLSCwmRecords, TotalXLSPDTRecords, TotalXLSSumPDTRecords, ClientID, * from vwuser where userid = 2368992
Select fv40, MaximumAllowedCWMRecords [FlyerLevel MaxLimit (Xls)], MaximumAllowedPDTRecords[ProductLevel MaxLimit (Xls)], MaximumAllowedXLSSumRecords [Summary MaxLimit (Xls)], 
MaxSingleFileXLSRecordsEmail [SingleFile MaxLimit for Email (Xls)], MaxSingleFileXlsRecordsDownload [SingleFile MaxLimit for Download (Xls)], 
TotalXLSCwmRecords [TotalFlyer TillDate (Xls)], TotalXLSPDTRecords [TotalProduct TillDate (Xls)], TotalXLSSumPDTRecords [TotalSummary TillDate (Xls)], ClientID, * from vwuser where userid = 2368992