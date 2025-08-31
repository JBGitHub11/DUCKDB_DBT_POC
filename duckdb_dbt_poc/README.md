# Local POC: dbt + DuckDB (D0→D3)

This is a zero-cost POC you can run entirely on your PC. It simulates Snowflake layers using **dbt** with **DuckDB** and two CSVs as your D0 snapshots.

## Data Flow & Layer Definitions

This project uses a layered approach to data modeling:

- **D0 (Raw Data):** CSV files in the `data/` directory are considered D0 snapshots (raw source data).
- **D1 (Clean Layer):** dbt models in `models/d1_clean/` read the CSVs, clean and type-cast the data, and materialize it as tables in DuckDB.
- **D2 (Transform Layer):** dbt models in `models/d2_transform/` apply business logic, aggregations, and build dimension/fact tables using `ref()` to D1 models.
- **D3 (Present Layer):** dbt models in `models/d3_present/` join and aggregate D2 tables for analytics and reporting.

**Execution Order:**
- dbt automatically determines the order to run models based on dependencies defined with `ref()` in SQL files.
- Models with no dependencies (D1) run first, followed by D2 and D3 models that depend on upstream tables.
- The pipeline is run by executing `dbt run` (or via the `run_tests.sh` script).

**Example Flow:**
```
CSV files (D0)
   ↓
d1_clean (customers_d1, sales_d1)
   ↓
d2_transform (dim_customer, fct_sales)
   ↓
d3_present (sales_with_customer)
```

---

## Current Capabilities
- Ingests D0 CSV snapshots into DuckDB as D1 tables.
- Builds D2 dimension and fact models.
- Presents a joined D3 model `sales_with_customer`.
- Automated tests for not-null/unique/relationship constraints.
- `run_tests.sh` script runs the pipeline and verifies results.

## 1) Install prerequisites
- Python 3.10+
- Git (optional)

Install dbt + DuckDB adapter:
```bash
pip install dbt-duckdb duckdb
```

Verify:
```bash
dbt --version
python -c "import duckdb; print(duckdb.__version__)"
```

## 2) Project layout
```
dbt_project/
  dbt_project.yml
  profiles.yml.example
  models/
    d1_clean/
      customers_d1.sql
      sales_d1.sql
    d2_transform/
      dim_customer.sql
      fct_sales.sql
    d3_present/
      sales_with_customer.sql
data/
  customers_2025-08-31-10.csv
  sales_2025-08-31-10.csv
```

## 3) Configure dbt profile
Copy the example profile to your dbt profiles location and point `path` to a local DuckDB file:
- macOS/Linux: `~/.dbt/profiles.yml`
- Windows: `%USERPROFILE%\.dbt\profiles.yml`

Example (copy this):
```yaml
duckdb_poc:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: "duck_poc.duckdb"   # or set env var DBT_DUCKDB_PATH
      threads: 4
```

## 4) Run the pipeline
```bash
cd dbt_project
dbt debug                # check config
dbt deps                 # no packages yet, but safe to run
dbt run                  # builds D1 -> D2 -> D3 in DuckDB
```

## 5) Inspect results
Launch DuckDB shell and query the tables:
```bash
python -c "import duckdb; con=duckdb.connect('duck_poc.duckdb'); print(con.execute('show tables').fetchall()); print(con.execute('select * from sales_with_customer').fetchdf())"
```

You should see a joined `sales_with_customer` table with two customers and three sales.

## 6) Next steps
- Add more CSVs to `data/` and point the D1 models to wildcard readers (e.g., `read_csv_auto('../data/sales_*.csv')`).  
- Add **tests** via a `schema.yml` (not_null/unique/relationships).  
- When ready, swap DuckDB for Snowflake by installing `dbt-snowflake` and updating `profiles.yml`.  
- Use your D0 FSPEC template to document sources alongside the models.

## Troubleshooting
- If `dbt run` can’t find your profile, ensure it’s in the correct directory and named exactly `profiles.yml`.  
- On Windows, use double backslashes in paths.  
- If Python env conflicts, create a venv: `python -m venv .venv && source .venv/bin/activate` (Windows: `.venv\Scripts\activate`).

Enjoy! 🚀
