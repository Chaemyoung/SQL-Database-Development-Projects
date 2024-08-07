CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL
)
CREATE INDEX IX_User_PhoneNumber ON [User] (PhoneNumber)



CREATE TABLE Server (
    ServerID INT IDENTITY(1,1) PRIMARY KEY,
    ServerName VARCHAR(100) NOT NULL,
    IPAddress VARCHAR(15) NOT NULL UNIQUE,
    Status VARCHAR(50) NOT NULL DEFAULT 'Operational'
)
CREATE INDEX IX_Server_Status ON Server (Status)



CREATE TABLE UserServerMapping (
    UserID INT,
    ServerID INT,
    PRIMARY KEY (UserID, ServerID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ServerID) REFERENCES Server(ServerID)
)


CREATE TABLE Alert (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    ServerID INT,
    AlertType VARCHAR(50) NOT NULL,
    AlertMessage VARCHAR(1000) NOT NULL,
    AlertDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ServerID) REFERENCES Server(ServerID)
)


CREATE TABLE Notification (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    AlertID INT,
    SentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (AlertID) REFERENCES Alert(AlertID)
)
