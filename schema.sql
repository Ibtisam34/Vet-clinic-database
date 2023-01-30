/* Database schema to keep the structure of entire database. */
CREATE DATABASE VET_CLINIC:

USE VET_CLINIC;

CREATE TABLE animals (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255),
 date_of_birth DATE,
 escape_attemps INT,
 neutered BOOLEAN,
 weight_kg DECIMAL(10,2)
);
