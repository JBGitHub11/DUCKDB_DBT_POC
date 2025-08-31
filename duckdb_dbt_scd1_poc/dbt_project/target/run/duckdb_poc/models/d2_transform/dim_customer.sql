
  
    
    

    create  table
      "duck_poc"."main"."dim_customer__dbt_tmp"
  
    as (
      
select
  customer_id,
  any_value(customer_name) as customer_name,
  any_value(email) as email,
  any_value(region_code) as region_code
from "duck_poc"."main"."customers_d1"
group by customer_id
    );
  
  