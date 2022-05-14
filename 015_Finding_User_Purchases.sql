with cte as(select user_id,created_at,lead(created_at)over(partition by user_id order by created_at) as Next_dt 
from amazon_transactions)

select distinct user_id   
from cte
where DATEDIFF(created_at,next_dt)<=7
