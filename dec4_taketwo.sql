-- Two tables, users and user_comments
-- Write a SQL query to create a histogram of number of comments per user in January 2019


-- The first time we got this warmup, I wasn't able to really visualize without at database. And after creating the database, I wasn't able to figure out a query that grabbed the users with no comments. Today, I'll try thinking out the query without making a database, to start with.


-- Will need to join the users and user_comments tables to grab users and the amount of comments each user has made. Need a where clause for the month of January and the year 2019. It'd be something like:

SELECT 
 u.name
 ,count(uc.user_id) as comment_count

FROM 
 users as u 
JOIN user_comments as uc 
 on u.id = uc.user_id

WHERE 
 EXTRACT(month from created_at) = 1
AND 
 EXTRACT(year from created_at) = 2019

GROUP BY 
 u.name

-- This won't grab the users who didn't make any comments in January 2019. Using coalesce might help turn the nulls into 0s, hopefully so the count will show those users that made no comments.

SELECT 
 u.name
 ,coalesce(count(uc.user_id), 0) as comment_count

FROM 
 users as u 
JOIN user_comments as uc 
 on u.id = uc.user_id

WHERE 
 EXTRACT(month from created_at) = 1
AND 
 EXTRACT(year from created_at) = 2019

GROUP BY 
 u.name


-- If coalesce works, we should have a list of users with the amount of comments that they made in January 2019. Now to make a histogram. 

WITH jan_19 as (
SELECT 
 u.name
 ,coalesce(count(uc.user_id), 0) as comment_count

FROM 
 users as u 
JOIN user_comments as uc 
 on u.id = uc.user_id

WHERE 
 EXTRACT(month from created_at) = 1
AND 
 EXTRACT(year from created_at) = 2019

GROUP BY 
 u.name)

SELECT 
 comment_count
 ,coalesce(count(u.name) as user_count, 0)

FROM 
 jan_19

GROUP BY 
 comment_count

ORDER BY 
 user_count 

-- Ideally, this query will group together the amount of users that made 0 comments, 1 comment, 2 comments, etc in January 2019. 