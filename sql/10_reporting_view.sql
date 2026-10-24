-- =====================================================================
-- Step 10 : one flat view for the dashboard
-- The BI tool connects to this view instead of joining three tables,
-- so every report sees the same, already-decoded data.
-- =====================================================================

USE loan_risk_db;

CREATE OR REPLACE VIEW vw_loan_report AS
SELECT
    l.loan_id,
    l.age,
    l.annual_income,
    l.loan_amount,
    l.credit_score,
    l.months_employed,
    l.num_credit_lines,
    l.interest_rate,
    l.loan_term_months,
    l.dti_ratio,
    e.education_name,
    p.purpose_name,
    l.employment_type,
    l.marital_status,
    l.has_mortgage,
    l.has_dependents,
    l.has_cosigner,
    l.is_default
FROM loan_applications AS l
JOIN education_levels  AS e ON e.education_id = l.education_id
JOIN loan_purposes     AS p ON p.purpose_id   = l.purpose_id;

SELECT * FROM vw_loan_report LIMIT 10;
