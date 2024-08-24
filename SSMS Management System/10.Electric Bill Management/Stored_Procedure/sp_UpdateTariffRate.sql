-- This stored procedure updates the tariff rate for a specific vendor
CREATE OR ALTER PROCEDURE sp_UpdateTariffRate
    @VendorID INT,
    @NewRate DECIMAL(10, 2)
AS
BEGIN
    UPDATE Tariff
    SET RatePerUnit = @NewRate, EffectiveFrom = GETDATE()
    WHERE VendorID = @VendorID
    AND EffectiveTo IS NULL

    UPDATE Tariff
    SET EffectiveTo = GETDATE()
    WHERE VendorID = @VendorID
    AND EffectiveTo IS NULL
END
