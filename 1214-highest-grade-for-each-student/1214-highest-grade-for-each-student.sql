# Write your MySQL query statement below

# HIGHEST GRADE WITH COURSE FOR EACH STUDENT 
# TIE => SMALLEST COURSE_ID
# ORDER BY STUDENT_ID ASC

WITH TEMP_RANK AS (
    SELECT *, 
        RANK() OVER (PARTITION BY STUDENT_ID ORDER BY GRADE DESC, COURSE_ID) AS RANK1
    FROM ENROLLMENTS)

SELECT STUDENT_ID, COURSE_ID, GRADE
FROM TEMP_RANK
WHERE RANK1 = 1
ORDER BY STUDENT_ID 