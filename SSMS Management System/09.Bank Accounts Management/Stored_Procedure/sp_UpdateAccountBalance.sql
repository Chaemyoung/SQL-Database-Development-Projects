-- Stored Procedure to Update Account Balance
CREATE OR ALTER PROCEDURE sp_UpdateAccountBalance
    @AccountID INT,
    @NewBalance DECIMAL(18, 2)
AS
BEGIN
    UPDATE Account
    SET AccountBalance = @NewBalance
    WHERE AccountID = @AccountID
END
