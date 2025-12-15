# Stock Trading Analytics using SQL

This repository contains a complete end-to-end trading analytics case study built using SQL and dimensional data modeling.

The project demonstrates how raw trading and market data can be transformed into business-ready KPIs used for performance tracking, risk analysis, and market insights, similar to real-world systems used in trading firms and financial institutions.

---

## Dataset Overview

The dataset represents a simplified trading system, including:

- Trade executions  
- Stock price movements  
- Portfolio holdings  
- Corporate actions (dividends and splits)  
- Trader and desk information  

Raw data is provided in:
- `Stock_Data.xlsx` as the source file
- `Stock_data.sql` for SQL-based data loading

---

## Data Model

The project follows a fact–dimension (star/snowflake) schema designed for analytical workloads.

### Fact Tables
- `fact_traders` – trade-level execution data  
- `fact_daily_prices` – daily OHLCV stock prices  
- `fact_positions_snapshot` – portfolio holdings  
- `fact_dividends` – dividend events  
- `fact_splits` – stock split history  

### Dimension Tables
- `dim_trader` – trader details and desk assignment  
- `dim_company` – company and ticker information  
- `dim_sector` – sector classification  
- `dim_portfolio` – portfolio metadata  
- `dim_calendar` – time dimension  

Entity relationships are documented in `Diagrams/Connections.png`.

---

## Business KPIs Implemented

Each KPI is implemented as a standalone SQL file inside the `KPI` directory.

Key analyses include:

- Top traders by trade value and fee generation  
- Trading desk performance comparison  
- Most traded companies by volume and value  
- Portfolio concentration and exposure risk  
- Sector-wise trading activity  
- Buy vs sell ratio and net positioning  
- Monthly trading volume and revenue trends  
- Stock price volatility and performance  
- Corporate actions impact analysis  

---

## Tools and Skills Used

- SQL (advanced aggregations and analytical queries)  
- Dimensional data modeling  
- Financial and trading domain analysis  
- KPI design for business decision-making  

---

## How to Use This Project

1. Execute schema scripts from the `Schema` directory  
2. Load data using `data/Stock_data.sql`  
3. Run KPI queries from the `KPI` directory  
4. Visualize results using any BI or analytics tool such as Power BI or Tableau  

---

## Purpose of This Project

This project was built to demonstrate practical SQL skills applied to real-world financial data.

The focus is on building business-aligned KPIs rather than academic or theoretical queries, reflecting how analytics teams operate in trading firms, banks, and investment platforms.

---

## Author

Kanhaiya  
Aspiring Data Analyst with a focus on SQL, analytics, and finance data
