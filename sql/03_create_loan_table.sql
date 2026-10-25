

USE loan_risk_db;

CREATE TABLE loan_applications (
    loan_id            VARCHAR(20)    NOT NULL,
    age                INT            NOT NULL,
    annual_income      DECIMAL(12,2)  NOT NULL,
    loan_amount        DECIMAL(12,2)  NOT NULL,
    credit_score       INT            NOT NULL,
    months_employed    INT,
    num_credit_lines   INT,
    interest_rate      DECIMAL(5,2),
    loan_term_months   INT,
    dti_ratio          DECIMAL(5,2),
    education_id       INT            NOT NULL,
    employment_type    VARCHAR(50),
    marital_status     VARCHAR(30),
    has_mortgage       TINYINT(1),
    has_dependents     TINYINT(1),
    purpose_id         INT            NOT NULL,
    has_cosigner       TINYINT(1),
    is_default         TINYINT(1)     NOT NULL,

    PRIMARY KEY (loan_id),

    CONSTRAINT fk_loans_education
        FOREIGN KEY (education_id) REFERENCES education_levels (education_id),
    CONSTRAINT fk_loans_purpose
        FOREIGN KEY (purpose_id)   REFERENCES loan_purposes (purpose_id)
);

DESCRIBE loan_applications;
