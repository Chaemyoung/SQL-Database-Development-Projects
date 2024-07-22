CREATE OR ALTER FUNCTION fun_GetTotalSaleAmount(@GalleryID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN 
    DECLARE @TotalSale DECIMAL(10,2)

    SELECT @TotalSale = COUNT(s.Amount)
    FROM Sale s 
    INNER JOIN Art a ON s.ArtID = a.ArtID 
    INNER JOIN ArtGallery g ON a.ArtistID = g.GalleryID
    WHERE g.GalleryID = @GalleryID

    RETURN @TotalSale
END