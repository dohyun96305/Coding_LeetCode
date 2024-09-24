# Write your MySQL query statement below

# BALACE OF EACH USER AFTER EACH TRANSACTION 
# ORDER BY ACCOUNT_ID ASC DAY 

WITH TEMP AS (
    SELECT ACCOUNT_ID, DAY, AMOUNT, 
        CASE 
            WHEN TYPE = "DEPOSIT" THEN 1
            WHEN TYPE = 'WITHDRAW' THEN -1
        END AS STATE
    FROM TRANSACTIONS)

SELECT ACCOUNT_ID, DAY, 
    SUM(STATE * AMOUNT) OVER (PARTITION BY ACCOUNT_ID ORDER BY DAY) AS BALANCE
FROM TEMP