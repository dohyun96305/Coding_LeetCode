# Write your MySQL query statement below

# SUSPICIOUS IF THE TOTAL INCOME EXCEED MAX_INCOME FOR TWO OR MORE CONSECUTIVE
# TOTAL INCOME => SUM OF ALL DEPOSITS 
# REPORT THE IDS OF ALL SUSPICIOUS BANK ACCOUNTS

WITH MONTH_ACCOUNT AS (
    SELECT ACCOUNT_ID, YEAR(DAY) AS YEAR1, MONTH(DAY) AS MONTH1, SUM(AMOUNT) AS AMOUNT_SUM
    FROM TRANSACTIONS
    WHERE TYPE = 'CREDITOR'
    GROUP BY ACCOUNT_ID, YEAR1, MONTH1),

TEMP AS (
    SELECT A.ACCOUNT_ID, A.YEAR1, A.MONTH1, 
        LEAD(MONTH1, 1, 99) OVER (PARTITION BY ACCOUNT_ID ORDER BY YEAR1, MONTH1) AS NEXT_MONTH
    FROM MONTH_ACCOUNT AS A
    LEFT JOIN ACCOUNTS AS B ON A.ACCOUNT_ID = B.ACCOUNT_ID
    WHERE AMOUNT_SUM > MAX_INCOME
    ORDER BY ACCOUNT_ID, YEAR1, MONTH1)

SELECT DISTINCT ACCOUNT_ID
FROM TEMP
WHERE NEXT_MONTH - MONTH1 = 1