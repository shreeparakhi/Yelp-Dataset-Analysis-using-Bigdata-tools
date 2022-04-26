# Yelp-Dataset-Analysis-using-Bigdata-tools
The Yelp dataset was originally released in order for students to do research and analysis in to how food trends begin and how they impact locations. The dataset includes data about businesses, reviews, users, checkins, tips, and photos. Here in my project I used users,review and business dataset.

## Table of Contents
1. [Introduction](##introduction)
2. [Goal](##goal)
3. [Technology Stack](##technology-stack)
4. [Bucket Calculation](##bucket-calculation)
5. [Project Architecture](##project-architecture)
6. [ER Diagram](##er-diagram)
7. [Analysis](##analysis)

## Introduction
Most businesses seek to get reviews on their goods and services one way or another. It is a most basic way for the business to improve their efficiency and subsequently their bottom-line. Get the review is not only the issue, ability to extract and visualize analytics from review data is critical to business success.

In this Project, we will use the yelp review dataset to analyze businesses and reviews over a period of time. Perhaps we will spot potential gaps in service delivery or see how business thrive in different scenarios.

Beyond processing this data, we will ingest the final output of our data processing in PowerBI and use the visualization tool to visualize various kinds of ad-hoc reports from the data.

## Goal
Goal is to create data pipeline for yelp dataset to finally load in hive external tables so that analysis team can make use of this data. Along with this goal is to extract required data using some free-form queries for geeral business usecases.

## Technology Stack
- HDFS
- Hive
- PowerBI

## Bucket Calculation

Block Size in HDFS = 128 MB

Size of review dataset = 5120 MB

5120/128 = 40

2^x = 40 where x will be number of buckets

Hence we will take number of bucket = 6

Size of user dataset = 3205 MB

3205/128 = 25

2^x = 25  where x will be number of buckets

Hence we will take number of bucket = 5


## Project Architecture
<img width="960" alt="image" src="https://user-images.githubusercontent.com/100192175/160176730-17f0882b-c3e7-4e8a-a370-7407646b9e4d.png">

## ER Diagram
<img width="400" alt="image" src="https://user-images.githubusercontent.com/100192175/160176615-f8448a40-db73-4db2-85fd-a118b48cdb87.png">

## Analysis

#### Top Users who posted reviews (by count)
<img width="658" alt="User_Review_Count" src="https://user-images.githubusercontent.com/100192175/158600926-6bf5117d-630e-41e5-8c0c-ca3af93dbf78.png">

#### Average Rating of business per year
![Screenshot 2022-03-16 190622](https://user-images.githubusercontent.com/100192175/158607652-260bd0ec-e5eb-46dd-95d2-314f83cb7e36.png)

#### Top users who posted funny reviews
<img width="960" alt="FunnyPerUser" src="https://user-images.githubusercontent.com/100192175/158602856-18e69751-aa69-45fb-bf81-0c989a512c65.png">

#### Top users who posted useful reviews
<img width="853" alt="TopUsefulReviews" src="https://user-images.githubusercontent.com/100192175/158607389-8dcc0a5a-a037-495a-bd9c-cc5daa192982.png">

#### Top users who have most fans
<img width="613" alt="TopFans" src="https://user-images.githubusercontent.com/100192175/158607916-36578860-7d9f-4c6f-a77b-c3aa011668c9.png">

#### Business who has most reviews
![Screenshot 2022-03-16 191016](https://user-images.githubusercontent.com/100192175/158608140-31aad9a5-d570-4c19-bb58-7766b6c2a97e.png)

