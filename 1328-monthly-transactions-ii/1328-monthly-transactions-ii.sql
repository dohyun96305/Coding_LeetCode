# Write your MySQL query statement below

# Write your MySQL query statement below

# FIND EACH MONTH AND COUNTRY
# NUMBER OF APPROVED TRANSACTIONS AND TOTAL AMOUNT , CHARGEBACKS AND TOTAL AMOUNT

WITH TEMP_TRANS AS (
    SELECT DATE_FORMAT(TRANS_DATE, '%Y-%m') AS MONTH, COUNTRY, 'TRANS' AS 'STATE1', AMOUNT AS 'AMOUNT'
    FROM TRANSACTIONS 
    WHERE STATE = 'APPROVED'),

    TEMP_CHARGE AS (
        SELECT DATE_FORMAT(B.TRANS_DATE, '%Y-%m') AS MONTH, A.COUNTRY AS COUNTRY, 'CHARGE' AS 'STATE1', AMOUNT AS 'AMOUNT'
        FROM TRANSACTIONS AS A 
        JOIN CHARGEBACKS AS B ON A.ID = B.TRANS_ID),

    TEMP AS (
        SELECT * FROM TEMP_TRANS
        UNION ALL 
        SELECT * FROM TEMP_CHARGE)

SELECT MONTH, COUNTRY, 
    SUM(CASE WHEN STATE1 = 'TRANS' THEN 1 ELSE 0 END) AS 'APPROVED_COUNT', 
    SUM(CASE WHEN STATE1 = 'TRANS' THEN AMOUNT ELSE 0 END) AS 'APPROVED_AMOUNT', 
    SUM(CASE WHEN STATE1 = 'CHARGE' THEN 1 ELSE 0 END) AS 'CHARGEBACK_COUNT', 
    SUM(CASE WHEN STATE1 = 'CHARGE' THEN AMOUNT ELSE 0 END) AS 'CHARGEBACK_AMOUNT'
FROM TEMP
GROUP BY MONTH, COUNTRY