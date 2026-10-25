
USE loan_risk_db;

-- 5.1 duplicate loan identifiers
SELECT loan_id, COUNT(*) AS occurrences
FROM stg_loan_applications
GROUP BY loan_id
HAVING COUNT(*) > 1;

-- 5.2 missing values in the key columns
SELECT
    COUNT(*)                         AS total_rows,
    SUM(loan_id          IS NULL)    AS missing_loan_id,
    SUM(age              IS NULL)    AS missing_age,
    SUM(income           IS NULL)    AS missing_income,
    SUM(loan_amount      IS NULL)    AS missing_loan_amount,
    SUM(credit_score     IS NULL)    AS missing_credit_score,
    SUM(education        IS NULL)    AS missing_education,
    SUM(loan_purpose     IS NULL)    AS missing_purpose,
    SUM(default_flag     IS NULL)    AS missing_default_flag
FROM stg_loan_applications;

-- 5.3 value ranges of the numeric columns
SELECT 'age' AS column_name, MIN(age) AS min_value, MAX(age) AS max_value FROM stg_loan_applications
UNION ALL
SELECT 'income',           MIN(income),           MAX(income)           FROM stg_loan_applications
UNION ALL
SELECT 'loan_amount',      MIN(loan_amount),      MAX(loan_amount)      FROM stg_loan_applications
UNION ALL
SELECT 'credit_score',     MIN(credit_score),     MAX(credit_score)     FROM stg_loan_applications
UNION ALL
SELECT 'interest_rate',    MIN(interest_rate),    MAX(interest_rate)    FROM stg_loan_applications
UNION ALL
SELECT 'dti_ratio',        MIN(dti_ratio),        MAX(dti_ratio)        FROM stg_loan_applications;

-- 5.4 distinct values of every categorical / flag column
SELECT DISTINCT education       FROM stg_loan_applications;
SELECT DISTINCT employment_type FROM stg_loan_applications;
SELECT DISTINCT marital_status  FROM stg_loan_applications;
SELECT DISTINCT loan_purpose    FROM stg_loan_applications;
SELECT DISTINCT has_mortgage    FROM stg_loan_applications;
SELECT DISTINCT has_dependents  FROM stg_loan_applications;
SELECT DISTINCT has_cosigner    FROM stg_loan_applications;
SELECT DISTINCT default_flag    FROM stg_loan_applications;
