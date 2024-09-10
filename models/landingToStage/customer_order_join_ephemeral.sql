{{ config(materialized='table') }}


with revenue_order as (

select * from {{ ref('ephemeral') }}

),


customer_cte as (


select

ro.customer_key,
cc.C_NAME as customer_name,
cc.C_ADDRESS as customer_address,
ro.total_revenue


from revenue_order ro

join 
{{source("snowflake_sample_data",'CUSTOMER')}} cc


on ro.customer_key=cc.C_CUSTKEY


)


select * from customer_cte