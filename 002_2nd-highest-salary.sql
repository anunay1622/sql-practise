with cte as (select D.*,E.salary,dense_rank() over(partition by D.id order by E.salary desc) as rnk1
from employees E
inner join departments D
on E.department_id = D.id)

select salary from cte
where name='engineering'
and rnk1=2
