-- Retrieves the most recent alert message for a given server
CREATE OR ALTER FUNCTION fun_GetLastAlertMessage(@ServerID INT)
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @LastAlertMessage VARCHAR(255)
    
    SELECT TOP 1 @LastAlertMessage = AlertMessage
    FROM Alert
    WHERE ServerID = @ServerID
    ORDER BY AlertDate DESC
    
    RETURN @LastAlertMessage
END
