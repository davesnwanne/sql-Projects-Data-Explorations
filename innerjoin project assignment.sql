select * from seats
select * from boarding_passes

---select all the the details from both table ---
select *from boarding_passes as b ---(u can use aliases eg as b and s)
inner join seats as s
on s.seat_no=b.seat_no
---select fare condition,count the number of each, innerjoin the two tables---
---how many people use busines,economy or comfort class--
select 
fare_conditions,
count(*)
from boarding_passes as b
inner join seats as s
on s.seat_no=b.seat_no
group by fare_conditions