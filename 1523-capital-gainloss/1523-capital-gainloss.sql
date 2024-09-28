# Write your MySQL query statement below

# CAPITAL GAIN/LOSS FOR EACH STOCK
# TOTAL GAIN OR LOSS AFTER BUYING AND SELLING STOCK ONE OR MANY TIMES

SELECT STOCK_NAME, 
    SUM(CASE 
            WHEN OPERATION = 'BUY' THEN -1 * PRICE 
            WHEN OPERATION = 'SELL' THEN  PRICE 
        END) AS CAPITAL_GAIN_LOSS
FROM STOCKS 
GROUP BY STOCK_NAME 