-- 1. External table over all yearly SSA files in the bucket.

CREATE OR REPLACE EXTERNAL TABLE `dsai694.baby_names.ssa_raw` (
  name STRING, sex STRING, count INT64
)
OPTIONS (format = 'CSV', uris = ['gs://what-should-we-name-our-baby/yob*.txt']);

-- 2. View that rebuilds `year` from the filename and lowercases `name`.
CREATE OR REPLACE VIEW `dsai694.baby_names.ssa` AS
SELECT
  LOWER(name) AS name,
  sex,
  count,
  CAST(REGEXP_EXTRACT(_FILE_NAME, r'yob(\d{4})\.txt') AS INT64) AS year
FROM `dsai694.baby_names.ssa_raw`;

-- 3. Preview: confirm columns align and year is populated.
SELECT
  name, sex, count,
  CAST(REGEXP_EXTRACT(_FILE_NAME, r'yob(\d{4})\.txt') AS INT64) AS year
FROM `dsai694.baby_names.ssa_raw`
LIMIT 20;

-- 4. Verify ALL years uploaded.  RESULT: 146 years, 1880–2025.
SELECT
  COUNT(DISTINCT year) AS num_years,
  MIN(year) AS first_year,
  MAX(year) AS last_year
FROM `dsai694.baby_names.ssa`;

-- 5. Baseline n-gram size after flatten, before filtering.
SELECT COUNT(*) AS unfiltered_rows
FROM `bigquery-public-data.google_books_ngrams_2020.eng_us_1`, UNNEST(years)
WHERE has_tag = FALSE;

-- 6. N-gram size after filtering to SSA names + year >= 1880.
WITH names AS (
SELECT DISTINCT name FROM `dsai694.baby_names.ssa`
)
SELECT COUNT(*) AS matched_rows
FROM `bigquery-public-data.google_books_ngrams_2020.eng_us_1` AS n, UNNEST(n.years) AS y
WHERE n.has_tag = FALSE
AND y.year >= 1880
AND LOWER(n.term) IN (SELECT name FROM names);


-- 7. Export the filtered n-grams to GCS as CSV for Spark (sc.textFile).
EXPORT DATA OPTIONS(
  uri = 'gs://what-should-we-name-our-baby/ngrams_names/*.csv',
  format = 'CSV',
  overwrite = true
) AS
WITH names AS (
SELECT DISTINCT name FROM `dsai694.baby_names.ssa`
)
SELECT
  LOWER(n.term) AS term,
  y.year AS year,
  y.term_frequency AS term_frequency,
  y.document_frequency AS document_frequency
FROM `bigquery-public-data.google_books_ngrams_2020.eng_us_1` AS n, UNNEST(n.years) AS y
WHERE n.has_tag = FALSE
AND y.year >= 1880
AND LOWER(n.term) IN (SELECT name FROM names);