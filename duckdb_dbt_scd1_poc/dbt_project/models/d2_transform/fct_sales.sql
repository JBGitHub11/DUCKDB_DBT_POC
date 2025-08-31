{{ config(materialized='table') }}
select
  sales_id,
  event_ts as sale_ts,
  amount,
  currency_code,
  customer_id
from {{ ref('sales_d1') }}
