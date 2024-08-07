-- Stored Procedure to Get Appointment History for a Specific Patient
CREATE OR ALTER PROCEDURE sp_GetPatientAppointmentHistory
	@Pat_id BIGINT
AS 
BEGIN 
	SELECT CONCAT(p.PAT_FNAME, ' ', p.PAT_LNAME) AS PAT_FULLNAME, a.APP_DATE, CONCAT(a.APP_START_TIME, ' - ', a.APP_END_TIME) AS APP_TIME, CONCAT(d.DOC_FNAME, ' ', d.DOC_LNAME) AS DOC_FULLNAME
	FROM PATIENTS p
	INNER JOIN PATIENTS_APPOINTMENTS pa ON p.PAT_ID = pa.PAT_ID
	INNER JOIN APPOINTMENTS a ON pa.APP_ID = a.APP_ID
	INNER JOIN DOCTORS d ON a.DOC_ID = d.DOC_ID
	WHERE p.PAT_ID = @Pat_id
END
GO