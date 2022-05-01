--JAR used in hive
ADD JAR /home/saif/LFS/cohort_c9/jars/hive-hcatalog-core-3.1.0.jar

--DDL
--user_staging_table
create table if not exists yelp_user_staging(
user_id string,
name string,
review_count int,
yelping_since string,
useful int,
funny int,
cool int,
elite string,
friends string,
fans int ,
average_stars int,
compliment_hot int,
compliment_more int,
compliment_profile int,
compliment_cute int,
compliment_list int,
compliment_note int,
compliment_plain int,
compliment_cool int,
compliment_funny int,
compliment_writer int,
compliment_photos int
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '/user/saif/HFS/Input/Yelp/yelp_user_staging/';

--hive property for dynamic partitioning
set hive.exec.dynamic.partition.mode=nonstrict;

--user_external_table
create external table if not exists yelp_user_part(
user_id string,
name string,
review_count int,
yelping_since string,
useful int,
funny int,
cool int,
elite string,
friends string,
fans int ,
average_stars int,
compliment_hot int,
compliment_more int,
compliment_profile int,
compliment_cute int,
compliment_list int,
compliment_note int,
compliment_plain int,
compliment_cool int,
compliment_funny int,
compliment_writer int,
compliment_photos int
)
partitioned by (year string,month string)
clustered by (user_id) into 5 buckets
STORED AS ORC;

--review_staging_table
create table if not exists yelp_review_staging(
review_id string,
user_id string,
business_id string,
stars int,
`date` string,
text string,
useful int,
funny int,
cool int
)
row format serde 'org.apache.hive.hcatalog.data.JsonSerDe'
location '/user/saif/HFS/Input/Yelp/yelp_review_staging/';

--review_external_table
create external table yelp_review_part(
review_id string,
user_id string,
business_id string,
stars int,
`date` string,
text string,
useful int,
funny int,
cool int
)
partitioned by(year string,month string)
clustered by (user_id) into 6 buckets
STORED AS ORC;

--DML:
--hive property set to overcome errors
set hive.exec.max.dynamic.partitions=1000;
set hive.exec.max.dynamic.partitions.pernode=1000;

insert overwrite table yelp_user_part partition(year,month) select user_id, name, review_count, yelping_since, useful, funny,cool, elite, friends, fans, average_stars, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos, substr(yelping_since,1,4) as year, substr(yelping_since,6,2) as month from yelp_user_staging limit 5000;
insert overwrite table yelp_review_part partition(year,month) select review_id,user_id,business_id,stars,`date`,text,useful,funny,cool,substr(`date`,1,4) as year,substr(`date`,6,2) as month from yelp_review_staging where user_id in (select user_id from yelp_user_part);
