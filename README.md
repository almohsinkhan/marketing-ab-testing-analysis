# Marketing A/B Testing Analysis Using SQL and Python

## Project Overview

This project analyzes the effectiveness of a digital advertising campaign using A/B testing techniques. The objective is to determine whether displaying advertisements leads to a higher conversion rate compared to a Public Service Announcement (PSA) control group.

The analysis combines:

* PostgreSQL for data storage and querying
* SQL for exploratory analysis
* Python for statistical testing
* Pandas and Matplotlib/Seaborn for visualization

---

## Business Problem

A company conducted an A/B test with two groups:

* **Ad Group**: Users were shown advertisements.
* **PSA Group**: Users were shown public service announcements (control group).

The goal was to answer:

> Does showing advertisements significantly increase user conversions?

---

## Dataset

The dataset contains approximately **588,000 users** and includes the following fields:

| Column        | Description                   |
| ------------- | ----------------------------- |
| user id       | Unique user identifier        |
| test group    | Ad or PSA group               |
| converted     | Whether the user converted    |
| total ads     | Total number of ads viewed    |
| most ads day  | Day with highest ad exposure  |
| most ads hour | Hour with highest ad exposure |

---

## Tools and Technologies

* PostgreSQL
* DBeaver
* SQL
* Python
* Pandas
* Seaborn
* Matplotlib
* SciPy

---

## Project Workflow

### 1. Data Import

* Installed PostgreSQL
* Created a database
* Imported the CSV dataset using DBeaver

### 2. Exploratory Data Analysis

Performed SQL queries to:

* Count total records
* Compare user distribution across groups
* Calculate conversion rates
* Analyze conversion trends by day and hour
* Study the relationship between ad exposure and conversion

### Example SQL Query

```sql
SELECT
    "test group",
    COUNT(*) AS total_users,
    SUM(CASE WHEN converted = TRUE THEN 1 ELSE 0 END) AS converted_users,
    ROUND(
        100.0 * SUM(CASE WHEN converted = TRUE THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS conversion_rate_pct
FROM marketing_ab
GROUP BY "test group";
```

---

## Key Findings

### 1. Ad Campaign Performance

| Group | Conversion Rate |
| ----- | --------------- |
| Ad    | 2.55%           |
| PSA   | 1.79%           |

The ad campaign achieved a significantly higher conversion rate than the control group.

---

### 2. Relative Lift

The relative lift was calculated as:

Lift = ((Ad Conversion Rate - PSA Conversion Rate) / PSA Conversion Rate) × 100

Result:

**43% Relative Lift**

This means users exposed to advertisements converted 43% more often than users in the control group.

---

### 3. Statistical Significance

A Chi-Square Test of Independence was performed to verify that the observed difference was not due to random chance.

#### Hypotheses

**Null Hypothesis (H₀)**

Conversion is independent of the test group.

**Alternative Hypothesis (H₁)**

Conversion depends on the test group.

#### Results

| Metric               | Value   |
| -------------------- | ------- |
| Chi-Square Statistic | 54.01   |
| p-value              | 2.0e-13 |

Since the p-value is far below 0.05, the null hypothesis is rejected.

### Conclusion

The improvement in conversion rate is statistically significant and highly unlikely to be caused by random variation.

---

## Additional Insights

### Conversion Rate vs Ad Frequency

Users who saw more advertisements generally converted at higher rates.

The conversion rate increased steadily and reached approximately **17% for users exposed to 100 or more ads**.

### Best Converting Day

Monday showed the highest conversion performance.

### Best Converting Hours

The highest conversion rates were observed during:

* 14:00–16:00
* 20:00–21:00

These time windows may represent optimal advertising opportunities.

---

## Visualizations

The project includes:

* Conversion Rate by Test Group
* Conversion Rate by Ad Exposure
* Conversion Rate by Day
* Conversion Rate by Hour

---

## Business Recommendations

1. Continue running the advertisement campaign since it produces a statistically significant increase in conversions.
2. Prioritize advertising during high-converting hours (14:00–16:00 and 20:00–21:00).
3. Investigate optimal ad frequency to balance conversion gains and advertising costs.
4. Use A/B testing as a standard framework for evaluating future marketing initiatives.

---

## Conclusion

This analysis demonstrates how SQL, statistics, and data visualization can be combined to evaluate marketing effectiveness. The results show that the advertising campaign significantly improves conversion performance and provides actionable insights for future campaign optimization.
# marketing-ab-testing-analysis
