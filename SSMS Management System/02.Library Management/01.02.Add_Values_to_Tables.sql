-- Add datas to Authors Table
INSERT INTO Authors (AuthorId, AuthorFirstName, AuthorLastName) VALUES
(1, 'George', 'Orwell'),
(2, 'Jane', 'Austen'),
(3, 'Mark', 'Twain');

-- Add datas to BooksStatus Table
INSERT INTO BooksStatus (BookStatusId, Status) VALUES
('available', 'Available'),
('borrowed', 'Borrowed'),
('reserved', 'Reserved');

-- Add datas to Books Table
INSERT INTO Books (BookId, AuthorId, ISBN, PublishDate, BookStatusId, BookTitle) VALUES
(1, 1, 9780451524935, '1949-06-08', 'available', '1984'),
(2, 2, 9780141439518, '1813-01-28', 'borrowed', 'Pride and Prejudice'),
(3, 3, 9780486280615, '1884-12-10', 'reserved', 'The Adventures of Huckleberry Finn');

-- Add datas to Sex Table
INSERT INTO Sex (SexTypeId, SexName) VALUES
('M', 'Male'),
('F', 'Female'),
('O', 'Other');


-- Add datas to StaffStatus Table
INSERT INTO StaffStatus (StaffStatusId, Status) VALUES
('active', 'Active'),
('inactive', 'Inactive'),
('on_leave', 'On Leave');


-- Add datas to Staffs Table
INSERT INTO Staffs (StaffId, StaffFirstName, StaffLastName, EmployedDate, DOB, SexTypeId, StaffStatusId) VALUES
(1, 'John', 'Doe', '2020-01-15', '1980-05-20', 'M', 'active'),
(2, 'Jane', 'Smith', '2019-04-23', '1990-08-10', 'F', 'inactive'),
(3, 'Emily', 'Jones', '2021-09-12', '1985-12-05', 'F', 'on_leave');


-- Add datas to CustomerStatus Table
INSERT INTO CustomerStatus (CusStatusId, Status) VALUES
('active', 'Active'),
('inactive', 'Inactive'),
('suspended', 'Suspended');


-- Add datas to Customers Table
INSERT INTO Customers (CustomerId, CusFirstName, CusLastName, CusStatusId) VALUES
(1, 'Alice', 'Johnson', 'active'),
(2, 'Bob', 'Brown', 'inactive'),
(3, 'Charlie', 'Davis', 'suspended');


-- Add datas to MaxBorrowLimits Table
INSERT INTO MaxBorrowLimits (MaxBorrowLimitId, MaxBorrowNumber) VALUES
(1, 5),
(2, 10),
(3, 15);

-- Add datas to Borrows Table
INSERT INTO Borrows (BorrowId, CustomerId, StaffId, BookId, BorrowDate, DateNeedToReturn, BorrowedNumber, MaxBorrowLimitId) VALUES
(1, 1, 1, 2, '2024-06-01', '2024-06-15', 1, 1),
(2, 2, 2, 1, '2024-06-02', '2024-06-16', 2, 2),
(3, 3, 3, 3, '2024-06-03', '2024-06-17', 3, 3);

-- Add datas to Returns Table
INSERT INTO Returns (ReturnId, BorrowId, ReturnDate) VALUES
(1, 1, '2024-06-10'),
(2, 2, '2024-06-12'),
(3, 3, '2024-06-14');
