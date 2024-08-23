-- Generates a bill for a customer based on the units consumed and the applicable tariff rate
CREATE OR ALTER PROCEDURE sp_GenerateMonthlyBill
    @CustomerID INT,
    @UnitsConsumed DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TariffRate DECIMAL(10, 2)
    DECLARE @AmountDue DECIMAL(10, 2)

    SELECT TOP 1 @TariffRate = RatePerUnit 
    FROM Tariff
    WHERE VendorID = (SELECT VendorID FROM Customer WHERE CustomerID = @CustomerID)
    ORDER BY EffectiveFrom DESC

    SET @AmountDue = @UnitsConsumed * @TariffRate

    INSERT INTO Billing (AccountID, BillDate, UnitsConsumed, AmountDue, IsPaid)
    VALUES (
        (SELECT AccountID FROM Account WHERE CustomerID = @CustomerID),
        GETDATE(),
        @UnitsConsumed,
        @AmountDue,
        0
    )
END
