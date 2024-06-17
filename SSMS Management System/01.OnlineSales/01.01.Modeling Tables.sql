CREATE DATABASE OnlineSales
GO
USE OnlineSales
GO

CREATE TABLE Customer (
CustomerId INT IDENTITY(1,5) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
UserName varchar(30) NOT NULL UNIQUE,
MembershipStartDate DATE NOT NULL,
)

CREATE TABLE AddressType(
AddressTypeId TINYINT PRIMARY KEY,
Name varchar(20) NOT NULL
)

CREATE TABLE CustomerAddress(
CustomerAddressId INT IDENTITY(1,5) PRIMARY KEY,
CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
AddressTypeId TINYINT NOT NULL FOREIGN KEY REFERENCES AddressType(AddressTYpeId),
AddressLine1 varchar(50) NOT NULL,
City varchar(30) NOT NULL,
Province char(2)
)

CREATE TABLE Orders (
OrderId BIGINT IDENTITY(1000,3) PRIMARY KEY,
CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId), 
OrderDate DATETIME NOT NULL
)

CREATE TABLE Shipment(
Id BIGINT IDENTITY(1,1) PRIMARY KEY,
OrderId BIGINT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
CustomerAddressId INT NOT NULL FOREIGN KEY REFERENCES CustomerAddress(CustomerAddressId),
ShippedDate DATETIME NOT NULL
)

CREATE TABLE Product(
ProductId INT IDENTITY(3000,2) PRIMARY KEY,
ProductName varchar(50) NOT NULL UNIQUE,
ShortDesc varchar(50) NOT NULL,
Price INT NOT NULL,
QuantityInStock INT DEFAULT 0
)

CREATE TABLE OrderDetails(
OrderDetailsId BIGINT IDENTITY(1,1) PRIMARY KEY,
OrderId BIGINT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
ProductId INT NOT NULL FOREIGN KEY REFERENCES Product(ProductId),
Quantity INT
)
