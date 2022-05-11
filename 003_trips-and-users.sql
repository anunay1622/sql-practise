# Write your MySQL query statement below
with driver as(select T.id as trip_id,T.request_at,U.users_id as driver,case when T.status='cancelled_by_driver' then 1 else 0 end as Cancelled_driver_flg
from trips T
inner join Users U
on U.users_id=T.driver_id
where banned='No'
              )
, client as(select T.id as trip_id,T.request_at,U.users_id as client,case when T.status='cancelled_by_client' then 1 else 0 end as Cancelled_client_flg
from trips T
inner join Users U
on U.users_id=T.client_id
where banned='No')

, final as(select D.trip_id,D.request_at as Day , D.Cancelled_driver_flg,C.Cancelled_client_flg,
           case when D.Cancelled_driver_flg=1 or C.Cancelled_client_flg=1 then 1 else 0 end as Cancelled_Flag
          from driver D
          inner join client C
          on D.trip_id=C.trip_id)

select Day,Round(sum(Cancelled_Flag)/count(1),2) as 'Cancellation Rate'
from final
where Day <="2013-10-03"
group by day
