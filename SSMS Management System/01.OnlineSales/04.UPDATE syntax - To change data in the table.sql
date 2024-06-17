-- Change the MembershipStartDate to November 01 2022 for Mike Johnson in Customer table.
UPDATE Customer
SET MembershipStartDate = '2022-11-01'
WHERE CustomerId = 1

-- In the Customer table set the value for the column EmailAddress to 'Not Provided' for all the records.
UPDATE Customer
SET EmailAddress = 'Not Provided'
