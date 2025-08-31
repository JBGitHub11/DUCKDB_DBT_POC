{{ config(materialized='table') }}
select
  customer_id,
  any_value(customer_name) as customer_name,
  any_value(email) as email,
  any_value(region_code) as region_code
from {{ ref('customers_d1') }}
group by customer_id
