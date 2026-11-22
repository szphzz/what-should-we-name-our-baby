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
Choosing a baby name can be impacted by many things like cultural trends, popular media, and societal preferences.
Name popularity changes over time, and we want to see if these trends can be correlated to the names that appear in 
books and literature. Do names become more popular because they appear many times in books, or do books select the names
that are already popular in society?

Our project wants to investigate the relationship between baby popularity in the US and the commonness of the names in
books. By using the Social Security Administration (SSA) Baby Names dataset with the Google Books N-gram dataset, we
will evaluate how name frequencies change over time and find possible relationships between literature and real-world
naming trends.

Using the distributed computing techniques we learned in class, Spark will help process and join the datasets by name
and year to discover patterns. Our analysis will focus on the most popular baby names each year, examining how often
those names appear in books, and then determine whether changes in book name usage are connected to changes in baby name
popularity.


## Data Sources

### Sources
| # | Source & Link | What it contains | Schema | Access requirements |
| --- | --- | --- | --- | --- |
| 1 | [Google Books N-gram](https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sbigquery-public-data!2sgoogle_books_ngrams_2020!3seng_us_1) |  |  | Google Cloud Account |
| 2 | [Social Security Administration Baby Names](https://www.ssa.gov/oact/babynames/names.zip) |  |  | No requirements |

---
## Repository Structure
```
.
├── .env_template
├── requirements.txt
└── README.md
```