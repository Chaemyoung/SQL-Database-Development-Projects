CREATE PROCEDURE sp_InsertAlertAndNotify
    @ServerID INT,
    @AlertType NVARCHAR(50),
    @AlertMessage NVARCHAR(1000)
AS
BEGIN
    DECLARE @AlertID INT

    -- Insert new alert
    INSERT INTO Alert (ServerID, AlertType, AlertMessage)
    VALUES (@ServerID, @AlertType, @AlertMessage)

    SET @AlertID = SCOPE_IDENTITY()

    -- Insert notifications for users monitoring the server
    INSERT INTO Notification (UserID, AlertID)
    SELECT UserID, @AlertID
    FROM UserServerMapping
    WHERE ServerID = @ServerID
END
