-- =====================================================
-- Course: CSD430
-- Assignment: Modules 5 & 6 Assignment - Working with CRUD-READ, JDBC, & JavaBeans
-- Database: CSD430
-- User: student1
-- Password: pass
-- Topic: Movies
-- =====================================================

-- Remove database if it already exists
DROP DATABASE IF EXISTS CSD430;

-- Create database
CREATE DATABASE CSD430;
USE CSD430;

-- Create user
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

-- Grant permissions so JavaBean can access the database
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

-- -----------------------------------------------------
-- Drop table if it exists
-- -----------------------------------------------------
DROP TABLE IF EXISTS juan_movies_data;

-- -----------------------------------------------------
-- Create movies table
-- -----------------------------------------------------
CREATE TABLE juan_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    director VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) NOT NULL
);

-- -----------------------------------------------------
-- Insert the movie records (minimum 10)
-- -----------------------------------------------------
INSERT INTO juan_movies_data
(title, genre, release_year, director, rating)
VALUES
('The Hobbit: An Unexpected Journey', 'Fantasy', 2012, 'Peter Jackson', 7.8),
('The Lord of the Rings: The Fellowship of the Ring', 'Fantasy', 2001, 'Peter Jackson', 8.8),
('Star Wars: Episode III – Revenge of the Sith', 'Sci-Fi', 2005, 'George Lucas', 7.6),
('The Dark Knight', 'Action', 2008, 'Christopher Nolan', 9.0),
('The Matrix', 'Sci-Fi', 1999, 'Wachowski Sisters', 8.7),
('The Godfather', 'Crime', 1972, 'Francis Ford Coppola', 9.2),
('The Hangover', 'Comedy', 2009, 'Todd Phillips', 7.7),
('John Wick', 'Action', 2014, 'Chad Stahelski', 7.4),
('Joker', 'Drama', 2019, 'Todd Phillips', 8.4),
('Spider-Man', 'Action', 2002, 'Sam Raimi', 7.4);

-- -----------------------------------------------------
-- Verify table creation and data
-- -----------------------------------------------------
SELECT * FROM juan_movies_data;
