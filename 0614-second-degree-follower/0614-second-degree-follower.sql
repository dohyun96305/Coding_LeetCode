# Write your MySQL query statement below

# FOLLOWS AT LEAST ONE USER, FOLLOWED BY AT LEAST ONE USER

# SECOND DEGREE USERS AND NUMBER OF THEIR FOLLOWERS

SELECT A.FOLLOWER, COUNT(DISTINCT B.FOLLOWER) AS NUM
FROM FOLLOW AS A
JOIN FOLLOW AS B ON A.FOLLOWER = B.FOLLOWEE
GROUP BY A.FOLLOWER