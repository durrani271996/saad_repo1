with customer_data as (

select customerkey,customername,customeraddress,customerphone from
{{ref("customer")}}

),



order_data as (

    select customerkey,count(total_orders) as total_orders,sum(total_revenue) as total_revenue
    from 
    {{ref("orders")}}
group by customerkey
)

select cd.customerkey,
cd.customername,
cd.customeraddress,
cd.customerphone,
od.total_orders,
od.total_revenue
from
customer_data cd
left join order_data od on
cd.customerkey=od.customerkey