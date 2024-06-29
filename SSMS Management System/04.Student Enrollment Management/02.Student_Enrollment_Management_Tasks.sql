--1) List all students along with their ages and email addresses.
SELECT CONCAT(s.STU_FNAME, ' ', s.STU_LNAME) AS STUDENT_FULL_NAME, s.STU_AGE, s.STU_EMAIL
FROM STUDENTS s


--2) Retrieve the list of courses along with their start and end dates.
SELECT c.COURSE_TITLE, c.COURSE_START_DATE, c.COURSE_END_DATE
FROM COURSES C


--3) Find all assessments for a specific student.
SELECT CONCAT(s.STU_FNAME, ' ', s.STU_LNAME) AS STUDENT_FULL_NAME, a.ASM_TYPE
FROM STUDENTS s 
INNER JOIN GRADES g ON s.STU_ID = g.STU_ID
INNER JOIN ASSESSMENTS a ON g.ASM_ID = a.ASM_ID
WHERE s.STU_ID = 1


--4) List all instructors and their corresponding courses.
SELECT CONCAT(i.INS_FNAME, ' ', i.INS_LNAME) AS INSTRUCTOR_FULL_NAME, c.COURSE_TITLE
FROM INSTRUCTORS i 
INNER JOIN COURSES c ON i.INS_ID = c.INS_ID


--5) Retrieve the list of students who have registered for more than a specific number of courses.
SELECT CONCAT(s.STU_FNAME, ' ', s.STU_LNAME) AS STUDENT_FULL_NAME, COUNT(c.COURSE_ID) AS NUM_OF_COURSE_REGISTERED
FROM STUDENTS s
INNER JOIN REGISTER r ON s.STU_ID = r.STU_ID 
INNER JOIN COURSES c ON r.COURSE_ID = c.COURSE_ID 
GROUP BY CONCAT(s.STU_FNAME, ' ', s.STU_LNAME)
HAVING COUNT(c.COURSE_ID) > 3


--6) Calculate the total number of students enrolled in each course.
SELECT c.COURSE_TITLE, COUNT(s.STU_ID) AS NUM_OF_PEOPLE_REGISTERED
FROM COURSES c 
INNER JOIN REGISTER r ON c.COURSE_ID = r.COURSE_ID 
INNER JOIN STUDENTS s ON r.STU_ID = s.STU_ID 
GROUP BY c.COURSE_TITLE 


--7) Find the student with the highest final grade in a specific course.
SELECT CONCAT(s.STU_FNAME, ' ', s.STU_LNAME) AS STUDENT_FULL_NAME, g.GRADE 
FROM STUDENTS s 
INNER JOIN GRADES g ON s.STU_ID = g.STU_ID 
INNER JOIN COURSES c ON g.COURSE_ID = c.COURSE_ID 
WHERE c.COURSE_ID = 1
ORDER BY g.GRADE DESC 


--8) List all courses a specific student is registered for.
SELECT CONCAT(s.STU_FNAME, ' ', s.STU_LNAME) AS STUDENT_FULL_NAME, c.COURSE_TITLE 
FROM STUDENTS s 
INNER JOIN REGISTER r ON s.STU_ID = r.STU_ID 
INNER JOIN COURSES c ON r.COURSE_ID = c.COURSE_ID 


--9) Retrieve the details of the assessments for a specific course and their average grades.
SELECT a.ASM_TYPE, AVG(g.GRADE) AS AVERAGE_GRADE
FROM ASSESSMENTS a 
INNER JOIN GRADES g ON a.ASM_ID = g.ASM_ID
WHERE g.COURSE_ID = 1
GROUP BY a.ASM_TYPE



--10) List all instructors who have more than a specific number of courses assigned.
SELECT CONCAT(i.INS_FNAME, ' ', i.INS_LNAME) AS INSTRUCTOR_FULL_NAME, COUNT(c.COURSE_ID) AS COURSES
FROM INSTRUCTORS i 
INNER JOIN COURSES c ON i.INS_ID = c.INS_ID
GROUP BY CONCAT(i.INS_FNAME, ' ', i.INS_LNAME)
HAVING COUNT(c.COURSE_ID) > 1

