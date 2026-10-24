# Loan Portfolio Risk Analysis

A SQL and Power BI project that turns a raw file of 255,347 retail loan applications into a clean relational database, a set of risk queries, and a four page dashboard. The question behind it: which borrowers default, and what does the loan book look like

## What is in this project

| Stage | What happens | Where |
|---|---|---|
| Design | Three table schema: one loan table, two lookup tables | `sql/01` to `sql/03`, `diagrams/` |
| Staging | Raw CSV loaded untouched into a staging table | `sql/04` |
| Quality checks | Duplicates, missing values, value ranges, category lists | `sql/05` |
| ETL | Lookups filled, text labels replaced by keys, Yes/No turned into 0/1 | `sql/06` |
| Analysis | Portfolio profile, ten default risk questions, dashboard KPIs | `sql/07` to `sql/09` |
| Serving | Flat reporting view and indexes | `sql/10`, `sql/11` |
| Dashboard | Four report pages (build guide and previews) | `docs/dashboard_build_guide.md`, `dashboard_previews/` |

## Folder layout

```
loan_risk_project
|-- data/                  loan_applications.csv (source file)
|-- sql/                   numbered scripts, run in order (run_all.sql runs them all)
|-- diagrams/              entity relationship diagram (PNG and Graphviz source)
|-- dashboard_previews/    the four report pages as images
|-- docs/                  design, ETL, data dictionary, findings, dashboard guide
`-- README.md
```


## Database design

`loan_applications` holds one row per loan. `education_levels` and `loan_purposes` are lookup tables referenced through foreign keys, so every label is stored once. A view, `vw_loan_report`, joins the three tables back together for access to POWERBI. See `docs/database_design.md`.

## Headline findings

Overall default rate is 11.61 percent (29,653 of 255,347 loans). Risk is concentrated in a few places:

- **Age:** borrowers under 30 default at 19.71 percent, against 5.05 percent for those over 60.
- **Income:** loans to borrowers earning under 50k default at 17.16 percent, against 9.10 percent above 100k.
- **Employment:** unemployed borrowers default at 13.55 percent, full-time employees at 9.46 percent.
- **Protection:** a co-signer (10.36 versus 12.87 percent) and a mortgage (10.88 versus 12.35 percent) both go with lower default rates.
- **Weak signals:** loan purpose, marital status and loan term move the default rate far less.

The full list is in `docs/key_findings.md`.

## Dashboard previews

| | |
|---|---|
| ![Executive summary](dashboard_previews/01_executive_summary.png) | ![Risk analysis](dashboard_previews/02_risk_analysis.png) |
| ![Customer profile](dashboard_previews/03_customer_profile.png) | ![Portfolio insights](dashboard_previews/04_portfolio_insights.png) |

## Tools

MySQL, SQL, Power BI
