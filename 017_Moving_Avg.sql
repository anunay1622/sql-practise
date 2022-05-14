with cte as(select DATE_FORMAT(created_at,'%m-%Y') as Created_date,sum(purchase_amt) as Amount_purchase
from amazon_purchases
where purchase_amt >=0
group by DATE_FORMAT(created_at,'%m-%Y'))

select *,AVG(Amount_purchase)over(order by Created_date rows between 2 preceding and current row) as Moving_Avg
from cte
