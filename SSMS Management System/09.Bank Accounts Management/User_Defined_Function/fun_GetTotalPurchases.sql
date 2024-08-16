-- Function to Get Total Purchases by a Customer
CREATE OR ALTER FUNCTION fun_GetTotalPurchases(@CustomerID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalPurchases DECIMAL(18, 2)
    SELECT @TotalPurchases = SUM(Amount)
    FROM CustomerPurchase
    WHERE CustomerID = @CustomerID
    RETURN @TotalPurchases
END
