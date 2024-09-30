# Write your MySQL query statement below

# NUMBER OF POSTS REPORTED YESTERDAY FOR EACH REPORT REASON
# TODAY => '2019-07-05'

SELECT EXTRA AS REPORT_REASON, COUNT(DISTINCT POST_ID) AS REPORT_COUNT
FROM ACTIONS
WHERE ACTION = 'REPORT' AND DATEDIFF('2019-07-05', ACTION_DATE) = 1
GROUP BY EXTRA