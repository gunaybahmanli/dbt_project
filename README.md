# DBT Project: Medallion Architecture on Databricks
### Project Overview

This project implements a Medallion Architecture on Databricks using dbt as a demo/proof-of-concept:

**Bronze Layer:** Raw data ingestion from source schemas (fact_sales, fact_returns, dim_customer, dim_date, dim_store, dim_product, etc.) in Databricks dbt_project_dev catalog. Includes a manual items table for snapshot demonstration.

**Silver Layer:** Example transformed table (silver_salesinfo) demonstrating business logic (calculated gross_amount, joined dimensions).

**Gold Layer:** Deduplicated table (gold_items) to demonstrate snapshot functionality.

This setup shows how data flows from **Bronze → Silver → Gold** and how dbt models, tests, snapshots, and macros work together.
```
dbt_project/
│
├─ models/
│   ├─ bronze/      # Raw staging tables
│   ├─ silver/      # Example business logic table (silver_salesinfo)
│   ├─ gold/        # Snapshot demo table (gold_items)
│     
│
├─ snapshots/       # Gold layer snapshots (gold_items)
├─ macros/          # Custom macros (multiply.sql)
├─ tests/           # Generic and business logic tests
├─ seeds/           # Lookup/dummy data (lookup.csv)
└─ analyses/        # SQL/Jinja experiments
```

### Key Features

Dynamic table materialization: Bronze, Silver, and Gold models are materialized as tables in Databricks.

**Data Testing:** Generic tests (not_null, unique, accepted_values) and custom business logic tests (not_negative_singular).

**Snapshot Demo:** Gold layer table (gold_items) demonstrates tracking historical changes.

**Macros & Business Logic:** Example macro (multiply.sql) used in Silver layer calculation.

**Dev → Prod Deployment:** Full workflow using separate Databricks catalogs (dbt_project_dev → dbt_project_prod) and dbt targets.

### Medallion Architecture Workflow

       Raw Data (Bronze Layer)
                 │
                 ▼
 Example Transformation (Silver Layer)
        ┌──────────────────┐
        │ silver_salesinfo │
        └──────────────────┘
                 │
                 ▼
  Deduplicated Snapshot (Gold Layer)
        ┌──────────────────┐
        │     gold_items   │
        └──────────────────┘

### Setup & Usage

Clone the repository:
```
git clone https://github.com/gunaybahmanli/dbt_project.git
cd dbt_project
```
Create and activate a virtual environment:
```
uv init
uv sync
```
Install dbt packages:
```
uv add dbt-core
uv add dbt-databricks
```
Configure Databricks credentials in profiles.yml.
Run models and tests:
```
dbt run
dbt test
dbt run --select 'macros\bronze\'
```
Deploy to production catalog:
```
dbt build --target prod
```

### Results

Demo Medallion Architecture implemented with one Silver table and one Gold snapshot table.

Shows Bronze → Silver → Gold flow, model testing, snapshot creation, and macro usage.

Full Dev → Prod workflow supported via dbt targets and catalog configuration.


