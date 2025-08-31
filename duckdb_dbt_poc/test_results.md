18:00:32  Running with dbt=1.10.10
18:00:32  dbt version: 1.10.10
18:00:32  python version: 3.11.12
18:00:32  python path: /root/.pyenv/versions/3.11.12/bin/python3.11
18:00:32  os info: Linux-6.12.13-x86_64-with-glibc2.39
18:00:32  Using profiles dir at /workspace/DUCKDB_DBT_POC/dbt_project
18:00:32  Using profiles.yml file at /workspace/DUCKDB_DBT_POC/dbt_project/profiles.yml
18:00:32  Using dbt_project.yml file at /workspace/DUCKDB_DBT_POC/dbt_project/dbt_project.yml
18:00:32  adapter type: duckdb
18:00:32  adapter version: 1.9.4
18:00:33  Configuration:
18:00:33    profiles.yml file [OK found and valid]
18:00:33    dbt_project.yml file [OK found and valid]
18:00:33  Required dependencies:
18:00:33   - git [OK found]

18:00:33  Connection:
18:00:33    database: duck_poc
18:00:33    schema: main
18:00:33    path: duck_poc.duckdb
18:00:33    config_options: None
18:00:33    extensions: None
18:00:33    settings: {}
18:00:33    external_root: .
18:00:33    use_credential_provider: None
18:00:33    attach: None
18:00:33    filesystems: None
18:00:33    remote: None
18:00:33    plugins: None
18:00:33    disable_transactions: False
18:00:33  Registered adapter: duckdb=1.9.4
18:00:33    Connection test: [OK connection ok]

18:00:33  All checks passed!
18:00:36  Running with dbt=1.10.10
18:00:36  Warning: No packages were found in packages.yml
18:00:36  Warning: No packages were found in packages.yml
18:00:38  Running with dbt=1.10.10
18:00:39  Registered adapter: duckdb=1.9.4
18:00:39  Unable to do partial parsing because saved manifest not found. Starting full parse.
18:00:40  Found 5 models, 15 data tests, 429 macros
18:00:40  
18:00:40  Concurrency: 4 threads (target='dev')
18:00:40  
18:00:40  1 of 20 START sql table model main.customers_d1 ................................ [RUN]
18:00:40  2 of 20 START sql table model main.sales_d1 .................................... [RUN]
18:00:41  1 of 20 OK created sql table model main.customers_d1 ........................... [OK in 0.21s]
18:00:41  2 of 20 OK created sql table model main.sales_d1 ............................... [OK in 0.21s]
18:00:41  3 of 20 START test not_null_customers_d1_customer_id ........................... [RUN]
18:00:41  4 of 20 START test not_null_customers_d1_customer_name ......................... [RUN]
18:00:41  5 of 20 START test not_null_customers_d1_email ................................. [RUN]
18:00:41  6 of 20 START test not_null_sales_d1_customer_id ............................... [RUN]
18:00:41  3 of 20 PASS not_null_customers_d1_customer_id ................................. [PASS in 0.11s]
18:00:41  4 of 20 PASS not_null_customers_d1_customer_name ............................... [PASS in 0.10s]
18:00:41  7 of 20 START test not_null_sales_d1_event_ts .................................. [RUN]
18:00:41  5 of 20 PASS not_null_customers_d1_email ....................................... [PASS in 0.07s]
18:00:41  6 of 20 PASS not_null_sales_d1_customer_id ..................................... [PASS in 0.07s]
18:00:41  8 of 20 START test not_null_sales_d1_sales_id .................................. [RUN]
18:00:41  9 of 20 START test unique_customers_d1_customer_id ............................. [RUN]
18:00:41  10 of 20 START test unique_sales_d1_sales_id ................................... [RUN]
18:00:41  8 of 20 PASS not_null_sales_d1_sales_id ........................................ [PASS in 0.06s]
18:00:41  7 of 20 PASS not_null_sales_d1_event_ts ........................................ [PASS in 0.08s]
18:00:41  10 of 20 PASS unique_sales_d1_sales_id ......................................... [PASS in 0.06s]
18:00:41  9 of 20 PASS unique_customers_d1_customer_id ................................... [PASS in 0.07s]
18:00:41  11 of 20 START sql table model main.fct_sales .................................. [RUN]
18:00:41  12 of 20 START sql table model main.dim_customer ............................... [RUN]
18:00:41  11 of 20 OK created sql table model main.fct_sales ............................. [OK in 0.07s]
18:00:41  12 of 20 OK created sql table model main.dim_customer .......................... [OK in 0.06s]
18:00:41  13 of 20 START test not_null_dim_customer_customer_id .......................... [RUN]
18:00:41  14 of 20 START test not_null_fct_sales_customer_id ............................. [RUN]
18:00:41  15 of 20 START test not_null_fct_sales_sales_id ................................ [RUN]
18:00:41  16 of 20 START test relationships_fct_sales_customer_id__customer_id__ref_dim_customer_  [RUN]
18:00:41  15 of 20 PASS not_null_fct_sales_sales_id ...................................... [PASS in 0.07s]
18:00:41  13 of 20 PASS not_null_dim_customer_customer_id ................................ [PASS in 0.08s]
18:00:41  14 of 20 PASS not_null_fct_sales_customer_id ................................... [PASS in 0.08s]
18:00:41  17 of 20 START test unique_dim_customer_customer_id ............................ [RUN]
18:00:41  16 of 20 PASS relationships_fct_sales_customer_id__customer_id__ref_dim_customer_  [PASS in 0.08s]
18:00:41  18 of 20 START test unique_fct_sales_sales_id .................................. [RUN]
18:00:41  18 of 20 PASS unique_fct_sales_sales_id ........................................ [PASS in 0.13s]
18:00:41  17 of 20 PASS unique_dim_customer_customer_id .................................. [PASS in 0.13s]
18:00:41  19 of 20 START sql table model main.sales_with_customer ........................ [RUN]
18:00:41  19 of 20 OK created sql table model main.sales_with_customer ................... [OK in 0.04s]
18:00:41  20 of 20 START test not_null_sales_with_customer_sales_id ...................... [RUN]
18:00:41  20 of 20 PASS not_null_sales_with_customer_sales_id ............................ [PASS in 0.02s]
18:00:41  
18:00:41  Finished running 5 table models, 15 data tests in 0 hours 0 minutes and 0.98 seconds (0.98s).
18:00:41  
18:00:41  Completed successfully
18:00:41  
18:00:41  Done. PASS=20 WARN=0 ERROR=0 SKIP=0 NO-OP=0 TOTAL=20
Tables: [('customers_d1',), ('dim_customer',), ('fct_sales',), ('sales_d1',), ('sales_with_customer',)]
sales_with_customer rows:
(1001, datetime.datetime(2025, 8, 31, 9, 55), 25.5, 'USD', 'C001', 'ACME CORP', 'contact@acme.example', 'NE')
(1002, datetime.datetime(2025, 8, 31, 10, 1), 78.9, 'USD', 'C002', 'GLOBEX LLC', 'info@globex.example', 'SW')
(1003, datetime.datetime(2025, 8, 31, 10, 5), 13.0, 'USD', 'C001', 'ACME CORP', 'contact@acme.example', 'NE')
