-- Add a new server to the Server table
CREATE OR ALTER PROCEDURE sp_AddServer
    @ServerName NVARCHAR(100),
    @IPAddress NVARCHAR(15),
    @Status NVARCHAR(50) = 'Operational'
AS
BEGIN
    INSERT INTO Server (ServerName, IPAddress, Status)
    VALUES (@ServerName, @IPAddress, @Status)
END
