#!/usr/bin/env bash
set -euo pipefail
# Navigate to project root
dirname="$(cd "$(dirname "$0")" && pwd)"
cd "$dirname"

# Ensure dbt profile exists
if [ ! -f dbt_project/profiles.yml ]; then
  cp dbt_project/profiles.yml.example dbt_project/profiles.yml
fi

export DBT_PROFILES_DIR="$PWD/dbt_project"
cd dbt_project

dbt debug --no-use-colors

dbt deps --no-use-colors

dbt build --no-use-colors

python - <<'PYTHON'
import duckdb
con = duckdb.connect('duck_poc.duckdb')
print('Tables:', con.execute('show tables').fetchall())
rows = con.execute('select * from sales_with_customer order by sales_id').fetchall()
print('sales_with_customer rows:')
for row in rows:
    print(row)
con.close()
PYTHON

# Clean up database file to keep repo clean
rm -f duck_poc.duckdb
rm -rf dbt_packages logs target
rm -f profiles.yml
