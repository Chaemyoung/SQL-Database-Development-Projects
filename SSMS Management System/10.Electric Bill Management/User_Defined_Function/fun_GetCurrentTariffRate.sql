-- This function retrieves the current tariff rate for a specific vendor
CREATE OR ALTER FUNCTION fun_GetCurrentTariffRate(@VendorID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TariffRate DECIMAL(10, 2)

    SELECT TOP 1 @TariffRate = RatePerUnit
    FROM Tariff
    WHERE VendorID = @VendorID
    ORDER BY EffectiveFrom DESC

    RETURN ISNULL(@TariffRate, 0)
END
