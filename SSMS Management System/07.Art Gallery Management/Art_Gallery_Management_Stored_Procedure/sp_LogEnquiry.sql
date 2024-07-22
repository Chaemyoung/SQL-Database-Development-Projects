-- Log an enquiry with details
CREATE OR ALTER PROCEDURE sp_LogEnquiry
    @EnquiryUserID INT,
    @EnquiryGalleryID INT,
    @EnquiryMessage NVARCHAR(1000),
    @EnquiryDate DATE
AS
BEGIN
    INSERT INTO Enquiry (UserID, GalleryID, Message, EnquiryDate)
    VALUES (@EnquiryUserID, @EnquiryGalleryID, @EnquiryMessage, @EnquiryDate)
END
GO