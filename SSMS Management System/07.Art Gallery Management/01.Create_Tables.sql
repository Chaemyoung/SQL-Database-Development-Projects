CREATE TABLE ArtGallery (
    GalleryID INT PRIMARY KEY IDENTITY(1,1),
    Location VARCHAR(100) NOT NULL,
    Venue VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    NumberOfArtists INT NOT NULL,
    NumberOfArts INT NOT NULL
) 
CREATE INDEX IX_ArtGallery_Date ON ArtGallery ([Date])


CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    FistName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Bio VARCHAR(500),
    Achievements VARCHAR(500)
) 
CREATE INDEX IX_Artist_ArtistID ON Artist(ArtistID)


CREATE TABLE Art (
    ArtID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Medium VARCHAR(50) NOT NULL,
    ArtistID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
) 
CREATE INDEX IX_Art_ArtistID ON Art(ArtistID)
CREATE INDEX IX_Art_ArtType ON Art ([Type])


CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL
) 
CREATE INDEX IX_User_UserID ON [User](UserID)


CREATE TABLE Sale (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ArtID INT NOT NULL,
    UserID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    SaleDate DATE NOT NULL,
    FOREIGN KEY (ArtID) REFERENCES Art(ArtID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
) 
CREATE INDEX IX_Sale_ArtID_GalleryID ON Sale (ArtID, GalleryID)


CREATE TABLE Enquiry (
    EnquiryID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    GalleryID INT NOT NULL,
    Message VARCHAR(1000),
    EnquiryDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (GalleryID) REFERENCES ArtGallery(GalleryID)
) 
CREATE INDEX IX_Enquiry_UserID_GalleryID ON Enquiry (UserID, GalleryID)
