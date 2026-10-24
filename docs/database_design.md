# Database Design

Database name: `loan_risk_db`

## Tables

| Table | Role | Key |
|---|---|---|
| `loan_applications` | One row per loan: borrower profile, loan terms, default outcome | `loan_id` (primary key) |
| `education_levels` | Lookup: High School, Bachelor's, Master's, PhD | `education_id` |
| `loan_purposes` | Lookup: Home, Auto, Business, Education, Other | `purpose_id` |
| `stg_loan_applications` | Staging copy of the raw CSV, used only during loading | none |

`vw_loan_report` is a view that joins the three real tables and is the single source for the dashboard.

## Relationships

- `education_levels` 1 to many `loan_applications` through `education_id`
- `loan_purposes` 1 to many `loan_applications` through `purpose_id`

## Design decisions

- **Lookup tables.** Education and purpose are long text values repeated 255,347 times. Storing them once keeps the loan table smaller and prevents spelling variants.
- **Fixed keys for known values.** The five purposes and four education levels are inserted with fixed keys first, so key 1 is always High School and results sort in a meaningful order.
- **Flags as 0/1.** Mortgage, dependents, co-signer and default are `TINYINT(1)`. Averaging such a column gives a rate directly, which keeps the risk queries short.
- **Staging first.** The CSV is loaded as is, checked, and only then moved into the final tables. A bad load can be repeated without touching the final data.
- **Indexes** on the foreign keys and on the columns used for filtering (credit score, income, default flag).

The diagram is in `diagrams/er_diagram.png`.
