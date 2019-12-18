
-- The first time we got this warmup, I wasn't able to really visualize without at database. And after creating the database, I wasn't able to figure out a query that grabbed the users with no comments. Today, I'll try thinking out the query without making a database, to start with.


-- Two tables, users and user_comments
-- Write a SQL query to create a histogram of number of comments per user in January 2019

-- Will need to join the users and user_comments tables to grab users and the amount of comments each user has made. Need a where clause for the month of January and the year 2019. It'd be something like:

SELECT 
