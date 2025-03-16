1341. Movie Rating 

Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the users review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.




SOLUTION: 


WITH FIRST_CTE AS (
    SELECT U.user_id as id, U.name as user_name, count(M.rating) as highest_rating_number
    FROM Users U
    JOIN MovieRating M
    ON U.user_id = M.user_id 
    GROUP BY 1,2
    ORDER BY highest_rating_number DESC,U.name ASC
    LIMIT 1
), 

SECOND_CTE AS (
    SELECT M.movie_id as movie_id, M.title as title, AVG(N.rating) as average_rating 
    FROM Movies M
    JOIN MovieRating N
    ON M.movie_id = N.movie_id 
    WHERE N.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY 1, 2
    ORDER BY average_rating DESC, M.title ASC
    LIMIT 1
)


SELECT user_name as results FROM FIRST_CTE
UNION ALL
SELECT title FROM SECOND_CTE ; 



