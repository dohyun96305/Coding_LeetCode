# Write your MySQL query statement below

# LAST TIME USED
# ORDER BY MOST RECENTLY USED

SELECT BIKE_NUMBER, MAX(END_TIME) AS END_TIME
FROM BIKES
GROUP BY BIKE_NUMBER
ORDER BY END_TIME DESC;

