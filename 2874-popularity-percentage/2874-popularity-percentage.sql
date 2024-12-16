# Write your MySQL query statement below

# TOTAL NUMBER OF FRIENDS USER HAS DIVIDED BY THE TOTAL NUMBER OF USERS OF PLATROM
# PERCENTAGE, ROUNDED TO 2 DECIMAL
# ORDER BY USER1 ASC

WITH FRIENDS_COMB AS (
    SELECT USER1, USER2
    FROM FRIENDS

    UNION 

    SELECT USER2 AS USER1, USER1 AS USER2
    FROM FRIENDS
), 

NUM_USER AS (
    SELECT COUNT(DISTINCT USER1) AS USER_NUM
    FROM FRIENDS_COMB 
)

SELECT USER1, 
    ROUND((COUNT(DISTINCT USER2) / (SELECT USER_NUM FROM NUM_USER))  * 100, 2) AS PERCENTAGE_POPULARITY
FROM FRIENDS_COMB
GROUP BY USER1
ORDER BY USER1