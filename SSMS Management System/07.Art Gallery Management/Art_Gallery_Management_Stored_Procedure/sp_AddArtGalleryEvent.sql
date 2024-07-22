-- Add a new art gallery event with details
CREATE OR ALTER PROCEDURE sp_AddArtGalleryEvent 
    @EventLocation VARCHAR(100),
    @EventVenue VARCHAR(100),
    @EventDate DATE,
    @EventNumOfArtists INT,
    @EventNumOfArt INT
AS
BEGIN
    INSERT INTO ArtGallery (Location, Venue, Date, NumberOfArtists, NumberOfArts)
    VALUES (@EventLocation, @EventVenue, @EventDate, @EventNumOfArtists, @EventNumOfArt)
END
GO 