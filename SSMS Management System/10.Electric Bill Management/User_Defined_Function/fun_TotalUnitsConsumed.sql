-- This function calculates the total units consumed by a customer across all billing cycles
CREATE OR ALTER FUNCTION fun_TotalUnitsConsumed(@CustomerID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalUnits DECIMAL(10, 2)

    SELECT @TotalUnits = SUM(B.UnitsConsumed)
    FROM Billing B
    JOIN Account A ON B.AccountID = A.AccountID
    WHERE A.CustomerID = @CustomerID

    RETURN ISNULL(@TotalUnits, 0)
END
