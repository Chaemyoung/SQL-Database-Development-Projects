-- Function to Get Account Balance
CREATE OR ALTER FUNCTION fun_GetAccountBalance(@AccountID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Balance DECIMAL(18, 2)
    SELECT @Balance = AccountBalance 
    FROM Account
    WHERE AccountID = @AccountID
    RETURN @Balance
END
