-- 1) Total Sales Amount per Art Gallery Event
SELECT g.Location, g.Venue, SUM(s.Amount) AS TotalSales
FROM ArtGallery g
INNER JOIN Enquiry e ON g.GalleryID = e.GalleryID
INNER JOIN Sale s ON e.UserID = s.UserID
GROUP BY g.Location, g.Venue


-- 2) Number of Arts by Each Artist:
SELECT a.Name, COUNT(art.ArtID) AS NumberOfArts
FROM Artist a
INNER JOIN Art art ON a.ArtistID = art.ArtistID
GROUP BY a.Name


-- 3) List of Users Registered for Each Gallery Event:
SELECT g.Location, g.Venue, u.Name, u.Email
FROM ArtGallery g
INNER JOIN Enquiry e ON g.GalleryID = e.GalleryID
INNER JOIN User u ON e.UserID = u.UserID
ORDER BY g.Location, g.Venue, u.Name


-- 4) Total Enquiries per Gallery Event:
SELECT g.Location, g.Venue, COUNT(e.EnquiryID) AS TotalEnquiries
FROM ArtGallery g
INNER JOIN Enquiry e ON g.GalleryID = e.GalleryID
GROUP BY g.Location, g.Venue


-- 5) Sales Details for Each Artwork:
SELECT art.Title, art.Type, art.Medium, u.Name AS Buyer, s.Amount, s.SaleDate
FROM Art art
INNER JOIN Sale s ON art.ArtID = s.ArtID
INNER JOIN User u ON s.UserID = u.UserID
ORDER BY art.Title
