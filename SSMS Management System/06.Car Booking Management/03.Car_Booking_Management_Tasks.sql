--1) To find the total payments made per customer
SELECT cus.FirstName, cus.LastName, SUM(p.Amount) AS TotalPayment
FROM Customer cus
INNER JOIN Booking b ON cus.CustomerID = b.CustomerID
INNER JOIN Payment p ON b.BookingID = p.BookingID
GROUP BY cus.FirstName, cus.LastName


--2) To find the number of bookings per car
SELECT c.Manufacturer, c.Model, COUNT(b.BookingID) AS NumberOfBookings
FROM Car c
INNER JOIN Booking b ON c.CarID = b.CarID
GROUP BY c.Manufacturer, c.Model


--3) To find the total amount paid per booking date
SELECT b.BookingDate, SUM(p.Amount) AS TotalAmount
FROM Booking b
INNER JOIN Payment p ON b.BookingID = p.BookingID
GROUP BY b.BookingDate


-- 4) To find the list of cars available at each location
SELECT l.LocationName, c.Manufacturer, c.Model, c.Year
FROM Location l
INNER JOIN Car c ON l.LocationID = c.LocationID
ORDER BY l.LocationName, c.Manufacturer, c.Model


-- 5) To find the number of bookings per location
SELECT l.LocationName, COUNT(b.BookingID) AS NumberOfBookings
FROM Location l
INNER JOIN Car c ON l.LocationID = c.LocationID
INNER JOIN Booking b ON c.CarID = b.CarID
GROUP BY l.LocationName

