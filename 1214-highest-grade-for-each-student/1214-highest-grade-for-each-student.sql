# Write your MySQL query statement below

# HIGHEST GRADE WITH COURSE FOR EACH STUDENT 
# TIE => SMALLEST COURSE_ID
# ORDER BY STUDENT_ID ASC


SELECT STUDENT_ID, COURSE_ID, GRADE
FROM (  
    SELECT *, 
        RANK() OVER (PARTITION BY STUDENT_ID ORDER BY GRADE DESC, COURSE_ID) AS RANK1
    FROM ENROLLMENTS) AS A
WHERE RANK1 = 1
ORDER BY STUDENT_ID 