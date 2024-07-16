-- Inserting data into Customer table
INSERT INTO Customer (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321'),
('Jim', 'Beam', 'jim.beam@example.com', '555-555-5555'),
('Alice', 'Johnson', 'alice.johnson@example.com', '222-333-4444'),
('Bob', 'Brown', 'bob.brown@example.com', '333-444-5555'),
('Charlie', 'Davis', 'charlie.davis@example.com', '444-555-6666'),
('Diana', 'Evans', 'diana.evans@example.com', '555-666-7777'),
('Frank', 'Green', 'frank.green@example.com', '666-777-8888'),
('Grace', 'Hill', 'grace.hill@example.com', '777-888-9999'),
('Henry', 'Ivy', 'henry.ivy@example.com', '888-999-0000')

-- Inserting data into Location table
INSERT INTO Location (LocationName, Address) VALUES
('Downtown Branch', '123 Main St, Burnaby'),
('Airport Branch', '456 Airport Rd, Richmond'),
('Suburb Branch', '789 Suburb St, Langley')

-- Inserting data into Car table
INSERT INTO Car (Make, Model, Year, LicensePlate, LocationID) VALUES
('Toyota', 'Camry', 2020, 'ABC123', 1),
('Honda', 'Civic', 2019, 'XYZ456', 2),
('Ford', 'Focus', 2021, 'LMN789', 3),
('Chevrolet', 'Malibu', 2018, 'QRS112', 1),
('Nissan', 'Altima', 2017, 'TUV223', 2),
('BMW', '3 Series', 2022, 'WXY334', 3),
('Audi', 'A4', 2019, 'JKL445', 1),
('Mercedes', 'C-Class', 2021, 'FGH556', 2),
('Kia', 'Optima', 2020, 'OPQ667', 3),
('Hyundai', 'Sonata', 2018, 'MNO778', 1)

-- Inserting data into Booking table
INSERT INTO Booking (CustomerID, CarID, BookingDate, ReturnDate) VALUES
(1, 1, '2023-07-01', '2023-07-10'),
(2, 2, '2023-07-05', '2023-07-15'),
(3, 3, '2023-07-08', '2023-07-18'),
(4, 4, '2023-07-11', '2023-07-20'),
(5, 5, '2023-07-13', '2023-07-22'),
(6, 6, '2023-07-14', '2023-07-23'),
(7, 7, '2023-07-16', '2023-07-25'),
(8, 8, '2023-07-18', '2023-07-27'),
(9, 9, '2023-07-19', '2023-07-28'),
(10, 10, '2023-07-20', '2023-07-29')

-- Inserting data into Payment table
INSERT INTO Payment (BookingID, Amount, PaymentDate) VALUES
(1, 500.00, '2023-07-01'),
(2, 600.00, '2023-07-05'),
(3, 550.00, '2023-07-08'),
(4, 450.00, '2023-07-11'),
(5, 700.00, '2023-07-13'),
(6, 650.00, '2023-07-14'),
(7, 800.00, '2023-07-16'),
(8, 750.00, '2023-07-18'),
(9, 620.00, '2023-07-19'),
(10, 580.00, '2023-07-20')
