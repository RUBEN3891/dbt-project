
  
    

create or replace transient table DBT.DBT_PRACTICAS.my_first_dbt_model
    
    
    
    as (/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/






with source_data as (

    
select *
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS as O
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER as C
    on O.O_CUSTKEY = C.C_CUSTKEY
where O.O_TOTALPRICE > 400000.00
  and C.C_MKTSEGMENT = 'FURNITURE'


)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
    )
;


  