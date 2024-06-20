CREATE DATABASE LibraryManagement
GO
USE LibraryManagement
GO

-- Authors Table
CREATE TABLE Authors (
    AuthorId BIGINT PRIMARY KEY,
    AuthorFirstName VARCHAR(255),
    AuthorLastName VARCHAR(255)
)

-- BooksStatus Table
CREATE TABLE BooksStatus (
    BookStatusId VARCHAR(255) PRIMARY KEY,
    Status VARCHAR(255)
)

-- Sex Table
CREATE TABLE Sex (
    SexTypeId VARCHAR(255) PRIMARY KEY,
    SexName VARCHAR(255)
)

-- StaffStatus Table
CREATE TABLE StaffStatus (
    StaffStatusId VARCHAR(255) PRIMARY KEY,
    Status VARCHAR(255)
)

-- Staffs Table
CREATE TABLE Staffs (
    StaffId BIGINT PRIMARY KEY,
    StaffFirstName VARCHAR(255),
    StaffLastName VARCHAR(255),
    EmployedDate DATE,
    DOB DATE,
    SexTypeId VARCHAR(255),
    StaffStatusId VARCHAR(255),
    WorkShiftStart TIME,
    WorkShiftEnd TIME,
    FOREIGN KEY (SexTypeId) REFERENCES Sex(SexTypeId),
    FOREIGN KEY (StaffStatusId) REFERENCES StaffStatus(StaffStatusId)
)

-- CustomerStatus Table
CREATE TABLE CustomerStatus (
    CusStatusId VARCHAR(255) PRIMARY KEY,
    Status VARCHAR(255)
)

-- Customers Table
CREATE TABLE Customers (
    CustomerId BIGINT PRIMARY KEY,
    CusFirstName VARCHAR(255),
    CusLastName VARCHAR(255),
    CusStatusId VARCHAR(255),
    FOREIGN KEY (CusStatusId) REFERENCES CustomerStatus(CusStatusId)
)

-- MaxBorrowLimits Table
CREATE TABLE MaxBorrowLimits (
    MaxBorrowLimitId BIGINT PRIMARY KEY,
    MaxBorrowNumber INT
)

-- Borrows Table
CREATE TABLE Borrows (
    BorrowId BIGINT PRIMARY KEY,
    CustomerId BIGINT,
    StaffId BIGINT,
    BorrowDate DATE,
    DateNeedToReturn DATE,
    NumberOfBooksBorrowed INT,
    MaxBorrowLimitId BIGINT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (StaffId) REFERENCES Staffs(StaffId),
    FOREIGN KEY (MaxBorrowLimitId) REFERENCES MaxBorrowLimits(MaxBorrowLimitId)
)

-- Books Table
CREATE TABLE Books (
    BookId BIGINT PRIMARY KEY,
    ISBN BIGINT,
    PublishDate DATE,
    BookStatusId VARCHAR(255),
    BookTitle VARCHAR(255),
    Genre VARCHAR(20),
    FOREIGN KEY (BookStatusId) REFERENCES BooksStatus(BookStatusId)
)

-- Writes table
CREATE TABLE Writes (
    BookId BIGINT,
    AuthorId BIGINT,
    PRIMARY KEY (BookId, AuthorId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId),
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
)

-- Returns Table
CREATE TABLE Returns (
    ReturnId BIGINT PRIMARY KEY,
    BorrowId BIGINT,
    ReturnDate DATE,
    Fine DECIMAL(8, 2),
    FOREIGN KEY (BorrowId) REFERENCES Borrows(BorrowId)
)

-- FinePayments table
CREATE TABLE FinePayments (
    PaymentId BIGINT PRIMARY KEY,
    CustomerId BIGINT,
    PaymentDate DATE,
    Amount DECIMAL(8, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
)