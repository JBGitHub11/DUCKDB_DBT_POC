{{ config(materialized='table') }}
select
  f.sales_id,
  f.sale_ts,
  f.amount,
  f.currency_code,
  c.customer_id,
  c.customer_name,
  c.email,
  c.region_code
from {{ ref('fct_sales') }} f
join {{ ref('dim_customer') }} c
  on c.customer_id = f.customer_id
