---cross join/cartesian product---
select
staff_id,
store.store_id,
last_name,
store.store_id*staff_id
from staff
cross join store
--[NATURAL JOIN]----
select
first_name,
last_name,
sum(amount)
from payment
natural inner join customer
group by first_name,last_name

select *
from payment
natural inner join customer

