# Write your MySQL query statement below
select

case 
when mod(id, 2) = 1 and id + 1 not in (select id from Seat) then id
when mod(id, 2) = 1 then id + 1
else id - 1
end as id, student 

from Seat order by id;