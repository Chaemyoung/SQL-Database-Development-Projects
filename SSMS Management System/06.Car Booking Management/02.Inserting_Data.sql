-- Inserting data into Customer table
INSERT INTO Customer (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321'),
('Jim', 'Beam', 'jim.beam@example.com', '555-555-5555');

-- Inserting data into Car table
INSERT INTO Car (Make, Model, Year, LicensePlate) VALUES
('Toyota', 'Camry', 2020, 'ABC123'),
('Honda', 'Civic', 2019, 'XYZ456'),
('Ford', 'Focus', 2021, 'LMN789');

-- Inserting data into Booking table
INSERT INTO Booking (CustomerID, CarID, BookingDate, ReturnDate) VALUES
(1, 1, '2023-07-01', '2023-07-10'),
(2, 2, '2023-07-05', '2023-07-15'),
(3, 3, '2023-07-08', '2023-07-18');

-- Inserting data into Payment table
INSERT INTO Payment (BookingID, Amount, PaymentDate) VALUES
(1, 500.00, '2023-07-01'),
(2, 600.00, '2023-07-05'),
(3, 550.00, '2023-07-08');
