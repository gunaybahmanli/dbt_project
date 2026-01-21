# DBT Project: Medallion Architecture on Databricks
### Project Overview

This project implements a Medallion Architecture on Databricks using dbt as a demo/proof-of-concept:

**Bronze Layer:** Raw data ingestion from source schemas (fact_sales, fact_returns, dim_customer, dim_date, dim_store, dim_product, etc.) in Databricks dbt_project_dev catalog. Includes a manual items table for snapshot demonstration.

**Silver Layer:** Example transformed table (silver_salesinfo) demonstrating business logic (calculated gross_amount, joined dimensions).

**Gold Layer:** Deduplicated table (gold_items) to demonstrate snapshot functionality.

This setup shows how data flows from **Bronze → Silver → Gold** and how dbt models, tests, snapshots, and macros work together.
