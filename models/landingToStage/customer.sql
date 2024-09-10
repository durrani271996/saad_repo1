with base_cte as (

select C_CUSTKEY as customerkey,
C_NAME as customername,
C_ADDRESS as customeraddress,
C_PHONE as customerphone


FROM
    {{source('snowflake_sample_data','CUSTOMER')}}

)

select *
from base_cte