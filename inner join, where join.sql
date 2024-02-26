--- this outputs everything from both tables ---
select * 
from payment
inner join customer
on payment.customer_id=customer.customer_id
---ouputs everything from payment table using '.*' 
--- then also outputs selected columns from customer table,first_name,last_name
select payment.*,
first_name,
last_name
from payment
inner join customer
on payment.customer_id=customer.customer_id

select * from address
select * from customer
select * from payment
---output payment_id,customer_id from payment,amount also first_name, last_name
----fro
select payment_id,
pa.customer_id,---(as can be used for shorter names eg instead of payment use pa)
 ---since customer id appears on both tables you specify the table
----so payment.customer_id specifies the payment table
amount,
first_name,
last_name
from payment as pa---(as can be used for shorter names eg instead of payment use pa)
inner join customer as cu---(as can be used for shorter names eg instead of customer use cu)
on pa.customer_id=cu.customer_id

select address,district,
first_name,
last_name
from address as ad
inner join customer as cu
on ad.address_id=cu.address_id
---select from both tables using innerjoin--
select *from payment---('* from' selects everything from both tables)
inner join staff
on staff.staff_id=payment.staff_id
----(.*, selects everything from the payment column , select specific column from the staff column immediately after
--and innerjoin them)
select payment.*,first_name,last_name,email ---('.* from' selects everything from payment table)
from payment
inner join staff
on staff.staff_id=payment.staff_id
where staff.staff_id =1 ---(where clause is used after the join clause)
