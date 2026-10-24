USE loan_risk_db;

CREATE TABLE education_levels (
    education_id   INT          NOT NULL AUTO_INCREMENT,
    education_name VARCHAR(50)  NOT NULL,
    PRIMARY KEY (education_id),
    UNIQUE KEY uq_education_name (education_name)
);

CREATE TABLE loan_purposes (
    purpose_id   INT          NOT NULL AUTO_INCREMENT,
    purpose_name VARCHAR(50)  NOT NULL,
    PRIMARY KEY (purpose_id),
    UNIQUE KEY uq_purpose_name (purpose_name)
);

INSERT INTO education_levels (education_id, education_name) VALUES
    (1, 'High School'),
    (2, 'Bachelor''s'),
    (3, 'Master''s'),
    (4, 'PhD');

INSERT INTO loan_purposes (purpose_id, purpose_name) VALUES
    (1, 'Home'),
    (2, 'Auto'),
    (3, 'Business'),
    (4, 'Education'),
    (5, 'Other');

SELECT * FROM education_levels;
SELECT * FROM loan_purposes;
