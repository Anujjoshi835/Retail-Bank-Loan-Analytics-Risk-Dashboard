# ETL Workflow

```
loan_applications.csv  ->  stg_loan_applications  ->  quality checks  ->  lookups  ->  loan_applications  ->  vw_loan_report
        (04)                      (04)                    (05)              (06)            (06)                 (10)
```

1. **Extract.** `LOAD DATA LOCAL INFILE` reads the CSV into the staging table. The row count (255,347) is checked straight away.
2. **Check.** Script 05 looks for duplicate loan identifiers, missing values, impossible ranges and unexpected category spellings. This dataset passes every check, so the load needs no row removal.
3. **Prepare lookups.** Education and purpose are seeded with fixed keys. `INSERT IGNORE ... SELECT DISTINCT` then adds any category found in the data that is not seeded yet.
4. **Transform and load.** One `INSERT ... SELECT` joins staging to both lookups to swap the text for keys, and turns the Yes/No columns into 0/1 with a comparison (`has_mortgage = 'Yes'`).
5. **Reconcile.** Staged rows and loaded rows must be equal. They are, at 255,347.
6. **Serve.** The reporting view is created and indexes are added.

Because the final tables are only written in step 4, the whole pipeline can be rerun from script 01 at any time.
