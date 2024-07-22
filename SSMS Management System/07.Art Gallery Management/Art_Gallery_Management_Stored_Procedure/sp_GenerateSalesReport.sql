-- Generate Sales Report for a Gallery Event
CREATE OR ALTER PROCEDURE sp_GenerateSalesReport 
    @GalleryID INT
AS
BEGIN 
    SELECT g.Location, g.Venue, g.Date, a.Title, a.Type, a.Medium, u.FirstName AS Buyer, SUM(s.Amount) AS SalesTotal
    FROM ArtGallery g 
    INNER JOIN Enquiry e ON g.GalleryID = e.GalleryID
    INNER JOIN Sale s ON e.UserID = s.UserID
    INNER JOIN Art a ON s.ArtID = a.ArtID 
    INNER JOIN [User] u ON s.UserID = u.UserID
    WHERE g.GalleryID = @GalleryID 
    GROUP BY g.Venue, a.Title, a.Type, a.Medium, u.Name, s.SaleDate
END
GO