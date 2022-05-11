select user_id,last_stamp from
(select user_id,time_stamp as last_stamp,row_number()over(partition by user_id order by time_stamp desc) as rnk1
from Logins
where Year(time_stamp)='2020') tbl
where rnk1=1
