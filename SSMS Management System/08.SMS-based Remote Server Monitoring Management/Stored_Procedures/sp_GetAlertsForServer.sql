-- retrieve all alerts associated with a specific server
CREATE OR ALTER PROCEDURE sp_GetAlertsForServer
    @ServerID INT
AS
BEGIN
    SELECT a.AlertID, a.AlertType, a.AlertMessage, a.AlertDate, s.ServerName
    FROM Alert a
    INNER JOIN Server s ON a.ServerID = s.ServerID
    WHERE a.ServerID = @ServerID
    ORDER BY a.AlertDate DESC
END
