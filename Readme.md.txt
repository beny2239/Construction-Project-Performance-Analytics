# Construction Project Performance Analytics

An end-to-end data analytics project that combines **SQL Server, Power BI, and DAX** to analyze construction project performance across cost, schedule, progress, materials, labor productivity, and project risk.

The project was designed from a construction management perspective and demonstrates how project data can be transformed into actionable performance indicators through data modeling and business intelligence.

---

## Project Overview

Construction projects generate large amounts of operational data related to activities, costs, materials, labor, and progress.

The objective of this project is to build a centralized analytical solution that helps project stakeholders monitor:

* Project cost performance
* Planned vs. actual progress
* Schedule delays
* Material consumption
* Labor utilization
* Productivity
* Earned Value Management (EVM)
* Cost Performance Index (CPI)
* Schedule Performance Index (SPI)
* Overall project health and risk

The solution uses a relational SQL database as the data source and Power BI as the analytical and visualization layer.

---

## Business Questions

The project addresses questions such as:

1. Are projects within their planned budgets?
2. How does actual progress compare with planned progress?
3. Which activities are delayed?
4. Which construction categories experience the largest delays?
5. How does actual material consumption compare with planned quantities?
6. How much labor is being used across activities?
7. What is the relationship between labor hours and project progress?
8. Are projects performing efficiently from a cost perspective?
9. Are projects ahead of or behind schedule?
10. Which projects require closer monitoring based on cost and schedule performance?

---

## Dataset

The project uses a relational construction project database containing the following tables:

| Table        | Description                                                               |
| ------------ | ------------------------------------------------------------------------- |
| `Projects`   | Project-level information, budgets, locations, clients, and planned dates |
| `Activities` | Construction activities, categories, durations, and planned/actual costs  |
| `Progress`   | Planned and actual progress over time                                     |
| `Costs`      | Cost transactions by project, activity, and cost type                     |
| `Materials`  | Planned vs. actual material quantities and unit costs                     |
| `Workers`    | Workforce, working hours, worker type, and labor costs                    |
| `DimDate`    | Calendar dimension used for time-based analysis                           |

The model contains three construction projects covering residential and commercial development scenarios.

---

## Data Model

The Power BI model follows a relational structure connecting projects to activities and activities to operational data.

### Main relationships

```text
Projects
   │
   └── Activities
          │
          ├── Progress
          ├── Costs
          ├── Materials
          └── Workers

DimDate
   ├── Progress
   ├── Costs
   ├── Materials
   └── Workers
```

The model uses one-to-many relationships with single-direction filtering from dimension entities toward transactional data.

---

## SQL Server

SQL Server is used as the primary data storage and preparation layer.

The SQL component includes:

* Database creation
* Relational table design
* Primary and foreign keys
* Data insertion
* Analytical SQL queries
* Aggregation and variance analysis
* Project-level performance analysis

### SQL Project Structure

```text
SQL/
├── 01_Create_Database.sql
├── 02_Create_Tables.sql
├── 03_Insert_Data.sql
└── 04_Analysis_Queries.sql
```

---

## Power BI

Power BI is used to transform the relational data model into an interactive analytical dashboard.

The report contains four analytical pages.

### 1. Project Overview

Provides a high-level view of:

* Total budget
* Planned cost
* Actual cost
* Cost variance
* Planned progress
* Actual progress
* Total activities
* Completed activities
* Project-level performance

### 2. Schedule & Progress

Focuses on schedule performance and construction progress.

Key analysis includes:

* Planned vs. actual duration
* Activity delays
* Average delay
* Delayed activities
* Delay by construction category
* Progress by building level
* Activity-level schedule analysis

### 3. Cost & Materials

Analyzes project expenditure and material consumption.

Key analysis includes:

* Planned vs. actual cost
* Cost variance
* Cost variance percentage
* Cost breakdown by type
* Material cost
* Labor cost
* Planned vs. actual material quantities
* Material quantity variance

### 4. Productivity & Risk

Combines workforce productivity with Earned Value Management.

Key analysis includes:

* Labor hours
* Worker utilization
* Labor cost
* Productivity indicators
* CPI
* SPI
* CPI/SPI trends
* Project risk analysis
* Delayed activities by category
* Project performance comparison

---

## DAX & Key Performance Indicators

DAX measures are used to calculate project performance indicators directly within the Power BI semantic model.

### Cost Performance

**Cost Variance**

```text
Actual Cost − Planned Cost
```

**Cost Variance %**

```text
Cost Variance / Planned Cost
```

### Schedule Performance

**Delay Days**

```text
Actual Duration − Planned Duration
```

**Delay Rate**

```text
Delayed Activities / Total Activities
```

### Earned Value Management

The project also implements Earned Value Management concepts.

**Planned Value (PV)**

Represents the budgeted value of work planned to be completed.

**Earned Value (EV)**

Represents the budgeted value of work actually completed.

**Actual Cost (AC)**

Represents the actual expenditure associated with project work.

### Cost Performance Index

```text
CPI = EV / AC
```

Interpretation:

* CPI > 1 → cost efficiency above the baseline
* CPI = 1 → cost performance at the baseline
* CPI < 1 → cost efficiency below the baseline

### Schedule Performance Index

```text
SPI = EV / PV
```

Interpretation:

* SPI > 1 → progress is ahead of the baseline
* SPI = 1 → progress is aligned with the baseline
* SPI < 1 → progress is behind the baseline

The dashboard also includes time-phased CPI and SPI analysis to observe how project performance changes over time.

---

## Time-Phased Analysis

A major component of the project is the use of a date dimension to analyze project performance over time.

Instead of evaluating project performance only at the final reporting point, the dashboard tracks:

* Progress over time
* PV over time
* EV over time
* AC over time
* CPI over time
* SPI over time

This allows project performance to be monitored throughout the project lifecycle.

---

## Project Health

Project health is evaluated using the combination of cost and schedule performance.

The dashboard categorizes project performance into:

* `On Track`
* `At Risk`
* `Critical`

The classification is based on CPI and SPI thresholds defined within the DAX model.

This provides a simplified management-level indicator while allowing users to drill down into the underlying cost and schedule metrics.

---

## Technical Stack

| Technology              | Purpose                                |
| ----------------------- | -------------------------------------- |
| SQL Server              | Database and data management           |
| SQL                     | Data querying and analysis             |
| Power BI                | Data visualization and reporting       |
| DAX                     | KPI and analytical calculations        |
| Data Modeling           | Relationships and semantic model       |
| Earned Value Management | Cost and schedule performance analysis |

---

## Project Structure

```text
Construction-Project-Performance-Analytics/
│
├── README.md
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Insert_Data.sql
│   └── 04_Analysis_Queries.sql
│
├── PowerBI/
│   └── ConstructionAnalytics.pbix
│
├── Screenshots/
│   ├── 01_Project_Overview.png
│   ├── 02_Schedule_Progress.png
│   ├── 03_Cost_Materials.png
│   └── 04_Productivity_Risk.png
│
└── Documentation/
    └── Project_Analysis.md
```

---

## Key Skills Demonstrated

This project demonstrates practical experience in:

* SQL database design
* Relational data modeling
* SQL querying
* Data aggregation
* Data quality and consistency
* Power BI dashboard development
* DAX measure development
* Time-series analysis
* KPI design
* Earned Value Management
* Construction project analytics
* Cost variance analysis
* Schedule variance analysis
* Labor productivity analysis
* Material consumption analysis
* Project risk monitoring

---

## Intended Use

This project is designed as a portfolio demonstration of applying data analytics techniques to a real-world construction management context.

It combines domain knowledge from **Civil Engineering and Construction Management** with modern data analytics and business intelligence tools.

---

## Author

**Benyamin Bastani**

Civil Engineering → Data Analytics

Interested in applying data analytics, business intelligence, and quantitative methods to construction, project management, and business decision-making.
