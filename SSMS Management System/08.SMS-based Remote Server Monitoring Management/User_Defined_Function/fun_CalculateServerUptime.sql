-- Calculates the uptime percentage of a server based on the total time it has been operational versus the total monitored time
CREATE OR ALTER FUNCTION fun_CalculateServerUptime(@ServerID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @TotalMonitoredTime FLOAT
    DECLARE @TotalOperationalTime FLOAT
    
    SELECT @TotalMonitoredTime = COUNT(*)
    FROM Alert
    WHERE ServerID = @ServerID
    
    SELECT @TotalOperationalTime = COUNT(*)
    FROM Alert
    WHERE ServerID = @ServerID AND AlertType = 'Operational'
    
    RETURN (CASE WHEN @TotalMonitoredTime = 0 THEN 0 ELSE (@TotalOperationalTime / @TotalMonitoredTime) * 100 END)
END
