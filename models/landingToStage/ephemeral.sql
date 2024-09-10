{{ config(materialized='ephemeral') }}

with base_cte as (


select O_CUSTKEY as customer_key,

sum(o_totalprice) as total_revenue



from

{{source('snowflake_sample_data','ORDERS')}}
group by O_CUSTKEY
)


select * from base_cte
