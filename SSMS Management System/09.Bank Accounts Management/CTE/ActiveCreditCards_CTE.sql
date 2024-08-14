-- CTE for Customers with Active Credit Cards
WITH ActiveCreditCards_CTE AS (
    SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
        Cd.CardNumber, Cd.ExpirationDate
    FROM Customer C
    INNER JOIN Card Cd ON C.CustomerID = Cd.CustomerID
    WHERE Cd.IsActive = 1 AND Cd.CardType = 'Credit'
)
SELECT CustomerID, CustomerName, CardNumber, ExpirationDate
FROM ActiveCreditCards_CTE
ORDER BY ExpirationDate
