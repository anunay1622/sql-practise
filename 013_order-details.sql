with cte as (select first_name,O.order_details
from customers C
inner join orders O
on C.id=O.cust_id
where C.first_name IN ("Jill","Eva")
order by C.id)

select first_name,group_concat(distinct order_details order by order_details) AS items
from cte
group by first_name
