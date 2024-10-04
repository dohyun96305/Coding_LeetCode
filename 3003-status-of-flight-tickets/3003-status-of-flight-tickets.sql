# Write your MySQL query statement below

# PASSENGER BOOKS A TICKET AND STILL EMPTY SEATS, CONFIRMED, WAITLIST
# CURRENT STATUS TICKETS FOR EACH PASSENGER
# ORDER BY PASSENGER_ID ASC

WITH TEMP AS (
    SELECT FLIGHT_ID, COUNT(PASSENGER_ID) AS CAP_SUM
    FROM PASSENGERS
    GROUP BY FLIGHT_ID), 

FLIGHT_RANK AS (
    SELECT A.*, B.CAPACITY,
        ROW_NUMBER() OVER (PARTITION BY A.FLIGHT_ID ORDER BY A.BOOKING_TIME) AS BOOK_RANK1
    FROM PASSENGERS AS A
    LEFT JOIN FLIGHTS AS B ON A.FLIGHT_ID = B.FLIGHT_ID)

SELECT PASSENGER_ID, 
    CASE
        WHEN BOOK_RANK1 <= CAPACITY THEN 'Confirmed'
        ELSE 'Waitlist'
    END AS STATUS
FROM FLIGHT_RANK
ORDER BY PASSENGER_ID