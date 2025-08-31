{{ config(materialized='table') }}
select
  customer_id,
  upper(trim(customer_name)) as customer_name,
  email,
  region_code,
  cast(load_hour as timestamp) as load_hour
from read_csv_auto('../data/customers_2025-08-31-10.csv', header=True)
