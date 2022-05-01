-- MAP join query to join two tables
select count(a.review_id) /*+ MAPJOIN(yelp_user_part) */ a.user_id from yelp_review_part a inner join yelp_user_part on a.user_id=b.user_id limit 5;

--to get total review for each year
select year,count(review_id) as review_count from yelp_review_part group by year;

--to get average review for each businee_id per year
select business_id,year,avg(stars) as avg_star from yelp_review_part group by business_id,year;

--to get userID who posed most funny reviews
select user_id,funny from yelp_user_part order by review_count desc;

--to get userId who posted mostuseful reviews
select user_id,useful from yelp_user_part order by review_count desc;

--to get userId who posted most reviews
select user_id,review_count from yelp_user_part order by review_count desc;


