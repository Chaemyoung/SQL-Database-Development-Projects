-- Calculate the Time Since Last Alert
CREATE OR ALTER FUNCTION fun_TimeSinceLastAlert(@ServerID INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @LastAlertDate DATETIME
    DECLARE @TimeSinceLastAlert NVARCHAR(50)

    SELECT @LastAlertDate = MAX(AlertDate)
    FROM Alert
    WHERE ServerID = @ServerID

    IF @LastAlertDate IS NULL
        SET @TimeSinceLastAlert = 'No alerts'
    ELSE
        SET @TimeSinceLastAlert = CONVERT(NVARCHAR(50), DATEDIFF(MINUTE, @LastAlertDate, GETDATE())) + ' minutes ago'

    RETURN @TimeSinceLastAlert
END
