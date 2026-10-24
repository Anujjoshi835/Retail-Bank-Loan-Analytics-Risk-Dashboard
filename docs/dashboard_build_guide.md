# Dashboard Build Guide (Power BI)

Data source: MySQL database `loan_risk_db`, table/view `vw_loan_report`. Use Import mode.

## Measures

```
Total Loans        = COUNTROWS ( vw_loan_report )
Total Loan Amount  = SUM ( vw_loan_report[loan_amount] )
Average Income     = AVERAGE ( vw_loan_report[annual_income] )
Average Credit Score = AVERAGE ( vw_loan_report[credit_score] )
Total Defaults     = SUM ( vw_loan_report[is_default] )
Default Rate %     = DIVIDE ( [Total Defaults], [Total Loans] )
Average DTI        = AVERAGE ( vw_loan_report[dti_ratio] )
Average Interest   = AVERAGE ( vw_loan_report[interest_rate] )
Average Age        = AVERAGE ( vw_loan_report[age] )
Average Credit Lines = AVERAGE ( vw_loan_report[num_credit_lines] )
Average Months Employed = AVERAGE ( vw_loan_report[months_employed] )
```

Add a calculated column for the age group and use it as an axis:

```
Age Group = SWITCH ( TRUE (),
    vw_loan_report[age] < 30,  "18-29",
    vw_loan_report[age] <= 45, "30-45",
    vw_loan_report[age] <= 60, "46-60",
    "60+" )
```

## Pages

| Page | KPI cards | Visuals |
|---|---|---|
| Home | none | Project title, tools used, navigation buttons |
| Executive Summary | Total Loans, Total Loan Amount, Average Income, Average Credit Score, Total Defaults | Applications by purpose, by education, by employment type; average loan amount by purpose |
| Risk Analysis | Total Defaults, Average Credit Score, Average DTI, Average Interest | Default Rate % by purpose, education, employment type, mortgage and co-signer |
| Customer Profile | Average Age, Total Loans, Average Credit Lines, Average Months Employed | Borrowers by age group, marital status, purpose; default rate by age group |
| Portfolio Insights | Highest loan, lowest loan, highest interest rate, lowest credit score, highest income | Average loan by term, interest rate by employment, income and credit lines by education |

## Slicers on every page

Loan purpose, education, employment type, marital status, loan term. Sync them across pages with the Sync slicers pane.

The numbers on each card can be checked against `sql/09_dashboard_kpis.sql`. The images in `dashboard_previews/` show the intended layout.
