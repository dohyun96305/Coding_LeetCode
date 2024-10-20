# Write your MySQL query statement below

SELECT A.REQUEST_AT AS DAY, ROUND(SUM(CASE WHEN STATUS LIKE 'CANCELLED%' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 'CANCELLATION RATE' 
FROM TRIPS AS A
JOIN (SELECT USERS_ID FROM USERS WHERE ROLE = 'CLIENT' AND BANNED = 'NO') AS B ON A.CLIENT_ID = B.USERS_ID
JOIN (SELECT USERS_ID FROM USERS WHERE ROLE = 'DRIVER' AND BANNED = 'NO') AS C ON A.DRIVER_ID = C.USERS_ID
WHERE A.REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY A.REQUEST_AT

# CANCELLATION RATE => DEVIDING NUMBER OF CANCLED WITH UNBANNED USERS / TOTAL NUMBER OF REQUESTS WITH UNBANNED
# Unbanned => both client and driver not be banned
# between 2013-10-01 ~ 2013-10-03