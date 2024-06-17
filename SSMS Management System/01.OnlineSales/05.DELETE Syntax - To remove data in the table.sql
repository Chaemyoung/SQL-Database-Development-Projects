--  Remove the data for FirstName = David and LastName = Ryan in Customer table.
DELETE FROM Customer WHERE FirstName = 'David' AND LastName = 'Ryan'

-- Cannot delete rows that are being referenced to different table
DELETE FROM Customer WHERE FirstName = 'Mike' AND LastName = 'Johnson'
