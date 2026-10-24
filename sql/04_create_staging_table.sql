
USE loan_risk_db;

DROP TABLE IF EXISTS stg_loan_applications;

CREATE TABLE stg_loan_applications (
    loan_id           VARCHAR(20),
    age               INT,
    income            DECIMAL(12,2),
    loan_amount       DECIMAL(12,2),
    credit_score      INT,
    months_employed   INT,
    num_credit_lines  INT,
    interest_rate     DECIMAL(5,2),
    loan_term         INT,
    dti_ratio         DECIMAL(5,2),
    education         VARCHAR(50),
    employment_type   VARCHAR(50),
    marital_status    VARCHAR(30),
    has_mortgage      VARCHAR(3),
    has_dependents    VARCHAR(3),
    loan_purpose      VARCHAR(50),
    has_cosigner      VARCHAR(3),
    default_flag      TINYINT
);

LOAD DATA LOCAL INFILE '"C:\Users\anujj\Downloads\Loan_default (1).csv"'
INTO TABLE stg_loan_applications
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS rows_staged FROM stg_loan_applications;
SELECT * FROM stg_loan_applications LIMIT 5;
