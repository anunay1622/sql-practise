with cte as(select C.*,O.order_date,O.total_order_cost
from customers C
inner join orders O
on C.id=O.cust_id
where O.order_date between '2019-02-01 ' and '2019-05-01')

,cte1 as(select * from (select id,order_date,sum(total_order_cost) as total_order_cost,rank()over(order by sum(total_order_cost)  desc) as rnk1
from cte
group by id,order_date) tbl
where rnk1=1)

select B.first_name,A.total_order_cost
from cte1 A
join customers B
on A.id=B.id

