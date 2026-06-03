-- total number of row 
select  count(*) as number_of_row from public.marketing_ab ;

--split between two group  
select 
	"test group",
	count(*) as users,
	round(count(*) * 100.0/ sum(count(*)) over(), 2) as pct_of_total
from marketing_ab ma 
group by "test group";

-- conversion rate 
/* how many of pas bought product*/
select 
	"test group",
	count(*) as total_users,
	sum(case when converted = true then 1 else 0 end) as converted_user,
	round(sum(case when converted = true then 1 else 0 end ) * 100.0/ count(*),2) as coversion_rate_pct
from public.marketing_ab
group by "test group" ;



--Does seeing more ads make you more likely to convert?
SELECT 
    "test group",
    ROUND(AVG("total ads"), 1) AS avg_ads_seen,
    MIN("total ads") AS min_ads,
    MAX("total ads") AS max_ads,
    PERCENTILE_CONT(0.5) 
        WITHIN GROUP (ORDER BY "total ads") AS median_ads
FROM public.marketing_ab
GROUP BY "test group";


SELECT 
    CASE 
        WHEN "total ads" BETWEEN 1 AND 10 THEN '1-10 ads'
        WHEN "total ads" BETWEEN 11 AND 50 THEN '11-50 ads'
        WHEN "total ads" BETWEEN 51 AND 100 THEN '51-100 ads'
        ELSE '100+ ads'
    END AS ads_bucket,
    COUNT(*) AS users,
    ROUND(
        AVG(CASE WHEN converted THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS conversion_rate_pct
FROM public.marketing_ab
WHERE  "test group" = 'ad'
GROUP BY ads_bucket
ORDER by ads_bucket


-- Which day of the week drives the most conversions?
SELECT 
    "most ads day",
    COUNT(*) AS users,
    SUM(CASE WHEN converted = TRUE THEN 1 ELSE 0 END) AS conversions,
    ROUND(
        SUM(CASE WHEN converted = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS conversion_rate_pct
FROM public.marketing_ab
WHERE "test group" = 'ad'
GROUP BY "most ads day"
ORDER BY conversion_rate_pct DESC;

-- Which hour of the day drives the most conversions?
SELECT 
    "most ads hour",
    COUNT(*) AS users,
    ROUND(
        SUM(CASE WHEN converted = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS conversion_rate_pct
FROM public.marketing_ab
WHERE "test group" = 'ad'
GROUP BY "most ads hour"
ORDER BY conversion_rate_pct DESC;
     