-- Trigger to Update Server Status Based on Alerts
CREATE OR ALTER TRIGGER trg_UpdateServerStatus
ON Alert
AFTER INSERT
AS
BEGIN
    UPDATE Server
    SET Status = 'Down'
    WHERE ServerID IN (SELECT DISTINCT ServerID FROM inserted);
END;
