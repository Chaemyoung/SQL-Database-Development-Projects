-- This function calculates the total unpaid amount for a specific customer
CREATE OR ALTER FUNCTION fun_TotalAmountDueByCustomer(@CustomerID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalAmountDue DECIMAL(10, 2)

    SELECT @TotalAmountDue = SUM(B.AmountDue)
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    WHERE A.CustomerID = @CustomerID AND B.IsPaid = 0

    RETURN ISNULL(@TotalAmountDue, 0)
END
