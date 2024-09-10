with base_cte as (

select o_custkey as customerkey,
o_orderkey as totalorders,
o_totalprice as totalrevenue,
o_orderdate as orderdate

FROM
    {{source('snowflake_sample_data','ORDERS')}}

)

select customerkey,orderdate,count(totalorders) as total_orders,sum(totalrevenue) as total_revenue
from base_cte
GROUP BY
orderdate,customerkey
order by 
orderdate,customerkey