
USE loan_risk_db;

-- 7.1 size of the book
SELECT COUNT(*) AS total_loans FROM loan_applications;

-- 7.2 spread of the main numeric attributes
SELECT
    MIN(age)            AS min_age,
    MAX(age)            AS max_age,
    ROUND(AVG(age), 1)  AS avg_age
FROM loan_applications;

SELECT
    MIN(annual_income)            AS min_income,
    MAX(annual_income)            AS max_income,
    ROUND(AVG(annual_income), 0)  AS avg_income
FROM loan_applications;

SELECT
    MIN(loan_amount)            AS min_loan,
    MAX(loan_amount)            AS max_loan,
    ROUND(AVG(loan_amount), 0)  AS avg_loan
FROM loan_applications;

SELECT
    MIN(credit_score)            AS min_score,
    MAX(credit_score)            AS max_score,
    ROUND(AVG(credit_score), 0)  AS avg_score
FROM loan_applications;

-- 7.3 composition of the book by category
SELECT e.education_name, COUNT(*) AS total_loans
FROM loan_applications AS l
JOIN education_levels  AS e ON e.education_id = l.education_id
GROUP BY e.education_name
ORDER BY total_loans DESC;

SELECT p.purpose_name, COUNT(*) AS total_loans
FROM loan_applications AS l
JOIN loan_purposes     AS p ON p.purpose_id = l.purpose_id
GROUP BY p.purpose_name
ORDER BY total_loans DESC;

SELECT employment_type, COUNT(*) AS total_loans
FROM loan_applications
GROUP BY employment_type
ORDER BY total_loans DESC;

SELECT marital_status, COUNT(*) AS total_loans
FROM loan_applications
GROUP BY marital_status
ORDER BY total_loans DESC;

-- 7.4 overall default picture
SELECT is_default, COUNT(*) AS total_loans
FROM loan_applications
GROUP BY is_default;

SELECT ROUND(100 * AVG(is_default), 2) AS overall_default_rate_pct
FROM loan_applications;
