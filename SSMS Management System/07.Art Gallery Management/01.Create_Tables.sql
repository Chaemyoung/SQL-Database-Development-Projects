CREATE TABLE ArtGallery (
    GalleryID INT PRIMARY KEY IDENTITY(1,1),
    Location VARCHAR(100) NOT NULL,
    Venue VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    NumberOfArtists INT NOT NULL,
    NumberOfArts INT NOT NULL
) 

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Bio VARCHAR(500),
    Achievements VARCHAR(500)
) 

CREATE TABLE Art (
    ArtID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Medium VARCHAR(50) NOT NULL,
    ArtistID INT NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
) 

CREATE TABLE User (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL
) 

CREATE TABLE Sale (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ArtID INT NOT NULL,
    UserID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    SaleDate DATE NOT NULL,
    FOREIGN KEY (ArtID) REFERENCES Art(ArtID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) 

CREATE TABLE Enquiry (
    EnquiryID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    GalleryID INT NOT NULL,
    Message VARCHAR(1000),
    EnquiryDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (GalleryID) REFERENCES ArtGallery(GalleryID)
) 