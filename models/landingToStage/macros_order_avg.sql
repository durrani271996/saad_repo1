select 
total_orders,
{{ avg_macros('total_revenue') }} as avg_revenue


from 

{{ref("orders")}}
group by total_orders