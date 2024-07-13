--1) Total payments made per customer
SELECT c.FirstName, c.LastName, SUM(p.Amount) AS TotalPayment
FROM Customer c
INNER JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Payment p ON b.BookingID = p.BookingID
GROUP BY c.FirstName, c.LastName


--2) Number ofbookings per car
SELECT c.Make, c.Model, COUNT(b.BookingID) AS NumberOfBookings
FROM Car c
INNER JOIN Booking b ON c.CarID = b.CarID
GROUP BY c.Make, c.Model


--3) Total amount paid per booking date
SELECT b.BookingDate, SUM(p.Amount) AS TotalAmount
FROM Booking b
INNER JOIN Payment p ON b.BookingID = p.BookingID
GROUP BY b.BookingDate;
