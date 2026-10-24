-- =====================================================================
-- Step 11 : indexes for the columns used in filters and joins
-- (the primary key on loan_id already exists)
-- =====================================================================

USE loan_risk_db;

CREATE INDEX idx_loans_education  ON loan_applications (education_id);
CREATE INDEX idx_loans_purpose    ON loan_applications (purpose_id);
CREATE INDEX idx_loans_credit     ON loan_applications (credit_score);
CREATE INDEX idx_loans_income     ON loan_applications (annual_income);
CREATE INDEX idx_loans_default    ON loan_applications (is_default);

SHOW INDEX FROM loan_applications;
