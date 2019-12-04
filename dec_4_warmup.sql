CREATE DATABASE warmups

CREATE TABLE users
(id serial primary key
,name varchar(255)
,joined_at timestamp
,city_id int
,device int)

CREATE TABLE user_comments
(id serial primary key
,user_id int
,body text
,created_at timestamp
,foreign key (user_id) references users(id))

INSERT INTO users(name, joined_at, city_id, device)
VALUES ('John Doe', '2019-01-31 03:00:09', '3', '6'), ('Jane Smith', '2018-03-23 02:35:11', '2', '2'), ('Anne Jenkins', '2018-07-11 09:11:00', '4', '4'), ('Eric Branford', '2017-03-09 11:07:39', '1', '3')

INSERT INTO user_comments(user_id, body, created_at)
VALUES('1', 'this is great!', '2019-01-31 23:40:07'),('2', 'whoa, cool', '2018-01-30 05:32:11'), ('1', 'everyone should join this site', '2019-01-31 23:40:11'), ('3', 'john is a bot', '2019-02-01 05:40:32'), ('1', 'no, i am not a bot', '2019-02-01 05:41:52')


-- WITH january as (
-- 	SELECT 
-- 	extract(month from created_at) as month

-- 	from 
-- 	user_comments

-- 	where 
-- 	extract(month from created_at) = 1

-- 	group by
-- 	month)

-- ,current_year as (
-- 	SELECT 
-- 	extract(year from created_at) as year

-- 	from 
-- 	user_comments

-- 	where 
-- 	extract(year from created_at) = 2019

-- 	group by
-- 	year)


SELECT 
count(user_id)

from
user_comments

where
extract(month from created_at) = 1
AND
extract(year from created_at) = 2019

group by 
user_id

order by
user_id