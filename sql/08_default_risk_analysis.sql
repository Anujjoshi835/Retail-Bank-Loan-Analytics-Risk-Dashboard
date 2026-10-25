

USE loan_risk_db;

--  Which education level has the highest default rate?
SELECT
    e.education_name,
    COUNT(*)                          AS total_loans,
    SUM(l.is_default)                 AS defaults,
    ROUND(100 * AVG(l.is_default), 2) AS default_rate_pct
FROM loan_applications AS l
JOIN education_levels  AS e ON e.education_id = l.education_id
GROUP BY e.education_name
ORDER BY default_rate_pct DESC;

--  Which loan purpose is the riskiest?
SELECT
    p.purpose_name,
    COUNT(*)                          AS total_loans,
    SUM(l.is_default)                 AS defaults,
    ROUND(100 * AVG(l.is_default), 2) AS default_rate_pct
FROM loan_applications AS l
JOIN loan_purposes     AS p ON p.purpose_id = l.purpose_id
GROUP BY p.purpose_name
ORDER BY default_rate_pct DESC;

--  Does income level change the chance of default?
SELECT
    income_band,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM (
    SELECT
        is_default,
        CASE
            WHEN annual_income <  50000 THEN 'Low (< 50k)'
            WHEN annual_income <= 100000 THEN 'Middle (50k-100k)'
            ELSE 'High (> 100k)'
        END AS income_band
    FROM loan_applications
) AS banded
GROUP BY income_band
ORDER BY default_rate_pct DESC;

--  Does credit score change the chance of default?
SELECT
    credit_band,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM (
    SELECT
        is_default,
        CASE
            WHEN credit_score <  600 THEN 'Poor (< 600)'
            WHEN credit_score <= 700 THEN 'Average (600-700)'
            ELSE 'Excellent (> 700)'
        END AS credit_band
    FROM loan_applications
) AS banded
GROUP BY credit_band
ORDER BY default_rate_pct DESC;

--  Do borrowers with a mortgage default less?
SELECT
    IF(has_mortgage = 1, 'Has mortgage', 'No mortgage') AS mortgage_status,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM loan_applications
GROUP BY has_mortgage;

-- Q6. Does a co-signer reduce default?
SELECT
    IF(has_cosigner = 1, 'With co-signer', 'No co-signer') AS cosigner_status,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM loan_applications
GROUP BY has_cosigner;

--  Which employment type is the riskiest?
SELECT
    employment_type,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM loan_applications
GROUP BY employment_type
ORDER BY default_rate_pct DESC;

--  Which marital status shows the highest default rate?
SELECT
    marital_status,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM loan_applications
GROUP BY marital_status
ORDER BY default_rate_pct DESC;

--  Which age group defaults the most?
SELECT
    age_group,
    COUNT(*)                          AS total_loans,
    SUM(is_default)                   AS defaults,
    ROUND(100 * AVG(is_default), 2)   AS default_rate_pct
FROM (
    SELECT
        is_default,
        CASE
            WHEN age < 30  THEN '18-29'
            WHEN age <= 45 THEN '30-45'
            WHEN age <= 60 THEN '46-60'
            ELSE '60+'
        END AS age_group
    FROM loan_applications
) AS banded
GROUP BY age_group
ORDER BY default_rate_pct DESC;

--  Ten largest loans and who took them
SELECT
    loan_id,
    loan_amount,
    annual_income,
    credit_score,
    employment_type,
    is_default
FROM loan_applications
ORDER BY loan_amount DESC
LIMIT 10;
