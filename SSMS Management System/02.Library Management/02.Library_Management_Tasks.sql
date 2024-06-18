/* Find Most Borrowed Books. */
SELECT b.BookTitle, COUNT(br.BorrowId) AS BorrowCount
FROM Books b
JOIN Borrows br ON b.BookId = br.BookId
GROUP BY b.BookTitle
ORDER BY BorrowCount DESC

/* Identify all active and inactive staff members. */

SELECT * FROM Borrows

/* List all books that are currently overdue for return. */
SELECT c.CusFirstName, c.CusLastName, b.BookTitle, br.DateNeedToReturn
FROM Customers c
JOIN Borrows br ON c.CustomerId = br.CustomerId
JOIN Books b ON br.BookId = b.BookId
WHERE br.DateNeedToReturn < GETDATE() AND br.BorrowId NOT IN (SELECT BorrowId FROM Returns);


/* Generate a borrowing history for a specific customer. */


/* Identify the most popular authors based on the number of times their books have been borrowed. */


/* Analyze borrowing trends over the past year. */
SELECT MONTH(br.BorrowDate) AS Months, COUNT(br.BorrowId) AS BorrowCount
FROM Borrows br
GROUP BY DATEPART(MONTH, BorrowDate)
ORDER BY BorrowCount

/* Evaluate the performance of staff based on the number of books issued and returned under their supervision. */


/* List all books currently available for borrowing. */


/* Calculate the total fines accrued by customers. */


/* Determine the popularity of different book genres based on borrow counts. */


/* List all new arrivals in the library within the last month. */


/* Generate a schedule of staff shifts. */


/* Verify compliance with borrow limits. */


/* Analyze historical borrowing data to identify trends over multiple years. */


/* Identify the most popular days for borrowing books. */


/* Analyze the distribution of customer statuses (e.g., active, inactive). */


/* Evaluate the timeliness of book returns. */


/* Track fine payments made by customers. */


/* Analyze the growth of the library's collection over time. */


/* Analyze the demographics of library staff. */

