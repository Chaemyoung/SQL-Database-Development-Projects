-- Generate a monthly billing report for each patient, including the total bill amount for the month and the details of each bill.
CREATE OR ALTER PROCEDURE sp_GetMonthlyBillingReport
	@Pat_Id INT,
	@Year INT,
	@Month INT
AS
BEGIN
	SELECT CONCAT(p.PAT_FNAME, ' ', p.PAT_LNAME) AS PAT_FULLNAME, b.BILL_ID, b.BILL_AMOUNT, SUM(b.BILL_AMOUNT) OVER (PARTITION BY p.PAT_ID) AS TOTAL_BILL_AMOUNT
	FROM PATIENTS p
	INNER JOIN BILLS b ON p.PAT_ID = b.PAT_ID
	WHERE b.PAT_ID = @Pat_Id AND YEAR(b.BILL_DATE) = @Year AND MONTH(b.BILL_DATE) = @Month
	ORDER BY p.PAT_LNAME, p.PAT_FNAME, b.BILL_DATE
END
GO