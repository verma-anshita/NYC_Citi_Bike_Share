-- Trend over Time by calendar year
SELECT 
month (starttime) AS month ,COUNT(*) as Trip_count 
FROM final_project.citibike_trips
WHERE year(starttime) = 2019 
GROUP BY month 
HAVING month is NOT NULL 
ORDER BY month; 

-- Trend over Time by calendar month and year

SELECT 
day (starttime) AS day ,COUNT(*) as Trip_count 
FROM final_project.citibike_trips
WHERE month(starttime) = 09 and year(starttime) = 2019 
GROUP BY day 
HAVING day is NOT NULL 
ORDER BY day; 

-- Trend over Time by day of week

SELECT 
dayofweek (starttime) AS dayofweek ,COUNT(*) as Trip_count 
FROM final_project.citibike_trips
WHERE week(starttime) = 36 and year(starttime) = 2019 
GROUP BY dayofweek 
HAVING dayofweek is NOT NULL 
ORDER BY dayofweek;

-- Seasonality

select case when month(starttime) in (06,07,08) then 'Summer'
when month(starttime) in (09,10,11) then 'Autumn'
when month(starttime) in (12,01,02) then 'Winter'
else 'Spring' end as Season , count(*) as total_rides_in_season from final_project.citibike_trips
group by Season;

-- Month-wise trend

SELECT 
month (starttime) AS month ,COUNT(*) as Trip_count 
FROM final_project.citibike_trips
group by month;

-- Breakdown of subscriber (or member) vs customer (non-subscriber) rides

SELECT COUNT(bikeid) as num_of_round_trips,usertype
FROM final_project.citibike_trips
WHERE start_station_name = end_station_name
group by usertype;

--

SELECT COUNT(bikeid) as num_of_non_round_trips,usertype
FROM final_project.citibike_trips
WHERE start_station_name != end_station_name
group by usertype;

SELECT avg(tripduration) as average_round
FROM final_project.citibike_trips
WHERE start_station_name = end_station_name;

select avg(tripduration) as avgtrip from final_project.citibike_trips;

select avg(tripduration) as avgtrip, usertype from final_project.citibike_trips
group by 2;

-- Trips less than 15 minutes

select Count(tripduration) as tripslessthan15 from final_project.citibike_trips
where tripduration <900;

-- Trip duration greater than 15 minutes and less than an hour

select Count(tripduration) as tripduration from final_project.citibike_trips
where tripduration >900 and tripduration <3600;

-- Trip duration more than 1 hour

select Count(tripduration) as tripdurationmorethan1 from final_project.citibike_trips
where tripduration >3600;

select gender, avg(tripduration) as avgduration from final_project.citibike_trips
group by gender;

select gender, avg(tripduration) as avgduration from final_project.citibike_trips
where gender in ('male','female')
group by 1;

select gender,usertype, avg(tripduration) as avgduration from final_project.citibike_trips
where gender in ('male','female')
group by 1,2;

-- Analysis of Gender Year over Year Trend
select year(starttime) as year, gender
from final_project.citibike_trips
where gender in ('male','female');

select count( Distinct start_station_name) 
from final_project.citibike_trips
order by  start_station_name desc;
