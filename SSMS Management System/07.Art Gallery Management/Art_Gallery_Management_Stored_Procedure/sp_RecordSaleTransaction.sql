-- Record a sale transaction with details
CREATE OR ALTER PROCEDURE sp_RecordSaleTransaction
    @SaleArtID INT,
    @SaleUserID INT,
    @SaleAmount DECIMAL(10, 2),
    @SaleDate DATE
AS
BEGIN 
    INSERT INTO SALE (ArtID, UserID, SaleAmount, SaleDate)
    VALUES (@SaleArtID, @SaleUserID, @SaleAmount, @SaleDate)
END
GO