  -- count total number of rows
  -- 5667717 rows found
SELECT
  COUNT(*) AS Total_Rows
FROM
  `2022.tripdata_2022`;

  -- check data type of all columns
SELECT
  column_name,
  data_type
FROM
  `2022.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'tripdata_2022';

  -- Identify duplicates
  -- no duplicates found
SELECT
  COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM
  `2022.tripdata_2022`;

  -- Identify missing values
  -- null values only found in start_station_name, start_station_id, end_station_name, end_station_id, end_lat, end_lng
SELECT
  COUNT(*) - COUNT(ride_id) AS null_ride_id,
  COUNT(*) - COUNT(rideable_type) AS null_rideable_type,
  COUNT(*) - COUNT(started_at) AS null_started_at,
  COUNT(*) - COUNT(ended_at) AS null_ended_at,
  COUNT(*) - COUNT(start_station_name) AS null_start_station_name,
  COUNT(*) - COUNT(start_station_id) AS null_start_station_id,
  COUNT(*) - COUNT(end_station_name) AS null_end_station_name,
  COUNT(*) - COUNT(end_station_id) AS null_end_station_id,
  COUNT(*) - COUNT(start_lat) AS null_start_lat,
  COUNT(*) - COUNT(start_lng) AS null_start_lng,
  COUNT(*) - COUNT(end_lat) AS null_end_lat,
  COUNT(*) - COUNT(end_lng) AS null_end_lng,
  COUNT(*) - COUNT(member_casual) AS null_member_casual
FROM
  `2022.tripdata_2022`;

  -- handling missing values
DELETE
FROM
  `2022.tripdata_2022`
WHERE
  start_station_name IS NULL
  OR start_station_id IS NULL
  OR end_station_name IS NULL
  OR end_station_id IS NULL
  OR end_lat IS NULL
  OR end_lng IS NULL;

  -- check if there exist data where ended_is is earlier than started_at
SELECT
  *
FROM
  `2022.tripdata_2022`
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 0;

  -- handling inaccurate data
DELETE
FROM
  `2022.tripdata_2022`
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 0;

  -- check if any data is neither member nor casual
  -- no data is neither member nor casual
SELECT
  member_casual
FROM
  `2022.tripdata_2022`
WHERE
  member_casual <> 'member'
  AND member_casual <> 'casual';

  -- view first 10 rows of data
SELECT
  *
FROM
  `2022.tripdata_2022`
LIMIT
  10;

  -- add day of week column for start date
ALTER TABLE
  `2022.tripdata_2022` ADD COLUMN
IF NOT EXISTS day_of_week STRING;
UPDATE
  `2022.tripdata_2022`
SET
  day_of_week =
  CASE EXTRACT(DAYOFWEEK
  FROM
    started_at)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
END
WHERE
  EXTRACT(DAYOFWEEK
  FROM
    started_at) IN (1,
    2,
    3,
    4,
    5,
    6,
    7);

  -- add month column for start date
ALTER TABLE
  `2022.tripdata_2022` ADD COLUMN
IF NOT EXISTS month STRING;
UPDATE
  `2022.tripdata_2022`
SET
  month =
  CASE EXTRACT(MONTH
  FROM
    started_at)
    WHEN 1 THEN 'Jan'
    WHEN 2 THEN 'Feb'
    WHEN 3 THEN 'Mar'
    WHEN 4 THEN 'Apr'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'Jun'
    WHEN 7 THEN 'Jul'
    WHEN 8 THEN 'Aug'
    WHEN 9 THEN 'Sep'
    WHEN 10 THEN 'Oct'
    WHEN 11 THEN 'Nov'
    WHEN 12 THEN 'Dec'
END
WHERE
  EXTRACT(MONTH
  FROM
    started_at) IN (1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12);

  -- add ride length
  -- note: ride_length is in seconds
ALTER TABLE
  `2022.tripdata_2022` ADD COLUMN
IF NOT EXISTS ride_length INT;
UPDATE
  `2022.tripdata_2022`
SET
  ride_length = CAST(TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS INT)
WHERE
  ended_at IS NOT NULL
  AND started_at IS NOT NULL;

  -- exclude if ride length more than a day or is 0
DELETE
FROM
  `2022.tripdata_2022`
WHERE
  ride_length = 0
  OR ride_length > 86400;
  
  -- check if columns are updated
SELECT
  *
FROM
  `2022.tripdata_2022`
LIMIT
  10;
