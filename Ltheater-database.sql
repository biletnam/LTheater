CREATE DATABASE LTheater;
CREATE USER 'LTheater'@'localhost' IDENTIFIED BY 'LTheaterpw';
GRANT ALL ON LTheater.* TO 'LTheater'@'localhost';
use LTheater;
CREATE TABLE movies (
    id INT,
    title VARCHAR(100),
    rdate DATE,
    genres VARCHAR(100),
    IMDB INT,
    rating TINYINT,
    popularity INT,
    poster VARCHAR(255)
) TYPE=innodb;