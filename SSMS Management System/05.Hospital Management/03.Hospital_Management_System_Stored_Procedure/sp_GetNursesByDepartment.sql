-- Stored Procedure to List All Nurses in a Specific Department
CREATE OR ALTER PROCEDURE sp_GetNursesByDepartment
	@Dept_Id BIGINT
AS 
BEGIN
	SELECT CONCAT(n.NUR_FNAME, ' ', n.NUR_LNAME) AS NUR_FULLNAME, dep.DEPT_NAME
	FROM NURSES n 
	INNER JOIN DEPARTMENTS dep ON n.DEPT_ID = dep.DEPT_ID
	WHERE dep.DEPT_ID = @Dept_Id
END
GO