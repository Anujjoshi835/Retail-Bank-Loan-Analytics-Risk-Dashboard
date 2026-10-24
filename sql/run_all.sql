-- Run the whole pipeline from the project root folder:
--     mysql --local-infile=1 -u <user> -p < sql/run_all.sql
SOURCE sql/01_create_database.sql;
SOURCE sql/02_create_lookup_tables.sql;
SOURCE sql/03_create_loan_table.sql;
SOURCE sql/04_create_staging_table.sql;
SOURCE sql/05_data_quality_checks.sql;
SOURCE sql/06_load_normalized_data.sql;
SOURCE sql/07_portfolio_profile.sql;
SOURCE sql/08_default_risk_analysis.sql;
SOURCE sql/09_dashboard_kpis.sql;
SOURCE sql/10_reporting_view.sql;
SOURCE sql/11_performance_indexes.sql;
