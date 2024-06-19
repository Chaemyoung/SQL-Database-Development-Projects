/* Find Most Borrowed Books. */
SELECT b.BookTitle, COUNT(br.BorrowId) AS BorrowCount
FROM Books b INNER JOIN Borrows br 
ON b.BookId = br.BookId
GROUP BY b.BookTitle
ORDER BY BorrowCount DESC

/* Identify all active and inactive staff members. */
SELECT CONCAT(s.StaffFirstName, ' ', s.StaffLastName) AS StaffFullName, ss.Status
FROM Staffs s INNER JOIN StaffStatus ss ON s.StaffStatusId = ss.StaffStatusId
WHERE s.StaffStatusId = 'active'

/* List all books that are currently overdue for return. */
SELECT c.CusFirstName, c.CusLastName, b.BookTitle, br.DateNeedToReturn
FROM Customers c INNER JOIN Borrows br ON c.CustomerId = br.CustomerId
INNER JOIN Books b ON br.BookId = b.BookId
WHERE br.DateNeedToReturn < GETDATE() AND br.BorrowId NOT IN (SELECT BorrowId FROM Returns);


/* Generate a borrowing history for a specific customer. */
SELECT CONCAT(cus.CusFirstName, ' ', cus.CusLastName) AS CusFullName, b.BookTitle, CONCAT(a.AuthorFirstName, ' ', a.AuthorLastName) AS AuthorFullName, br.BorrowDate, r.ReturnDate
FROM Customers cus INNER JOIN Borrows br ON cus.CustomerId = br.CustomerId
INNER JOIN Books b ON br.BookId = b.BookId
INNER JOIN Authors a ON b.AuthorId = a.AuthorId
INNER JOIN Returns r ON br.BorrowId = r.BorrowId
WHERE cus.CustomerId = 2

/* Identify the most popular authors based on the number of times their books have been borrowed. */
SELECT CONCAT(a.AuthorFirstName, ' ', a.AuthorLastName) AS AuthorFullName, COUNT(br.BookId) AS BorrowCount
FROM Borrows br INNER JOIN Books b ON br.BookId = b.BookId
INNER JOIN Authors a ON b.AuthorId = a.AuthorId
GROUP BY a.AuthorFirstName, a.AuthorLastName
ORDER BY BorrowCount DESC

/* Analyze borrowing trends over the past year. */
SELECT MONTH(br.BorrowDate) AS Months, COUNT(br.BorrowId) AS BorrowCount
FROM Borrows br
GROUP BY DATEPART(MONTH, BorrowDate)
ORDER BY BorrowCount

/* Evaluate the performance of staff based on the number of books issued and returned under their supervision. */
SELECT CONCAT(s.StaffFirstName, ' ', s.StaffLastName) AS StaffFullName, COUNT(br.StaffId) AS StaffCount
FROM Staffs s INNER JOIN Borrows br ON s.StaffId = br.StaffId
GROUP BY s.StaffFirstName, s.StaffLastName
ORDER BY StaffCount

/* List all books currently available for borrowing. */
SELECT b.BookTitle
FROM Books b
WHERE BookStatusId = 'available'

/* Calculate the total fines accrued by customers. */
SELECT SUM(r.Fine) as TotalFine
FROM Returns r

/* Determine the popularity of different book genres based on borrow counts. */
SELECT b.Genre, COUNT(br.BookId) AS BorrowCount
FROM Borrows br INNER JOIN Books b ON br.BookId = b.BookId
GROUP BY b.Genre
ORDER BY BorrowCount DESC

/* List all new arrivals in the library within the last month. */
SELECT MONTH(br.DateNeedToReturn) AS NewArrivalMonth, b.BookTitle
FROM Borrows br INNER JOIN Books b ON br.BookId = b.BookId
WHERE MONTH(GETDATE()) = MONTH(br.DateNeedToReturn)

/* Generate a schedule of staff shifts. */


/* Verify compliance with borrow limits. */
SELECT CONCAT(cus.CusFirstName, ' ', cus.CusLastName) AS CusFullName, (m.MaxBorrowNumber - br.BorrowedNumber) AS availableNumOfBorrowLimit
FROM Borrows br INNER JOIN MaxBorrowLimits m ON br.MaxBorrowLimitId = m.MaxBorrowLimitId
INNER JOIN Customers cus ON br.CustomerId = cus.CustomerId

/* Analyze historical borrowing data to identify trends over multiple years. */
SELECT YEAR(BorrowDate) AS BorrowYear, COUNT(*) AS BorrowCount
FROM Borrows
GROUP BY YEAR(BorrowDate)
ORDER BY BorrowYear;

/* Identify the most popular days for borrowing books. */
SELECT DATENAME(WEEKDAY, BorrowDate) AS BorrowDay, COUNT(*) AS BorrowCount
FROM Borrows
GROUP BY DATENAME(WEEKDAY, BorrowDate), DATEPART(WEEKDAY, BorrowDate)
ORDER BY BorrowCount DESC

/* Analyze the distribution of customer statuses (e.g., active, inactive). */
SELECT cs.Status, COUNT(*) AS Distribution
FROM Customers cus INNER JOIN CustomerStatus cs ON cus.CusStatusId = cs.CusStatusId
GROUP BY cs.[Status]
ORDER BY Distribution DESC

/* Evaluate the timeliness of book returns. */
SELECT b.BorrowId, b.CustomerId, b.BookId, b.BorrowDate, b.DateNeedToReturn, r.ReturnDate,
    CASE 
        WHEN r.ReturnDate <= b.DateNeedToReturn THEN 'On Time'
        ELSE 'Late'
    END AS ReturnStatus, DATEDIFF(DAY, b.DateNeedToReturn, r.ReturnDate) AS DaysLate
FROM Borrows b INNER JOIN Returns r ON b.BorrowId = r.BorrowId
ORDER BY b.BorrowId

/* Track fine payments made by customers. */
SELECT c.CustomerId, CONCAT(c.CusFirstName, ' ', c.CusLastName) AS CustomerName, fp.PaymentDate, fp.Amount
FROM Customers c
JOIN FinePayments fp ON c.CustomerId = fp.CustomerId
ORDER BY fp.PaymentDate DESC

/* Analyze the demographics of library staff. */
-- Query to analyze gender distribution of library staff
SELECT s.SexName, COUNT(*) AS SexDistribution
FROM Sex s INNER JOIN Staffs st ON s.SexTypeId = st.SexTypeId
GROUP BY s.SexName

-- Query to analyze employment status of library staff
SELECT ss.Status, COUNT(*) AS EmploymentStatus
FROM Staffs st INNER JOIN StaffStatus ss ON st.StaffStatusId = ss.StaffStatusId
GROUP BY ss.Status

-- Query to analyze age distribution of library staff
SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) < 30 THEN 'Less then 30 years old!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59!'
        ELSE '60 Above'
    END AS AgeGroup, COUNT(*) AS AgeCount
FROM Staffs st
GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) < 30 THEN 'Less then 30 years old!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49!'
        WHEN DATEDIFF(YEAR, st.DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59!'
        ELSE '60 Above'
    END
ORDER BY AgeCount DESC