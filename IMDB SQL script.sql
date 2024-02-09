select* from directors;
select* from movies;

# Can you get all data about movies?
select* from movies;

# How do you get all data about directors?
select* from directors;

# Check how many movies are present in IMDB.
select count(distinct(title)) as IMDB_Movies from movies;

# Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select name from directors where name in ('James Cameron','Luc Besson', 'John Woo') ;

# Find all directors with name starting with Steven.
select * from directors where name like 'steven%';

# Count female directors.
 select gender,count(gender) as count, case when gender = 0 then 'NON_Binary' when gender = 1 then 'Female' else 'Male' end as M_F from directors group by gender;
 
# Find the name of the 10th first women directors?
select * from directors where gender = 1 limit 10;

# What are the 3 most popular movies?
select title,popularity from movies order by  popularity desc limit 3 ;

# What are the 3 most bankable movies?
select title, revenue from movies order by revenue desc limit 3;

#  What is the most awarded average vote since the January 1st, 2000?
select vote_average,count(*) from movies where release_date >='1-1-2000' group by vote_average order by count(*) desc limit 5;

#  Which movie(s) were directed by Brenda Chapman?
select name,title from movies join directors on  directors.id=movies.director_id where name in ('Brenda Chapman') ;

# Whose director made the most movies?
select name,count(title)as Movies from movies join directors on  directors.id=movies.director_id group by name order by count(title) desc limit 5;

# Whose director is the most bankable?
select name,sum(revenue)as Banked from movies join directors on  directors.id=movies.director_id group by name order by sum(revenue) desc limit 5;