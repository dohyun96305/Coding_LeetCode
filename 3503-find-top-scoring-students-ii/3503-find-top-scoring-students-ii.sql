# Write your MySQL query statement below

# TAKEN ALL MANDATORY COURSES OR AT LEAST TWO ELECTIVE COURSES OFFERED IN MAJOR
# ACHIEVED A GRADE OF A IN ALL MANDATORY COURSES OR AT LEAST B IN ELECTIVE COURSES
# MAINTAINED AN AVG GPA AT LEAST 2.5 ACROSS ALL COURSES
# ORDER BY STUDENT_ID 

WITH STUDENT_MAJOR_CNT AS (
    SELECT A.STUDENT_ID, B.MAJOR, 
        COUNT(CASE WHEN B.MANDATORY = 'YES' AND A.GRADE = 'A' THEN A.COURSE_ID END) AS CNT_MANDATORY_A, 
        COUNT(CASE WHEN B.MANDATORY = 'NO' AND A.GRADE IN ('A', 'B') THEN A.COURSE_ID END) AS CNT_ELECTIVE_AB 
    FROM ENROLLMENTS AS A
    JOIN COURSES AS B ON A.COURSE_ID = B.COURSE_ID 
    GROUP BY A.STUDENT_ID, B.MAJOR
), 

COURSE_CNT AS (
    SELECT MAJOR, 
        COUNT(CASE WHEN MANDATORY = 'YES' THEN COURSE_ID END) AS CNT_MANDATORY
    FROM COURSES
    GROUP BY MAJOR 
),

GPA_AVG AS (
    SELECT STUDENT_ID, AVG(GPA) AS AVG_GPA
    FROM ENROLLMENTS
    GROUP BY STUDENT_ID
    HAVING AVG_GPA >= 2.5
)

SELECT A.STUDENT_ID 
FROM STUDENTS AS A
JOIN STUDENT_MAJOR_CNT AS B ON A.STUDENT_ID = B.STUDENT_ID AND A.MAJOR = B.MAJOR
JOIN COURSE_CNT AS C ON A.MAJOR = C.MAJOR
JOIN GPA_AVG AS D ON A.STUDENT_ID = D.STUDENT_ID 
WHERE B.CNT_MANDATORY_A = C.CNT_MANDATORY AND 
    B.CNT_ELECTIVE_AB >= 2 AND 
    D.AVG_GPA >= 2.5
ORDER BY A.STUDENT_ID