{{config(materialized='table')}}

with base_cte as (

select 
s_suppkey as supplierkey,
s_name as suppliername,
s_address as supplieraddress,
s_acctbal as supplierbalance

from

{{source('snowflake_sample_data','SUPPLIER')}}

)

select 
supplierkey,
suppliername,
supplieraddress,
sum(supplierbalance) as supplierbalance

from base_cte
group by supplierkey,suppliername,supplieraddress
order by supplierkey,suppliername,supplieraddress