--This CTE retrieves customer feedback for a specific vendor
WITH VendorFeedback_CTE AS (
    SELECT V.VendorName, C.FirstName + ' ' + C.LastName AS CustomerName,
        F.FeedbackText, F.FeedbackDate
    FROM CustomerFeedback F
    INNER JOIN Customer C ON F.CustomerID = C.CustomerID
    INNER JOIN Vendor V ON F.VendorID = V.VendorID
    WHERE V.VendorID = 2
)
SELECT * FROM VendorFeedback_CTE
ORDER BY FeedbackDate DESC
