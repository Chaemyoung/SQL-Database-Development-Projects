-- Calculate the Time Since Last Alert
CREATE OR ALTER FUNCTION fun_TimeSinceLastAlert(@ServerID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @LastAlertDate DATETIME
    DECLARE @TimeSinceLastAlert VARCHAR(50)

    SELECT @LastAlertDate = MAX(AlertDate)
    FROM Alert
    WHERE ServerID = @ServerID

    IF @LastAlertDate IS NULL
        SET @TimeSinceLastAlert = 'No alerts'
    ELSE
        SET @TimeSinceLastAlert = CONVERT(VARCHAR(50), DATEDIFF(MINUTE, @LastAlertDate, GETDATE())) + ' minutes ago'

    RETURN @TimeSinceLastAlert
END
