-- =====================================================================
-- Step 6 : ETL from staging into the normalized tables
--   1. add any category that is new to the lookup tables
--   2. replace text labels by lookup keys, Yes/No by 1/0
--   3. reconcile row counts
-- =====================================================================

USE loan_risk_db;

-- 6.1 lookups (INSERT IGNORE skips values that already exist)
INSERT IGNORE INTO education_levels (education_name)
SELECT DISTINCT education
FROM stg_loan_applications
WHERE education IS NOT NULL;

INSERT IGNORE INTO loan_purposes (purpose_name)
SELECT DISTINCT loan_purpose
FROM stg_loan_applications
WHERE loan_purpose IS NOT NULL;

-- 6.2 main load
INSERT INTO loan_applications (
    loan_id, age, annual_income, loan_amount, credit_score,
    months_employed, num_credit_lines, interest_rate, loan_term_months,
    dti_ratio, education_id, employment_type, marital_status,
    has_mortgage, has_dependents, purpose_id, has_cosigner, is_default
)
SELECT
    s.loan_id,
    s.age,
    s.income,
    s.loan_amount,
    s.credit_score,
    s.months_employed,
    s.num_credit_lines,
    s.interest_rate,
    s.loan_term,
    s.dti_ratio,
    e.education_id,
    s.employment_type,
    s.marital_status,
    (s.has_mortgage   = 'Yes'),
    (s.has_dependents = 'Yes'),
    p.purpose_id,
    (s.has_cosigner   = 'Yes'),
    s.default_flag
FROM stg_loan_applications AS s
JOIN education_levels AS e ON e.education_name = s.education
JOIN loan_purposes    AS p ON p.purpose_name   = s.loan_purpose;

-- 6.3 reconciliation: both counts must match
SELECT
    (SELECT COUNT(*) FROM stg_loan_applications) AS staged_rows,
    (SELECT COUNT(*) FROM loan_applications)     AS loaded_rows;
