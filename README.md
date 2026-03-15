# SpotOn Disaster Analytics – Snowflake ELT Pipeline

A production-style Snowflake ELT pipeline designed to simulate enterprise disaster impact analytics for operational risk monitoring and business continuity reporting.

This project demonstrates layered data architecture, dimensional modeling, incremental ingestion, and CI/CD automation using GitHub Actions.

---

## Overview

Organizations operating across multiple regions require visibility into:

- Disaster incidents  
- Operational disruptions  
- Revenue impact  
- SLA performance  
- Regional risk exposure  

This project implements a scalable Snowflake-based analytics pipeline that ingests, transforms, and models disaster incident data into a star schema optimized for reporting and KPI analysis.

---

## Architecture

The pipeline follows a layered ELT architecture:

Source Data  
→ RAW Layer (Landing Zone)  
→ STAGING Layer (Data Cleaning & Standardization)  
→ CURATED Layer (Star Schema Model)  
→ KPI & Analytics Queries  

### RAW Layer
- Stores ingested source data without transformation  
- Acts as the landing zone for new data loads  

### STAGING Layer
- Cleans and standardizes data  
- Normalizes timestamps and regions  
- Derives calculated fields such as SLA performance and severity classification  

### CURATED Layer
Implements a dimensional star schema optimized for analytics.

Fact Table:
- FACT_INCIDENTS  

Dimension Tables:
- DIM_DATE  
- DIM_REGION  

This structure enables efficient aggregation, filtering, and KPI reporting.

---

## Key Analytics Enabled

- Total revenue loss  
- SLA breach rate  
- Average resolution time  
- Incidents by region  
- Incidents by severity  
- Monthly trend analysis  

The dimensional model supports scalable enterprise reporting use cases.

---

## Incremental Data Processing

The pipeline supports incremental ingestion using:

- LOAD_TIMESTAMP column  
- Delta-based insert logic  
- Comparison against previously processed records  

This ensures:

- No full-table reloads  
- Efficient compute usage  
- Production-style data processing behavior  

---

## CI/CD Automation

Deployment is automated using GitHub Actions.

On every push to the main branch:

- The repository is checked out  
- A Python runtime environment is configured  
- The Snowflake connector is installed  
- SQL scripts are executed  
- Snowflake objects are deployed securely  

Credentials are managed using GitHub repository secrets to simulate enterprise-grade DevOps practices.

---

## Project Structure
spoton-snowflake-disaster-analytics/
│
├── sql/
│ ├── 01_raw.sql
│ ├── 02_staging.sql
│ └── 03_curated.sql
│
├── .github/
│ └── workflows/
│ └── deploy.yml
│
├── deploy.py
├── .gitignore
└── README.md


---

## Technology Stack

- Snowflake (Cloud Data Warehouse)  
- SQL (ELT transformations)  
- Python (Deployment automation)  
- GitHub Actions (CI/CD)  
- Dimensional Modeling (Star Schema)  
- Incremental Data Processing  

---

## Business Value

This architecture enables:

- Faster disaster impact analysis  
- Regional performance comparison  
- SLA compliance monitoring  
- Revenue impact visibility  
- A scalable foundation for enterprise analytics  

---

## Future Enhancements

- Snowflake Streams and Tasks for near real-time ingestion  
- Role-Based Access Control (RBAC)  
- Cost monitoring and warehouse optimization  
- BI tool integration (Power BI or QuickSight)  
- Data quality validation framework  

---

## Power BI Dashboard

The Snowflake data warehouse is connected to Power BI using DirectQuery, enabling real-time visualization of incident trends, revenue impact, SLA breaches, and regional performance metrics.

Key Features:

Executive KPI summary

Daily incident and revenue trend analysis

Regional performance comparison

SLA breach monitoring

Interactive filtering by Region and Severity

---

Dashboard Preview

