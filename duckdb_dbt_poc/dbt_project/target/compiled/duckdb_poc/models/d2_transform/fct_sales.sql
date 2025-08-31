
select
  sales_id,
  event_ts as sale_ts,
  amount,
  currency_code,
  customer_id
from "duck_poc"."main"."sales_d1"