with cte as (
    select
        *,
        lag(student) over(order by id asc) as previous_student,
        lead(student) over(order by id asc) as next_student,row_number()over(order by id) as n
    from Seat
)
select 
    id,
    case
        when n % 2 <> 0 and next_student is null then student
        when n % 2 <> 0 then next_student
        else previous_student
    end as student
from cte
