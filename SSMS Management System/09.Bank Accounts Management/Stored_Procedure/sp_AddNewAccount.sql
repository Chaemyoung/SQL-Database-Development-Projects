-- Stored Procedure to Add a New Account
CREATE OR ALTER PROCEDURE sp_AddNewAccount
    @CustomerID INT,
    @AccountType VARCHAR(50),
    @AccountBalance DECIMAL(18, 2),
    @IFSCCode VARCHAR(20),
    @AccountOpenedDate DATE
AS
BEGIN
    INSERT INTO Account (CustomerID, AccountType, AccountBalance, IFSCCode, AccountOpenedDate)
    VALUES (@CustomerID, @AccountType, @AccountBalance, @IFSCCode, @AccountOpenedDate)
END
