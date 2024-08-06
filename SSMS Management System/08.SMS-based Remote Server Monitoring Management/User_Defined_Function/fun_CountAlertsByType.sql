-- Counts the number of alerts of a specific type for a given server
CREATE OR ALTER FUNCTION fun_CountAlertsByType(@ServerID INT, @AlertType VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @AlertCount INT
    
    SELECT @AlertCount = COUNT(*)
    FROM Alert
    WHERE ServerID = @ServerID AND AlertType = @AlertType
    
    RETURN @AlertCount
END
