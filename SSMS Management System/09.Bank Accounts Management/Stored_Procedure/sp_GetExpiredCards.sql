-- Stored Procedure to Retrieve Expired Cards
CREATE OR ALTER PROCEDURE sp_GetExpiredCards
AS
BEGIN
    SELECT CardID, CustomerID, CardNumber, CardType, ExpirationDate
    FROM Card
    WHERE ExpirationDate < GETDATE()
END
