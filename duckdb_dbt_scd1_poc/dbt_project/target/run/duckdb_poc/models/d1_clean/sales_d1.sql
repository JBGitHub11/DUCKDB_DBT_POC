
  
    
    

    create  table
      "duck_poc"."main"."sales_d1__dbt_tmp"
  
    as (
      
-- Treat CSVs under /data as your D0 snapshots
select
  cast(sales_id as integer) as sales_id,
  customer_id,
  cast(amount as double) as amount,
  currency_code,
  cast(event_ts as timestamp) as event_ts,
  cast(load_hour as timestamp) as load_hour
from read_csv_auto('../data/sales_2025-08-31-10.csv', header=True)
    );
  
  