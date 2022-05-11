with cte as(select T1.id,T1.p_id,T2.id as c_id
from Tree T1
left join Tree T2
on T1.id=T2.p_id)

select id,max(case when p_id is NULL then 'Root'
               when p_id is not NULL and c_id is NOT NULL then 'Inner'
               when p_id is not NULL and c_id is NULL then 'Leaf' end) as type

from cte
group by id
order by id
