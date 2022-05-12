with cte as(select * from (select department_id,count(distinct id) as num_employees,rank()over(order by count(distinct id) desc ) as rnk1
from az_employees
group by department_id) tbl
where rnk1=1)
 select a.*
 from cte c
 inner join az_employees a
 on a.department_id=c.department_id
where a.position ='Manager'


