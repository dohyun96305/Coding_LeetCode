# Write your MySQL query statement below

# TOTAL SPENDING BY USER ON EACH FRIDAY
# 

SELECT WEEK(PURCHASE_DATE) - 43 AS WEEK_OF_MONTH, PURCHASE_DATE, SUM(AMOUNT_SPEND) AS TOTAL_AMOUNT
FROM PURCHASES
GROUP BY PURCHASE_DATE
HAVING WEEKDAY(PURCHASE_DATE) = 4
ORDER BY WEEK_OF_MONTH