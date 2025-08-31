# Meta FSpec for All Layers

This document provides a comprehensive functional specification (fspec) for each layer in the DuckDB + dbt proof-of-concept project. It covers the data flow, transformation logic, and purpose of each layer and model.

---

## Layer Overview

- **d1_clean**: Raw data ingestion and basic cleaning
- **d2_transform**: Business logic transformations and dimensional modeling
- **d3_present**: Presentation layer for analytics and reporting

---

## d1_clean Layer

### Purpose
- Ingest raw CSV data
- Apply basic cleaning (type casting, null handling, deduplication)
- Prepare data for downstream transformations

### Models
- `customers_d1.sql`: Cleans and standardizes customer data
- `sales_d1.sql`: Cleans and standardizes sales data

### Functional Spec
- **Input**: Raw CSV files (`customers_*.csv`, `sales_*.csv`)
- **Output**: Cleaned tables (`customers_d1`, `sales_d1`)
- **Logic**:
  - Remove duplicates
  - Standardize column types
  - Handle missing/null values
  - Basic validation (e.g., valid dates, non-negative sales)

---

## d2_transform Layer

### Purpose
- Apply business rules
- Create dimensional and fact tables
- Enrich data for analytics

### Models
- `dim_customer.sql`: Builds a customer dimension table
- `fct_sales.sql`: Builds a sales fact table

### Functional Spec
- **Input**: Cleaned tables from d1 (`customers_d1`, `sales_d1`)
- **Output**: Dimensional (`dim_customer`) and fact (`fct_sales`) tables
- **Logic**:
  - Join and enrich data
  - Calculate derived fields (e.g., total sales, customer age)
  - Apply business logic (e.g., customer segmentation)
  - Ensure referential integrity

---

## d3_present Layer

### Purpose
- Prepare data for reporting and dashboarding
- Aggregate and join for final analytics consumption

### Models
- `sales_with_customer.sql`: Combines sales and customer data for reporting

### Functional Spec
- **Input**: Dimensional and fact tables (`dim_customer`, `fct_sales`)
- **Output**: Analytical views (`sales_with_customer`)
- **Logic**:
  - Join dimension and fact tables
  - Aggregate metrics (e.g., sales by customer, time period)
  - Format for BI/reporting tools

---

## Data Flow Diagram

```
Raw CSVs (data/) 
   ↓
d1_clean (customers_d1, sales_d1)
   ↓
d2_transform (dim_customer, fct_sales)
   ↓
d3_present (sales_with_customer)
```

---

## Change Management
- All models are versioned in dbt
- Changes to logic or schema should be reflected in this fspec
- Test results and logs are tracked in `test_results.md` and `dbt_project/logs/`

---

## References
- See `dbt_project/models/schema.yml` for schema definitions
- See individual model SQL files for implementation details

---

*Last updated: 2025-08-31*
