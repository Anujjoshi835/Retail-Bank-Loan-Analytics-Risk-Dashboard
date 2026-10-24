# Data Dictionary

Source file: `data/loan_applications.csv`, 255,347 rows, 18 columns, no missing values and no duplicate loan identifiers.

| Column in the CSV | Column in `loan_applications` | Meaning |
|---|---|---|
| LoanID | `loan_id` | Unique loan application identifier |
| Age | `age` | Borrower age in years (18 to 69) |
| Income | `annual_income` | Borrower yearly income (15,000 to 149,999) |
| LoanAmount | `loan_amount` | Loan amount (5,000 to 249,999) |
| CreditScore | `credit_score` | Credit score (300 to 849) |
| MonthsEmployed | `months_employed` | Months in current employment |
| NumCreditLines | `num_credit_lines` | Number of open credit lines |
| InterestRate | `interest_rate` | Loan interest rate in percent (2.00 to 25.00) |
| LoanTerm | `loan_term_months` | Loan length in months (12, 24, 36, 48, 60) |
| DTIRatio | `dti_ratio` | Debt to income ratio (0.10 to 0.90) |
| Education | `education_id` | Key into `education_levels` |
| EmploymentType | `employment_type` | Full-time, Part-time, Self-employed, Unemployed |
| MaritalStatus | `marital_status` | Single, Married, Divorced |
| HasMortgage | `has_mortgage` | 1 if the borrower has a mortgage |
| HasDependents | `has_dependents` | 1 if the borrower has dependents |
| LoanPurpose | `purpose_id` | Key into `loan_purposes` |
| HasCoSigner | `has_cosigner` | 1 if the loan has a co-signer |
| Default | `is_default` | 1 if the loan defaulted |
