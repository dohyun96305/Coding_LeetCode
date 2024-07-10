# Write your MySQL query statement below
# swap the seat id 
# odd => last student not swapped

SELECT 
CASE
    WHEN MOD(ID, 2) = 1 AND ID + 1 NOT IN (SELECT ID FROM SEAT) THEN ID
    WHEN MOD(ID, 2) = 1 THEN ID + 1
    ELSE ID - 1
END AS ID, STUDENT
FROM SEAT
ORDER BY ID;