# Write your MySQL query statement below

# TIMES EACH ARTIST APPEARED ON THE RANKING LIST
# NAME, NUMBER 
# NUMBER DESC, NAME ASC

SELECT ARTIST, COUNT(*) AS OCCURRENCES 
FROM SPOTIFY
GROUP BY ARTIST
ORDER BY OCCURRENCES DESC, ARTIST