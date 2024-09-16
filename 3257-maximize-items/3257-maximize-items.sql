# Write your MySQL query statement below

# WANT TO STOCK AS MANY PRIME ITEMS AS POSSIBLE 

WITH TEMP_PRIME AS (
    SELECT ITEM_TYPE, COUNT(*) AS CNT, SUM(SQUARE_FOOTAGE) AS TOTAL_SQUARE
    FROM INVENTORY 
    WHERE ITEM_TYPE = 'PRIME_ELIGIBLE'), 

TEMP_NOTPRIME AS (
    SELECT ITEM_TYPE, COUNT(*) AS CNT, SUM(SQUARE_FOOTAGE) AS TOTAL_SQUARE
    FROM INVENTORY 
    WHERE ITEM_TYPE = 'NOT_PRIME'), 

TEMP_PRIME_1 AS (  
    SELECT ITEM_TYPE, 
        FLOOR(500000 / (SELECT TOTAL_SQUARE FROM TEMP_PRIME)) * CNT AS ITEM_COUNT, 
        FLOOR(500000 / (SELECT TOTAL_SQUARE FROM TEMP_PRIME)) * TOTAL_SQUARE AS TOTAL_FOOTAGE
    FROM TEMP_PRIME)

SELECT ITEM_TYPE, ITEM_COUNT 
FROM TEMP_PRIME_1

UNION

SELECT ITEM_TYPE, FLOOR((500000 - (SELECT TOTAL_FOOTAGE FROM TEMP_PRIME_1)) / TOTAL_SQUARE) * CNT AS ITEM_COUNT
FROM TEMP_NOTPRIME