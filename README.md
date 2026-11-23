# What should we name our baby?


## Team Members

| Name | GitHubID | Role / Focus |
| --- | --- | --- |
| Talha Tariq | mrozoen | Visualization & Joining |
| Rachel Zeng | rzeng866 | EDA & Analysis |
| Sophia Chung | szphzz | Joining & Filtering Data |
| Davey Grimes | Xerion1 | Joining & Filtering Data |
| Korbin White | korbinvwhite | Visualization & Joining |

---

## Problem Statement
Choosing a baby name might be impacted by many things like cultural trends, popular media, and societal preferences.
Name popularity changes over time, and we want to analyze if these trends might be correlated to the names that appear
in books. Do names become more popular after they appear in many books, or do books contain the names that are already
popular in society?

Our project wants to investigate the relationship between baby name popularity in the U.S. and the prevalence of the
names in books. By using the Social Security Administration (SSA) Baby Names dataset with the Google Books N-gram 
dataset, we will explore how name frequencies change over time and find possible relationships between literature and
real-world naming trends.

Using the distributed computing techniques we learned in class, Spark will help process and join the datasets by name
and year to discover patterns. Our analysis will focus on the most popular baby names each year, examining how often 
those names appear in books, and then determine whether changes in book name usage are connected to changes in baby
name popularity. Our analysis is limited to the years 1880 - 2019 since the SSA dataset starts from 1880 and the N-gram dataset contains data until 2019.

---

## Data Sources

### Sources
| # | Source & Link | What it contains | Schema | Access requirements |
| --- | --- | --- | --- | --- |
| 1 | [Google Books N-gram](https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sbigquery-public-data!2sgoogle_books_ngrams_2020!3seng_us_1) | This version of the dataset was generated in February 2020 and contains all of the words in the American English books Google has scanned. The dataset contains about 50 million records and is 68 GB. | <ul><li>term (string)</li><li>term_frequency (integer)</li><li>document_frequency (integer)</li><li>tokens (string)</li><li>has_tag (boolean)</li><li>years [year (integer), term_frequency (integer), document_frequency (integer)]</li></ul> | Google Cloud Account |
| 2 | [Social Security Administration Baby Names](https://www.ssa.gov/oact/babynames/names.zip) | For each year from 1880, there is a comma-delimited file called yobYYYY.txt. Names have at least 5 occurrences and come from U.S. births where the individual has a Social Security Number. The dataset contains about 2 million records and is 57 MB. | <ul><li>Name (string)</li><li>Sex (string)</li><li>Number (integer)</li></ul> | No requirements |

---

## Repository Structure
```
.
├── 01_create_name_ngram_rdd.ipynb
├── requirements.txt
└── README.md
```