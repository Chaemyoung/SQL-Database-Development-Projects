-- Add a new column to an existing table.
ALTER TABLE Customer
ADD EmailAddress VARCHAR(50)

-- Drop the foreign key on ProductId column.
SELECT    f.name AS foreign_key_name,    OBJECT_NAME(f.parent_object_id) AS table_name,    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS constraint_column_name,    OBJECT_NAME(f.referenced_object_id) AS referenced_object,    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS referenced_column_name,    f.is_disabled

FROM sys.foreign_keys AS f

INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id

ALTER TABLE OrderDetails DROP CONSTRAINT FK_OrderDetails_ProductId

-- Add the foreign key on ProductId references Product(ProductId)
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_ProductId FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
