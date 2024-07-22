-- Inserting data into ArtGallery table
INSERT INTO ArtGallery (Location, Venue, Date, NumberOfArtists, NumberOfArts) VALUES
('New York', 'NY Art Center', '2024-08-01', 10, 50),
('San Francisco', 'SF Art Expo', '2024-09-15', 15, 75);

-- Inserting data into Artist table
INSERT INTO Artist (Name, Bio, Achievements) VALUES
('Alice Smith', 'Contemporary artist', 'Exhibited at NY Art Expo'),
('Bob Brown', 'Modern artist', 'Winner of SF Art Award');

-- Inserting data into Art table
INSERT INTO Art (Title, Type, Medium, ArtistID) VALUES
('Sunset Overdrive', 'Painting', 'Oil', 1),
('Abstract Thoughts', 'Sculpture', 'Marble', 2);

-- Inserting data into User table
INSERT INTO User (Name, Email, Phone) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890'),
('Jane Smith', 'jane.smith@example.com', '098-765-4321');

-- Inserting data into Sale table
INSERT INTO Sale (ArtID, UserID, Amount, SaleDate) VALUES
(1, 1, 1500.00, '2024-08-02'),
(2, 2, 2000.00, '2024-09-16');

-- Inserting data into Enquiry table
INSERT INTO Enquiry (UserID, GalleryID, Message, EnquiryDate) VALUES
(1, 1, 'Interested in purchasing art', '2024-08-01'),
(2, 2, 'Looking for more information about the artists', '2024-09-15');
