# Write your MySQL query statement below

# TOTAL NUMBER OF USERS, TOTAL AMOUNT SPENT USING THE MOBILE, DESKTOP, BOTH FOR EACH DATE

WITH TEMP AS (
    SELECT USER_ID, SPEND_DATE, SUM(AMOUNT) AS TOTAL_AMOUNT,
        CASE
            WHEN COUNT(DISTINCT PLATFORM) = 1 THEN PLATFORM
            WHEN COUNT(DISTINCT PLATFORM) = 2 THEN 'both'
        END AS 'PLAT_CATE'
    FROM SPENDING 
    GROUP BY SPEND_DATE, USER_ID), 

DATE_PLAT AS ( # ALL DATE AND PLATFORM INCLUDING 'both'
    SELECT DISTINCT SPEND_DATE, 'desktop' AS PLATFORM FROM SPENDING
    UNION ALL
    SELECT DISTINCT SPEND_DATE, 'mobile' AS PLATFORM FROM SPENDING
    UNION ALL
    SELECT DISTINCT SPEND_DATE, 'both' AS PLATFORM FROM SPENDING)

SELECT A.SPEND_DATE, A.PLATFORM, SUM(IFNULL(B.TOTAL_AMOUNT, 0)) AS TOTAL_AMOUNT, COUNT(DISTINCT B.USER_ID) AS TOTAL_USERS
FROM DATE_PLAT AS A
LEFT JOIN TEMP AS B ON A.SPEND_DATE = B.SPEND_DATE AND A.PLATFORM = B.PLAT_CATE
GROUP BY A.SPEND_DATE, A.PLATFORM