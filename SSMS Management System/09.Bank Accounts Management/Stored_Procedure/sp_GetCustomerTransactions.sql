-- Stored Procedure to Get All Transactions for a Customer
CREATE OR ALTER PROCEDURE sp_GetCustomerTransactions
    @CustomerID INT
AS
BEGIN
    SELECT 
        T.TransactionID, A.AccountNumber, T.TransactionDate, T.TransactionType,
        T.Amount, T.Mode, T.Status
    FROM [Transaction] T
    INNER JOIN Account A ON T.AccountID = A.AccountID
    WHERE A.CustomerID = @CustomerID
    ORDER BY T.TransactionDate DESC
END
