# Write your MySQL query statement below
# PREFIX NAME 

# ^ = starts with
# [a-zA-Z] = means mail should start from small or capital letter.
# [a-zA-Z0-9_.-] = after that any letter or number or _ or . or -
# @leetcode = after that combine with  @leetcode
# [.] = must come . after @leetcode
# com = then com.
# $ = ends with

SELECT *
FROM USERS
WHERE MAIL REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';