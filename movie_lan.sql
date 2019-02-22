-- Drops the favorite_db if it exists currently --
DROP DATABASE IF EXISTS movies_database;
-- Creates the "favorite_db" database --
CREATE DATABASE movies_database;

-- Make it so all of the following code will affect favorite_db --
USE movies_database;
-- Creates the table "favorite_foods" within favorite_db --
DROP TABLE IF EXISTS movies_metadata;

CREATE TABLE movies_metadata (
	id integer auto_increment primary key,
    movie_id integer not null,
    homepage nvarchar(255),
    imdb_id varchar(50),
    original_title nvarchar(1000) not null,
    overview nvarchar(1000),
    popularity decimal(5,2),
    poster_path nvarchar(100),
    release_date varchar(20) not null,
    runtime integer,
    tagline nvarchar(1000),
    title nvarchar(500));
  
    
CREATE TABLE movies_finance (
	movie_id integer not null primary key,
    imdb_id nvarchar (50),
    Revenue long);
    
CREATE TABLE movies_genres (
	id integer auto_increment primary key,
    movie_id integer,
    genres_id integer
    );
    
CREATE TABLE genres_master (
	genres_id integer primary key,
    description varchar (1000) not null
    );
    
CREATE TABLE movies_language (
	id integer auto_increment primary key,
    movie_id integer,
    movie_language varchar (100) not null,
    movie_language_Type varchar (100) not null
    );
    
CREATE TABLE production_companies (
	prod_company_id integer primary key,
    prod_company_name varchar (100)
    );
    
CREATE TABLE production_countries (
	id integer auto_increment primary key,
    movie_id integer not null,
    country_name varchar (100),
    country_abbr varchar (50)
    );
    
CREATE TABLE movie_cast (
	id integer auto_increment primary key,
    movie_id integer not null,
    cast_id integer not null,
    movie_character varchar (100) not null,
    actor_id integer,
    actor_name varchar (50),
    gender varchar (50)
    );
    
CREATE TABLE movie_crew (
	id integer auto_increment primary key,
    movie_id integer not null,
    department varchar (100) not null,
    job_title varchar (100) not null,
    crew_name nvarchar (50),
    gender varchar (50)
    );
    
    
CREATE TABLE movie_keywords (
	id integer auto_increment primary key,
    movie_id integer not null,
    keyword_id integer not null
    );
    
CREATE TABLE keywords_master (
	keyword_id integer primary key,
    keyword_name nvarchar (100)
    );    
    
CREATE TABLE movie_links (
	movie_id integer not null,
    imdb_id varchar (50),
    tmdb_id integer not null
    );
 select *from movies_language;  
 select count(*) from movies_language;
 
 select *from movie_keywords;  
 select count(*) from movie_keywords;

 
 select *from movies_finance;  
 select count(*) from movies_finance;

 
 select *from keywords_master;  
 select count(*) from keywords_master;
 
 select *from movie_crew;  
 select count(*) from movie_crew;   
 
 select *from movies_metadata;  
 select count(*) from movies_metadata; 
 
 select a.movie_id, b.movie_id from movie_langiage a
 inner join movies_metadata b
 on a.movie_id=b.movie_id;
 
 # top revenue by movie language
 select a.movie_id,b.movie_language,sum(Revenue) as rev from movies_finance a  inner join movies_language b on
 a.movie_id=b.movie_id 
 group by a.movie_id,b.movie_language
 order by rev desc;
 

 
 
 