{{
    config(materialized='view')
}}



with base_cte as (


select 

S_SUPPKEY as SUPPLIERKEY,
S_NAME as SUPPLIERNAME,
S_ADDRESS as SUPPLIERADDRESS,
S_ACCTBAL as SUPPLIERBALANCE

from 

{{source('snowflake_sample_data2','SUPPLIER')}}

)

select * from base_cte