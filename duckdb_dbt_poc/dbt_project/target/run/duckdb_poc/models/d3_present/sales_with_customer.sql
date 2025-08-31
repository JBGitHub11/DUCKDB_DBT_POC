
  
    
    

    create  table
      "duck_poc"."main"."sales_with_customer__dbt_tmp"
  
    as (
      
select
  f.sales_id,
  f.sale_ts,
  f.amount,
  f.currency_code,
  c.customer_id,
  c.customer_name,
  c.email,
  c.region_code
from "duck_poc"."main"."fct_sales" f
join "duck_poc"."main"."dim_customer" c
  on c.customer_id = f.customer_id
    );
  
  