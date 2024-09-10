{{

    config(materialized='incremental',
    unique_key='customer_key')
}}



with max_value as (
    select 
        --max(customer_key) as max_customer_key
		coalesce(max(customer_key), 0) as max_customer_key

    from {{ this }}
),

base_cte as (

select 
C_CUSTKEY as customer_key,
C_NAME as customer_name,
C_ADDRESS as customer_address,
C_PHONE as customer_phone

from {{source('snowflake_sample_data2','CUSTOMER')}}

{%if is_incremental()%}

    where C_CUSTKEY > (select max_customer_key from max_value)



{% endif %}


)


select * from base_cte
