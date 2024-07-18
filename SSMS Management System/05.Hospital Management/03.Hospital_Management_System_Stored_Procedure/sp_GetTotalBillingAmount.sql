-- Stored Procedure to Get Total Billing Amount for Each Patient
CREATE OR ALTER PROCEDURE sp_GetTotalBillingAmount
AS
BEGIN
	SELECT CONCAT(p.PAT_FNAME, ' ', p.PAT_LNAME) AS PAT_FULLNAME, SUM(b.BILL_AMOUNT) AS TOTAL_BILL_AMOUNT
	FROM PATIENTS p 
	INNER JOIN BILLS b ON p.PAT_ID = b.PAT_ID
	GROUP BY CONCAT(p.PAT_FNAME, ' ', p.PAT_LNAME)
END
GO