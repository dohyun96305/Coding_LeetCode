# Write your MySQL query statement below

# EACH PERSON'S NAME FOLLOWED BY THE FIRST LETTER OF PROFESSION
# ORDER PERSON_ID DESC

SELECT PERSON_ID, 
        CONCAT(NAME, '(', SUBSTRING(PROFESSION, 1, 1), ')') AS NAME
FROM PERSON
ORDER BY PERSON_ID DESC