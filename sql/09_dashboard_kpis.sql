

USE loan_risk_db;

-- Page 1 : executive summary
SELECT
    COUNT(*)                          AS total_loans,
    ROUND(SUM(loan_amount), 0)        AS total_loan_amount,
    ROUND(AVG(annual_income), 0)      AS avg_income,
    ROUND(AVG(credit_score), 0)       AS avg_credit_score,
    SUM(is_default)                   AS total_defaults
FROM loan_applications;

SELECT p.purpose_name,
       COUNT(*)                       AS applications,
       ROUND(AVG(l.loan_amount), 0)   AS avg_loan_amount
FROM loan_applications AS l
JOIN loan_purposes     AS p ON p.purpose_id = l.purpose_id
GROUP BY p.purpose_name
ORDER BY applications DESC;

-- Page 2 : risk analysis
SELECT
    SUM(is_default)                   AS default_loans,
    ROUND(AVG(credit_score), 0)       AS avg_credit_score,
    ROUND(AVG(dti_ratio), 3)          AS avg_dti_ratio,
    ROUND(AVG(interest_rate), 2)      AS avg_interest_rate
FROM loan_applications;

-- Page 3 : customer profile
SELECT
    ROUND(AVG(age), 1)                AS avg_age,
    COUNT(*)                          AS total_borrowers,
    ROUND(AVG(num_credit_lines), 2)   AS avg_credit_lines,
    ROUND(AVG(months_employed), 1)    AS avg_months_employed
FROM loan_applications;

-- Page 4 : loan performance and portfolio insights
SELECT
    MAX(loan_amount)                  AS highest_loan_amount,
    MIN(loan_amount)                  AS lowest_loan_amount,
    MAX(interest_rate)                AS highest_interest_rate,
    MIN(credit_score)                 AS lowest_credit_score,
    MAX(annual_income)                AS highest_income
FROM loan_applications;

SELECT loan_term_months,
       COUNT(*)                       AS loans,
       ROUND(AVG(loan_amount), 0)     AS avg_loan_amount
FROM loan_applications
GROUP BY loan_term_months
ORDER BY loan_term_months;

SELECT employment_type,
       ROUND(AVG(interest_rate), 2)   AS avg_interest_rate
FROM loan_applications
GROUP BY employment_type
ORDER BY avg_interest_rate DESC;

SELECT e.education_name,
       ROUND(AVG(l.annual_income), 0)    AS avg_income,
       ROUND(AVG(l.num_credit_lines), 2) AS avg_credit_lines
FROM loan_applications AS l
JOIN education_levels  AS e ON e.education_id = l.education_id
GROUP BY e.education_name
ORDER BY e.education_id;
