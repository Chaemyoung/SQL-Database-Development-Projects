-- 1) Monthly Billing Report
SELECT C.FirstName + ' ' + C.LastName AS CustomerName, B.BillDate,
    B.UnitsConsumed, B.AmountDue,
    CASE 
        WHEN B.IsPaid = 1 THEN 'Paid'
        ELSE 'Unpaid'
    END AS PaymentStatus
FROM Billing B
INNER JOIN Account A ON B.AccountID = A.AccountID
INNER JOIN Customer C ON A.CustomerID = C.CustomerID
WHERE MONTH(B.BillDate) = 8 AND YEAR(B.BillDate) = 2024


-- 2) Vendor-Wise Customer Count Report
SELECT V.VendorName, COUNT(C.CustomerID) AS NumberOfCustomers
FROM Vendor V
LEFT JOIN Customer C ON V.VendorID = C.VendorID
GROUP BY V.VendorName
ORDER BY NumberOfCustomers DESC


-- 3) Top 5 High-Consumption Customers
SELECT C.FirstName + ' ' + C.LastName AS CustomerName,
    B.BillDate, B.UnitsConsumed, B.AmountDue
FROM Billing B
INNER JOIN Account A ON B.AccountID = A.AccountID
INNER JOIN Customer C ON A.CustomerID = C.CustomerID
ORDER BY B.UnitsConsumed DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY


-- 4) Tariff Rate Changes Report
SELECT V.VendorName, T.RatePerUnit, T.EffectiveFrom, T.EffectiveTo
FROM Tariff T
INNER JOIN Vendor V ON T.VendorID = V.VendorID
ORDER BY V.VendorName, T.EffectiveFrom DESC


-- 5) Customer Feedback Summary
SELECT V.VendorName,
    C.FirstName + ' ' + C.LastName AS CustomerName, F.FeedbackText, F.FeedbackDate
FROM CustomerFeedback F
INNER JOIN Customer C ON F.CustomerID = C.CustomerID
INNER JOIN Vendor V ON F.VendorID = V.VendorID
ORDER BY F.FeedbackDate DESC
