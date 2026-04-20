
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


{{ config(
    materialized = 'table'
) }}



with source_data as (

    
select *
from {{ source('snowflake_sample_data_2', 'ORDERS') }} as O
left join {{ source('snowflake_sample_data_2', 'CUSTOMER') }} as C
    on O.O_CUSTKEY = C.C_CUSTKEY
where O.O_TOTALPRICE > 400000.00
  and C.C_MKTSEGMENT = 'MACHINERY'


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
