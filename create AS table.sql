 ---CREATE TABLE AS----
 --WE USE CREATE TABLE AS COMMAND CREATE TABLE BY USING ANOYTHER QUERY---
 
 CREATE TABLE CUSTOMER_ANONYMOUS
 AS 
 SELECT CUSTOMER_ID,INITIALS
 FROM CUSTOMER
 WHERE FIRST_NAME LIKE 'C%'
---
select * from customer
---creating a new table from columns from another table ---
CREATE TABLE CUSTOMER_ADDRESS
AS
SELECT FIRST_NAME,LAST_NAME,EMAIL,ADDRESS,CITY
FROM CUSTOMER c
LEFT JOIN ADDRESS a
ON c.ADDRESS_ID=a.ADDRESS_ID
LEFT JOIN CITY CI
ON CI.CITY_ID=a.CITY_ID

select * from customer_address
---create first_name,last_name with total spendings done in the payment table---
create table customer_spendings
as
select first_name ||' '|| last_name as name,
sum(amount)as total_amount
from customer c
left join payment p
on c.customer_id=p.customer_id
group by first_name||' '||last_name

select * from customer_spendings
drop table customer_spendings

----create view  this just views the table and dosent store the table---
create view customer_spendings
as
select first_name ||' '|| last_name as name,
sum(amount)as total_amount
from customer c
left join payment p
on c.customer_id=p.customer_id
group by first_name||' '||last_name

---create materialized views---
stores and views
---data is stored physically--

create materialized view mv_film_category
as
select
title,name,length
from film f
left join film_category fc
on f.film_id=fc.film_id
left join category c
on c.category_id=fc.category_id
where name in ('action','comedy')
order by length desc
refresh materialized view mv_film_category

select * from mv_film_category
--- replace view or rename only works with view----
--- rename view---
alter view_ v_customer_info
rename to v_customer_information
---rename customer_id column to c.id----
alter view v_customer info
rename column customer_id to c_id
--create or replace view--
create or replace view v_customer_information
as 
select
cu.customer_id as c_id,
cu.first_name || ' ' ||cu.last_name as name,
a.address,
a.postal_code,
a.phone,
city.city,
country.country,
concat(left(cu.first_name,1),left(cu.last_name,1))
from customer cu
join address a on cu.address_id=a.address_id
join city on a.city_id=city.city_id
join country on city.country_id=country.country_id
order by c_id
