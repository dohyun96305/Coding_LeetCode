# Write your MySQL query statement below

# PRDEDICTIVE MODEL TO DETECT LIKELIHOOD, TOP 5% OF CLAIMS FLAGGED
# FIND THE TOP 5 PERCENTILE OF CLAIMS OF EACH STATE
# ORDER BY STATE ASC, FRAUD_SCORE DESC, POLICY_ID ASC        PERCENT_RANK() 

WITH TEMP AS (
    SELECT POLICY_ID, STATE, FRAUD_SCORE, 
        PERCENT_RANK() OVER (PARTITION BY STATE ORDER BY FRAUD_SCORE DESC) AS PERC1
    FROM FRAUD)

SELECT POLICY_ID, STATE, FRAUD_SCORE
FROM TEMP 
WHERE PERC1 <= 0.05
ORDER BY STATE, FRAUD_SCORE DESC, POLICY_ID
