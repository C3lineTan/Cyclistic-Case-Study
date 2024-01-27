  -- Number of rides, Max, Min, Avg and Total Ride Lengths: Member vs Casual
  -- casual riders enjoys less but longer rides
  -- member riders enjoys more but shorter rides
SELECT
  member_casual,
  MAX(ride_length) AS max_ride_length,
  MIN(ride_length) AS min_ride_length,
  AVG(ride_length) AS avg_ride_length,
  SUM(ride_length) AS total_ride_length,
  COUNT(ride_id) AS number_of_rides
FROM
  `2022.tripdata_2022`
GROUP BY
  member_casual;

  -- number of trips for each day_of_week: Member vs Casual
  -- member riders mostly ride on weekdays
  -- casual riders mostly ride on weekends
WITH
  mode_day AS (
  SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS day_count,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rn
  FROM
    `2022.tripdata_2022`
  GROUP BY
    member_casual,
    day_of_week )
SELECT
  member_casual,
  day_of_week,
  day_count
FROM
  mode_day
ORDER BY
  member_casual;

  -- number of trips per month
SELECT
  month,
  member_casual,
  COUNT(ride_id) AS num_trips
FROM
  `2022.tripdata_2022`
GROUP BY
  month,
  member_casual
ORDER BY
  member_casual;

  -- number of trips per month
  -- most rides during during Q3 (Jul followed by Jun then Aug then Sep)
SELECT
  month,
  COUNT(ride_id) AS total_trips
FROM
  `2022.tripdata_2022`
GROUP BY
  month
ORDER BY
  total_trips DESC;

  -- number of each type of bike used: Member vs Casual
  -- classic_bike most popular for both member and casual riders
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_trips
FROM
  `2022.tripdata_2022`
GROUP BY
  member_casual,
  rideable_type
ORDER BY
  member_casual,
  total_trips DESC;

  -- rank starting station locations by count
SELECT
  start_station_name,
  AVG(start_lat) AS start_lat,
  AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM
  `2022.tripdata_2022`
GROUP BY
  start_station_name
ORDER BY
  total_trips DESC;
  
  -- rank ending station locations by count
SELECT
  end_station_name,
  AVG(end_lat) AS end_lat,
  AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM
  `2022.tripdata_2022`
GROUP BY
  end_station_name
ORDER BY
  total_trips;
