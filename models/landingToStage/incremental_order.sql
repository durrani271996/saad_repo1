{{
  config(
    materialized='incremental',
    unique_key='orderkey'
  )
}}

with base_cte as (
    select 
        o_custkey as customerkey,
        o_orderkey as orderkey,
        o_totalprice as totalrevenue,
        o_orderdate as orderdate
    from 
        {{ source('snowflake_sample_data2', 'ORDERS') }}  -- Referencing the existing Snowflake sample data table
    {% if is_incremental() %}
        where 
            o_orderdate > (select max(orderdate) from {{ this }})  -- Adding only new records
    {% endif %}
)

select * from base_cte
