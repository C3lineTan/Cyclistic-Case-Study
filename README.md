# Google Data Analytics Capstone: Cyclistic-Case-Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone/)

Following the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Table of Contents
1. [Ask](#ask)
2. [Prepare](#prepare)
3. [Process](#process)
4. [Analyze](#analyze)
5. [Share](#share)
6. [Act](#act)

## Quick Links
SQL Queries: [Data Preparation](./Data-Preparation), [Data Cleaning](./Data-Cleaning), [Data Analysis](./Data-Analysis)

Tableau: [Data Visualization](https://public.tableau.com/views/Cyclisticcasestudy_17033263316310/WeekendWeekday?:language=en-GB&:display_count=n&:origin=viz_share_link)

<a name="ask"></a>
## Ask
In this case study, I will take on the role of a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships, as Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Therefore, the insights gained from understanding how casual riders and annual members differs, will aid in designing a new marketing strategy to convert casual riders into annual members.

> Objective: To clean, analyze and visualize the data to understand how casual riders and annual members use Cyclistic bikes differently.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

<a name="prepare"></a>
## Prepare
- Data Source: [Divvy tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://divvybikes.com/data-license-agreement)
- Data Range: Jan 20222 to Dec 2022 (12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month)
- Columns in each file: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual
- [Data Preparation](./Data-Preparation): 12 csv files obtained from Divvy tripdata are uploaded as tables in the '2022' dataset and combined into 1 table, 'tripdata_2022', in the '2022' dataset, and cleaned using BigQuery due to BigQuery's ability to handle large amounts of data

<a name="process"></a>
## Process
SQL Query: [Data Cleaning](./Data-Cleaning)

- 5,667,717 rows found
- Check data type of all columns
- No duplicates found
- Null values found in start_station_name, start_station_id, end_station_name, end_station_id, end_lat, end_lng
- 1,298,357 rows with null values were removed
- 69 rows with ended_at earlier than started_at were removed
- Added day_of_week, month and ride_length columns
- 395 rows with ride_length equals to 0 or more than a day were removed

<a name="analyze"></a>
## Analyze
SQL Query: [Data Analysis](./Data-Analysis) 

<a name="share"></a>
## Share
Tableau: [Data Visualization](https://public.tableau.com/views/Cyclisticcasestudy_17033263316310/WeekendWeekday?:language=en-GB&:display_count=n&:origin=viz_share_link)

### Number of riders by month
![Num of riders by month](https://github.com/C3lineTan/Cyclistic-Case-Study/assets/110513678/62f9f19a-4759-483f-8770-609a184683f5)
Number of riders peaked during June to August and is at its lowest during December to February.

### Types of bikes
![Type of bikes](https://github.com/C3lineTan/Cyclistic-Case-Study/assets/110513678/26e796bd-c636-4ba4-a89d-abf3177d94d9)
Classic bike is the most popular bike among both casual and member riders.

### Number of rides and Average ride length
![Num and Avg ride length](https://github.com/C3lineTan/Cyclistic-Case-Study/assets/110513678/e3059650-1851-4c75-b9d6-25832431eb67)
Casual riders ride less frequently for longer durations while member riders ride more frequently for shorter durations.

### Member and casual riders during each day of week
![Weekend_Weekday](https://github.com/C3lineTan/Cyclistic-Case-Study/assets/110513678/cac3337a-3121-431f-bfa1-140a67be8b27)
Member riders ride mostly on weekdays while casual riders ride mostly on weekends. It may be because member riders ride for commuting purposes while casual riders ride for leisure purposes.

<a name="act"></a>
## Act
After cleaning, analyzing and visualizing the data to better understand how casual riders and annual members use Cyclistic bikes differently, marketing strategies can be proposed to encourage casual riders to become members.

Recommendations:
- Special discounts or incentives during winter months (Dec-Feb) and weekdays for casual riders to encourage them to use the service for commuting during those periods.
- Increase marketing campaigns during winter months
- Create a loyalty program rewarding riders for longer rides with points, discounts, or exclusive benefits upon transitioning from occasional to annual membership, incentivizing a longer-term commitment.
- Form collaborations with recreational businesses popular among casual riders to enhance the value of applying for member. This collaboration may involve offering discounts on related services, joint promotional events, or exclusive partnerships, enhancing the overall appeal of a membership.

