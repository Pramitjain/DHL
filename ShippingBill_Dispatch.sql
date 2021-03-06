USE [ShippingBill_Dispatch]
GO
/****** Object:  User [KUL-DC\indiadsk]    Script Date: 2/4/2021 11:05:28 AM ******/
CREATE USER [KUL-DC\indiadsk] FOR LOGIN [KUL-DC\indiadsk] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PRG-DC\UDLDHL-SQLmigdist]    Script Date: 2/4/2021 11:05:29 AM ******/
CREATE USER [PRG-DC\UDLDHL-SQLmigdist] FOR LOGIN [PRG-DC\UDLDHL-SQLmigdist]
GO
ALTER ROLE [db_owner] ADD MEMBER [PRG-DC\UDLDHL-SQLmigdist]
GO
/****** Object:  UserDefinedTableType [dbo].[GetAwb]    Script Date: 2/4/2021 11:05:31 AM ******/
CREATE TYPE [dbo].[GetAwb] AS TABLE(
	[awb] [varchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_ExtractTool_CSB5Extract_Type]    Script Date: 2/4/2021 11:05:31 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_ExtractTool_CSB5Extract_Type] AS TABLE(
	[f_HAWB_Number] [varchar](10) NULL,
	[f_Port_of_Loading] [varchar](6) NULL,
	[f_CSB_Number] [nvarchar](16) NULL,
	[f_Filling_Date] [datetime] NULL,
	[f_Import_Export_Code_IEC] [nvarchar](30) NULL,
	[f_GSTIN_OTHER_ID] [nvarchar](100) NULL,
	[f_GSTIN_Type] [nvarchar](100) NULL,
	[f_State_Code] [nvarchar](2) NULL,
	[f_BOND_OR_UT] [nvarchar](20) NULL,
	[f_Invoice_Number] [nvarchar](300) NULL,
	[f_Invoice_Value_in_INR] [decimal](18, 2) NULL,
	[f_Total_IGST_Paid] [nvarchar](100) NULL,
	[f_LEO_DATE] [date] NULL,
	[f_EGM_Number] [nvarchar](16) NULL,
	[f_EGM_Date] [date] NULL,
	[f_Unit_Price_Currency] [nvarchar](20) NULL,
	[f_Exchange_Rate] [decimal](10, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertCSB5Extract_type]    Script Date: 2/4/2021 11:05:43 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertCSB5Extract_type] AS TABLE(
	[f_HAWB_Number] [varchar](20) NULL,
	[f_Port_of_Loading] [varchar](100) NULL,
	[f_CSB_Number] [nvarchar](100) NULL,
	[f_Filling_Date] [varchar](100) NULL,
	[f_Import_Export_Code_(IEC)] [varchar](100) NULL,
	[f_GSTIN/OTHER_ID] [varchar](50) NULL,
	[f_GSTIN_Type] [varchar](50) NULL,
	[f_State_Code] [varchar](10) NULL,
	[f_Invoice_Number] [varchar](100) NULL,
	[f_Invoice_Value_(in_INR)] [decimal](18, 2) NULL,
	[f_LEO_DATE] [varchar](100) NULL,
	[f_EGM_Number] [varchar](100) NULL,
	[f_EGM_Date] [varchar](100) NULL,
	[f_AccountNo] [varchar](100) NULL,
	[f_SumofTotal_IGSTPaid] [varchar](100) NULL,
	[f_BOND_OR_UT] [varchar](100) NULL,
	[f_ExchangeRate] [decimal](18, 2) NULL,
	[f_URN] [varchar](100) NULL,
	[f_Currency] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertGSTDetails_type]    Script Date: 2/4/2021 11:05:52 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertGSTDetails_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_GSTINNO] [varchar](200) NULL,
	[f_GSTINEmailId] [varchar](200) NULL,
	[f_GSTFileDirectory] [varchar](300) NULL,
	[f_GSTFilePath] [varchar](500) NULL,
	[f_GSTExcelFilePath] [varchar](500) NULL,
	[f_AWBSplitedCount] [int] NULL,
	[f_GIAClubCount] [int] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertPdf_LineItemDetails_type]    Script Date: 2/4/2021 11:06:01 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertPdf_LineItemDetails_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_HAWB_Number] [varchar](20) NULL,
	[f_CTSH] [varchar](100) NULL,
	[f_Goods_Description] [varchar](250) NULL,
	[f_Quantity] [varchar](100) NULL,
	[f_Unit_Price] [varchar](100) NULL,
	[f_Total_Item_Value] [varchar](100) NULL,
	[f_Unit_Price_Currency] [varchar](100) NULL,
	[f_Exchange_Rate] [varchar](100) NULL,
	[f_Total_Item_Value_In_INR] [varchar](100) NULL,
	[f_Total_Taxable_Value] [varchar](100) NULL,
	[f_Taxable_Value_Currency] [varchar](10) NULL,
	[f_Total_IGST_Paid] [varchar](100) NULL,
	[f_BOND_OR_UT] [varchar](10) NULL,
	[f_Total_CESS_Paid] [varchar](100) NULL,
	[f_CreatedBy] [varchar](100) NULL,
	[f_CreatedUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertPdfDetails_CSBIII_type]    Script Date: 2/4/2021 11:06:17 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertPdfDetails_CSBIII_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_CSB_Number] [nvarchar](100) NULL,
	[f_Courier_Registration_Number] [varchar](100) NULL,
	[f_Courier_Name] [varchar](100) NULL,
	[f_Address_1] [varchar](2000) NULL,
	[f_Address_2] [varchar](2000) NULL,
	[f_City] [varchar](50) NULL,
	[f_Postal_Zip_Code] [varchar](40) NULL,
	[f_State] [varchar](50) NULL,
	[f_Airlines] [varchar](200) NULL,
	[f_Flight_Number] [varchar](100) NULL,
	[f_EGM_Number] [varchar](100) NULL,
	[f_EGM_Date] [varchar](100) NULL,
	[f_DomesticAirlines] [varchar](100) NULL,
	[f_Domestic_Flight_Number] [varchar](100) NULL,
	[f_Airport_of_Departure] [varchar](100) NULL,
	[f_Airport_of_Destination] [varchar](100) NULL,
	[f_Date_of_Departure] [varchar](100) NULL,
	[f_ExpectedDateOf_LandingAtDestination] [varchar](100) NULL,
	[f_Manifest_Weight] [varchar](100) NULL,
	[f_Manifest_ActualWeight] [varchar](100) NULL,
	[f_NO_MAWB_Number] [varchar](20) NULL,
	[f_NO_HAWB_Number] [varchar](20) NULL,
	[f_Number_of_Packages_Pieces_Bags_ULD] [varchar](100) NULL,
	[f_CSBStatus] [varchar](20) NULL,
	[f_ItemDetailsCount] [int] NULL,
	[f_PageCount] [varchar](100) NULL,
	[f_CreatedBy] [varchar](100) NULL,
	[f_CreatedUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertPdfDetails_CSBIV_type]    Script Date: 2/4/2021 11:06:41 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertPdfDetails_CSBIV_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_CSB_Number] [nvarchar](100) NULL,
	[f_Courier_Registration_Number] [varchar](100) NULL,
	[f_Courier_Name] [varchar](100) NULL,
	[f_Address_1] [varchar](2000) NULL,
	[f_Address_2] [varchar](2000) NULL,
	[f_City] [varchar](50) NULL,
	[f_Postal_Zip_Code] [varchar](40) NULL,
	[f_State] [varchar](50) NULL,
	[f_Airlines] [varchar](200) NULL,
	[f_Flight_Number] [varchar](100) NULL,
	[f_EGM_Number] [varchar](100) NULL,
	[f_EGM_Date] [varchar](100) NULL,
	[f_Airport_of_Departure] [varchar](100) NULL,
	[f_Airport_of_Destination] [varchar](100) NULL,
	[f_Date_of_Departure] [varchar](100) NULL,
	[f_Manifest_Weight] [varchar](100) NULL,
	[f_Manifest_ActualWeight] [varchar](100) NULL,
	[f_MAWB_Number] [varchar](20) NULL,
	[f_HAWB_Number] [varchar](20) NULL,
	[f_Number_of_Packages_Pieces_Bags_ULD] [varchar](100) NULL,
	[f_Status] [varchar](20) NULL,
	[f_Declared_Weight_in_Kgs] [varchar](100) NULL,
	[f_ValueIN_USD] [varchar](20) NULL,
	[f_Goods_Description] [varchar](1000) NULL,
	[f_Name_of_the_Consignor] [varchar](200) NULL,
	[f_Address_of_the_Consignor] [varchar](500) NULL,
	[f_Name_of_the_Consignee] [varchar](200) NULL,
	[f_Address_of_the_Consignee] [varchar](500) NULL,
	[f_GST_INVOICE_No] [varchar](100) NULL,
	[f_GST_INVOICE_Date] [varchar](20) NULL,
	[f_ExportInvoice_No] [varchar](20) NULL,
	[f_ExportInvoice_Date] [varchar](100) NULL,
	[f_Payment_of_IGST] [varchar](20) NULL,
	[f_Total_IGST_Paid] [varchar](20) NULL,
	[f_Supply_BondOrUT] [varchar](100) NULL,
	[f_ADCODE] [varchar](100) NULL,
	[f_GSTIN_TYPE] [varchar](100) NULL,
	[f_GSTIN_ID] [varchar](100) NULL,
	[f_PageCount] [varchar](100) NULL,
	[f_CreatedBy] [varchar](100) NULL,
	[f_CreatedUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertPdfDetails_type]    Script Date: 2/4/2021 11:07:09 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertPdfDetails_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_CSB_Number] [nvarchar](100) NULL,
	[f_Filling_Date] [varchar](100) NULL,
	[f_Courier_Registration_Number] [varchar](100) NULL,
	[f_Courier_Name] [varchar](100) NULL,
	[f_Address_1] [varchar](2000) NULL,
	[f_Address_2] [varchar](2000) NULL,
	[f_City] [varchar](50) NULL,
	[f_Postal/Zip_Code] [varchar](40) NULL,
	[f_State] [varchar](50) NULL,
	[f_Custom_Station_Name] [varchar](100) NULL,
	[f_Airlines] [varchar](200) NULL,
	[f_Flight_Number] [varchar](100) NULL,
	[f_Port_of_Loading] [varchar](100) NULL,
	[f_Date_of_Departure] [varchar](100) NULL,
	[f_HAWB_Number] [varchar](20) NULL,
	[f_Number_of_Packages_/Pieces_/_Bags_/_ULD] [varchar](100) NULL,
	[f_Declared_Weight(in_Kgs)] [varchar](100) NULL,
	[f_Airport_of_Destination] [varchar](10) NULL,
	[f_Import_Export_Code_(IEC)] [varchar](100) NULL,
	[f_IEC_Branch_Code] [varchar](10) NULL,
	[f_Invoice_Term] [varchar](10) NULL,
	[f_MHBS_No] [varchar](100) NULL,
	[f_Export_Using_e-Commerce] [varchar](10) NULL,
	[f_Under_MEIS_Scheme] [varchar](10) NULL,
	[f_AD_Code] [varchar](100) NULL,
	[f_Status] [varchar](20) NULL,
	[f_LEO_DATE] [varchar](100) NULL,
	[f_EGM_Number] [varchar](100) NULL,
	[f_EGM_Date] [varchar](100) NULL,
	[f_Name_of_the_Consignor] [varchar](200) NULL,
	[f_Address_of_the_Consignor] [varchar](500) NULL,
	[f_Name_of_the_Consignee] [varchar](200) NULL,
	[f_Address_of_the_Consignee] [varchar](500) NULL,
	[f_FOB_Value_(In_INR)] [varchar](100) NULL,
	[f_GSTIN_Type] [varchar](50) NULL,
	[f_GSTIN/OTHER_ID] [varchar](50) NULL,
	[f_State_Code] [varchar](10) NULL,
	[f_Invoice_Number] [varchar](100) NULL,
	[f_Invoice_Date] [varchar](100) NULL,
	[f_Invoice_Value_(in_INR)] [varchar](100) NULL,
	[f_CRN_Number] [varchar](100) NULL,
	[f_CRN_MHBS_Number] [varchar](100) NULL,
	[f_PageCount] [varchar](100) NULL,
	[f_ItemDetailsCount] [varchar](100) NULL,
	[f_GIAFileName] [varchar](300) NULL,
	[f_CreatedBy] [varchar](100) NULL,
	[f_CreatedUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_InsertPdfLineItem_Details_CSBIII_type]    Script Date: 2/4/2021 11:07:41 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_InsertPdfLineItem_Details_CSBIII_type] AS TABLE(
	[f_PdfHdr_Sequence] [varchar](100) NULL,
	[f_PdfDtl_Sequence] [varchar](100) NULL,
	[f_MAWB_Number] [varchar](20) NULL,
	[f_HAWB_Number] [varchar](20) NULL,
	[f_HAWBStatus] [varchar](500) NULL,
	[f_CreatedBy] [varchar](100) NULL,
	[f_CreatedUserId] [varchar](100) NULL,
	[f_CreatedIp] [varchar](40) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[USP_ShippingBill_SearchAWB]    Script Date: 2/4/2021 11:07:47 AM ******/
CREATE TYPE [dbo].[USP_ShippingBill_SearchAWB] AS TABLE(
	[awb] [varchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_Update_CSB5History_ExtractTool_Status_type]    Script Date: 2/4/2021 11:07:48 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_Update_CSB5History_ExtractTool_Status_type] AS TABLE(
	[AWB] [varchar](20) NULL,
	[IECNumber] [varchar](100) NULL,
	[IsSuccess] [bit] NULL DEFAULT ((0)),
	[IsError] [varchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[usp_ShippingBill_Update_GIADetails_type]    Script Date: 2/4/2021 11:07:53 AM ******/
CREATE TYPE [dbo].[usp_ShippingBill_Update_GIADetails_type] AS TABLE(
	[f_HAWB_Number] [varchar](10) NULL,
	[f_FileMoveToGIA] [bit] NULL,
	[f_GIAFilePath] [varchar](300) NULL,
	[f_GIAFileMove_Date] [datetime] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[CSB_5_Tracker1]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CSB_5_Tracker1
CREATE PROCEDURE [dbo].[CSB_5_Tracker1]
AS
BEGIN
--File Log
SELECT OriginalFileName AS [FileName]
	  ,FileName AS 'ModifiedFileName'
      ,ISNULL((SELECT f_UserName FROM t_ShippingBill_Users WHERE f_UserId=[UploadedByUserID]),'') AS 'UserName'      
	  ,CONVERT(VARCHAR,UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime]        
	  ,FileSize
	  ,TotalPages
	  ,IsProceed
FROM [dbo].[CSB_5_Uploaded_File_Details]
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,UploadedDateTime,103)
ORDER BY UploadedDateTime DESC

--schedular_run_log
SELECT SchedularNo,SchedularType,
CONVERT(VARCHAR,EntryDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, EntryDateTime), 'HH:mm:ss')) AS  [UploadedDateTime]  
,TotalItemFound
,Description      
FROM CSB_5_schedular_run_log
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,EntryDateTime,103)
ORDER BY EntryDateTime DESC
END


GO
/****** Object:  StoredProcedure [dbo].[CSB_5_Tracker2]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CSB_5_Tracker2
CREATE PROCEDURE [dbo].[CSB_5_Tracker2]
AS
BEGIN
--Barcode issues
SELECT Upload.Ref_fileID, Upload.OriginalFileName AS 'FileName',
CONVERT(VARCHAR,Upload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, Upload.UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
(SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=Upload.UploadedByUserID) AS 'UploadedBy',
bar.PageNumber,
bar.Description AS 'ErrorDescription',
bar.DirectoryName+'\'+bar.FileName AS 'ErrorFileLocation'
FROM CSB_5_Barcode_not_found_files bar LEFT JOIN CSB_5_Uploaded_File_Details Upload
ON bar.Ref_FileID=Upload.Ref_fileID
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,Upload.UploadedDateTime,103)
ORDER BY EntryDateTime DESC

--Export issues
SELECT Upload.OriginalFileName AS 'FileName',
CONVERT(VARCHAR,Upload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, Upload.UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
(SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=Upload.UploadedByUserID) AS 'UploadedBy',
export.ErrorDescription AS 'ErrorDescription',
export.ErrorDirectory+'\'+export.FileName AS 'ErrorFileLocation'
FROM CSB_5_Export_Error_files export LEFT JOIN CSB_5_Uploaded_File_Details Upload
ON export.Ref_FileID=Upload.Ref_fileID
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,Upload.UploadedDateTime,103)
ORDER BY ErrorDateTime DESC
END


GO
/****** Object:  StoredProcedure [dbo].[CSB_5_Tracker3]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CSB_5_Tracker3
CREATE PROCEDURE [dbo].[CSB_5_Tracker3]
AS
BEGIN
--CSB_5_Split_GIA_file_details
SELECT ISNULL(UserUpload.Ref_fileID,0) AS Ref_fileID,
ISNULL(UserUpload.OriginalFileName,'') AS 'FileName',
ISNULL(CONVERT(VARCHAR,UserUpload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UserUpload.UploadedDateTime), 'hh:mm:ss tt')),'') AS  [UploadedDateTime],
ISNULL((SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=UserUpload.UploadedByUserID),'') AS 'UploadedBy',
split.PageNumber,
split.SplitFileName,
split.GSTIN,
split.URN AS 'UniqueSequnceNo',
CONVERT(VARCHAR,SplitEntryDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, SplitEntryDateTime), 'hh:mm:ss tt')) AS  'SplitDateTime',
ISNULL((SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=UserUpload.UploadedByUserID),'') AS 'UploadedBy',
[GIAFileName]  AS 'GIAFileName',
CONVERT(VARCHAR,GIAFileNameUpdatedDatetime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, GIAFileNameUpdatedDatetime), 'hh:mm:ss tt')) AS  'GIAFileUploadedDateTime',
IsEntryUpdatedCSB5HistoryTable
FROM CSB_5_Split_GIA_file_details split LEFT JOIN CSB_5_Uploaded_File_Details UserUpload
ON split.Ref_FileID=UserUpload.Ref_fileID
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,UserUpload.UploadedDateTime,103)
ORDER BY PageNumber ASC,UserUpload.UploadedDateTime DESC

--FTP FileUploadStatus
SELECT ISNULL(UserUpload.Ref_fileID,0) AS Ref_fileID,
ISNULL(UserUpload.OriginalFileName,'') AS 'FileName',
ISNULL(CONVERT(VARCHAR,UserUpload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UserUpload.UploadedDateTime), 'hh:mm:ss tt')),'') AS  [UploadedDateTime],
ISNULL((SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=UserUpload.UploadedByUserID),'') AS 'UploadedBy',
[GIAFileName]  AS 'GIAFileName',
CONVERT(VARCHAR,FileUploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, FileUploadedDateTime), 'hh:mm:ss tt')) AS  'GIAFileUploadedDateTime',
UploadedStatus,
StatusDescription
FROM CSB_5_FTPFileUploadStatus FTP INNER JOIN CSB_5_Uploaded_File_Details UserUpload
ON FTP.Ref_FileID=UserUpload.Ref_fileID
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,UserUpload.UploadedDateTime,103)
ORDER BY GIAFileUploadedDateTime DESC

END


GO
/****** Object:  StoredProcedure [dbo].[CSB_5_Tracker4]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CSB_5_Tracker4
CREATE PROCEDURE [dbo].[CSB_5_Tracker4]
AS
BEGIN
--CSB_5_schedular_error_log
SELECT SchedularType,
ISNULL(CONVERT(VARCHAR,ErrorDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, ErrorDateTime), 'hh:mm:ss tt')),'') AS  'ErrorDateTime',
ErrorFunctionName,
ErrorDescritpion
FROM CSB_5_schedular_error_log
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,ErrorDateTime,103)
ORDER BY ErrorDateTime DESC

--CSB_5_DB_Errors

SELECT FileName AS 'InputValue',ErrorNumber,ErrorState,ErrorLine,ErrorProcedure,ErrorMessage,
ISNULL(CONVERT(VARCHAR,ErrorDateTime,103)+SPACE(1)+(FORMAT(CONVERT(DATETIME, ErrorDateTime), 'hh:mm:ss tt')),'') AS  [UploadedDateTime]
FROM CSB_5_DB_Errors
WHERE CONVERT(DATE,GETDATE()-2,103) <= CONVERT(DATE,ErrorDateTime,103)
ORDER BY ErrorDateTime DESC

END


GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_AddGIAFileBase64Content]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 08/07/2020
-- Description:	Add GIA file content in base 64 string format
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_AddGIAFileBase64Content]	
	@GSTIN VARCHAR(20),
	@GIAFileName VARCHAR(30),
	@GIAFileContent VARCHAR(MAX),
	@RefFileContentID NUMERIC(18,0) OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION

	IF EXISTS(SELECT 1 FROM CSB_5_GIAFileInBase64StringFormat WHERE GSTIN=@GSTIN AND GIAFileName=@GIAFileName)
	BEGIN
		UPDATE CSB_5_GIAFileInBase64StringFormat
		SET IsActive=0
		WHERE GSTIN=@GSTIN AND GIAFileName=@GIAFileName
	END

	INSERT INTO [dbo].[CSB_5_GIAFileInBase64StringFormat]
           ([GSTIN]
           ,[GIAFileName]
           ,[GIAFileContent]
           ,[GIAFileEntryDateTime]
		   ,[IsActive])
     VALUES
           (@GSTIN
           ,@GIAFileName
           ,@GIAFileContent
           ,GETDATE()
		   ,1)
    SET @RefFileContentID=SCOPE_IDENTITY()

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
 SET @RefFileContentID=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_barcode_not_found_log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 10/06/2020
-- Description:	Barcode not found log
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_barcode_not_found_log]	
	@Ref_FileID NUMERIC(18,0),
	@PageNumber INT,
	@FileName VARCHAR(200),
	@DirectoryName VARCHAR(1000),
	@Description VARCHAR(1000),
	@Result_Code INT OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO [dbo].[CSB_5_Barcode_not_found_files]
           ([Ref_FileID]
           ,[PageNumber]
           ,[FileName]
           ,[EntryDateTime]
		   ,[DirectoryName]
		   ,[Description])
     VALUES
           (@Ref_FileID
           ,@PageNumber
           ,@FileName
           ,GETDATE()
		   ,@DirectoryName
		   ,@Description)

    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('Barcode_not_found_log',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_Check_IsFileUploaded]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 19/05/2020
-- Description:	Check file already uploaded with same name on same date
-- =============================================                    
CREATE PROCEDURE [dbo].[usp_CSB_5_Check_IsFileUploaded]                     
 @OriginalFileNameFileName  VARCHAR(200),          
 @Result_Code VARCHAR(50) OUTPUT            
AS              
BEGIN TRY    
	IF EXISTS( SELECT 1 FROM [dbo].[CSB_5_Uploaded_File_Details] 
			   WHERE LOWER(LTRIM(RTRIM(OriginalFileName)))=LOWER(LTRIM(RTRIM(@OriginalFileNameFileName)))
			   AND CONVERT(DATE,UploadedDateTime,103)=CONVERT(DATE,GETDATE(),103)
	          )
	BEGIN
	SET @Result_Code=1
	END
	ELSE
	BEGIN
	SET @Result_Code=0
	END
END TRY
BEGIN CATCH
	SET @Result_Code=0
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_DownloadGetGIAFilesWithBase64StringContent]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 09/07/2020
-- Description:	Get GIA files for download page with Base64String content
-- usp_CSB_5_DownloadGetGIAFilesWithBase64StringContent '07AAACG4699N1ZY','08-07-2020','09-07-2020',''
-- =============================================                    
CREATE PROCEDURE [dbo].[usp_CSB_5_DownloadGetGIAFilesWithBase64StringContent]   
 @GSTIN VARCHAR(20),          
 @FromDate VARCHAR(10),          
 @ToDate VARCHAR(10),
 @UserID VARCHAR(200)=null                              
AS              
BEGIN TRY    
SELECT RefFileContentID,
       CONVERT(VARCHAR,(GIAFileEntryDateTime-1),103) AS 'CreatedDate',
	   ISNULL(GIAFileName,'') AS 'GIAFileName',
	   GIAFileContent 
FROM   CSB_5_GIAFileInBase64StringFormat
WHERE  GSTIN=@GSTIN
	   AND CONVERT(DATE,(GIAFileEntryDateTime-1),105) BETWEEN CONVERT(DATE,@FromDate,105)  AND CONVERT(DATE,@ToDate,105) 
	   AND IsActive=1
ORDER  BY GIAFileEntryDateTime DESC
END TRY
BEGIN CATCH
SELECT 'Error'
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_export_error_file_log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 13/06/2020
-- Description:	Export error file log
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_export_error_file_log]	
	@FileName VARCHAR(200),
	@ErrorDirectory VARCHAR(1000),
	@ErrorDescription VARCHAR(1000),
	@Result_Code INT OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION

DECLARE @Ref_FileID NUMERIC(18,0)
SET @Ref_FileID=(SELECT TOP 1 Ref_FileID 
			     FROM CSB_5_Uploaded_File_Details 
			     WHERE [FileName]=@FileName)

INSERT INTO [dbo].[CSB_5_Export_Error_files]
           ([Ref_FileID]
           ,[FileName]
           ,[ErrorDateTime]
           ,[ErrorDirectory]
           ,[ErrorDescription])
     VALUES
           (@Ref_FileID
           ,@FileName
           ,GETDATE()
           ,@ErrorDirectory
           ,@ErrorDescription)

    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES(@FileName,ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_FileNotProceededForEmail]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kiran Posture
-- Create date: 14/06/2020
-- Description:	Get list of files which were uploaded on yesterday but not proceeded yet
-- usp_CSB_5_FileNotProceededForEmail
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_FileNotProceededForEmail]	
AS
BEGIN TRY

SELECT UserUpload.OriginalFileName AS 'FileName',
CONVERT(VARCHAR,UserUpload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UserUpload.UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
(SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=UserUpload.UploadedByUserID) AS 'UploadedBy'
FROM CSB_5_Uploaded_File_Details UserUpload
WHERE IsProceed=0 
AND CONVERT(DATE,UserUpload.UploadedDateTime,103)=CONVERT(DATE,(GETDATE()-1),103) --- Yesterday Date

END TRY
BEGIN CATCH
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_FileUpload]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 11/05/2020
-- Description:	Add file details
-- =============================================                    
CREATE PROCEDURE [dbo].[usp_CSB_5_FileUpload]              
 @UserID INT,       
 @OriginalFileNameFileName  VARCHAR(200),
 @FileName VARCHAR(200),            
 @FileSize NUMERIC(18,0),
 @TotalPages INT,
 @FilePath VARCHAR(400),  
 @IPAddress VARCHAR(50),            
 @Result_Code VARCHAR(50) OUTPUT            
AS              
BEGIN TRY    
BEGIN TRANSACTION                        
   
INSERT INTO [dbo].[CSB_5_Uploaded_File_Details]
           ([OriginalFileName]
		   ,[FileName]
           ,[FileSize]
           ,[TotalPages]
           ,[FileFullPath]
           ,[UploadedByUserID]
           ,[UploadedDateTime]
           ,[IPAddress]
		   ,[IsProceed])
VALUES(@OriginalFileNameFileName,@FileName,@FileSize,@TotalPages,@FilePath,@UserID,GETDATE(),@IPAddress,0)
	SET @Result_Code='File uploaded successfully'
COMMIT TRANSACTION;      
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
	SET @Result_Code='Error occured while uploading file'
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_FTPFailureUploadStatusForEmail]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 30/06/2020
-- Description:	Get FTP errors details for email
-- usp_CSB_5_FTPFailureUploadStatusForEmail
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_FTPFailureUploadStatusForEmail]	
AS
BEGIN TRY

SELECT FileLogID,GIAFileName,FTPUrl,
CONVERT(VARCHAR,FileUploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, FileUploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
UploadedStatus,StatusDescription 
FROM CSB_5_FTPFileUploadStatus
WHERE LOWER(UploadedStatus)!='success'
AND IsFailureEmailSend=0

END TRY
BEGIN CATCH
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH




GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_FTPFileUploadStatus]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 22/05/2020
-- Description:	Update FTP File upload status
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_FTPFileUploadStatus]		
	@GIAFileName VARCHAR(200)=NULL,
	@FTPUrl VARCHAR(300)=NULL,
	@UploadedStatus VARCHAR(20)=NULL,
	@StatusDescription VARCHAR(MAX)=NULL,	
	@SessionID VARCHAR(50)=NULL,	
	@Result_Code VARCHAR(10) OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION
	IF NOT EXISTS(SELECT 1 FROM CSB_5_FTPFileUploadStatus WHERE LTRIM(RTRIM([GIAFileName]))=LTRIM(RTRIM(@GIAFileName)))
	BEGIN
	INSERT INTO [dbo].[CSB_5_FTPFileUploadStatus]
           ([Ref_FileID]
		   ,[GIAFileName]
           ,[FTPUrl]
           ,[FileUploadedDateTime]
           ,[UploadedStatus]
           ,[StatusDescription])
     VALUES
           (0,
		    @GIAFileName,
		    @FTPUrl,
            GETDATE(),
            @UploadedStatus,
            @StatusDescription)
	END
	ELSE
	BEGIN
		UPDATE CSB_5_FTPFileUploadStatus
		SET UploadedStatus=@UploadedStatus,
		StatusDescription=@StatusDescription,
		IsFailureEmailSend=0		
		WHERE LTRIM(RTRIM([GIAFileName]))=LTRIM(RTRIM(@GIAFileName))
	END

SET @Result_Code=1
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES(@GIAFileName,ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH




GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_Get_RefFileID]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kiran Posture
-- Create date: 19/05/2020
-- Description:	Get Ref File ID for Table CSB_5_split_file_details
-- usp_CSB_5_Get_RefFileID 'abc.pdf',''
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_Get_RefFileID]	
@UploadedFileName VARCHAR(200),
@Ref_FileID INT OUTPUT
AS
BEGIN TRY

SET @Ref_FileID=ISNULL((SELECT TOP 1 Ref_FileID 
			     FROM CSB_5_Uploaded_File_Details 
			     WHERE [FileName]=@UploadedFileName),0)
END TRY
BEGIN CATCH
SET @Ref_FileID=0
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES(@UploadedFileName,ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_Get_UploadedFile_List]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 11/05/2020
-- Description:	Get uploaded File Details
-- =============================================                    
--usp_CSB_5_Get_UploadedFile_List 1,1,20,'',''
CREATE PROCEDURE [dbo].[usp_CSB_5_Get_UploadedFile_List]      
     @UserID INT,        
	 @PageIndex INT =1,
	 @PageSize INT =5,
	 @Searchtxt VARCHAR(200) = null,
	 @TotalRow BIGINT  OUTPUT  
AS              
BEGIN TRY
	BEGIN TRANSACTION  
 
SELECT 
	   ROW_NUMBER() OVER(ORDER BY Ref_fileID ) as [RowNumber]
      ,[Ref_fileID] AS [Id]
      ,[OriginalFileName]
      ,[FileName]
      ,[FileSize]
      ,[TotalPages]      
      ,ISNULL((SELECT f_UserName FROM t_ShippingBill_Users WHERE f_UserId=[UploadedByUserID]),'') AS 'UserName'
      --,CONVERT(VARCHAR,UploadedDateTime,103)+SPACE(1)+CONVERT(VARCHAR,UploadedDateTime,108) AS  [UploadedDateTime]
	  ,CONVERT(VARCHAR,UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime]
      ,[IPAddress]
  INTO #CSB_5_TempTable
  FROM [dbo].[CSB_5_Uploaded_File_Details]
  WHERE ((LTRIM(RTRIM(LOWER(OriginalFileName))) LIKE LOWER('%'+LTRIM(RTRIM(@Searchtxt))+'%')  OR  ISNULL(@Searchtxt,'') = '')
  OR (CONVERT(VARCHAR,UploadedDateTime,103) LIKE LOWER(LTRIM(RTRIM(@Searchtxt)))  OR  ISNULL(@Searchtxt,'') = '')
  )


 SET @TotalRow = (SELECT COUNT(1) FROM #CSB_5_TempTable)

 SELECT * FROM #CSB_5_TempTable 
 WHERE RowNumber BETWEEN(@PageIndex-1) * @PageSize +1  AND (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1
 ORDER BY  Id DESC

 DROP TABLE #CSB_5_TempTable

 COMMIT TRANSACTION;
END TRY
BEGIN CATCH
IF @@TRANCOUNT>0
ROLLBACK TRANSACTION;

 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_GetErrorLogDetailsForEmail]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kiran Posture
-- Create date: 13/06/2020
-- Description:	Get Error log details for email
-- usp_CSB_5_GetErrorLogDetailsForEmail
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_GetErrorLogDetailsForEmail]	
AS
BEGIN TRY

--Barcode issues
SELECT Upload.Ref_fileID, Upload.OriginalFileName AS 'FileName',
CONVERT(VARCHAR,Upload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, Upload.UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
(SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=Upload.UploadedByUserID) AS 'UploadedBy',
bar.PageNumber,
bar.Description AS 'ErrorDescription',
bar.DirectoryName+'\'+bar.FileName AS 'ErrorFileLocation'
FROM CSB_5_Barcode_not_found_files bar LEFT JOIN CSB_5_Uploaded_File_Details Upload
ON bar.Ref_FileID=Upload.Ref_fileID
WHERE CONVERT(DATE,bar.EntryDateTime,103)=CONVERT(DATE,(GETDATE()-1),103) -- Yesterday Date

--Export issues
SELECT Upload.OriginalFileName AS 'FileName',
CONVERT(VARCHAR,Upload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, Upload.UploadedDateTime), 'hh:mm:ss tt')) AS  [UploadedDateTime],
(SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=Upload.UploadedByUserID) AS 'UploadedBy',
export.ErrorDescription AS 'ErrorDescription',
export.ErrorDirectory+'\'+export.FileName AS 'ErrorFileLocation'
FROM CSB_5_Export_Error_files export LEFT JOIN CSB_5_Uploaded_File_Details Upload
ON export.Ref_FileID=Upload.Ref_fileID
WHERE CONVERT(DATE,export.ErrorDateTime,103)=CONVERT(DATE,(GETDATE()-1),103) --- Yesterday Date

END TRY
BEGIN CATCH
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_GetGIAFileDetailsForEmail]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kiran Posture
-- Create date: 23/05/2020
-- Description:	Get FTP files upload log details for email funcatinality
-- usp_CSB_5_GetGIAFileDetailsForEmail
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_GetGIAFileDetailsForEmail]	
AS
BEGIN TRY

SELECT ISNULL(UserUpload.Ref_fileID,0) AS Ref_fileID,
ISNULL(UserUpload.OriginalFileName,'') AS 'FileName',
ISNULL(CONVERT(VARCHAR,UserUpload.UploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, UserUpload.UploadedDateTime), 'hh:mm:ss tt')),'') AS  [UploadedDateTime],
ISNULL((SELECT TOP 1 ISNULL(f_UserName,'') FROM t_ShippingBill_Users WHERE f_UserId=UserUpload.UploadedByUserID),'') AS 'UploadedBy',
[GIAFileName]  AS 'GIAFileName',
CONVERT(VARCHAR,FileUploadedDateTime,103)+SPACE(1)+(FORMAT(CONVERT(datetime, FileUploadedDateTime), 'hh:mm:ss tt')) AS  'GIAFileUploadedDateTime',
UploadedStatus,
StatusDescription
FROM CSB_5_FTPFileUploadStatus FTP LEFT JOIN CSB_5_Uploaded_File_Details UserUpload
ON FTP.Ref_FileID=UserUpload.Ref_fileID
WHERE CONVERT(DATE,FileUploadedDateTime,103)=CONVERT(DATE,GETDATE(),103)    ---Today's Date
ORDER BY UserUpload.Ref_fileID

END TRY
BEGIN CATCH
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_GSTIN_merge_schedular2_Log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 18/05/2020
-- Description:	Update GIA filename in CSB5History Table of manifestpriniting database
-- Note : SessionID is made from SplitFileName by removing Underscore and .pdf text
-- usp_CSB_5_GSTIN_merge_schedular2_Log '15921725.pdf','15921725','15921725_3',''
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_GSTIN_merge_schedular2_Log]	
	@GIAFileName VARCHAR(100),
	@GSTIN VARCHAR(20),	
	@SessionIDs VARCHAR(MAX),
	@RefFileBaseContentID NUMERIC(18,0),
	@FileID VARCHAR(20) OUTPUT
AS
BEGIN TRY
	BEGIN TRANSACTION

	--Step 1 : Get Ref_FileID for FTP Details table for log process
	SET @FileID=ISNULL((SELECT TOP 1 Ref_FileID 
					    FROM CSB_5_Split_GIA_file_details
					    WHERE GSTIN=@GSTIN 	
						AND LOWER(SessionID) IN (SELECT LOWER(Value) FROM fnSplitString(@SessionIDs,','))									    
					  ),0)

	-- STEP 2 : This will update GIAFileName for previous day uploaded files based on GSTIN & SessionID
    UPDATE CSB_5_Split_GIA_file_details
	SET    GIAFileName=@GIAFileName,
	       RefFileContentID=@RefFileBaseContentID,
		   GIAFileNameUpdatedDatetime=GETDATE()
	WHERE  GSTIN=@GSTIN 	
	       AND LOWER(SessionID) IN (SELECT LOWER(Value) FROM fnSplitString(@SessionIDs,','))		     
	

	-- STEP 3 : This will update GIAFileName in CSB5History table of ManifestPrinting Database
	-- Imp Note : Will uncomment once system go on live

	UPDATE hist
	SET    hist.GIA_FILENAME=split.GIAFileName
	FROM   [ManifestPrinting].[dbo].[CSB5History] hist WITH(NOLOCK,NOWAIT) INNER JOIN CSB_5_Split_GIA_file_details split WITH(NOLOCK,NOWAIT) 
		   ON LTRIM(RTRIM(hist.GSTIN)) =LTRIM(RTRIM(split.GSTIN)) 
	       AND REPLACE(REPLACE(hist.UniqueID,'_',''),' ','')= LTRIM(RTRIM(split.URN))
	WHERE  split.GSTIN=@GSTIN 	
	       AND LOWER(SessionID) IN (SELECT LOWER(Value) FROM fnSplitString(@SessionIDs,','))	
	    

	 -- STEP 4 : This will update IsEntryUpdatedCSB5HistoryTable=1 once the GIAFileName updated in CSB5History Table
	 UPDATE CSB_5_Split_GIA_file_details
	 SET    IsEntryUpdatedCSB5HistoryTable=1
	 WHERE  GSTIN=@GSTIN 	 
			AND LOWER(SessionID) IN (SELECT LOWER(Value) FROM fnSplitString(@SessionIDs,','))			      

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
 SET @FileID=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES(@GIAFileName,ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_GSTIN_Split_schedular1_Log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 18/05/2020
-- Description:	Add Split File Log Details using Schedular 1
-- usp_CSB_5_GSTIN_Split_schedular1_Log 1,'36AAECD2585L1ZB','AI0161_DEL_09302019_CSB5_02'
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_GSTIN_Split_schedular1_Log]
    @PageNumber INT,		
	@GSTIN VARCHAR(20),
	@UniqueSequnceNo VARCHAR(50),
	@CurrentDateTime VARCHAR(50),
	@Ref_FileID NUMERIC(18,0),
	@Result_Code VARCHAR(10) OUTPUT
AS
BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [dbo].[CSB_5_Split_GIA_file_details]
           ([PageNumber]		
		   ,[Ref_FileID]
           ,[GSTIN]
           ,[URN]
           ,[SplitDate]
		   ,[SplitEntryDateTime]
		   ,[RefFileContentID])
     VALUES
           (@PageNumber,		    
		    @Ref_FileID,
            @GSTIN,
            @UniqueSequnceNo,
            CONVERT(DATE,@CurrentDateTime,103),
			GETDATE(),
			0)
    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
 SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_schedular_error_Log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 18/05/2020
-- Description:	Add Schedular error log
-- =============================================
--usp_CSB_5_schedular_error_Log 1,'Call-put','Error',''
CREATE PROCEDURE [dbo].[usp_CSB_5_schedular_error_Log]	
	@SchedularNo INT,
	@ErrorFunctionName VARCHAR(100),
	@ErrorDescritpion VARCHAR(4000),
	@Result_Code VARCHAR(10) OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION


INSERT INTO [dbo].[CSB_5_schedular_error_log]
           ([SchedularNo]
           ,[SchedularType]
           ,[ErrorDateTime]
           ,[ErrorFunctionName]
           ,[ErrorDescritpion])
     VALUES
           (@SchedularNo,
            (CASE WHEN @SchedularNo=1 THEN 'Split' 
			      WHEN @SchedularNo=2 THEN 'GIA' 
				  WHEN @SchedularNo=3 THEN 'Download' 
				  ELSE 'Other' END),
            GETDATE(),
            @ErrorFunctionName,
            @ErrorDescritpion)

    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('schedular_log',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_schedular_Run_Log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 18/05/2020
-- Description:	Add Schedular log
-- =============================================
--usp_CSB_5_schedular_run_log 1,1,'Test',''
CREATE PROCEDURE [dbo].[usp_CSB_5_schedular_Run_Log]	
	@SchedularNo INT,
	@TotalFileFound INT,
	@Description VARCHAR(4000),
	@Result_Code VARCHAR(10) OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO [dbo].[CSB_5_schedular_run_log]
           ([SchedularNo]
           ,[SchedularType]
           ,[EntryDateTime]
		   ,[TotalItemFound]
           ,[Description])
     VALUES
           (@SchedularNo,
            (CASE WHEN @SchedularNo=1 THEN 'Split' 
			      WHEN @SchedularNo=2 THEN 'GIA' 
				  WHEN @SchedularNo=3 THEN 'Download' 
				  ELSE 'Other' END),
            GETDATE(),
			@TotalFileFound,
            @Description)
    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('schedular_log',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_schedular1_uploaded_file_log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kiran Posture
-- Create date: 19/05/2020
-- Description:	Add uploaded file log - schedular 1
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_schedular1_uploaded_file_log]
    @FileID NUMERIC(18,0),
	@UploadedFileName VARCHAR(200),
	@IsProceed INT,
	@FileSize NUMERIC(18,0),
	@TotalPages INT,
	@Result INT OUTPUT
AS
BEGIN TRY
	BEGIN TRANSACTION

				IF(@IsProceed=0)
				BEGIN
					SET @FileID=ISNULL((SELECT TOP 1 Ref_FileID 
								 FROM CSB_5_Uploaded_File_Details 
								 WHERE [FileName]=@UploadedFileName),0)

					INSERT INTO [dbo].[CSB_5_schedular1_uploaded_file_log]
						   ([Ref_FileID]
						   ,[FileName]
						   ,[EntryDateTime]
						   ,[FileSize]
						   ,[TotalPages]
						   ,[IsProceed])
					 VALUES
						   (@FileID,
						    @UploadedFileName,
							GETDATE(),
							@FileSize,
							@TotalPages,
							0)
								
				END
				ELSE
				BEGIN
				    UPDATE [dbo].[CSB_5_Uploaded_File_Details]
					SET IsProceed=1
					WHERE Ref_FileID=@FileID	

					UPDATE [dbo].[CSB_5_schedular1_uploaded_file_log]
					SET IsProceed=1
					WHERE Ref_FileID=@FileID
													
				END
				SET @Result=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
 SET @Result=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES(@UploadedFileName,ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_Update_SplitFileName_schedular1_Log]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 23/05/2020
-- Description:	Update Split File Name
-- usp_CSB_5_Update_SplitFileName_schedular1_Log '08ABQPS0620K1ZC','08ABQPS0620K1ZC_09072020.pdf','09/07/2020 00:54:30',''
-- =============================================

CREATE PROCEDURE [dbo].[usp_CSB_5_Update_SplitFileName_schedular1_Log]	
	@GSTIN VARCHAR(50),
	@SplitFileName VARCHAR(200),
	@CurrentDateTime VARCHAR(50),
	@SessionID VARCHAR(100),
	@Result_Code VARCHAR(10) OUTPUT
AS
BEGIN TRY
	BEGIN TRANSACTION
		UPDATE CSB_5_Split_GIA_file_details
		SET SplitFileName=@SplitFileName,SessionID=@SessionID
		WHERE GSTIN=@GSTIN
		AND CONVERT(DATE,SplitDate,103)=CONVERT(DATE,@CurrentDateTime,103)
		AND (SplitFileName IS NULL OR SplitFileName='')
		SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
 SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_CSB_5_UpdateEmailFlagFTPUploadFailureStatus]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kiran Posture
-- Create date: 30/06/2020
-- Description: Update email flag for FTP failure file upload email status
-- =============================================
CREATE PROCEDURE [dbo].[usp_CSB_5_UpdateEmailFlagFTPUploadFailureStatus]	
	@FileLogIds VARCHAR(500),
	@Result_Code VARCHAR(10) OUTPUT	
AS
BEGIN TRY
	BEGIN TRANSACTION

	UPDATE CSB_5_FTPFileUploadStatus
	SET IsFailureEmailSend=1
	WHERE FileLogID IN (SELECT Value FROM fnSplitString(@FileLogIds,','))

    SET @Result_Code=1
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0
 ROLLBACK TRANSACTION;
SET @Result_Code=0
 --Database error log
INSERT INTO [dbo].[CSB_5_DB_Errors]([FileName],[ErrorNumber],[ErrorState],[ErrorSeverity],[ErrorLine],[ErrorProcedure],[ErrorMessage] ,[ErrorDateTime])
VALUES('',ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),ERROR_MESSAGE(),GETDATE());  
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[usp_NA_test]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_NA_test]
as
begin
			
DECLARE  @SQLINSERT varchar(MAX) 

SET @SQLINSERT= 'select * into #t_test FROM OpenRowSet(''Microsoft.ACE.OLEDB.12.0'',''Excel 8.0;HDR=yes;IMEX=1;
				Database=F:\MultipleDeliveryAttempt\Commodity_Rates.xlsx;'',''select * from  [Sheet1$]'') insert into t_test([Product_Name], [Exp_DT], [Open], [High], [Low], [Close], [LTP], [Chg], [(%)Chg],[AV_TP],[Spot_P], [Spot_DT], [Best_B],[Best_S],[OI],[Graph],[DDE_ER]) select [Product Name],[Exp DT],[Open],
[High],[Low],[Close],[LTP],[Chg],[(%)Chg],[AV TP#],[Spot P#],[Spot DT#],[Best B#],[Best S#],[OI],[Graph],1 from #t_test where [Product Name] =''Ref Soya Oil'''

EXECUTE(@SQLINSERT)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_DeleteGSTINDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_DeleteGSTINDetails](
  @uid int,
  @Createdby varchar(100),
  @CreatedbyUserId varchar(100),
  @CreatedIp varchar(40),
  @Message varchar(300) output

  )
  as
  begin
	
		if exists (select 1 from t_ShippingBill_GSTINMaster with(NOLOCK) where f_Id = @uid and f_active =1)
			begin
					update t_ShippingBill_GSTINMaster set f_Active= 0 , 
											  f_UpdatedBy = @Createdby,
											  f_UpdatedUserId = @CreatedbyUserId,
											  f_UpdatedDate = GETDATE(),
											  f_UpdatedIp = @CreatedIp
				where f_Id = @uid
				set  @Message = 'GSTIN Details Deleted Successfully.'
			end
		else
			begin
				set  @Message = 'No. GSTIN Details Found.'	
			end
  end





GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_DeleteGSTINMasterDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_DeleteGSTINMasterDetails](
  @uid bigint,
  @Createdby varchar(100),
  @CreatedbyUserId varchar(100),
  @CreatedIp varchar(40),
  @Message varchar(300) output)
  as
  begin
	SET NOCOUNT ON;
		
		update t_ShippingBill_GSTINMaster set
											 f_Account_No= 0,
											 f_UpdatedBy = @Createdby,
											 f_UpdatedUserId = @CreatedbyUserId,
											 f_UpdatedDate = GETDATE(),
											 f_UpdatedIp= @CreatedIp
			 where f_Id = @uid and f_Active=1 

			 set @Message = 'Records Deleted Successfully';
  end



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetAllDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetAllDetails](@GSTINNo nvarchar(100)='', @date nvarchar(100),@Result nvarchar(max) =null output ,@TemplateType int OUTPUT        )          
as          
begin          
          
 SET NOCOUNT ON;                
  select           
   'Details' as 'DETAILS OF CSB'          
             
   ---- Persnoal Details          
   ,ISNULL(a.f_CSB_Number,'') as CSB_Number          
   ,ISNULL(a.f_Filling_Date,'') as Filling_Date   
   
   ,'Details' as 'DETAILS OF AUTHORIZED COURIER'               

   ,ISNULL(a.f_Courier_Registration_Number,'') as Courier_Registration_Number          
   --,ISNULL(convert(varchar(12), reg.f_Dob,103),'') as Date_Of_Birth           
   ,ISNULL(a.f_Courier_Name,'') as Courier_Name          
   ,ISNULL(a. f_Address_1,'') as  f_Address_1          
   ,ISNULL(a.f_Address_2,'') as Address_2          
   ,ISNULL(a.f_City,'') as City          
   ,ISNULL(a.f_Postal_Zip_Code,'') as Postal_Zip_Code          
   ,ISNULL(a.f_State,'') as [State]
   ,ISNULL(a.f_Custom_Station_Name,'') as Custom_Station_Name
         
   ,'Details' as 'AIRLINE AND FLIGHT NUMBER DETAILS'            
   ,ISNULL(a.f_Airlines,'') as Airlines
   ,ISNULL(a.f_Flight_Number,'') as Flight_Number
   ,ISNULL(a.f_Port_of_Loading,'') as Port_of_Loading          
   ,ISNULL(a.f_Date_of_Departure,'') as Date_of_Departure
                    
   ,'Details' as 'DETAILS OF HAWBS EXPORTED'            

   ,ISNULL(a.f_HAWB_Number,'') as HAWB_Number
   ,ISNULL(a.f_Number_of_Packages_Pieces_Bags_ULD,'') as Number_of_Packages_Pieces_Bags_ULD
   ,ISNULL(a.f_Declared_Weight_in_Kgs,'') as Declared_Weight_in_Kgs
   ,ISNULL(a.f_Airport_of_Destination,'') as Airport_of_Destination
   ,ISNULL(a.f_Import_Export_Code_IEC,'') as Import_Export_Code_IEC
   ,ISNULL(a.f_IEC_Branch_Code,'') as IEC_Branch_Code
   ,ISNULL(a.f_Invoice_Term,'') as Invoice_Term
   ,ISNULL(a.f_MHBS_No,'') as MHBS_No
   ,ISNULL(a.f_Export_Using_eCommerce,'') as Export_Using_eCommerce
   ,ISNULL(a.f_Under_MEIS_Scheme,'') as Under_MEIS_Scheme
   ,ISNULL(a.f_AD_Code,'') as AD_Code
   ,ISNULL(a.f_Status,'') as [Status]
   ,ISNULL(a.f_LEO_DATE,'') as LEO_DATE

   ,'Details' as 'CEM DETAILS'            
   ,ISNULL(a.f_EGM_Number,'') as EGM_Number
   ,ISNULL(a.f_EGM_Date,'') as EGM_Date

   ,'Details' as 'CONSIGNOR AND CONSIGNEE DETAILS'            
   ,ISNULL(a.f_Name_of_the_Consignor,'') as Name_of_the_Consignor
   ,ISNULL(a.f_Address_of_the_Consignor,'') as Address_of_the_Consignor
   ,ISNULL(a.f_Name_of_the_Consignee,'') as Name_of_the_Consignee
   ,ISNULL(a.f_Address_of_the_Consignee,'') as Address_of_the_Consignee

           
 from t_ShippingBill_ReadPdfDetails a with (NOLOCK) 
	inner join t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK) on a.f_HAWB_Number= b.f_HAWB_Number    and a.f_Active=1   
	inner join t_ShippingBill_PdfGSTDetails c on c.f_GSTINNO = a.f_GSTIN_OTHER_ID
             
 where LTRIM(RTRIM(c.f_GSTINNO)) = LTRIM(RTRIM(@GSTINNo)) and a.f_Active=1 and b.f_Active=1         
       
 FOR XML RAW ('EmpData'), ROOT                 

 set @Result  = (
 select           
   'Details' as 'DETAILS OF CSB'          
             
   ---- Persnoal Details          
   ,ISNULL(a.f_CSB_Number,'') as CSB_Number          
   ,ISNULL(a.f_Filling_Date,'') as Filling_Date   
   
   ,'Details' as 'DETAILS OF AUTHORIZED COURIER'               

   ,ISNULL(a.f_Courier_Registration_Number,'') as Courier_Registration_Number          
   --,ISNULL(convert(varchar(12), reg.f_Dob,103),'') as Date_Of_Birth           
   ,ISNULL(a.f_Courier_Name,'') as Courier_Name          
   ,ISNULL(a. f_Address_1,'') as  f_Address_1          
   ,ISNULL(a.f_Address_2,'') as Address_2          
   ,ISNULL(a.f_City,'') as City          
   ,ISNULL(a.f_Postal_Zip_Code,'') as Postal_Zip_Code          
   ,ISNULL(a.f_State,'') as [State]
   ,ISNULL(a.f_Custom_Station_Name,'') as Custom_Station_Name
         
   ,'Details' as 'AIRLINE AND FLIGHT NUMBER DETAILS'            
   ,ISNULL(a.f_Airlines,'') as Airlines
   ,ISNULL(a.f_Flight_Number,'') as Flight_Number
   ,ISNULL(a.f_Port_of_Loading,'') as Port_of_Loading          
   ,ISNULL(a.f_Date_of_Departure,'') as Date_of_Departure
                    
   ,'Details' as 'DETAILS OF HAWBS EXPORTED'            

   ,ISNULL(a.f_HAWB_Number,'') as HAWB_Number
   ,ISNULL(a.f_Number_of_Packages_Pieces_Bags_ULD,'') as Number_of_Packages_Pieces_Bags_ULD
   ,ISNULL(a.f_Declared_Weight_in_Kgs,'') as Declared_Weight_in_Kgs
   ,ISNULL(a.f_Airport_of_Destination,'') as Airport_of_Destination
   ,ISNULL(a.f_Import_Export_Code_IEC,'') as Import_Export_Code_IEC
   ,ISNULL(a.f_IEC_Branch_Code,'') as IEC_Branch_Code
   ,ISNULL(a.f_Invoice_Term,'') as Invoice_Term
   ,ISNULL(a.f_MHBS_No,'') as MHBS_No
   ,ISNULL(a.f_Export_Using_eCommerce,'') as Export_Using_eCommerce
   ,ISNULL(a.f_Under_MEIS_Scheme,'') as Under_MEIS_Scheme
   ,ISNULL(a.f_AD_Code,'') as AD_Code
   ,ISNULL(a.f_Status,'') as [Status]
   ,ISNULL(a.f_LEO_DATE,'') as LEO_DATE

   ,'Details' as 'CEM DETAILS'            
   ,ISNULL(a.f_EGM_Number,'') as EGM_Number
   ,ISNULL(a.f_EGM_Date,'') as EGM_Date

   ,'Details' as 'CONSIGNOR AND CONSIGNEE DETAILS'            
   ,ISNULL(a.f_Name_of_the_Consignor,'') as Name_of_the_Consignor
   ,ISNULL(a.f_Address_of_the_Consignor,'') as Address_of_the_Consignor
   ,ISNULL(a.f_Name_of_the_Consignee,'') as Name_of_the_Consignee
   ,ISNULL(a.f_Address_of_the_Consignee,'') as Address_of_the_Consignee

           
 from t_ShippingBill_ReadPdfDetails a with (NOLOCK) 
	inner join t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK) on a.f_HAWB_Number= b.f_HAWB_Number    and a.f_Active=1   
	inner join t_ShippingBill_PdfGSTDetails c on c.f_GSTINNO = a.f_GSTIN_OTHER_ID
             
 where LTRIM(RTRIM(c.f_GSTINNO)) = LTRIM(RTRIM(@GSTINNo)) and a.f_Active=1 and b.f_Active=1         
       
 FOR XML RAW ('CustomerData'), ROOT    )    
 select @TemplateType = 1;                  
 SET NOCOUNT OFF;                  
end     



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetAllPDF_Details_AWBNumber]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetAllPDF_Details_AWBNumber](
@AWBNumber nvarchar(100)='', @DtlSeq varchar(100), @date nvarchar(100),@Result nvarchar(max) =null output ,@TemplateType int OUTPUT        )          

as          

begin          

          

 SET NOCOUNT ON;                

  select           
	top 1
   'Details' as 'DETAILS OF CSB'          

             

   ---- Persnoal Details          

   ,ISNULL(a.f_CSB_Number,'') as CSB_Number          

   ,ISNULL(a.f_Filling_Date,'') as Filling_Date   

   

   ,'Details' as 'DETAILS OF AUTHORIZED COURIER'               



   ,ISNULL(a.f_Courier_Registration_Number,'') as Courier_Registration_Number          

   --,ISNULL(convert(varchar(12), reg.f_Dob,103),'') as Date_Of_Birth           

   ,ISNULL(a.f_Courier_Name,'') as Courier_Name          

   ,ISNULL(a. f_Address_1,'') as  f_Address_1          

   ,ISNULL(a.f_Address_2,'') as Address_2          

   ,ISNULL(a.f_City,'') as City          

   ,ISNULL(a.f_Postal_Zip_Code,'') as Postal_Zip_Code          

   ,ISNULL(a.f_State,'') as [State]

   ,ISNULL(a.f_Custom_Station_Name,'') as Custom_Station_Name

         

   ,'Details' as 'AIRLINE AND FLIGHT NUMBER DETAILS'            

   ,ISNULL(a.f_Airlines,'') as Airlines

   ,ISNULL(a.f_Flight_Number,'') as Flight_Number

   ,ISNULL(a.f_Port_of_Loading,'') as Port_of_Loading          

   ,ISNULL(a.f_Date_of_Departure,'') as Date_of_Departure

                    

   ,'Details' as 'DETAILS OF HAWBS EXPORTED'            



   ,ISNULL(a.f_HAWB_Number,'') as HAWB_Number

   ,ISNULL(a.f_Number_of_Packages_Pieces_Bags_ULD,'') as Number_of_Packages_Pieces_Bags_ULD

   ,ISNULL(a.f_Declared_Weight_in_Kgs,'') as Declared_Weight_in_Kgs

   ,ISNULL(a.f_Airport_of_Destination,'') as Airport_of_Destination

   ,ISNULL(a.f_Import_Export_Code_IEC,'') as Import_Export_Code_IEC

   ,ISNULL(a.f_IEC_Branch_Code,'') as IEC_Branch_Code

   ,ISNULL(a.f_Invoice_Term,'') as Invoice_Term

   ,ISNULL(a.f_MHBS_No,'') as MHBS_No

   ,ISNULL(a.f_Export_Using_eCommerce,'') as Export_Using_eCommerce

   ,ISNULL(a.f_Under_MEIS_Scheme,'') as Under_MEIS_Scheme

   ,ISNULL(a.f_AD_Code,'') as AD_Code

   ,ISNULL(a.f_Status,'') as [Status]

   ,ISNULL(a.f_LEO_DATE,'') as LEO_DATE



   ,'Details' as 'CEM DETAILS'            

   ,ISNULL(a.f_EGM_Number,'') as EGM_Number

   ,ISNULL(a.f_EGM_Date,'') as EGM_Date



   ,'Details' as 'CONSIGNOR AND CONSIGNEE DETAILS'            

   ,ISNULL(a.f_Name_of_the_Consignor,'') as Name_of_the_Consignor

   ,ISNULL(a.f_Address_of_the_Consignor,'') as Address_of_the_Consignor

   ,ISNULL(a.f_Name_of_the_Consignee,'') as Name_of_the_Consignee

   ,ISNULL(a.f_Address_of_the_Consignee,'') as Address_of_the_Consignee



           

 from t_ShippingBill_ReadPdfDetails a with (NOLOCK) 

	--inner join t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK) on a.f_HAWB_Number= b.f_HAWB_Number    and a.f_Active=1   

	

             

 where LTRIM(RTRIM(a.f_HAWB_Number)) = LTRIM(RTRIM(@AWBNumber)) and  LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@DtlSeq))) and a.f_Active=1 

       

 FOR XML RAW ('EmpData'), ROOT                 



 

 select @TemplateType = 1;                  

 SET NOCOUNT OFF;                  

end 


GO
/****** Object:  StoredProcedure [dbo].[usp_shippingBill_GetAWBDetails_ToMoveData]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec [usp_shippingBill_GetAWBDetails_ToMoveData] 'extracttool'

    

CREATE procedure [dbo].[usp_shippingBill_GetAWBDetails_ToMoveData](@Type varchar(100))    





as    







    







begin    







    







 if(@Type='csb5history')    







  BEGIN    







       







   select     



   top 10000



    a.f_HAWB_Number as AWB,     







    a.f_Flight_Number + '_' + a.f_Custom_Station_Name + '_' + REPLACE(substring(convert(varchar(100),a.f_createdDate,112),0,11),'-','') + '_CSB5_' + '00' as UniqueId,    







    a.f_Number_of_Packages_Pieces_Bags_ULD as NoOfPackages,    







    a.f_Declared_Weight_in_Kgs as GrossWeight,    







    '' as Destination,    







    a.f_Name_of_the_Consignor as ConsignerName,    







    a.f_Address_of_the_Consignor as ConsignerAddress,    







    a.f_Import_Export_Code_IEC as IECNumber,    







    a.f_Invoice_Term as TermsOfInvoice,    







    a.f_Name_of_the_Consignee as ConsigneeName,    







    a.f_Address_of_the_Consignee as ConsigneeAddress,    







    a.f_HAWB_Number as HandlingUnitNumber,    







    a.f_Export_Using_eCommerce as IsUsingECommerce,    







    a.f_GSTIN_OTHER_ID as GSTIN,    







    '' as GSTInvNo,    







    '' as GSTInvNoDate,    







    '' as NonGSTInvNo,    







    '' as NonGSTInvDate,    







    '' as IsUsingIGST,    







    (select top 1 f_BOND_OR_UT from t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK,NOWAIT) where b.f_HAWB_Number= a.f_HAWB_Number ) as UsingBondorUT,    







    (select top 1 f_Total_IGST_Paid from t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK,NOWAIT) where b.f_HAWB_Number= a.f_HAWB_Number ) as TotalIGST,    







    GETDATE() as CreatedDate,    







    '' CreatedBy,    







    0 as [3CShipmentID],    







    '' as ShipperAccountNumber,    







    '' as PayerAccountNumber,    







    --(select top 1 convert(varchar(100), sd_Acct) from [Shipment_Detail_30102020] b where b.sd_awb= a.f_HAWB_Number ) as ShipperAccountNumber,    







    --(select top 1 convert(varchar(100), v2_sd_payer_acct) from [Shipment_Detail_30102020] b where b.sd_awb= a.f_HAWB_Number) as PayerAccountNumber,    







    (select top 1 f_Total_Item_Value_In_INR from t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK,NOWAIT) where b.f_HAWB_Number= a.f_HAWB_Number ) as TotalINR,    







    0 as TotalFob,    







    (select top 1 ISNULL(f_Unit_Price_Currency,'') from t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK,NOWAIT) where b.f_HAWB_Number= a.f_HAWB_Number )  as Currency,    







    (select top 1 ISNULL(f_Exchange_Rate,0) from t_ShippingBill_ReadPdf_LineItemDetails b with(NOLOCK,NOWAIT) where b.f_HAWB_Number= a.f_HAWB_Number ) as ExchangeRate,    







    Replace(a.f_GIAFilePath,'ftp://mykulws1220.kul-dc.dhl.com//CIAIMP/SBV/work//','') as GIA_FILENAME,    







    a.f_CSB_Number as ShippingBillNumber    







   from t_ShippingBill_ReadPdfDetails a with(NOLOCK, NOWAIT) inner join [t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool] b with(NOLOCK, NOWAIT)  on a.f_HAWB_Number =b.f_HAWB_Number where b.f_IsDataMoveToCSB5History = 0 and a.f_Active =1  and b.f_Active =1     







   --and cast(a.f_CreatedDate as date) = cast(GETDATE()-5 as date)     







    







  end    







    







 else if(@Type='extracttool')    







  BEGIN    







       







   select    top 10000







   a.[f_HAWB_Number] as AWB,   







      a.[f_Port_of_Loading] as PortCode,   







   a.[f_CSB_Number] as SbNo,   







   TRY_PARSE(a.[f_Filling_Date] AS Datetime USING 'Fr-FR') as SbDate,  







   a.[f_Import_Export_Code_IEC] as IEC,  







   a.[f_GSTIN_OTHER_ID] as GSTIN,   







   a.[f_GSTIN_Type] as GSTINType,   







   a.[f_State_Code] as StateCode,  







   (select top 1 f_BOND_OR_UT from [dbo].[t_ShippingBill_ReadPdf_LineItemDetails] b with(NOLOCK,NOWAIT) where b.f_HAWB_Number = a.f_HAWB_Number) as UsingBondOrUT,  







   a.[f_Invoice_Number] as ExportInvoiceNo,   







   a.[f_Invoice_Value_in_INR] as TaxableValueForExportedInvoice,   







   --S.[f_SumofTotal_IGSTPaid],  







   (select SUM(ISNULL(cast(f_Total_IGST_Paid as decimal),0)) from [dbo].[t_ShippingBill_ReadPdf_LineItemDetails] b with(NOLOCK,NOWAIT) where b.f_HAWB_Number = a.f_HAWB_Number and ISNUMERIC(f_Total_IGST_Paid)!=0) as  IGSTPaidOnTaxableValueForExportedInvoice,  







       







   TRY_PARSE(a.[f_LEO_DATE] AS Datetime USING 'Fr-FR') as LEODate,  







   a.[f_EGM_Number] as EGMNumber,   







   TRY_PARSE(a.[f_EGM_Date] AS Datetime USING 'Fr-FR') as EGMClosureDate,  







   --S.[f_AccountNo],  







   '' as AccountNo,  







   '' as URN,  







   (select top 1 f_Unit_Price_Currency from [dbo].[t_ShippingBill_ReadPdf_LineItemDetails] b with(NOLOCK,NOWAIT) where b.f_HAWB_Number = a.f_HAWB_Number) as Currency,  







   (select top 1 f_Exchange_Rate from [dbo].[t_ShippingBill_ReadPdf_LineItemDetails] b with(NOLOCK,NOWAIT) where b.f_HAWB_Number = a.f_HAWB_Number) as ExchangeRate  







  







   from t_ShippingBill_ReadPdfDetails a with(NOLOCK, NOWAIT) inner join [t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool] b with(NOLOCK, NOWAIT)  on a.f_HAWB_Number =b.f_HAWB_Number where b.f_IsDataMoveToExtractTool = 0 and a.f_Active =1  and b.f_Active =1     







   --and cast(a.f_CreatedDate as date) = cast(GETDATE()-5 as date)     

  end    

end 
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetDistinctGSTINNo]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetDistinctGSTINNo]
as

begin
			-- Total --2374
	select distinct f_GSTINNumber as GSTINNumber , f_EmailId as EmailId from t_ShippingBill_GSTINMaster WITH(NOLOCK) where ISNULL(f_GSTINNumber,'') ! = '' --2084
end




GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetDownloadGSTINWise_Details]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetDownloadGSTINWise_Details](



@GSTINNo varchar(100),



@Pdfdtl_Sequence varchar(300)



)



as



begin



		select



			 a.f_CSB_Number  as [CSB Number]



			,a.f_Filling_Date as [Filling Date] 



			,a.f_Courier_Registration_Number as [Courier Registration Number]



			,a.f_Courier_Name as [Courier Name]



			,a.f_Address_1  as [Address 1]



			,a.f_Address_2 as [Address 2]



			,a.f_City as City



			,a.f_Postal_Zip_Code as [Postal Zip Code]



			,a.f_State as [State] 



			,a.f_Custom_Station_Name as [Custom Station Name]



			,a.f_Airlines as Airlines



			,a.f_Flight_Number as [flight Number]



			,a.f_Port_of_Loading as [Port of Loading]



			,a.f_Date_of_Departure as [Date of Departure]



			,a.f_HAWB_Number as  [HAWB Number]



			,a.f_Number_of_Packages_Pieces_Bags_ULD as [Number of Packages Pieces Bags ULD]



			,a.f_Declared_Weight_in_Kgs as  Declared_Weight_in_Kgs



			,a.f_Airport_of_Destination as [Airport of Destination]



			,a.f_Import_Export_Code_IEC as [Import Export Code IEC]



			,a.f_IEC_Branch_Code as [IEC Branch Code]



			,a.f_Invoice_Term as [Invoice Term]



			,a.f_MHBS_No as [MHBS No]



			,a.f_Export_Using_eCommerce as [Export Using eCommerce]



			,a.f_Under_MEIS_Scheme as [Under MEIS Scheme]



			,a.f_AD_Code as [AD Code]



			,a.f_Status as [Status]



			,a.f_LEO_DATE as [LEO DATE]



			,a.f_EGM_Number as [EGM Number]



			,a.f_EGM_Date as [EGM Date]



			,a.f_Name_of_the_Consignor as [Name of the Consignor]



			,a.f_Address_of_the_Consignor as [Address of the Consignor]



			,a.f_Name_of_the_Consignee as [Name of the Consignee]



			,a.f_Address_of_the_Consignee as [Address of the Consignee]



			,a.f_FOB_Value_In_INR as [FOB Value In INR]



			,a.f_GSTIN_Type as [GSTIN Type]



			,a.f_GSTIN_OTHER_ID as [GSTIN OTHER ID]



			,a.f_State_Code as [State Code]

			,a.f_Invoice_Number as [Invoice Number]



			,a.f_Invoice_Date as [Invoice Date] 



			,a.f_Invoice_Value_in_INR as [InvoiceValue in INR]



			,a.f_CRN_Number as [CRN Number]



			,a.f_CRN_MHBS_Number as [CRN MHBS Number]

			
		 from t_ShippingBill_ReadPdfDetails a with(NOLOCK) where a.f_Active =1 



		--and a.f_GSTIN_OTHER_ID = @GSTINNo



		AND ((LTRIM(RTRIM(LOWER(a.f_GSTIN_OTHER_ID))) = LOWER(@GSTINNo)  or  ISNULL(@GSTINNo,'') = '')  

		AND (LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) =(LTRIM(RTRIM(LOWER(@Pdfdtl_Sequence))))))

		--AND convert(varchar(11),a.f_Filling_Date) = convert(varchar(11), @SearchDate))







		select



			   a.f_HAWB_Number as [HAWB Number]



			   ,a.f_CTSH as [CTSH]



			   ,a.f_Goods_Description as [Goods Description]



			   ,a.f_Quantity as [Quantity]



			   ,a.f_Unit_Price as [Unit Price]



			   ,a.f_Total_Item_Value as [Total Item Value]



			   ,a.f_Unit_Price_Currency as [Unit Price Currency]



			   ,a.f_Exchange_Rate as [Exchange Rate]



			   ,a.f_Total_Item_Value_In_INR as [Total Item Value In INR]

			   ,a.f_Total_Taxable_Value as [Total Taxable Value]
			   ,a.f_Taxable_Value_Currency as [Taxable Value Currency]
			   ,a.f_Total_IGST_Paid as [Total IGST Paid]
			   ,a.f_BOND_OR_UT as [BOND OR UT]
			   ,a.f_Total_CESS_Paid as [Total CESS Paid]

		 from t_ShippingBill_ReadPdf_LineItemDetails a with(NOLOCK) 
		 
		 where a.f_Active =1 
		 			and		

		LTRIM(RTRIM(LOWER(a.f_HAWB_Number))) in 

		(

		   select f_HAWB_Number  from  t_ShippingBill_ReadPdfDetails b with(NOLOCK) 

			where  (LTRIM(RTRIM(LOWER(b.f_GSTIN_OTHER_ID))) = LOWER(@GSTINNo)  or  ISNULL(@GSTINNo,'') = '')

			 --AND convert(varchar(11),b.f_Filling_Date) = convert(varchar(11), @SearchDate) and a.f_Active =1 )

			 AND (LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) =(LTRIM(RTRIM(LOWER(@Pdfdtl_Sequence))))) and a.f_Active =1 

		)

end



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetDownloadGSTINWiseFillingDate_Details]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetDownloadGSTINWiseFillingDate_Details](

@GSTINNo varchar(100),

@SearchDate varchar(11)

)

as

begin

		select

			 a.f_CSB_Number  as [CSB Number]

			,a.f_Filling_Date as [Filling Date] 

			,a.f_Courier_Registration_Number as [Courier Registration Number]

			,a.f_Courier_Name as [Courier Name]

			,a.f_Address_1  as [Address 1]

			,a.f_Address_2 as [Address 2]

			,a.f_City as City

			,a.f_Postal_Zip_Code as [Postal Zip Code]

			,a.f_State as [State] 

			,a.f_Custom_Station_Name as [Custom Station Name]

			,a.f_Airlines as Airlines

			,a.f_Flight_Number as [flight Number]

			,a.f_Port_of_Loading as [Port of Loading]

			,a.f_Date_of_Departure as [Date of Departure]

			,a.f_HAWB_Number as  [HAWB Number]

			,a.f_Number_of_Packages_Pieces_Bags_ULD as [Number of Packages Pieces Bags ULD]

			,a.f_Declared_Weight_in_Kgs as  Declared_Weight_in_Kgs

			,a.f_Airport_of_Destination as [Airport of Destination]

			,a.f_Import_Export_Code_IEC as [Import Export Code IEC]

			,a.f_IEC_Branch_Code as [IEC Branch Code]

			,a.f_Invoice_Term as [Invoice Term]

			,a.f_MHBS_No as [MHBS No]

			,a.f_Export_Using_eCommerce as [Export Using eCommerce]

			,a.f_Under_MEIS_Scheme as [Under MEIS Scheme]

			,a.f_AD_Code as [AD Code]

			,a.f_Status as [Status]

			,a.f_LEO_DATE as [LEO DATE]

			,a.f_EGM_Number as [EGM Number]

			,a.f_EGM_Date as [EGM Date]

			,a.f_Name_of_the_Consignor as [Name of the Consignor]

			,a.f_Address_of_the_Consignor as [Address of the Consignor]

			,a.f_Name_of_the_Consignee as [Name of the Consignee]

			,a.f_Address_of_the_Consignee as [Address of the Consignee]

			,a.f_FOB_Value_In_INR as [FOB Value In INR]

			,a.f_GSTIN_Type as [GSTIN Type] 

			,a.f_GSTIN_OTHER_ID as [GSTIN OTHER ID]

			,a.f_State_Code as [State Code]

			,a.f_Invoice_Number as [Invoice Number]

			,a.f_Invoice_Date as [Invoice Date] 

			,a.f_Invoice_Value_in_INR as [InvoiceValue in INR]

			,a.f_CRN_Number as [CRN Number]

			,a.f_CRN_MHBS_Number as [CRN MHBS Number]





		 from t_ShippingBill_ReadPdfDetails a with(NOLOCK) where a.f_Active =1 

		--and a.f_GSTIN_OTHER_ID = @GSTINNo

		AND ((LTRIM(RTRIM(LOWER(a.f_GSTIN_OTHER_ID))) = LOWER(@GSTINNo)  or  ISNULL(@GSTINNo,'') = '')  AND convert(varchar(11),a.f_Filling_Date) = convert(varchar(11), @SearchDate))



		select

			   a.f_HAWB_Number as [HAWB Number]

			   ,a.f_CTSH as [CTSH]

			   ,a.f_Goods_Description as [Goods Description]

			   ,a.f_Quantity as [Quantity]

			   ,a.f_Unit_Price as [Unit Price]

			   ,a.f_Total_Item_Value as [Total Item Value]

			   ,a.f_Unit_Price_Currency as [Unit Price Currency]

			   ,a.f_Exchange_Rate as [Exchange Rate]

			   ,a.f_Total_Item_Value_In_INR as [Total Item Value In INR]

			   ,a.f_Total_Taxable_Value as [Total Taxable Value]

				,a.f_Taxable_Value_Currency as [Taxable Value Currency]

				,a.f_Total_IGST_Paid as [Total IGST Paid]

				,a.f_BOND_OR_UT as [BOND OR UT]

				,a.f_Total_CESS_Paid as [Total CESS Paid]

		 from t_ShippingBill_ReadPdf_LineItemDetails a with(NOLOCK) 

		 where a.f_Active =1 

			and		

		LTRIM(RTRIM(LOWER(a.f_HAWB_Number))) in 

		

		(select f_HAWB_Number  from  t_ShippingBill_ReadPdfDetails b with(NOLOCK) 

			where  (LTRIM(RTRIM(LOWER(b.f_GSTIN_OTHER_ID))) = LOWER(@GSTINNo)  or  ISNULL(@GSTINNo,'') = '') AND convert(varchar(11),b.f_Filling_Date) = convert(varchar(11), @SearchDate) and a.f_Active =1 )

end



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetErrorFilesList]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetErrorFilesList](@type varchar(10))
as
begin
	if(@type='PDF_DATA')
		begin
			select f_PdfHdr_Sequence, f_IsErrorSavingPDFData_ExcelPath, f_ErrorSavingPDFData_ExcelPath as FilePath, convert(varchar(11), f_CreatedDate,103) as CreateDate   
			from t_ShippingBill_PdfHeader with(NOLOCK) where f_IsErrorSavingPDFData_ExcelPath= 0 and f_Active=1
		end	
	else if(@type='PDF_GSTIN')
		begin
			select f_PdfHdr_Sequence, f_ErrorSavingGSTINPDFData_ExcelPath,f_ErrorSavingPDFData_ExcelPath as FilePath, convert(varchar(11), f_CreatedDate,103) as CreateDate   
			from t_ShippingBill_PdfHeader with(NOLOCK) where f_IsErrorSavingGSTINPDFData_ExcelPath= 0 and f_Active=1
		end	
END





GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetFileName]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_ShippingBill_GetFileName]
as
begin

	select f_FileName
   from [dbo].[t_ShippingBill_Detail] where cast(f_CreatedDate as date) = '2020-11-21' and f_FileCSB_Type = 'CSB-V'    

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetFilesGIAMove_Report_EMAIL]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetFilesGIAMove_Report_EMAIL]
as
begin

	--DECLARE @Distinct_AWB varchar(20)
	DECLARE @Mail_Body varchar(max);
	DECLARE @Sent int = 0;
	DECLARE @Res_id int
	--, @File_attachement varchar(max)
	, @HTML varchar(max)
	, @Subject varchar(300)
	, @TotalCount int
	, @TotalCSB5_Count int
	, @TotalCSB4_Count int
	, @TotalCSB3_Count int
	, @date varchar(20)

	set @Mail_Body ='';

	set @TotalCSB5_Count = (select ISNULL(COUNT(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails] with(NOLOCK,NOWAIT) where f_Active =1 and [f_FileMoveToGIA] =1 and cast(f_CreatedDate as date) = cast(getdate() as date) )
	
	set @TotalCSB4_Count = (select ISNULL(COUNT(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] with(NOLOCK,NOWAIT) where f_Active =1 and [f_FileMoveToGIA] =1 and cast(f_CreatedDate as date) = cast(getdate() as date))
	
	set @TotalCSB3_Count = (select ISNULL(COUNT(*),0) from [dbo].[t_ShippingBill_ReadLineItem_PdfDetails_CSBIII] with(NOLOCK,NOWAIT) where f_Active =1 and [f_FileMoveToGIA] =1 and cast(f_CreatedDate as date) = cast(getdate() as date))

	set @date = (select convert(varchar(12),GETDATE(),106))

	set @TotalCount = (@TotalCSB5_Count + @TotalCSB4_Count + @TotalCSB3_Count);
	
	set @HTML='<html><style> table {  width: 1000px; border-collapse: collapse; }  table, th, td { border: 1px solid black; }  th, td { padding: 10px; text-align: left;}
	.Textstyle{font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D}.tdstyle{border:solid windowtext 1.0pt; padding:0in 5.4pt 0in 5.4pt;height:15.0pt}</style> 
						<body><div>  Dear Team,  <br/><br/>Please find the below details for Shipping Bill Dispatch Tool File move to GIA  <br/><br/> <br/> 
						<table>
						<thead>
						<tr>
						
						<th style="width:4%;text-align:center">CSB Types</th>
						<th style="width:4%;text-align:center">CSB-V</th>
						<th style="width:3%;text-align:center">CSB-IV</th>
						<th style="width:5%;text-align:center">CSB-III</th>
						<th style="width:5%;text-align:center">Total Count</th>
						<th style="width:10%;text-align:center">Date</th>
						</tr>
						</thead>
						<tbody >
						{FileRecored}
						</tbody>
						</table>
						';


		--	set @File_attachement =REPLACE(REPLACE(Replace(@File_attachement,'$',':'),';',''),'##',';');			
			--set @Mail_Body ='';
			--@ZipCode,@Areacode,@ReferenceNo,@StatusInformation,@date
			
			select @Mail_Body +=  '<td style="width:4%;text-align:center">No. of Files Processed</td>'
			select @Mail_Body +=  '<td style="width:4%;text-align:center">' + convert(varchar(100),@TotalCSB5_Count) + '</td>'
			select @Mail_Body +=  '<td style="width:4%;text-align:center">' + convert(varchar(100),@TotalCSB4_Count) + '</td>'
			select @Mail_Body +=  '<td style="width:4%;text-align:center">' + convert(varchar(100), @TotalCSB3_Count) + '</td>'
			select @Mail_Body +=  '<td style="width:4%;text-align:center">' + convert(varchar(100), @TotalCount) + '</td>'
			
			select @Mail_Body +=  '<td style="width:10%;text-align:center">' + Replace(@date,'/','-') + '</td></tr>'

		
		 declare @result int ;
	 	 
------------------------------------------------------------------------------------------------


	--  Print @HTML;
	  set @Subject = 'Shipping Bill Dispatch File Move to GIA Count Report for date ' + (select convert(varchar(12),GETDATE(),106));

	  set @HTML = Replace(@HTML,'{FileRecored}',@Mail_Body);
	  
	  	EXEC @result = MSDB.DBO.SP_SEND_DBMAIL
										  @profile_name = 'Reports_Mail',  
										  @RECIPIENTS='Nayan.Rakholiya@dhl.com;Milind.Joshi@dhl.com',
										  --@copy_recipients ='',
										  @copy_recipients ='',
										  @blind_copy_recipients='pramit.jain@dhl.com',
										  @SUBJECT=@Subject,
										  @BODY=@HTML,
										  @BODY_FORMAT = 'HTML'
										  --@file_attachments= @Filepath
										 --@file_attachments= @File_attachement
										 --@file_attachments='C:\Users\VivekYad\test.xls'
				
		


end

GO
/****** Object:  StoredProcedure [dbo].[usp_shippingBill_GetGSTInSearchDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_shippingBill_GetGSTInSearchDetails](



@GSTINNo varchar(100),



@SearchDate varchar(11),



@Message varchar(300) output



)



as



begin



		



		select 
			

			a.f_HAWB_Number as AWBNO,



			a.f_GSTIN_OTHER_ID as GSTINNo,



			convert(varchar(11),a.f_Filling_Date,103) as FillingDate,



			ISNULL(a.f_CSB_Number,'') as CSBNO,



			ISNULL(a.f_Custom_Station_Name,'') as StationName,



			ISNULL(a.f_Flight_Number,'') as FlightNo,



			CONVERT(varchar(11),a.f_Date_of_Departure,103) as DateDeparture,



			CONVERT(varchar(11),a.f_LEO_DATE,103) as LEODate,



			ISNULL(a.f_EGM_Number,'') as EGMNO,



			ISNULL(convert(varchar(11),a.f_EGM_Date,103),'') as EGMDATE,



			ISNULL(b.f_GSTINEmailId,'') as EmailId,



			CASE ISNULL(b.f_EmailSent,'') when 1 then 'YES' 



				 when 0 then 'No'                  



				 when '' then 'No'                  



				 else 'No' end  	as PdfEmailSent,



			--ISNULL(b.f_EmailSentDate,'') as PdfEmailSentDate,



			ISNULL(Convert(varchar, b.f_CreatedDate,13),'') as PdfEmailSentDate,



			CASE ISNULL(b.f_EmailSent,'') when 1 then 'YES' 



				 when 0 then 'NO'                  



				 when '' then 'NO'                  



				 else 'No' end  	as ExcelEmailSent,



			ISNULL(Convert(varchar,b.f_EmailSentDate,13),'') as ExcelEmailSentDate







		 from t_ShippingBill_ReadPdfDetails a with(NOLOCK) inner join t_ShippingBill_PdfGSTDetails b with(NOLOCK) 



			  on a.f_GSTIN_OTHER_ID = b.f_GSTINNO  and a.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and b.f_Active=1



		where a.f_Active =1 



		AND (LTRIM(RTRIM(LOWER(a.f_GSTIN_OTHER_ID))) = LOWER(@GSTINNo)  or  ISNULL(@GSTINNo,'') = '')  



		AND	(convert(varchar(11),a.f_Filling_Date) = convert(varchar(11), @SearchDate) or  ISNULL(@SearchDate,'') = '')  



                              



end





GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetLoginDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetLoginDetails]
@LDAPID varchar(100),
@Message varchar(300) output
AS

BEGIN
SET NOCOUNT ON;
Declare @Pos Int, @LDAP Varchar(100)

Set @Pos = CHARINDEX('\',  @LDAPID,1)

Set @LDAP = SUBSTRING(@LDAPID, @Pos + 1, Len(@LDAPID)- @Pos + 1)

SELECT f_UserId,f_UserName,f_LdapId,f_EmailId,f_Role,f_CreatedDate,f_Active FROM
			dbo.t_ShippingBill_Users
		where 
			f_LdapId = @LDAP
end

 



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetPDFDetailSeq_DataMove_CSB5History]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetPDFDetailSeq_DataMove_CSB5History]

as

begin

	SET NOCOUNT ON;

		

		select top 100 b.f_PdfDtl_Sequence, b. f_CreatedDate, 

		(select count(*) from  [dbo].[t_ShippingBill_ReadPdfDetails] a with(NOLOCK, NOWAIT)  where a.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence) as TotalAWBCount

		

		from 

		 [t_ShippingBill_Detail] b with(NOLOCK,NOWAIT) 

		where ISNULL(f_IsDataMoveToCSB5History,0) =0 and f_Active =1  order by f_CreatedDate desc





END
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetReport]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--exec usp_ShippingBill_GetReport 1,500,0,'date','2020-12-15','',''







CREATE procedure [dbo].[usp_ShippingBill_GetReport](



 @PageIndex int =1,



 @PageSize int =5,



 @TotalRow bigint  output,



 @type varchar(10),



 @Searchtxt nvarchar(max),



 @FromDate varchar(20),

 

 @ToDate varchar(20)

 )

 

as

	begin

		SET NOCOUNT ON;

		if(@type='date')

			begin

				select 

					a.f_Id as Id,







					ISNULL(a.f_PdfHdr_Sequence,'') as hdrSeq,



					ISNULL(b.f_PdfDtl_Sequence,'') as DtlSeq,



					ISNULL(b.f_FileName,'') as [FileName],


					CASE WHEN ISNULL(b.f_fileSize,0) <= 1024                         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)) + ' BYTES'
            WHEN ISNULL(b.f_fileSize,0) >1024 AND ISNULL(b.f_fileSize,0) <= 1048576         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1024) + ' KB'
            WHEN ISNULL(b.f_fileSize,0) >1048576 AND ISNULL(b.f_fileSize,0) <= 1073741824       THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1048576) + ' MB'
            WHEN ISNULL(b.f_fileSize,0) >1073741824 AND ISNULL(b.f_fileSize,0) <= 109951162777  THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1073741824) + ' GB'
            ELSE CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/109951162777) + ' TB'
       END

					 as FileSize,



					ISNULL(b.f_FilePageCount,0) as [PageCount],



					case when LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-V' then 	(select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) 

						 WHEN LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-IV'  then (select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)

						 WHEN LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-III' then (select ISNULL(count(*),0) from [t_ShippingBill_ReadLineItem_PdfDetails_CSBIII] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)  end 

					

					as   AWBCount,



					(select ISNULL((count(*)/ 2 ),0) from [dbo].[t_ShippingBill_PdfGSTDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) as   GIAClubCount,



					ISNULL(REPLACE(REPLACE(a.f_LogCreationPath,'\','\\'),'::1',''),'') as LogCreationPath ,



					ISNULL(REPLACE(Convert(varchar(11), b.f_CreatedDate,106),' ','-') +  Right(Convert(VarChar(20),b.f_CreatedDate,100),8),'') as CreatedDate ,







					b.f_CreatedDate as f_CreatedDate,

					b.f_FileCSB_Type as FileType,

					ROW_NUMBER() over(ORDER BY b.f_CreatedDate desc ) as [RowNumber]
						






					INTO #TempTable_NA







				from [dbo].[t_ShippingBill_Header] a with(NOLOCK) 







					inner join [dbo].[t_ShippingBill_Detail] b with(NOLOCK) on a.f_PdfHdr_Sequence = b.f_PdfHdr_Sequence where  b.f_Active=1 







					AND (convert(date,b.f_CreatedDate) = convert(date, @Searchtxt)  or (@Searchtxt ='' or @Searchtxt ='') )  







					order by b.f_CreatedDate desc







					set @TotalRow =  (select count(*) from #TempTable_NA)







					select * from #TempTable_NA where RowNumber Between(@PageIndex-1) * @PageSize +1  and (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1 order by f_CreatedDate desc







					drop table #TempTable_NA







			end











		ELSE IF (@type ='Name')

			begin
				set @Searchtxt = REPLACE(@Searchtxt,' ','_');
				select 
					a.f_Id as Id,
					ISNULL(a.f_PdfHdr_Sequence,'') as hdrSeq,
					ISNULL(b.f_PdfDtl_Sequence,'') as DtlSeq,
					ISNULL(b.f_FileName,'') as [FileName],
					CASE WHEN ISNULL(b.f_fileSize,0) <= 1024                         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)) + ' BYTES'
            WHEN ISNULL(b.f_fileSize,0) >1024 AND ISNULL(b.f_fileSize,0) <= 1048576         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1024) + ' KB'
            WHEN ISNULL(b.f_fileSize,0) >1048576 AND ISNULL(b.f_fileSize,0) <= 1073741824       THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1048576) + ' MB'
            WHEN ISNULL(b.f_fileSize,0) >1073741824 AND ISNULL(b.f_fileSize,0) <= 109951162777  THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1073741824) + ' GB'
            ELSE CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/109951162777) + ' TB'
       END
					 as FileSize,
					ISNULL(b.f_FilePageCount,0) as [PageCount],
					case when LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-V' then 	(select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) 

						 WHEN LTRIM(RTRIM(f_FileCSB_Type))   ='CSB-IV'  then (select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)

						 WHEN LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-III' then (select ISNULL(count(*),0) from [t_ShippingBill_ReadLineItem_PdfDetails_CSBIII] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)  end 

					as   AWBCount,
					(select ISNULL((count(*)/ 2 ),0) from [dbo].[t_ShippingBill_PdfGSTDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) as   GIAClubCount,
					ISNULL(REPLACE(REPLACE(a.f_LogCreationPath,'\','\\'),'::1',''),'') as LogCreationPath ,
					ISNULL(REPLACE(Convert(varchar(11), b.f_CreatedDate,106),' ','-') +  Right(Convert(VarChar(20),b.f_CreatedDate,100),8),'') as CreatedDate ,
					b.f_CreatedDate as f_CreatedDate,
					b.f_FileCSB_Type as FileType,
					ROW_NUMBER() over(ORDER BY b.f_CreatedDate desc ) as [RowNumber]
					INTO #TempTable_NA1

				from [dbo].[t_ShippingBill_Header] a with(NOLOCK) 

				 INNER JOIN [dbo].[t_ShippingBill_Detail] b with(NOLOCK) on a.f_PdfHdr_Sequence = b.f_PdfHdr_Sequence where  b.f_Active=1 
					AND (LTRIM(RTRIM(LOWER(f_FileName))) = LOWER(@Searchtxt)  or  ISNULL(@Searchtxt,'') = '')  order by f_CreatedDate desc

					set @TotalRow =  (select count(*) from #TempTable_NA1)

					select * from #TempTable_NA1 where RowNumber Between(@PageIndex-1) * @PageSize +1  and (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1 order by f_CreatedDate desc

					drop table #TempTable_NA1
			end



		ELSE IF (@Type ='AWB')



			BEGIN



		SELECT * from (		



			select 







			a.f_PdfDtl_Sequence as pdfDtlseq,







			a.f_HAWB_Number as HAWBNumber,







			a.f_CSB_Number as CSBNumber,







			a.f_Filling_Date as FillingDate,







			a.f_GSTIN_OTHER_ID as GSTINNumber,



			



			ROW_NUMBER() over(partition by f_HAWB_Number ORDER BY a.f_HAWB_Number ) as [RowNumber]







		from [dbo].[t_ShippingBill_ReadPdfDetails] a WITH(NOLOCK) 







		where LTRIM(RTRIM(LOWER(f_HAWB_Number))) in ((Select [Value]  FROM [dbo].[Split] (  @Searchtxt  ,','))) and f_Active = 1 ) as T Where T.[RowNumber] =1







		set @TotalRow =10;



			END



		ELSE







			BEGIN







				select 







					a.f_Id as Id,







					ISNULL(a.f_PdfHdr_Sequence,'') as hdrSeq,







					ISNULL(b.f_PdfDtl_Sequence,'') as DtlSeq,







					ISNULL(b.f_FileName,'') as [FileName],

						CASE WHEN ISNULL(b.f_fileSize,0) <= 1024                         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)) + ' BYTES'
            WHEN ISNULL(b.f_fileSize,0) >1024 AND ISNULL(b.f_fileSize,0) <= 1048576         THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1024) + ' KB'
            WHEN ISNULL(b.f_fileSize,0) >1048576 AND ISNULL(b.f_fileSize,0) <= 1073741824       THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1048576) + ' MB'
            WHEN ISNULL(b.f_fileSize,0) >1073741824 AND ISNULL(b.f_fileSize,0) <= 109951162777  THEN   CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/1073741824) + ' GB'
            ELSE CONVERT(NVARCHAR, ISNULL(b.f_fileSize,0)/109951162777) + ' TB'
       END

					 as FileSize,
			

					ISNULL(b.f_FilePageCount,0) as [PageCount],





					case when LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-V' then 	(select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) 

						 WHEN LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-IV'  then (select ISNULL(count(*),0) from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)

						 WHEN LTRIM(RTRIM(f_FileCSB_Type)) ='CSB-III' then (select ISNULL(count(*),0) from [t_ShippingBill_ReadLineItem_PdfDetails_CSBIII] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1)  end 

					

					as   AWBCount,


					(select ISNULL((count(*)/ 2 ),0) from [dbo].[t_ShippingBill_PdfGSTDetails] c WITH(NOLOCK)  where c.f_PdfDtl_Sequence = b.f_PdfDtl_Sequence and c.f_Active =1) as   GIAClubCount,

					ISNULL(REPLACE(REPLACE(a.f_LogCreationPath,'\','\\'),'::1',''),'') as LogCreationPath ,

					ISNULL(REPLACE(Convert(varchar(11), b.f_CreatedDate,106),' ','-') +  Right(Convert(VarChar(20),b.f_CreatedDate,100),8),'') as CreatedDate ,

					b.f_CreatedDate as f_CreatedDate,
					b.f_FileCSB_Type as FileType,
					ROW_NUMBER() over(ORDER BY b.f_CreatedDate desc) as [RowNumber]

					INTO #TempTable_NA2

				from [dbo].[t_ShippingBill_Header] a with(NOLOCK) 

					inner join [dbo].[t_ShippingBill_Detail] b with(NOLOCK) on a.f_PdfHdr_Sequence = b.f_PdfHdr_Sequence where  b.f_Active=1 

					AND	((cast(b.f_CreatedDate as date)) BETWEEN Cast(@FromDate as DATE) AND (CAST(@ToDate as DATE)) or  ISNULL(@FromDate,'') = '')

					order by f_CreatedDate desc

				set @TotalRow =  (select count(*) from #TempTable_NA2)

				select * from #TempTable_NA2 where RowNumber Between(@PageIndex-1) * @PageSize +1  and (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1 order by f_CreatedDate desc







				drop table #TempTable_NA2		







				END











end





GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetReport_AWBWise]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetReport_AWBWise](

@tblC  USP_ShippingBill_SearchAWB		 READONLY

)
as
	BEGIN

		SELECT * from (		

			select 
			(select top 1 SUBSTRING([f_FileName],0,100) from [dbo].[t_ShippingBill_Detail] b with(NOLOCK,NOWAIT) where b.f_PdfDtl_Sequence = a.f_PdfDtl_Sequence) as [FileName],
			a.f_PdfDtl_Sequence as pdfDtlseq,
			a.f_HAWB_Number as HAWBNumber,
			a.f_CSB_Number as CSBNumber,
			a.f_Filling_Date as FillingDate,
			a.f_GSTIN_OTHER_ID as GSTINNumber,
			ROW_NUMBER() over(partition by f_HAWB_Number ORDER BY a.f_HAWB_Number ) as [RowNumber]
		from [dbo].[t_ShippingBill_ReadPdfDetails] a WITH(NOLOCK) 
		where LTRIM(RTRIM(LOWER(f_HAWB_Number))) in (select awb from @tblC) and f_Active = 1 ) as T Where T.[RowNumber] =1


--exec usp_ShippingBill_GetReport 1,500,0,'date','2020-11-03','',''

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_GetReportby_DtlSeq]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_GetReportby_DtlSeq](
 @PageIndex int =1,
 @PageSize int =5,
 @TotalRow bigint  output,
 @type varchar(10),
 @Searchtxt varchar(100),
 @PdfDtl_Seq varchar(100)
)
as
	begin
		SET NOCOUNT ON;

		select 
			a.f_PdfDtl_Sequence as pdfDtlseq,
			a.f_HAWB_Number as HAWBNumber,
			a.f_CSB_Number as CSBNumber,
			a.f_Filling_Date as FillingDate,
			a.f_GSTIN_OTHER_ID as GSTINNumber,
			ROW_NUMBER() over(ORDER BY a.f_Id ) as [RowNumber]

			INTO #TempTable_NA2

			 
		from [dbo].[t_ShippingBill_ReadPdfDetails] a WITH(NOLOCK) 
		where LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@PdfDtl_Seq))) and f_Active = 1

		set @TotalRow =  (select count(*) from #TempTable_NA2)
		select * from #TempTable_NA2 where RowNumber Between(@PageIndex-1) * @PageSize +1  and (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1
		drop table #TempTable_NA2

	END


GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_InsertPdfDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[usp_ShippingBill_InsertPdfDetails](







@HdrSeq nvarchar(500),







@FilePath nvarchar(500),







@FileName nvarchar(200),







@FileSize bigint,







@FilePageCount int,







@Createdby varchar(100),







@CreatedbyUserId varchar(100),







@CreatedIp varchar(40),







@Message varchar(200) output,





@FileType char(10) = null





)







as







begin



	set NOCOUNT ON;







	declare @rowid bigint;



	



	insert into t_ShippingBill_Detail(f_PdfHdr_Sequence, f_FilePath,  f_FileName, f_FileSize, f_FilePageCount,  f_Active, f_Createdby,f_CreatedbyUserId, f_CreatedDate,f_CreatedIp, f_FileCSB_Type)







	values (







	@HdrSeq, @FilePath, @FileName, @FileSize, @FilePageCount,  1, @Createdby , @CreatedbyUserId, GETDATE(), @CreatedIp, @FileType







	)







	set @rowid = SCOPE_IDENTITY()







	set @Message = 'DTLSEQNO' + convert(varchar(500), @rowid)







	update t_ShippingBill_Detail set f_PdfDtl_Sequence = 'DTLSEQNO' + convert(varchar(500), f_Id)







								where isnull(f_PdfDtl_Sequence ,'') = '' or f_PdfDtl_Sequence ='' and f_Active=1







end













GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_InsertPdfGSTDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ShippingBill_InsertPdfGSTDetails](
@tblC usp_ShippingBill_InsertGSTDetails_type READONLY,
	@Message varchar(200) output
)

as

begin
	set NOCOUNT ON;

	insert into t_ShippingBill_PdfGSTDetails(f_EmailtempalteId, f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_GSTINNO, f_GSTINEmailId, f_GSTFileDirectory,  f_GSTFilePath, f_GSTExcelFilePath, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp)

	
	select 1, a.f_PdfHdr_Sequence, a.f_PdfDtl_Sequence, a.f_GSTINNO, a.f_GSTINEmailId, a.f_GSTFileDirectory, a.f_GSTFilePath, a.f_GSTExcelFilePath, 1, a.f_Createdby, a.f_CreatedbyUserId, GETDATE(), a.f_CreatedIp from @tblC a 

	set @Message = 'Data Added Succsfully.';

	update a
		set a.f_AWBSplitedCount = b.f_AWBSplitedCount ,
		a.f_GIAClubCount = b.f_GIAClubCount
		 from [dbo].[t_ShippingBill_Detail] a WITH(NOLOCK) 
		 inner join @tblC b 
		  on  LTRIM(RTRIM(LOWER(a.f_PdfHdr_Sequence))) = LTRIM(RTRIM(LOWER(b.f_PdfHdr_Sequence))) 
		  and LTRIM(RTRIM(LOWER(a.f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(b.f_PdfDtl_Sequence))) 

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_InsertPdfHeader]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_InsertPdfHeader](

@Createdby varchar(100),

@CreatedbyUserId varchar(100),

@CreatedIp varchar(40),

@Message varchar(200) output,

@LogCreationFilePath varchar(300) = null

)

as

begin

	set NOCOUNT ON;

	declare @rowid bigint;

	insert into t_ShippingBill_Header(f_LogCreationPath, f_Active, f_Createdby,f_CreatedbyUserId, f_CreatedDate,f_CreatedIp)

	values (@LogCreationFilePath, 1, @Createdby , @CreatedbyUserId, GETDATE(), @CreatedIp

	)

	set @rowid = SCOPE_IDENTITY()

	set @Message = 'SEQNO' + convert(varchar(250), @rowid)

	update t_ShippingBill_Header set f_PdfHdr_Sequence = 'SEQNO' + convert(varchar(250), f_Id)
								where isnull(f_PdfHdr_Sequence ,'') = '' or f_PdfHdr_Sequence ='' and f_Active=1

end






GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_InsertUpdateGSTINMaster]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_InsertUpdateGSTINMaster](



  @uid bigint,



  @GSTInNO varchar(50),



  @EmailId varchar(100),



  @AccountNo varchar(100),



  @Name varchar(100),



  @Createdby varchar(100),



  @CreatedbyUserId varchar(100),



  @CreatedIp varchar(40),



  @Message varchar(300) output,

  

  @type char(8)



  )



  as



  begin



	set NOCOUNT ON;





	if(@type='update')

	begin

		if exists (select 1 from t_ShippingBill_GSTINMaster with(NOLOCK) where f_Id =@uid and f_Active =1  )



		begin



			update t_ShippingBill_GSTINMaster set



											 f_GSTINNumber=@GSTInNO,



											 f_EmailId= @EmailId,



											 f_Name = @Name,

											 f_Account_No= @AccountNo,

											 f_UpdatedBy = @Createdby,



											 f_UpdatedUserId = @CreatedbyUserId,



											 f_UpdatedDate = GETDATE(),



											 f_UpdatedIp= @CreatedIp



			 where f_Id = @uid and f_Active=1 







			 set @Message = 'Records Updated Successfully ' + @GSTInNO;



		end

	end



	ELSE



		BEGIN



				INSERT INTO t_ShippingBill_GSTINMaster(



											f_GSTINNumber,



											f_Name,



											f_Account_No,



											f_EmailId,



											f_Active,



											f_CreatedBy,



											f_CreatedUserId,



											f_CreatedDate,



											f_CreatedIp



											) values (



											@GSTInNO,



											@Name,



											@AccountNo,



											@EmailId,



											1,



											@Createdby,



											@CreatedbyUserId,



											GETDATE(),



											@CreatedIp



											) 



				set @Message = 'Records Added Successfully ' + @GSTInNO;



		END



	



	 end




GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE procedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails](  
  
@tblC usp_ShippingBill_InsertPdfDetails_type READONLY,  
  
@tbl_LineItem usp_ShippingBill_InsertPdf_LineItemDetails_type READONLY,  
  
@Message varchar(200) output  
  
)  
  
as  
  
begin  
  
BEGIN TRANSACTION                 
                                                
 BEGIN TRY      
   
 set @Message ='';  
  
  
 --Update f_Active column to 0 if any AWB no. is already present in the Table  
 update a  
   set a.f_Active =0,  
    f_UpdatedBy=b.f_CreatedBy,  
    f_UpdatedUserId=b.f_CreatedUserId,  
    f_UpdatedDate= GETDATE(),  
    f_UpdatedIp = b.f_CreatedIp  
   from t_ShippingBill_ReadPdfDetails a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and a.f_Import_Export_Code_IEC =b.[f_Import_Export_Code_(IEC)] and f_Active=1  
  
  
insert into t_ShippingBill_ReadPdfDetails (  
  
f_PdfHdr_Sequence  
,f_PdfDtl_Sequence  
,f_CSB_Number  
,f_Filling_Date  
,f_Courier_Registration_Number  
,f_Courier_Name  
,f_Address_1  
,f_Address_2  
,f_City  
,f_Postal_Zip_Code  
,f_State  
,f_Custom_Station_Name  
,f_Airlines  
,f_Flight_Number  
,f_Port_of_Loading  
,f_Date_of_Departure  
,f_HAWB_Number  
,f_Number_of_Packages_Pieces_Bags_ULD  
,f_Declared_Weight_in_Kgs  
,f_Airport_of_Destination  
,f_Import_Export_Code_IEC  
,f_IEC_Branch_Code  
,f_Invoice_Term  
,f_MHBS_No  
,f_Export_Using_eCommerce  
,f_Under_MEIS_Scheme  
,f_AD_Code  
,f_Status  
,f_LEO_DATE  
,f_EGM_Number  
,f_EGM_Date  
,f_Name_of_the_Consignor  
,f_Address_of_the_Consignor  
,f_Name_of_the_Consignee  
,f_Address_of_the_Consignee  
,f_FOB_Value_In_INR  
,f_GSTIN_Type  
,f_GSTIN_OTHER_ID  
,f_State_Code  
--,f_Total_Taxable_Value  
--,f_Taxable_Value_Currency  
--,f_Total_IGST_Paid  
--,f_BOND_OR_UT  
--,f_Total_CESS_Paid  
,f_Invoice_Number  
,f_Invoice_Date  
,f_Invoice_Value_in_INR  
--,f_CTSH  
--,f_Goods_Description  
--,f_Quantity  
--,f_Unit_Price  
--,f_Total_Item_Value  
--,f_Unit_Price_Currency  
--,f_Exchange_Rate  
--,f_Total_Item_Value_In_INR  
,f_CRN_Number  
,f_CRN_MHBS_Number  
,f_PageCount  
,f_ItemDetailsCount  
,f_Active  
,f_CreatedBy  
,f_CreatedUserId  
,f_CreatedDate  
,f_CreatedIp  
  
  
  
  
)  
  
select   
 f_PdfHdr_Sequence,  
 f_PdfDtl_Sequence,  
 f_CSB_Number,  
 f_Filling_Date,  
  
 --DETAILS OF AUTHORIZED COURIER  
 f_Courier_Registration_Number,  
 f_Courier_Name ,  
 f_Address_1 ,  
 f_Address_2 ,  
 f_City,  
 [f_Postal/Zip_Code],  
 f_State,  
 f_Custom_Station_Name,  
  
 --AIRLINE AND FLIGHT NUMBER DETAILS  
 f_Airlines,  
 f_Flight_Number,  
 f_Port_of_Loading,  
 f_Date_of_Departure,  
  
 --DETAILS OF HAWBS EXPORTED  
 f_HAWB_Number ,  
 [f_Number_of_Packages_/Pieces_/_Bags_/_ULD] ,  
 [f_Declared_Weight(in_Kgs)] ,  
 f_Airport_of_Destination,  
 [f_Import_Export_Code_(IEC)] ,  
 f_IEC_Branch_Code,  
 f_Invoice_Term,  
 f_MHBS_No,  
 [f_Export_Using_e-Commerce],  
 f_Under_MEIS_Scheme,  
 f_AD_Code,  
 f_Status ,  
 f_LEO_DATE,  
  
 --CEM DETAILS  
 f_EGM_Number,  
 f_EGM_Date ,  
  
   
 --CONSIGNOR AND CONSIGNEE DETAILS  
 f_Name_of_the_Consignor ,  
 f_Address_of_the_Consignor,  
 f_Name_of_the_Consignee ,  
 f_Address_of_the_Consignee ,  
  
 --GSTIN DETAILS  
 [f_FOB_Value_(In_INR)] ,  
 f_GSTIN_Type ,  
 [f_GSTIN/OTHER_ID],  
 f_State_Code ,  
 --f_Total_Taxable_Value ,  
 --f_Taxable_Value_Currency ,  
 --f_Total_IGST_Paid ,  
 --f_BOND_OR_UT ,  
 --f_Total_CESS_Paid ,  
  
 --INVOICE DETAILS  
 f_Invoice_Number,  
 f_Invoice_Date,  
 [f_Invoice_Value_(in_INR)] ,  
  
 ----ITEM DETAILS  
 --f_CTSH,  
 --f_Goods_Description,  
 --f_Quantity ,  
 --f_Unit_Price ,  
 --f_Total_Item_Value ,  
 --f_Unit_Price_Currency ,  
 --f_Exchange_Rate,  
 --[f_Total_Item_Value_(In_INR)] ,  
   
 --CRN DETAILS  
 f_CRN_Number ,  
 f_CRN_MHBS_Number,  
 f_PageCount,  
 f_ItemDetailsCount,  
 1,  
 f_CreatedBy ,  
 f_CreatedUserId,  
 GETDATE(),  
 f_CreatedIp   
 from @tblC   
  
   
 --Update f_Active column to 0 if any AWB no. is already present in the Table  
   
 update a  
   set a.f_Active =0,  
    f_UpdatedBy=b.f_CreatedBy,  
    f_UpdatedUserId=b.f_CreatedUserId,  
    f_UpdatedDate= GETDATE(),  
    f_UpdatedIp = b.f_CreatedIp  
   from t_ShippingBill_ReadPdf_LineItemDetails a WITH(NOLOCK)  inner join @tbl_LineItem b on  a.f_HAWB_Number = b.f_HAWB_Number and f_Active=1  
  
  
insert into t_ShippingBill_ReadPdf_LineItemDetails  
(  
f_PdfHdr_Sequence  
,f_PdfDtl_Sequence  
,f_HAWB_Number  
,f_CTSH  
,f_Goods_Description  
,f_Quantity  
,f_Unit_Price  
,f_Total_Item_Value  
,f_Unit_Price_Currency  
,f_Exchange_Rate  
,f_Total_Item_Value_In_INR  
,f_Total_Taxable_Value  
,f_Taxable_Value_Currency  
,f_Total_IGST_Paid  
,f_BOND_OR_UT  
,f_Total_CESS_Paid  
,f_Active  
,f_CreatedBy  
,f_CreatedUserId  
,f_CreatedDate  
,f_CreatedIp  
)  
select   
f_PdfHdr_Sequence  
,f_PdfDtl_Sequence  
,f_HAWB_Number  
,f_CTSH  
,f_Goods_Description  
,f_Quantity  
,f_Unit_Price  
,f_Total_Item_Value  
,f_Unit_Price_Currency  
,f_Exchange_Rate  
,[f_Total_Item_Value_In_INR]  
,f_Total_Taxable_Value   
,f_Taxable_Value_Currency   
,f_Total_IGST_Paid   
,f_BOND_OR_UT   
,f_Total_CESS_Paid   
,1  
,f_CreatedBy  
,f_CreatedUserId  
,GETDATE()  
,f_CreatedIp  
 from @tbl_LineItem  
  
  declare @PdfDtlseq varchar(100);

 set @PdfDtlseq = (select top 1 f_PdfDtl_Sequence from @tblC)

		update a  
   set a.f_Active =0,  
    f_UpdatedBy=b.f_CreatedBy,  
    f_UpdatedUserId=b.f_CreatedUserId,  
    f_UpdatedDate= GETDATE(),  
    f_UpdatedIp = b.f_CreatedIp  
   from t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and a.f_Import_Export_Code_IEC =b.[f_Import_Export_Code_(IEC)] and f_Active=1  
  
			insert into t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool (f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_HAWB_Number, f_Import_Export_Code_IEC, f_Active,
f_CreatedBy, f_CreatedUserId, f_CreatedDate, f_CreatedIp) select f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_HAWB_Number, [f_Import_Export_Code_(IEC)], 1, f_CreatedBy  
,f_CreatedUserId ,GETDATE() ,f_CreatedIp from (select f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_HAWB_Number, [f_Import_Export_Code_(IEC)], f_CreatedBy  
,f_CreatedUserId ,f_CreatedIp ,Row_NUMBER() over( partition by f_HAWB_Number order by f_HAWB_Number desc )   as RowNum   from  @tblC ) as T where T.RowNum =1
  
set @Message ='PDF Details Added Successfully';  
  
COMMIT TRANSACTION;                                                  
 END TRY                                                  
 BEGIN CATCH                                                  
  ROLLBACK TRANSACTION;                                                  
 END CATCH    
  
end  
  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails_CSBIII]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails_CSBIII](

@tblC usp_ShippingBill_InsertPdfDetails_CSBIII_type READONLY,

@tbl_LineItem usp_ShippingBill_InsertPdfLineItem_Details_CSBIII_type READONLY,

@Message varchar(200) output

)

as

begin

BEGIN TRANSACTION               
                                              
	BEGIN TRY    
	
	set @Message ='';


	--Update f_Active column to 0 if any AWB no. is already present in the Table
	update a
			set a.f_Active =0,
				f_UpdatedBy=b.f_CreatedBy,
				f_UpdatedUserId=b.f_CreatedUserId,
				f_UpdatedDate= GETDATE(),
				f_UpdatedIp = b.f_CreatedIp
			from t_ShippingBill_ReadPdfDetails_CSBIII a WITH(NOLOCK)  inner join @tblC b on  a.f_CSB_Number = b.f_CSB_Number and a.f_Active=1


insert into t_ShippingBill_ReadPdfDetails_CSBIII (
f_PdfHdr_Sequence
,f_PdfDtl_Sequence
,f_CSB_Number
,f_Courier_Registration_Number
,f_Courier_Name
,f_Address_1
,f_Address_2
,f_City
,f_Postal_Zip_Code
,f_State
,f_Airlines
,f_Flight_Number
,f_EGM_Number
,f_EGM_Date
,f_DomesticAirlines
,f_Domestic_Flight_Number
,f_Airport_of_Departure
,f_Airport_of_Destination
,f_Date_of_Departure
,f_ExpectedDateOf_LandingAtDestination
,f_Manifest_Weight
,f_Manifest_ActualWeight
,f_NO_MAWB_Number
,f_NO_HAWB_Number
,f_Number_of_Packages_Pieces_Bags_ULD
,f_CSBStatus
,f_ItemDetailsCount
,f_PageCount
,f_Active
,f_CreatedBy
,f_CreatedUserId
,f_CreatedDate
,f_CreatedIp
)

select 
	f_PdfHdr_Sequence
,f_PdfDtl_Sequence
,f_CSB_Number
,f_Courier_Registration_Number
,f_Courier_Name
,f_Address_1
,f_Address_2
,f_City
,f_Postal_Zip_Code
,f_State
,f_Airlines
,f_Flight_Number
,f_EGM_Number
,f_EGM_Date
,f_DomesticAirlines
,f_Domestic_Flight_Number
,f_Airport_of_Departure
,f_Airport_of_Destination
,f_Date_of_Departure
,f_ExpectedDateOf_LandingAtDestination
,f_Manifest_Weight
,f_Manifest_ActualWeight
,f_NO_MAWB_Number
,f_NO_HAWB_Number
,f_Number_of_Packages_Pieces_Bags_ULD
,f_CSBStatus
,f_ItemDetailsCount
,f_PageCount
,1
,f_CreatedBy
,f_CreatedUserId
,GETDATE()
,f_CreatedIp 
 from @tblC 

 
 --Update f_Active column to 0 if any AWB no. is already present in the Table
	
	update a
			set a.f_Active =0,
				a.f_UpdatedBy=b.f_CreatedBy,
				a.f_UpdatedUserId=b.f_CreatedUserId,
				a.f_UpdatedDate= GETDATE(),
				a.f_UpdatedIp = b.f_CreatedIp
			from t_ShippingBill_ReadLineItem_PdfDetails_CSBIII a WITH(NOLOCK)  inner join @tbl_LineItem b on  a.f_HAWB_Number = b.f_HAWB_Number and a.f_Active=1


insert into t_ShippingBill_ReadLineItem_PdfDetails_CSBIII
(
f_PdfHdr_Sequence
,f_PdfDtl_Sequence
,f_MAWB_Number
,f_HAWB_Number
,f_HAWBStatus
,f_Active
,f_CreatedBy
,f_CreatedUserId
,f_CreatedDate
,f_CreatedIp

)
select 
f_PdfHdr_Sequence
,f_PdfDtl_Sequence
,f_MAWB_Number
,f_HAWB_Number
,f_HAWBStatus
,1
,f_CreatedBy
,f_CreatedUserId
,GETDATE()
,f_CreatedIp
 from @tbl_LineItem


set @Message ='PDF Details Added Successfully';

COMMIT TRANSACTION;                                                
 END TRY                                                
 BEGIN CATCH                                                
  ROLLBACK TRANSACTION;                                                
 END CATCH  

end






GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails_CSBIV]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[usp_ShippingBill_ReadInsertPdfDetails_CSBIV](

@tblC usp_ShippingBill_InsertPdfDetails_CSBIV_type READONLY,


@Message varchar(200) output

)

as

begin

BEGIN TRANSACTION               
                                              
	BEGIN TRY    
	
	set @Message ='';


	--Update f_Active column to 0 if any AWB no. is already present in the Table
	update a
			set a.f_Active =0,
				f_UpdatedBy=b.f_CreatedBy,
				f_UpdatedUserId=b.f_CreatedUserId,
				f_UpdatedDate= GETDATE(),
				f_UpdatedIp = b.f_CreatedIp
			from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and f_Active=1


insert into t_ShippingBill_ReadPdfDetails_CSBIV (
f_PdfHdr_Sequence
,f_PdfDtl_Sequence
,f_CSB_Number
,f_Courier_Registration_Number
,f_Courier_Name
,f_Address_1
,f_Address_2
,f_City
,f_Postal_Zip_Code
,f_State
,f_Airlines
,f_Flight_Number
,f_EGM_Number
,f_EGM_Date
,f_Airport_of_Departure
,f_Airport_of_Destination
,f_Date_of_Departure
,f_Manifest_Weight
,f_Manifest_ActualWeight
,f_MAWB_Number
,f_HAWB_Number
,f_Number_of_Packages_Pieces_Bags_ULD
,f_Status
,f_Declared_Weight_in_Kgs
,f_ValueIN_USD
,f_Goods_Description
,f_Name_of_the_Consignor
,f_Address_of_the_Consignor
,f_Name_of_the_Consignee
,f_Address_of_the_Consignee
,f_GST_INVOICE_No
,f_GST_INVOICE_Date
,f_ExportInvoice_No
,f_ExportInvoice_Date
,f_Payment_of_IGST
,f_Total_IGST_Paid
,f_Supply_BondOrUT
,f_ADCODE
,f_GSTIN_TYPE
,f_GSTIN_ID
,f_PageCount
,f_Active
,f_CreatedBy
,f_CreatedUserId
,f_CreatedDate
,f_CreatedIp
)

select 
	[f_PdfHdr_Sequence] 
	,[f_PdfDtl_Sequence] 
	,[f_CSB_Number] 
	,[f_Courier_Registration_Number] 
	,[f_Courier_Name] 
	,[f_Address_1] 
	,[f_Address_2] 
	,[f_City] 
	,[f_Postal_Zip_Code] 
	,[f_State] 
	,[f_Airlines] 
	,[f_Flight_Number] 
	,[f_EGM_Number] 
	,[f_EGM_Date] 
	,[f_Airport_of_Departure] 
	,[f_Airport_of_Destination] 
	,[f_Date_of_Departure] 
	,[f_Manifest_Weight] 
	,[f_Manifest_ActualWeight] 
	,[f_MAWB_Number] 
	,[f_HAWB_Number] 
	,[f_Number_of_Packages_Pieces_Bags_ULD] 
	,[f_Status] 
	,[f_Declared_Weight_in_Kgs] 
	,[f_ValueIN_USD] 
	,[f_Goods_Description] 
	,[f_Name_of_the_Consignor] 
	,[f_Address_of_the_Consignor] 
	,[f_Name_of_the_Consignee] 
	,[f_Address_of_the_Consignee] 
	,[f_GST_INVOICE_No]
	,[f_GST_INVOICE_Date] 
	,[f_ExportInvoice_No] 
	,[f_ExportInvoice_Date] 
	,[f_Payment_of_IGST] 
	,[f_Total_IGST_Paid] 
	,[f_Supply_BondOrUT] 
	,[f_ADCODE] 
	,[f_GSTIN_TYPE] 
	,[f_GSTIN_ID] 
	,[f_PageCount] 
	,1
	,f_CreatedBy 
	,f_CreatedUserId
	,GETDATE()
	,'' 
 from @tblC 

set @Message ='PDF Details Added Successfully';

COMMIT TRANSACTION;                                                
 END TRY                                                
 BEGIN CATCH                                                
  ROLLBACK TRANSACTION;                                                
 END CATCH  

end






GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_SendBulk_EMAIL]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_SendBulk_EMAIL]
as
begin
	
	DECLARE @uid int,  @GSTINNO VARCHAR(max),@Email_id VARCHAR(250), @File_attachement varchar(max), @EmailTemplateId int, @PdfHdr_Sequence varchar(100), 
	@PdfDtl_Sequence varchar(100), @HTML varchar(max), @Subject varchar(300)

	
	DECLARE MAIL_CUR CURSOR FOR

	SELECT  a.f_Id,
		    a.f_GSTINNO, 
			a.f_GSTINEmailId, 
			case when (ISNULL(a.f_GSTFilePath,'') ='' and (ISNULL(a.f_GSTExcelFilePath,''))='')  then ''
				 when (ISNULL(a.f_GSTFilePath,'') !='' and (ISNULL(a.f_GSTExcelFilePath,'')) !='') then a.f_GSTFilePath + '##' + a.f_GSTExcelFilePath
				 when (ISNULL(a.f_GSTFilePath,'') ='' and (ISNULL(a.f_GSTExcelFilePath,'')) !='') then  a.f_GSTExcelFilePath
				 when (ISNULL(a.f_GSTFilePath,'') !='' and (ISNULL(a.f_GSTExcelFilePath,'')) ='') then  a.f_GSTFilePath
				 else '' end as f_GSTExcelFilePath, 
			a.f_EmailtempalteId,
			a.f_PdfHdr_Sequence,
			a.f_PdfDtl_Sequence
			
			 FROM t_ShippingBill_PdfGSTDetails a WITH(NOLOCK) inner join t_ShippingBill_Header b WITH(NOLOCK) on a.f_PdfHdr_Sequence = b.f_PdfHdr_Sequence  WHERE (ISNULL(a.f_EmailSent ,0)=0 or a.f_EmailSent =0) and b.f_IsErrorSavingPDFData_ExcelPath =0 and b.f_IsErrorSavingGSTINPDFData_ExcelPath =0 
			 --and a.f_PdfHdr_Sequence ='SEQNO10027' and a.f_id=14678
	 
	 	OPEN MAIL_CUR

	FETCH NEXT FROM MAIL_CUR INTO @uid, @GSTINNO, @Email_id, @File_attachement, @EmailTemplateId, @PdfHdr_Sequence, @PdfDtl_Sequence

	WHILE @@FETCH_STATUS = 0
	 BEGIN
	 
	 set @HTML='';

	 SELECT  @HTML= f_EmailTemplate FROM dbo.[t_ShippingBill_EmailTemplate] WITH(NOLOCK) where f_TemplateId= @EmailTemplateId and f_Active=1    

	 declare @result int ;

		 if(@EmailTemplateId=1)
			 begin
				
	
				--set @File_attachement =REPLACE(REPLACE(@File_attachement,'$',':'),';','');
				set @File_attachement =REPLACE(REPLACE(Replace(@File_attachement,'$',':'),';',''),'##',';');			
				--print @File_attachement;
				set @Subject = 'Shipping Bill PDF For ' + @GSTINNO;
			 end
		--Bind Template    
		if(@EmailTemplateId=2)
			begin
				 SET @HTML = REPLACE(@HTML,'{PDFSEQ}', @PdfHdr_Sequence); 
				 SET @HTML = REPLACE(@HTML,'{PDFDtlSEQ}', @PdfDtl_Sequence); 
				 SET @HTML = REPLACE(@HTML,'{ExcelPath}',@File_attachement); 
				 set @File_attachement =REPLACE(REPLACE(Replace(@File_attachement,'$',':'),';',''),'##',';');
				 
				 set @Subject = 'Shipping Bill PDF ';
			end
------------------------------------------------------------------------------------------------

--print @HTMl;
   --Send Email Logic Starts
      	EXEC @result = MSDB.DBO.SP_SEND_DBMAIL
								  @profile_name = 'ShipingbillCSB',  
					              @RECIPIENTS='irp4@dhl.com',
								  --@RECIPIENTS='pramit.jain@dhl.com',
					              @copy_recipients ='pramit.jain@dhl.com;',

					              @blind_copy_recipients='',

					              @SUBJECT=@Subject,

					              @BODY=@HTML,

					              @BODY_FORMAT = 'HTML',
								  
								  @file_attachments= @File_attachement

								 --@file_attachments='U:\Shipping Bill\GSTINPDF\27BIFPK6086A1ZC_SEQNO2_31052019_142808_636949096886507067.pdf;U:\Shipping Bill\GSTINPDF\13122018H4_Print_CSB_V_Sample_15052019_094633.pdf'

	--Send Email Logic Ends


	-- After Sending Email Update the table  Flag

	
	if(@result=0)
		BEGIN
				update t_ShippingBill_PdfGSTDetails set f_EmailSent=1 , f_EmailSentDate= GETDATE(), f_Updatedby ='SYSTEM', f_UpdatedbyUserId='SYSTEM SCHEDULE',						f_UpdatedDate= GETDATE() where f_Id =@uid and f_GSTINNO= @GSTINNO and f_Active = 1 and ISNULL(f_EmailSent,'') =''
	 	 END
	ELSE
		BEGIN
			update t_ShippingBill_PdfGSTDetails set f_EmailSent=2,f_EmailErrorMessage= @@ERROR , f_Updatedby ='SYSTEM', f_UpdatedbyUserId='SYSTEM SCHEDULE',										f_UpdatedDate= GETDATE() where f_Id =@uid and f_GSTINNO= @GSTINNO and f_Active = 1 and ISNULL(f_EmailSent,'') =''
		END
	 --print @GSTINNO

      FETCH NEXT FROM MAIL_CUR INTO @uid, @GSTINNO, @Email_id, @File_attachement, @EmailTemplateId, @PdfHdr_Sequence, @PdfDtl_Sequence

	end

	close MAIL_CUR
	deallocate MAIL_CUR

end




GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_Update_CSB5History_ExtractTool_Status]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  


CREATE procedure [dbo].[usp_ShippingBill_Update_CSB5History_ExtractTool_Status](  

  

@tblC usp_ShippingBill_Update_CSB5History_ExtractTool_Status_type READONLY,  



@Type varchar(20),  

@CreatedBy varchar(100),

@CreatedUserId varchar(100),

@CreatedIp varchar(100),

@Message varchar(200) output  

 

)  

  

as  

  

begin  

  

BEGIN TRANSACTION                 

                                                

 BEGIN TRY      

   

 set @Message ='';  

  



	if EXISTS (select 1 from [t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool] a with(NOLOCK,NOWAIT) inner join @tblC b on  a.f_HAWB_Number = b.AWB and a.f_Import_Export_Code_IEC =b.IECNumber and f_Active=1)



	BEGIN

  



  if (@Type ='csb5history')

	BEGIN

		update a  

				set 

					a.f_IsDataMoveToCSB5History = b.IsSuccess,

					a.f_DataMoveToCSB5History_Date = GETDATE(),

					a.f_Error_DataMoveToCSB5History = IsError,  

					a.f_UpdatedBy= @CreatedBy,  

					a.f_UpdatedUserId=@CreatedUserId,  

					a.f_UpdatedDate= GETDATE(),  

					a.f_UpdatedIp = @CreatedIp  

				from [dbo].[t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool] a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.AWB and 

				a.f_Import_Export_Code_IEC =b.IECNumber and a.f_Active=1  

  

  END

  

  ELSE if (@Type ='extracttool')

	BEGIN

		update a  

				set 

					a.f_IsDataMoveToExtractTool = b.IsSuccess,

					a.f_DataMoveToExtractTool_Date = GETDATE(),

					a.f_Error_DataMoveToExtractTool = IsError,  

					a.f_UpdatedBy= @CreatedBy,  

					a.f_UpdatedUserId=@CreatedUserId,  

					a.f_UpdatedDate= GETDATE(),  

					a.f_UpdatedIp = @CreatedIp  

				from [dbo].[t_ShippingBill_CSB5_MoveDataToCSB5History_ExtractTool] a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.AWB and 

				a.f_Import_Export_Code_IEC =b.IECNumber and a.f_Active=1  

	END



  END

 

  

set @Message ='AWB Details Updated Successfully';  

  

COMMIT TRANSACTION;                                                  

 END TRY                                                  

 BEGIN CATCH                                                  

  ROLLBACK TRANSACTION;                                                  

 END CATCH    

  

end  

  

  

  

  

GO
/****** Object:  StoredProcedure [dbo].[usp_shippingBill_Update_GIADetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_shippingBill_Update_GIADetails](  
@tblC usp_ShippingBill_Update_GIADetails_type READONLY,  
@Message varchar(200) output  ,

@FileType varchar(20)= null 
)  
as  
begin  
 set @Message ='';  
	  if(@FileType='CSB-V' or @FileType= null)  
  BEGIN  
   update a  
  
   set   
  
    a.f_FileMoveToGIA=b.f_FileMoveToGIA,  
  
    a.f_GIAFilePath=b.f_GIAFilePath,  
  
    a.f_GIAFileMove_Date= b.f_GIAFileMove_Date  
  
      
  
   from t_ShippingBill_ReadPdfDetails a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and f_Active=1  
  END  
 else if(@FileType='CSB-IV')  
  BEGIN  
   update a  
    set   
    a.f_FileMoveToGIA=b.f_FileMoveToGIA,  
    a.f_GIAFilePath=b.f_GIAFilePath,  
    a.f_GIAFileMove_Date= b.f_GIAFileMove_Date  
   from [dbo].[t_ShippingBill_ReadPdfDetails_CSBIV] a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and f_Active=1  
  END  
 else if(@FileType='CSB-III')  
  BEGIN  
   update a  
    set   
    a.f_FileMoveToGIA=b.f_FileMoveToGIA,  
    a.f_GIAFilePath=b.f_GIAFilePath,  
    a.f_GIAFileMove_Date= b.f_GIAFileMove_Date  
   from t_ShippingBill_ReadLineItem_PdfDetails_CSBIII a WITH(NOLOCK)  inner join @tblC b on  a.f_HAWB_Number = b.f_HAWB_Number and f_Active=1  
  END  
  

  
 set @Message ='GIA Details Updated Successfully';  
end  
  



GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_UpdateAWBCount]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_ShippingBill_UpdateAWBCount](@FileType varchar(10), @DtlSeq varchar(100), @AWBCount int, @GIACount int  =0 )
as
begin

if EXISTS(select 1 from [t_ShippingBill_Detail] with(NOLOCK,NOWAIT) where LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@DtlSeq))))
BEGIN
	 update [t_ShippingBill_Detail] 
		set f_AWBSplitedCount = @AWBCount ,  
			f_GIAClubCount = @GIACount  
		where
			LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@DtlSeq)))   
END
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_UpdatePDFDataSaving_ExcelPath]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_UpdatePDFDataSaving_ExcelPath](



@type char(20),



@Hdr_Sequence varchar(300),



@Dtl_Sequence varchar(300),



@EmailId varchar(300),



@ExcelPath varchar(300),



@Createdby varchar(100),



@CreatedbyUserId varchar(100),



@CreatedIp varchar(40))







as







begin







	SET NOCOUNT ON;















	IF EXISTS (SELECT  1 FROM t_ShippingBill_Header WITH(NOLOCK) WHERE f_PdfHdr_Sequence = LTRIM(RTRIM(LOWER(@Hdr_Sequence))) and f_Active=1)







	BEGIN







	if(LTRIM(RTRIM(LOWER(@type)))='HAWB_DETAIlS')







		BEGIN







			UPDATE t_ShippingBill_Header 







				SET f_ErrorSavingPDFData_ExcelPath = @ExcelPath,



					f_IsErrorSavingPDFData_ExcelPath =1,



					f_Updatedby = @Createdby,







					f_UpdatedbyUserId = @CreatedbyUserId,







					f_UpdatedDate = GETDATE(),







					f_UpdatedIp = @CreatedIp







				WHERE f_PdfHdr_Sequence = LTRIM(RTRIM(LOWER(@Hdr_Sequence))) and f_Active=1







				



		insert into t_ShippingBill_PdfGSTDetails (f_EmailtempalteId, f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_GSTINEmailId, f_GSTExcelFilePath,

		 f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp ) values(2, @Hdr_Sequence, @Dtl_Sequence, @EmailId, @ExcelPath, 

		 1, @Createdby, @CreatedbyUserId, GETDATE(), @CreatedIp)



		END







	ELSE







		BEGIN







		UPDATE t_ShippingBill_Header 

						SET f_ErrorSavingGSTINPDFData_ExcelPath = @ExcelPath,

					f_IsErrorSavingGSTINPDFData_ExcelPath =1,

					f_Updatedby = @Createdby,

					f_UpdatedbyUserId = @CreatedbyUserId,

					f_UpdatedDate = GETDATE(),

					f_UpdatedIp = @CreatedIp



				WHERE f_PdfHdr_Sequence = LTRIM(RTRIM(LOWER(@Hdr_Sequence))) and f_Active=1



		insert into t_ShippingBill_PdfGSTDetails (f_EmailtempalteId, f_PdfHdr_Sequence, f_PdfDtl_Sequence, f_GSTINEmailId, f_GSTExcelFilePath, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp ) values(2, @Hdr_Sequence, @Dtl_Sequence, @EmailId, @ExcelPath,1, @Createdby, @CreatedbyUserId, GETDATE(), @CreatedIp)







		END







	end







end





GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_UpdatePDFDetailSeq_DataMove_CSB5History]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_ShippingBill_UpdatePDFDetailSeq_DataMove_CSB5History](
@DtlSeq varchar(100),
@Message varchar(500),
@IsSuccess bit )
as
begin
	SET NOCOUNT ON;
		
		if EXISTS (select 1 from [t_ShippingBill_Detail] b with(NOLOCK,NOWAIT)  where  LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@DtlSeq))) and f_Active =1)
		BEGIN
				update [t_ShippingBill_Detail] set 
					f_IsDataMoveToCSB5History = @IsSuccess,
					f_DataMoveToCSB5History_Date = GETDATE(),  
					f_Error_DataMoveToCSB5History = @Message
				 where LTRIM(RTRIM(LOWER(f_PdfDtl_Sequence))) = LTRIM(RTRIM(LOWER(@DtlSeq))) and f_Active =1
		END 


END

GO
/****** Object:  StoredProcedure [dbo].[usp_ShippingBill_UpdatePDFHeader_ErrorFiles]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ShippingBill_UpdatePDFHeader_ErrorFiles](@PdfHeader varchar(300), @type varchar(100))

as

begin

	

	if(@type='PDF_Data')

		begin

			update t_ShippingBill_PdfHeader  set  f_IsErrorSavingPDFData_ExcelPath=1,f_IsErrorSavingGSTINPDFData_ExcelPath_DateTime  = GETDATE() where f_PdfHdr_Sequence = LTRIM(RTRIM(@PdfHeader)) 

		END

	ELSE

		BEGIN

			update t_ShippingBill_PdfHeader set  f_IsErrorSavingGSTINPDFData_ExcelPath=1,f_IsErrorSavingPDFData_ExcelPath_DateTime  = GETDATE() where f_PdfHdr_Sequence = LTRIM(RTRIM(@PdfHeader))

		END

end



GO
/****** Object:  StoredProcedure [dbo].[usp_SHippingBillGetGSTINDetails]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[usp_SHippingBillGetGSTINDetails](
	 @PageIndex int =1,
	 @PageSize int =5,
	 @TotalRow bigint  output,
	 @Searchtxt varchar(100) = null
	 )
	 as
	 begin
		SET NOCOUNT ON;

		
			 select 
					f_Id  as Id,
					ISNULL(f_GSTINNumber,'') as GSTINNo,
					ISNULL(f_Name,'') as Name,
					ISNULL(f_EmailId,'') as EmailId,
					f_Account_No as AccountNo,
					f_CreatedBy as Createdby,
					f_CreatedUserId as CreatedUserId,
					convert(varchar(11),f_CreatedDate,103) as CreatedDate,
					ROW_NUMBER() over(ORDER BY f_Id ) as [RowNumber]
			INTO #TempTable
			 from t_ShippingBill_GSTINMaster WITH(NOLOCK) WHERE f_Active=1 
			   AND ((LTRIM(RTRIM(LOWER(f_GSTINNumber))) = LOWER(@Searchtxt)  or  ISNULL(@Searchtxt,'') = '')  
				OR (LTRIM(RTRIM(LOWER(f_EmailId))) = LOWER(@Searchtxt)  or  ISNULL(@Searchtxt,'') = '')  
				OR (LTRIM(RTRIM(LOWER(f_Account_No))) = LOWER(@Searchtxt)  or  ISNULL(@Searchtxt,'') = '')  
				OR (LTRIM(RTRIM(LOWER(f_Name))) = LOWER(@Searchtxt)  or  ISNULL(@Searchtxt,'') = '')  )
			 
			 set @TotalRow =  (select count(*) from #TempTable)

			 select * from #TempTable where RowNumber Between(@PageIndex-1) * @PageSize +1  and (((@PageIndex-1) * @PageSize + 1) + @PageSize)-1

			 drop table #TempTable
			 --) as T where T.RowNum between  @PageIndex + 1 and @PageSize    

	 end

	 





GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitString]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(Id int identity(1,1), Value NVARCHAR(MAX) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (Value)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 
    RETURN 
END


GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 2/4/2021 11:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split]    
 (    
  @List nvarchar(max), 
  @SplitOn nvarchar(1)    
 )      
 RETURNS @RtnValue table     
 (    

  Id int identity(1,1),    
  Value nvarchar(max)    
 )     
 AS      
 BEGIN     
  While (Charindex(@SplitOn,@List)>0)    
  Begin    

   Insert Into @RtnValue (value)    
   Select     
    Value = ltrim(rtrim(Substring(@List,1,Charindex(@SplitOn,@List)-1)))    

   Set @List = Substring(@List,Charindex(@SplitOn,@List)+len(@SplitOn),len(@List))    
  End    

  Insert Into @RtnValue (Value)    
  Select Value = ltrim(rtrim(@List))    

  Return    
 END  
GO
