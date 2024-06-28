SELECT * FROM PASSENGERS
SELECT * FROM PASSES
SELECT * FROM TRAIN_DETAILS
SELECT * FROM TRAIN_TYPES
SELECT * FROM ROUTES
SELECT * FROM ROUTES_STATIONS
SELECT * FROM STATIONS
SELECT * FROM PROVINCE_COUNTRY


--1) List all train details including the number of coaches.
SELECT td.TRAIN_ID, td.TRAIN_NAME, td.COACHES_NUM, tt.TRAIN_TYPE 
FROM TRAIN_DETAILS td 
INNER JOIN TRAIN_TYPES tt ON td.TRAIN_TYPE_ID = tt.TRAIN_TYPE_ID


--2) Retrieve the schedule for a specific train type.
SELECT td.TRAIN_ID, td.TRAIN_NAME, r.DEPARTURE_TIME, r.ARRIVAL_TIME 
FROM TRAIN_DETAILS td 
INNER JOIN PASSES ps ON td.TRAIN_ID = ps.TRAIN_ID
INNER JOIN ROUTES r ON ps.ROUTE_ID = r.ROUTE_ID
WHERE td.TRAIN_TYPE_ID = 1


--3) Find all passengers with passes expiring in the next month.
SELECT CONCAT(p.PASN_FNAME, ' ', p.PASN_LNAME) AS PASSENGER_NAME, p.PASN_AGE, p.PASN_PHONE_NUM, p.PASN_EMAIL
FROM PASSENGERS p 
INNER JOIN PASSES ps ON p.PASN_ID = ps.PASN_ID
WHERE MONTH(ps.PASS_EXPIRE_DATE) = MONTH(DATEADD(MONTH, 1, GETDATE()))
AND YEAR(ps.PASS_EXPIRE_DATE) = YEAR(DATEADD(MONTH, 1, GETDATE()))


--4) Calculate the number of passengers traveling on each train.
SELECT td.TRAIN_NAME, COUNT(p.PASN_ID) AS PASSENGER_COUNT
FROM TRAIN_DETAILS td 
INNER JOIN PASSES ps ON td.TRAIN_ID = ps.TRAIN_ID
INNER JOIN PASSENGERS p ON ps.PASN_ID = p.PASN_ID
GROUP BY td.TRAIN_NAME  


--5) List all routes along with their departure and arrival times.
SELECT r.ROUTE_ID, s.STATION_ID, s.STATION_STREET, s.STATION_CITY, 
s.PROVINCE, r.DEPARTURE_TIME, r.ARRIVAL_TIME,
    CASE 
        WHEN r.DEPARTURE_TIME IS NOT NULL THEN 'Departure'
        WHEN r.ARRIVAL_TIME IS NOT NULL THEN 'Arrival'
    END AS StationType
FROM ROUTES r
INNER JOIN ROUTES_STATIONS rs ON r.ROUTE_ID = rs.ROUTE_ID
INNER JOIN STATIONS s ON rs.STATION_ID = S.STATION_ID
ORDER BY r.DEPARTURE_TIME, r.ARRIVAL_TIME


--6) Find the busiest station based on the number of departures.
SELECT s.STATION_NAME,COUNT(r.ROUTE_ID) AS DEPARTURE_NUMBER
FROM STATIONS s 
INNER JOIN ROUTES_STATIONS rs ON s.STATION_ID = rs.STATION_ID
INNER JOIN ROUTES r ON rs.ROUTE_ID = r.ROUTE_ID
GROUP BY s.STATION_NAME
ORDER BY DEPARTURE_NUMBER DESC


--7) List all passes purchased within a specific date range.
SELECT ps.PASS_ID, ps.TRAIN_ID, ps.PASS_ISSUED_DATE, ps.PASS_EXPIRE_DATE, ps.PRICE, ps.PASN_ID
FROM PASSES ps
WHERE ps.PASS_ISSUED_DATE BETWEEN '2024-06-27' AND '2024-07-27'


--8) Find the most popular route based on the number of passes issued.
SELECT r.ROUTE_NAME, COUNT(ps.PASS_ID) AS PASS_NUM
FROM ROUTES r
INNER JOIN PASSES ps ON r.ROUTE_ID = ps.ROUTE_ID
GROUP BY r.ROUTE_NAME
ORDER BY PASS_NUM DESC


--9) List all trains that have fewer than a specific number of coaches.
SELECT td.TRAIN_NAME, td.COACHES_NUM
FROM TRAIN_DETAILS td
WHERE td.COACHES_NUM < 6
ORDER BY td.COACHES_NUM


--10) Retrieve the details of the train type with the most trains.
SELECT td.TRAIN_NAME, COUNT(td.TRAIN_ID) AS TRAIN_NUMBER
FROM TRAIN_DETAILS td 
INNER JOIN TRAIN_TYPES tt ON td.TRAIN_TYPE_ID = tt.TRAIN_TYPE_ID
GROUP BY td.TRAIN_NAME 

