
--Answer for Question 1: 

SELECT id FROM fact_order 
WHERE charge_amount > 500
ORDER BY updated_at DESC
LIMIT 1;



--Answer for Question 2: 
Select date_trunc('week',completed_at) as completion_week, sum(f.charge_amount) as total_GMV, count(f.id) as order_count 
from fact_order f
    join zones z on f.zone_id = z.id 
    join regions r on z.region_id = r.id
where r.country_id = 124
and completion_week between '2019-09-23' and '2019-11-11'
group by 1
order by 1 


--Answer for Question 3: 
SELECT CASE 
    WHEN datediff('month', hired_at, current_date)  <= 6
    THEN '0-6 Mo'
    WHEN datediff('month', hired_at, current_date)  BETWEEN 7 AND 12
    THEN '6-12 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 13 AND 18
    THEN '12-18 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 19 AND 24
    THEN '19-24 Months'
    WHEN datediff('month', hired_at, current_date) > 24
    THEN '24+ Mo'
    END AS tenure, (count(id) / (SELECT count(id) FROM drivers WHERE hired_at IS NOT NULL )) * 100 AS percentage_active
FROM drivers
    
WHERE hired_at IS NOT NULL

GROUP BY 1

--Answer for Question 4: 

