-- CTE for Customers with Multiple Products
WITH MultipleProducts_CTE AS (
    SELECT C.CustomerID, 
        C.FirstName + ' ' + C.LastName AS CustomerName,COUNT(CP.ProductType) AS ProductCount
    FROM Customer C
    INNER JOIN CustomerPurchase CP ON C.CustomerID = CP.CustomerID
    GROUP BY C.CustomerID, C.FirstName, C.LastName
    HAVING COUNT(CP.ProductType) > 1
)
SELECT CustomerID, CustomerName, ProductCount
FROM MultipleProducts_CTE
ORDER BY ProductCount DESC
