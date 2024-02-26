select
title,
case
when rating in ('PG','PG-13') OR length> 210 then 'great rating or long (tier 1)'
when description like '%DRAMA%' AND Length >90 then 'long drama(tier 2)'
when description like 'DRAMA' then 'short drama(tier 3)'
end as tier_list
from film
where
case
when rating in ('PG','PG-13') OR length> 210 then 'great rating or long (tier 1)'
when description like '%DRAMA%' AND Length >90 then 'long drama(tier 2)'
when description like 'DRAMA' then 'short drama(tier 3)'
when rental_rate<1 then 'very cheap (tier 4)'
end is not null