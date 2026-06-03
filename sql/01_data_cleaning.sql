SELECT ", "user id", "test group", converted, "total ads", "most ads day", "most ads hour"
FROM public.marketing_ab limit 10;

select  count(*) as number_of_row from public.marketing_ab ;

--check duplicate rows
select "user id" , count(*)
from marketing_ab ma group by "user id" 
having count(*) > 1

--check for null values
select 
	count(*) filter (where "user id" is null ) as missing_users,
	count(*) filter (where "test group" is null) as missing_groups,
	count(*) filter (where "converted" is null) as missing_coversions,
	count(*) filter (where "total ads" is null) as missing_ads,
	count(*) filter (where "most ads day" is null) as missing_most_ads_day,
	count(*) filter (where "most ads hour" is null) as missing_most_ads_hour
from public.marketing_ab


--check for oulier or invalid entry
/*in total ads*/
SELECT 
    MIN("total ads") AS min_ads,
    MAX("total ads") AS max_ads,
    AVG("total ads") AS avg_ads
FROM public.marketing_ab;

/*check houre of day*/
select 
	min("most ads hour") as min_hour,
	max("most ads hour") as max_hour
from public.marketing_ab ma ;

-- see days 
select distinct "most ads day" as days 
from marketing_ab ma ;



	
